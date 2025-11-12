# ❓ FAQ - Portal Administrativo

**Perguntas Frequentes**

**Última atualização:** November 12, 2025

---

## Arquitetura & Design

### P: Por que multi-tenant e não dois sistemas separados?
**R:** Porque:
- Código compartilhado reduz manutenção
- Atualizações simultâneas em ambos
- Economia de infraestrutura
- Melhor reutilização de código (70-80% entre Unigrande e AVP)

---

### P: Como funciona o seletor de empresa?
**R:** 
- Dropdown no header do Portal
- Ao clicar, mostra empresas disponíveis
- Selecionar muda o contexto (menu, dados, tema)
- **Sem logout necessário**
- Context muda dinamicamente

---

### P: Qual é a diferença entre Opção 1 e Opção 2 de arquitetura?
**R:**
- **Opção 1 (escolhida):** Duas identidades visuais + seletor → Menos confusão do usuário
- **Opção 2 (rejeitada):** Uma identidade + categorias → Mais confusão, menos visual distinto

---

### P: Como o isolamento de dados funciona?
**R:**
1. Toda tabela tem coluna `empresa_id`
2. Middleware valida que usuário tem acesso à empresa
3. TODA query filtra por empresa_id
4. Backend NUNCA retorna dados de outra empresa

---

### P: Um usuário pode estar em múltiplas empresas?
**R:** **SIM**
- Usuário pode ter acesso a Unigrande E AVP
- Pode ter **papéis diferentes** em cada empresa
- Exemplo: Admin em Unigrande, Secretária em AVP
- JWT token lista todas as empresas disponíveis

---

### P: O que é empresa_id?
**R:** 
- Coluna adicionada em TODAS as tabelas
- Identifica qual empresa os dados pertencem
- Usado para filtrar e isolar dados
- Foreign key para tabela `empresas`

---

## Frontend

### P: Como o sistema de temas funciona?
**R:**
- Context API armazena tema selecionado
- Cada empresa tem cores, logo, estilo próprio
- Quando troca empresa, tema muda automaticamente
- Componentes reutilizáveis recebem tema via props ou Context

---

### P: Os componentes são reutilizáveis entre empresas?
**R:** **DEPENDE**
- Componentes genéricos (Button, Input, Table): **SIM**
- Componentes específicos (FormDiploma): **NÃO**, mas lógica pode ser reutilizada
- Decidido durante desenvolvimento

---

### P: Como funciona a navegação entre páginas?
**R:**
- Menu muda conforme a empresa selecionada
- Cada empresa tem seus módulos/funções
- Roteamento via React Router
- Contexto da empresa sempre enviado nas requisições

---

## Backend

### P: Como o middleware de tenant valida acesso?
**R:**
1. Extrai empresa_id do header (x-empresa-id)
2. Valida no JWT token se usuário tem acesso
3. Se sim: processa requisição
4. Se não: retorna 403 Forbidden

---

### P: Toda query precisa filtrar por empresa_id?
**R:** **SIM, OBRIGATORIAMENTE**
- Segurança crítica
- Evita vazamento de dados
- Pattern padrão em toda app

---

### P: Como usuários com múltiplas empresas funcionam no banco?
**R:**
- Tabela separada: `usuario_empresas`
- Registra: usuario_id + empresa_id + papéis
- Permite diferentes papéis por empresa
- Cria relacionamento many-to-many

---

## Banco de Dados

### P: O banco é o mesmo para Unigrande e AVP?
**R:** **SIM**
- Mesmo SQL Server
- Dados isolados por empresa_id
- Reduz complexidade operacional
- Simplifica backup/restore

---

### P: Como funciona o backup de dados?
**R:**
- Backup do banco todo (inclui ambas empresas)
- Se precisar restaurar apenas Unigrande:
  - Restaurar e deletar dados de outras empresas
  - Ou scripts de filtragem por empresa_id

---

### P: Quantas tabelas têm empresa_id?
**R:**
- TODAS que armazenam dados específicos de empresa
- NÃO têm: Usuários (tem tabela separada usuario_empresas)
- Exemplos que TÊM: alunos, diplomas, notas, boletos

---

## Projeto & Planejamento

### P: Por que 5 fases? Não podia ser mais rápido?
**R:**
- Fase 0 (Setup): Necessário para fundação
- Fase 1 (Diploma): Piloto com Unigrande
- Fase 2-3 (Expandir/Produção): Outros módulos
- Fase 4 (Prep AVP): Preparar para 2ª empresa
- Fase 5 (AVP): Reutiliza código

