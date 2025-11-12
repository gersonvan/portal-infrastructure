```markdown
# 🎯 Templates: Navegação Confluence

Modelos prontos para adicionar navegação entre páginas do Portal Administrativo

---

## 📌 Como Usar Estes Templates

1. Copie o template apropriado
2. Abra a página Confluence
3. Cole o conteúdo (editar com "Edit" button)
4. Adapte os links conforme necessário
5. Publish

---

## 🔗 Template 1: Link Simples de Volta

**Uso:** Adicionar no topo de uma página child

**Código:**
```
[← Voltar para Portal Administrativo](./Portal Administrativo)
```

**Render:**
[← Voltar para Portal Administrativo](.)

---

## 🔗 Template 2: Navegação em Trilha (Breadcrumb)

**Uso:** Mostrar caminho: Pai > Atual > Próximo

**Código:**
```
[Portal Administrativo](./Portal Administrativo) > 
Roadmap Executivo > 
[Multi-Tenant Architecture](./Multi-Tenant Architecture)
```

**Render:**
Portal Administrativo > Roadmap Executivo > Multi-Tenant Architecture

---

## 🔗 Template 3: Navegação Anterior/Próximo

**Uso:** Navegar entre páginas sequenciais

**Código:**
```
⬅️ [Anterior](./Roadmap Executivo) | 
🏠 [Home](./Portal Administrativo) | 
➡️ [Próximo](./Multi-Tenant Architecture)
```

**Render:**
⬅️ Anterior | 🏠 Home | ➡️ Próximo

---

## 🔗 Template 4: Índice com Links

**Uso:** Página de sumário (como página pai)

**Código:**
```
## 📚 Documentação

### [📊 Roadmap Executivo](./Roadmap Executivo)
Timeline e fases do projeto (5 fases, 12+ sprints)

### [🏗️ Multi-Tenant Architecture](./Multi-Tenant Architecture)
Decisões técnicas e implementação (7 seções, código de exemplo)

### [🗺️ Mapeamento de Módulos](./Mapeamento de Módulos)
8 módulos identificados com features

### [📋 Estrutura Jira](./Estrutura Jira)
Organização de projeto
```

**Render:**
Mostra índice com links para cada seção

---

## 🔗 Template 5: Cards de Navegação

**Uso:** Design mais visual

**Código:**
```
| | |
|---|---|---|
| **[📊 Roadmap](./Roadmap Executivo)** | **[🏗️ Arquitetura](./Multi-Tenant Architecture)** | **[🗺️ Módulos](./Mapeamento de Módulos)** |
| Timeline e fases | Decisões técnicas | 8 módulos identificados |
```

---

## 🔗 Template 6: Links no Final da Página

**Uso:** Adicionar no footer de cada página

**Código:**
```
---

## 📚 Mais Documentação

- [Portal Administrativo](./Portal Administrativo) - Página inicial
- [Roadmap Executivo](./Roadmap Executivo) - Timeline
- [Multi-Tenant Architecture](./Multi-Tenant Architecture) - Técnico
- [Mapeamento de Módulos](./Mapeamento de Módulos) - Módulos
- [Estrutura Jira](./Estrutura Jira) - Projeto
```

---

## 🔗 Template 7: Seção "Veja Também"

**Uso:** Referência cruzada

**Código:**
```
## 🔗 Veja Também

- [Multi-Tenant Architecture](./Multi-Tenant Architecture) - Para entender isolamento de dados
- [Estrutura Jira](./Estrutura Jira) - Como estão organizadas as tasks
- [Portal Administrativo](./Portal Administrativo) - Visão geral do projeto
```

---

## 🔗 Template 8: Navegação em Tabela

**Uso:** Página com múltiplas seções

**Código:**
```
| Seção | Link | Descrição |
|-------|------|-----------|
| Home | [Portal Administrativo](./Portal Administrativo) | Página inicial |
| Roadmap | [Roadmap Executivo](./Roadmap Executivo) | Timeline do projeto |
| Arquitetura | [Multi-Tenant Architecture](./Multi-Tenant Architecture) | Decisões técnicas |
| Módulos | [Mapeamento de Módulos](./Mapeamento de Módulos) | 8 módulos |
| Jira | [Estrutura Jira](./Estrutura Jira) | Organização projeto |
```

---

## 🔗 Template 9: Callout com Links

**Uso:** Destacar seções importantes

**Confluence syntax (info panel):**
```
{info}
📌 **Comece aqui:** Leia [Roadmap Executivo](./Roadmap Executivo) 
para entender a timeline do projeto.

Para detalhes técnicos, veja [Multi-Tenant Architecture](./Multi-Tenant Architecture).
{info}
```

---

## 🔗 Template 10: Linha de Separação com Links

**Uso:** Separar seções

**Código:**
```
---

**← [Anterior](./Roadmap Executivo)** | **[Home](./Portal Administrativo)** | **[Próximo →](./Multi-Tenant Architecture)**

---
```

---

## 📋 Exemplos de Aplicação

### Página: Portal Administrativo (Pai)

```
# Portal Administrativo

Documentação técnica e planejamento do Portal Administrativo.

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

### Página: Roadmap Executivo (Child 1)

```
**← [Voltar](./Portal Administrativo)** | **[Próximo →](./Multi-Tenant Architecture)**

# Roadmap Executivo

[Seu conteúdo aqui...]

---

**← [Voltar](./Portal Administrativo)** | **[Próximo →](./Multi-Tenant Architecture)**
```

### Página: Multi-Tenant Architecture (Child 2)

```
**← [Anterior](./Roadmap Executivo)** | **[Home](./Portal Administrativo)** | **[Próximo →](./Mapeamento de Módulos)**

# Multi-Tenant Architecture

[Seu conteúdo aqui...]

---

**← [Anterior](./Roadmap Executivo)** | **[Home](./Portal Administrativo)** | **[Próximo →](./Mapeamento de Módulos)**
```

---

## 🎨 Dicas de Design

### Emojis Úteis
- 📊 Roadmap / Timeline
- 🏗️ Arquitetura / Técnico
- 🗺️ Mapeamento / Features
- 📋 Jira / Organização
- 🏠 Home / Página Pai
- ⬅️ Anterior / Voltar
- ➡️ Próximo / Avançar
- 📚 Documentação / Índice

### Formatação
- Use **negrito** para labels importantes
- Use `código` para nomes técnicos
- Use `[link](./página)` para navegação
- Use `---` para separar seções

---

## ✅ Checklist de Implementação

- [ ] Página Pai criada ou configurada
- [ ] Template 1 (Link de volta) adicionado em cada child
- [ ] Template 3 (Anterior/Próximo) adicionado em cada child
- [ ] Template 4 (Índice) adicionado na página pai
- [ ] Todos os links testados (clique em cada um)
- [ ] Formatting verificado (emojis, negrito, etc)
- [ ] Páginas publicadas

---

## 📞 Links de Referência

- [Como criar links em Confluence](https://confluence.atlassian.com/doc/confluence-wiki-markup-251003035.html)
- [Markdown em Confluence](https://support.atlassian.com/confluence-cloud/docs/use-markdown-in-confluence/)
- [Panels e macros](https://confluence.atlassian.com/doc/macros-139387.html)

---

**Versão:** 1.0  
**Criado:** November 12, 2025  
**Status:** Templates prontos para usar

```
# 🎯 Templates: Navegação Confluence (arquivado)

Arquivo original arquivado em docs/legacy/menus/. Mantido para histórico.

---

...existing code...
