```markdown
# 🔗 Guia: Reorganizar Menu Confluence

Passo a passo completo para reorganizar as páginas do Portal Administrativo em Confluence

---

## 🎯 Objetivo

Organizar as 4 páginas do Portal Administrativo em uma hierarquia lógica que siga a ordem de leitura recomendada:

```
✅ Antes (desorganizado):
   - Roadmap Executivo
   - Multi-Tenant Architecture
   - Mapeamento de Módulos
   - Estrutura Jira

✅ Depois (hierárquico):
   Portal Administrativo (Pai)
   ├── Roadmap Executivo (Child 1)
   ├── Multi-Tenant Architecture (Child 2)
   ├── Mapeamento de Módulos (Child 3)
   └── Estrutura Jira (Child 4)
```

---

## 📋 Pré-Requisitos

- [ ] Acesso ao Confluence
- [ ] Admin do space Portal Administrativo
- [ ] Browser (Chrome, Firefox, Safari)
- [ ] 10-15 minutos

---

## 🔢 Passos de Implementação

### Etapa 1: Acessar Confluence (2 min)

```
1. Abra Confluence
2. Navegue para: Spaces → Portal Administrativo
3. Você verá 4 páginas (não necessariamente nesta ordem)
```

### Etapa 2: Criar Página Pai "Portal Administrativo" (2 min)

**Opção A: Se já existe página com este nome**
- Pule para Etapa 3

**Opção B: Se não existe**
1. Clique em "+ Create"
2. Selecione "Page"
3. Título: `Portal Administrativo`
4. Escreva conteúdo breve:
```
# Portal Administrativo

Documentação técnica e planejamento do Portal Administrativo.

## Índice
- Roadmap Executivo
- Multi-Tenant Architecture
- Mapeamento de Módulos
- Estrutura Jira
```
5. Clique em "Publish"

### Etapa 3: Reorganizar Página 1 - Roadmap Executivo (2 min)

```
1. Abra página "Roadmap Executivo"
2. Clique em "..." (menu) no canto superior direito
3. Selecione "Move" (ou "Change Parent")
4. Escolha "Portal Administrativo" como pai
5. Clique em "Move"
6. ✅ Página agora está como child de Portal Administrativo
```

### Etapa 4: Reorganizar Página 2 - Multi-Tenant Architecture (2 min)

```
1. Abra página "Multi-Tenant Architecture"
2. Clique em "..." (menu) no canto superior direito
3. Selecione "Move" (ou "Change Parent")
4. Escolha "Portal Administrativo" como pai
5. Clique em "Move"
6. ✅ Página agora está como child de Portal Administrativo
```

### Etapa 5: Reorganizar Página 3 - Mapeamento de Módulos (2 min)

```
1. Abra página "Mapeamento de Módulos"
2. Clique em "..." (menu) no canto superior direito
3. Selecione "Move" (ou "Change Parent")
4. Escolha "Portal Administrativo" como pai
5. Clique em "Move"
6. ✅ Página agora está como child de Portal Administrativo
```

### Etapa 6: Reorganizar Página 4 - Estrutura Jira (2 min)

```
1. Abra página "Estrutura Jira"
2. Clique em "..." (menu) no canto superior direito
3. Selecione "Move" (ou "Change Parent")
4. Escolha "Portal Administrativo" como pai
5. Clique em "Move"
6. ✅ Página agora está como child de Portal Administrativo
```

### Etapa 7: Adicionar Navegação - Portal Administrativo (3 min)

Adicione links para as páginas child na página pai.

**Abra página "Portal Administrativo" e adicione:**

```
## 📚 Documentação

### [📊 Roadmap Executivo](./Roadmap Executivo)
Timeline e fases do projeto

### [🏗️ Multi-Tenant Architecture](./Multi-Tenant Architecture)
Decisões técnicas e implementação

### [🗺️ Mapeamento de Módulos](./Mapeamento de Módulos)
8 módulos identificados

### [📋 Estrutura Jira](./Estrutura Jira)
Organização de projeto
```

### Etapa 8: Adicionar Navegação - Child Pages (5 min)

Em cada página child, adicione link de volta para página pai e para outras páginas.

**Em "Roadmap Executivo", no início:**
```
[← Voltar](./Portal Administrativo) | 
[Arquitetura →](./Multi-Tenant Architecture)
```

**Em "Multi-Tenant Architecture", no início:**
```
[← Arquitetura](./Multi-Tenant Architecture) | 
[← Voltar](./Portal Administrativo) | 
[Mapeamento →](./Mapeamento de Módulos)
```

**Em "Mapeamento de Módulos", no início:**
```
[← Mapeamento](./Mapeamento de Módulos) | 
[← Voltar](./Portal Administrativo) | 
[Jira →](./Estrutura Jira)
```

**Em "Estrutura Jira", no início:**
```
[← Jira](./Estrutura Jira) | 
[← Voltar](./Portal Administrativo)
```

---

## ✅ Verificação Pós-Implementação

Depois que terminar, valide:

- [ ] Página "Portal Administrativo" existe
- [ ] "Roadmap Executivo" é child de "Portal Administrativo"
- [ ] "Multi-Tenant Architecture" é child de "Portal Administrativo"
- [ ] "Mapeamento de Módulos" é child de "Portal Administrativo"
- [ ] "Estrutura Jira" é child de "Portal Administrativo"
- [ ] Links de navegação funcionam em cada página
- [ ] Breadcrumb mostra hierarquia correta (no Confluence, topo da página)

---

## 🆘 Troubleshooting

### Problema: "Move" opção não aparece
**Solução:** 
- Você tem permissão de admin no space?
- Tente atualizar a página no browser (F5)
- Se persiste, contate admin Confluence

### Problema: Link não funciona
**Solução:**
- Confira o nome da página (case-sensitive em alguns casos)
- Use @ para autocomplete de página (digite `@` e nome)
- Exemplo correto: `[Link](./Portal Administrativo)`

### Problema: Página desapareceu
**Solução:**
- Não se preocupe, não foi deletada (apenas movida)
- Vá para página pai "Portal Administrativo"
- Você a verá como child page

---

## 📝 Resultado Esperado

Depois de completar todos os passos:

```
Confluence Space: Portal Administrativo

📍 Portal Administrativo (página pai)
   ├── 📊 Roadmap Executivo (child)
   ├── 🏗️ Multi-Tenant Architecture (child)
   ├── 🗺️ Mapeamento de Módulos (child)
   └── 📋 Estrutura Jira (child)

Cada página tem links de navegação para:
  - Voltar para página pai
  - Próxima página
  - Página anterior
```

---

## ⏱️ Tempo Total

- Tempo estimado: 15-20 minutos
- Pode ser feito por uma pessoa
- Sem risco (pode desfazer com "Move" novamente)

---

## 📚 Próximas Etapas Opcionais

1. **Adicionar mais detalhes** na página pai (introdução, links para docs locais)
2. **Criar subpáginas** para tópicos complexos
3. **Adicionar labels** para melhor busca
4. **Definir watchers** para notificações

---

**Versão:** 1.0  
**Criado:** November 12, 2025  
**Tempo:** 15-20 minutos
**Status:** Pronto para implementar

```
# 🔗 Guia: Reorganizar Menu Confluence (arquivado)

Arquivo original arquivado em docs/legacy/menus/. Mantido para histórico.

---

...existing code...