---

### P: AVP vai demorar quanto tempo?
**R:**
- Menos que Unigrande (reutiliza 70-80% do código)
- Estimado: 2-3 meses (vs 6 de Unigrande)
- Começa JAN 2026

---

### P: Qual é a data de go-live esperada?
**R:**
- **Unigrande:** Setembro 2025
- **AVP:** Janeiro 2026

---

### P: O diploma digital é obrigatório para AVP?
**R:**
- Unigrande: SIM (é o piloto)
- AVP: DEPENDE dos requisitos
- Mapeamento de funcionalidades vai definir

---

## Jira & Gerenciamento

### P: Como será organizado no Jira?
**R:**
- **Projeto único:** PA (Portal Administrativo)
- **Epics:** Componentes Compartilhados, Unigrande, AVP
- **Labels:** unigrande, avp, shared, frontend, backend
- **Sprints:** 2 semanas, sincronizadas

---

### P: Por que um projeto e não dois?
**R:**
- Visão unificada do roadmap
- Fácil ver dependências entre empresas
- Simplifica planejamento de releases
- Facilita migração AVP (reutiliza setup)

---

### P: Posso ter histórias específicas por empresa?
**R:** **SIM**
- Use labels (unigrande, avp, shared)
- Isso clarifica para qual empresa é a feature

---

## Testes & Qualidade

### P: Como testar isolamento de dados?
**R:**
- Testes de integração checam empresa_id em queries
- Testes E2E simulam usuários de diferentes empresas
- Validar que não vaza dados entre empresas

---

### P: Preciso de testes diferentes para cada empresa?
**R:**
- Testes compartilhados: SIM (validam isolamento)
- Testes específicos: apenas se comportamento é diferente
- Maioria dos testes reutiliza

---

## Segurança

### P: Como evitar vazamento de dados entre empresas?
**R:**
- Middleware valida acesso
- TODA query filtra empresa_id
- JWT token lista empresas disponíveis
- Testes validam isolamento

---

### P: É seguro ter uma identidade visual por empresa?
**R:** **SIM**
- Tema é apenas visual (CSS)
- Dados continuam isolados
- Segurança não é afetada

---

### P: Um admin pode acessar dados de outra empresa?
**R:** **NÃO**
- Mesmo sendo admin
- Middleware valida SEMPRE
- Precisa estar explicitamente autorizado

---

## Integração

### P: Como funciona a integração com Prefeitura SP?
**R:**
- Diploma enviado em formato XML
- Validado pela Prefeitura
- Publicado no DOU
- Detalhes técnicos em REQUIREMENTS.md

---

### P: AVP vai integrar com Prefeitura?
**R:**
- Depende dos requisitos de AVP
- Mapeamento de funcionalidades vai definir
- Pode reutilizar código de Unigrande

---

## Desenvolvimento

### P: Por onde comeco a programar?
**R:**
1. Esperar FASE 0 terminar (Dez 31)
2. Pegar história de Sprint 1 (Setup)
3. Seguir documentação de arquitetura
4. Consultar templates de código

---

### P: Quais tecnologias vou usar?
**R:**
- **Frontend:** React 18+, TypeScript, TailwindCSS/MUI
- **Backend:** Node.js, TypeScript, Express/Nest.js
- **Database:** SQL Server
- **DevOps:** Docker, GitHub Actions (CI/CD)

---

### P: Preciso saber multi-tenant para programar?
**R:**
- **Frontend:** Entender Context API + tema switching
- **Backend:** Entender middleware + isolamento empresa_id
- Leia: MULTI_TENANT_ARCHITECTURE.md

---

### P: Como reutilizo código entre Unigrande e AVP?
**R:**
- Componentes genéricos em pasta /shared
- Lógica compartilhada em services/utilities
- Específico por empresa em pastas /unigrande, /avp

---

## Dúvidas Não Listadas?

Se sua pergunta não está aqui:
1. Consulte: **GLOSSARIO.md** (definições de termos)
2. Consulte: **MULTI_TENANT_ARCHITECTURE.md** (design técnico)
3. Pergunte na reunião de sincronização (Dez 8)
4. Mande mensagem no Slack/Teams

---

**Próxima atualização:** Conforme novas perguntas surgirem
