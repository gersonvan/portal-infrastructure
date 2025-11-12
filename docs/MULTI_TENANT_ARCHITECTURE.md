# 🏗️ MULTI-TENANT ARCHITECTURE

Portal Administrativo - Documentação Técnica

---

## Visão Geral

O Portal Administrativo é um sistema **multi-tenant** que suporta múltiplas empresas (Unigrande, AVP, etc.) com isolamento completo de dados e contexto, mas compartilhando a mesma codebase.

**Princípio:** Um usuário pode alternar entre empresas sem fazer logout, e o contexto da aplicação (menu, permissões, dados, identidade visual) muda dinamicamente.

---

## 1. Contexto e Sessão

### 1.1 Fluxo de Login

```
┌─────────────────┐
│  Usuário Login  │
│  (AVP + UG)     │
└────────┬────────┘
         │
         ▼
┌──────────────────────────────┐
│  Sistema detecta:             │
│  - Usuário pode acessar       │
│    múltiplas empresas?        │
│  - Se sim: marcar empresas    │
│    disponíveis                │
│  - Se não: usar empresa única │
└──────────┬───────────────────┘
           │
           ▼
┌──────────────────────────────┐
│  JWT Token gerado com:        │
│  - user_id                    │
│  - available_enterprises      │
│    ["unigrande", "avp"]       │
│  - default_enterprise (se 1)  │
└──────────────────────────────┘
```

### 1.2 Seletor de Empresa

**Local:** Header/Menu principal do Portal

**Comportamento:**
```
┌─────────────────────────────┐
│  [Menu] [Empresa: Unigrande]│ ◄─── Dropdown
│                              │
├─────────────────────────────┤
│ Módulos (Unigrande):         │
│ • Acadêmico                  │
│ • Financeiro                 │
│ • Administrativo             │
└─────────────────────────────┘

[Clica no dropdown]
      ▼
Mostra empresas disponíveis:
  □ Unigrande (selecionada)
  □ AVP
```

**Ao mudar de empresa:**
1. Frontend: Salva `empresa_selecionada` no Context/Redux
2. Frontend: Aplica tema visual da empresa
3. Frontend: Recarrega menu com módulos da empresa
4. Backend: Todas as queries subsequentes filtram por `empresa_id`

---

## 2. Isolamento de Dados

### 2.1 Estrutura do Banco de Dados

Toda tabela com dados específicos de empresa terá coluna `empresa_id`:

```sql
-- Exemplo: Tabela de Alunos
CREATE TABLE alunos (
    id INT PRIMARY KEY,
    empresa_id INT NOT NULL,  -- ◄─── CHAVE ISOLAMENTO
    nome VARCHAR(255),
    cpf VARCHAR(14),
    data_criacao TIMESTAMP,
    FOREIGN KEY (empresa_id) REFERENCES empresas(id),
    INDEX (empresa_id, id)  -- ◄─── ÍNDICE COMPOSTO
);

-- Exemplo: Tabela de Diplomas
CREATE TABLE diplomas (
    id INT PRIMARY KEY,
    empresa_id INT NOT NULL,  -- ◄─── CHAVE ISOLAMENTO
    aluno_id INT,
    data_emissao DATE,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id),
    FOREIGN KEY (empresa_id) REFERENCES empresas(id),
    INDEX (empresa_id, id)
);

-- Exemplo: Tabela de Usuários (pode ter múltiplas empresas)
CREATE TABLE usuario_empresas (
    usuario_id INT,
    empresa_id INT,
    papeis_ids JSON,  -- Ex: ["secretaria", "coordenador"]
    PRIMARY KEY (usuario_id, empresa_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (empresa_id) REFERENCES empresas(id)
);
```

### 2.2 Tabelas Comuns vs Isoladas

**ISOLADAS (com empresa_id):**
- Alunos, Diplomas, Notas
- Atividades, Contratos, Convênios
- Notas Fiscais, Boletos
- Carga Horária, Lotações

**COMUNS (sem empresa_id):**
- Usuários (com tabela de relacionamento usuario_empresas)
- Configurações Globais
- Logs de Auditoria (com empresa_id, mas acesso restrito)

---

## 3. Controle de Acesso (RBAC + Tenant)

### 3.1 Fluxo de Autorização

```
┌─────────────────────────────────────┐
│  Usuário solicita acesso a recurso  │
└────────┬────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────┐
│  Verificar:                          │
│  1. Token JWT válido?                │
│  2. Empresa no token = empresa da   │
│     request?                         │
│  3. Usuário tem papel nesta empresa?│
│  4. Papel tem permissão para ação?   │
└────────┬────────────────────────────┘
         │
    ┌────┴──────┐
    │            │
    ▼ SIM       ▼ NÃO
┌────────┐  ┌──────────────┐
│ Acesso │  │ 403 Forbidden│
│Concedido│ │ ou 401 Unauth│
└────────┘  └──────────────┘
```

