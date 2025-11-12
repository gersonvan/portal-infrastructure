```markdown
# 📸 Guia Visual: Menu em 5 Clicks

Instruções passo a passo COM SCREENSHOTS (descritas textualmente)

---

## 🎯 Objetivo

Reorganizar 4 páginas Confluence em hierarquia lógica com 5 clicks.

---

## 📍 CLICK 1: Abrir Confluence

```
1. Abra Confluence no browser
2. Procure "Portal Administrativo" na barra superior
3. Clique no space
```

**O que você vê:**
```
┌─────────────────────────────────────┐
│ CONFLUENCE                          │
├─────────────────────────────────────┤
│ Portal Administrativo (space)       │
│                                     │
│ 📄 Roadmap Executivo                │
│ 📄 Multi-Tenant Architecture        │
│ 📄 Mapeamento de Módulos            │
│ 📄 Estrutura Jira                   │
└─────────────────────────────────────┘
```

---

## 📍 CLICK 2: Reorganizar Primeira Página

```
Abra "Roadmap Executivo"
```

**O que você vê:**
```
┌─────────────────────────────────────┐
│ Roadmap Executivo                   │
│                                     │
│ ... (menu no canto superior direito)│
└─────────────────────────────────────┘
```

**O que fazer:**
```
1. Clique em "..." (menu)
2. Procure por "Move" ou "Change Parent"
3. Clique
```

**Popup que aparece:**
```
┌──────────────────────────┐
│ Move this page to:       │
├──────────────────────────┤
│ [Portal Administrativo]  │ ← CLIQUE AQUI
│ (ou procure o nome)      │
└──────────────────────────┘
```

**O que fazer:**
```
1. Selecione "Portal Administrativo" como pai
2. Clique "Move" ou "Confirm"
```

---

## 📍 CLICK 3-5: Repita para Outras 3 Páginas

Volte ao space e repita o mesmo para:
- Multi-Tenant Architecture
- Mapeamento de Módulos
- Estrutura Jira

**Para cada página:**
```
1. Abra página
2. Clique "..."
3. Selecione "Move"
4. Escolha "Portal Administrativo"
5. Clique "Move"
```

---

## 📍 FINAL: Adicionar Navegação

Volte para página pai "Portal Administrativo"

**Clique "Edit"**

```
┌────────────────────────────────────┐
│ ✏️ EDIT (botão no canto superior)  │
└────────────────────────────────────┘
```

**Cole este texto:**

```
# Portal Administrativo

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

**Clique "Publish"**

```
┌────────────────────────────────────┐
│ ✅ PUBLISH (botão azul)            │
└────────────────────────────────────┘
```

---

## ✅ Resultado Final

```
Portal Administrativo (página pai)
├── 📊 Roadmap Executivo (clicável)
├── 🏗️ Multi-Tenant Architecture (clicável)
├── 🗺️ Mapeamento de Módulos (clicável)
└── 📋 Estrutura Jira (clicável)
```

---

## 🆘 Dificuldades?

### Não encontro o menu "..."
- Procure no canto superior DIREITO da página
- Pode estar em ⋮ ou ⋯ (dependendo do tema)
- Se não achar, procure por "Page" menu

### Não vejo "Move" no menu
- Confirme que você tem permissão de admin no space
- Tente atualizar a página (F5)
- Procure por "Change Parent" em vez de "Move"

### Página desapareceu
- Não deletou, apenas moveu
- Abra página pai "Portal Administrativo"
- Você a verá como sub-página

---

**Tempo:** 5-10 minutos  
**Dificuldade:** ⭐ Fácil  
**Risco:** Zero

```
# 📸 Guia Visual: Menu em 5 Clicks (arquivado)

Arquivo original arquivado em docs/legacy/menus/. Mantido para histórico.

---

...existing code...