### 3.2 Papéis por Empresa

Um usuário pode ter papéis DIFERENTES em cada empresa:

```json
{
  "user_id": 123,
  "enterprises": {
    "unigrande": {
      "papeis": ["secretaria_academica", "coordenador"],
      "unidades": ["campus_sp", "campus_rj"]
    },
    "avp": {
      "papeis": ["secretaria_academica"],
      "unidades": ["unidade_central"]
    }
  }
}
```

**Implicação:** A permissão é SEMPRE (usuário + papel + empresa), nunca só (usuário + papel)

---

## 4. Backend - Implementação

### 4.1 Middleware de Tenant

Todo endpoint precisa desse middleware:

```typescript
// middleware/tenant.ts
export async function tenantMiddleware(req, res, next) {
  // 1. Extrair empresa do header/request
  const empresaId = req.headers['x-empresa-id'] || 
                    req.user.current_enterprise;
  
  // 2. Validar que usuário tem acesso
  const userEnterprises = await db.query(`
    SELECT empresa_id FROM usuario_empresas 
    WHERE usuario_id = ? AND empresa_id = ?
  `, [req.user.id, empresaId]);
  
  if (!userEnterprises.length) {
    return res.status(403).json({ error: 'Acesso negado' });
  }
  
  // 3. Armazenar no contexto da request
  req.tenant = {
    empresaId,
    usuarioId: req.user.id,
    papeis: userEnterprises[0].papeis
  };
  
  next();
}
```

### 4.2 Queries Automáticas

**Padrão:** Toda query básica adiciona filtro de empresa

```typescript
// userRepository.ts
async function getAlunos(empresaId: string) {
  return db.query(`
    SELECT * FROM alunos 
    WHERE empresa_id = ?  -- ◄─── SEMPRE ADICIONAR
  `, [empresaId]);
}
```

### 4.3 Exemplo: Endpoint de Criar Diploma

```typescript
// POST /api/diplomas
async function createDiploma(req, res) {
  const { alunoId, dataEmissao } = req.body;
  
  // Middleware já validou empresaId
  const { empresaId } = req.tenant;
  
  // Validar que aluno pertence à empresa
  const aluno = await Aluno.where({
    id: alunoId,
    empresa_id: empresaId  // ◄─── ISOLAMENTO
  }).first();
  
  if (!aluno) {
    return res.status(404).json({ error: 'Aluno não encontrado' });
  }
  
  // Criar diploma
  const diploma = await Diploma.create({
    aluno_id: alunoId,
    empresa_id: empresaId,  // ◄─── SALVAR EMPRESA
    data_emissao: dataEmissao
  });
  
  return res.json(diploma);
}
```

---

## 5. Frontend - Implementação

### 5.1 Context de Tenant

```typescript
// contexts/TenantContext.tsx
interface TenantContextType {
  empresaSelecionada: string;
  empresasDisponiveis: string[];
  trocarEmpresa: (empresaId: string) => void;
  tema: Theme;
  menu: MenuItem[];
}

export const TenantContext = createContext<TenantContextType>(null!);

export function TenantProvider({ children }) {
  const [empresaSelecionada, setEmpresaSelecionada] = useState('unigrande');
  
  const trocarEmpresa = (empresaId: string) => {
    sessionStorage.setItem('empresa_atual', empresaId);
    api.defaults.headers['x-empresa-id'] = empresaId;
    setEmpresaSelecionada(empresaId);
  };
  
  return (
    <TenantContext.Provider value={{...}}>
      {children}
    </TenantContext.Provider>
  );
}
```

### 5.2 Tema por Empresa

```typescript
// themes/empresas.ts
export const TEMAS = {
  unigrande: {
    colors: { primary: '#007AFF' },
    logo: 'https://...unigrande-logo.png'
  },
  avp: {
    colors: { primary: '#FF6B35' },
    logo: 'https://...avp-logo.png'
  }
};
```

---

## 6. Reutilização de Componentes

**Componentes podem ser reutilizados se:**
1. Não assumem um módulo específico
2. Funcionam com dados genéricos
3. Tema é passado como prop ou via Context

**Exemplos reutilizáveis:**
- `<Button />`, `<Input />`, `<Modal />`
- `<Table />`, `<Form />`, `<Card />`

**Decisão:** Front/Back durante implementação

---

## 7. Segurança - Checklist

### Backend
- [ ] Middleware de tenant em TODOS endpoints
- [ ] Queries SEMPRE filtram por empresa_id
- [ ] Validação: usuário tem acesso à empresa?
- [ ] Logs de auditoria com empresa_id

### Frontend
- [ ] Enviar x-empresa-id em requests
- [ ] Não confiar em empresa do localStorage
- [ ] Menu/UI esconde funcionalidades por permissão
- [ ] Tema muda imediatamente ao trocar empresa

---

**Última atualização:** November 12, 2025
**Status:** Proposta Técnica - Aguardando validação Front/Back
