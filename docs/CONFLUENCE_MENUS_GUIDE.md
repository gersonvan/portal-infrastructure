# Confluence — Guide de Menus (consolidado)

Este arquivo unifica os vários guias e templates relacionados à reorganização das páginas do Portal Administrativo em Confluence.

---

## Objetivo

Reorganizar e padronizar a navegação do espaço "Portal Administrativo" no Confluence. Este guia contém:
- Quick start (5 minutos)
- Guia visual passo a passo
- Templates de navegação prontos (anterior/próximo, índice, cards)
- Checklist final e troubleshooting

> Arquivos originais arquivados em `docs/legacy/menus/`.

---

## 1) Quick Start — 5 minutos

1. Abra Confluence → Space: Portal Administrativo
2. Para cada página (Roadmap Executivo, Multi-Tenant Architecture, Mapeamento de Módulos, Estrutura Jira):
   - Abra a página → menu `...` → `Move` / `Change Parent` → escolha `Portal Administrativo` como pai → `Move`
3. Abra `Portal Administrativo` → Edit → cole o índice (trecho abaixo) → Publish

Trecho para colar (página pai):

```
# Portal Administrativo

## 📚 Documentação

### [📊 Roadmap Executivo](./Roadmap Executivo)
### [🏗️ Multi-Tenant Architecture](./Multi-Tenant Architecture)
### [🗺️ Mapeamento de Módulos](./Mapeamento de Módulos)
### [📋 Estrutura Jira](./Estrutura Jira)
```

---

## 2) Guia Visual (passo a passo)

- Abra Confluence e o space "Portal Administrativo".
- Abra "Roadmap Executivo" → menu `...` → `Move` → selecione "Portal Administrativo" como pai → Confirm.
- Repita para as outras três páginas.
- Edite a página pai e cole o índice acima.

Dicas rápidas:
- Se não ver `Move`, verifique permissões admin ou `Change Parent` (nome alternativo)
- Se a página "desaparecer", ela foi movida para baixo do pai — abra a página pai e verifique os children

---

## 3) Templates de Navegação (use conforme necessidade)

1. Link simples de volta (no topo de uma child page):
```
[← Voltar para Portal Administrativo](./Portal Administrativo)
```

2. Anterior / Home / Próximo:
```
⬅️ [Anterior](./Roadmap Executivo) | 🏠 [Home](./Portal Administrativo) | ➡️ [Próximo](./Multi-Tenant Architecture)
```

3. Índice (página pai - mais detalhado):
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

4. Callout (painel de informação) — Confluence macro:
```
{info}
📌 **Comece aqui:** Leia [Roadmap Executivo](./Roadmap Executivo).
{info}
```

---

## 4) Checklist Final (validação)

- [ ] Página `Portal Administrativo` criada/atualizada com índice
- [ ] As 4 páginas (Roadmap, Arquitetura, Mapeamento, Jira) são children do pai
- [ ] Links Anterior/Próximo testados
- [ ] Breadcrumbs apresentam hierarquia correta
- [ ] Formatação (emojis, negrito) ok
- [ ] Documentar data e responsável pela mudança

---

## 5) Troubleshooting

- `Move` não aparece → confirmar permissões admin e atualizar a página (F5)
- Link quebrado → conferir nome exato da página e usar autocomplete `@` no editor
- Página sumiu → provavelmente foi movida; verifique filhos da página pai

---

## 6) Histórico & Arquivamento

Arquivos originais relacionados foram arquivados em `docs/legacy/menus/` (QUICK_START, VISUAL_CLIQUE_POR_CLIQUE, GUIA_REORGANIZAR_CONFLUENCE, TEMPLATES_NAVEGACAO_CONFLUENCE, RESUMO_ATUALIZACAO_MENUS, COMECE_AQUI_MENUS, TUDO_COMPLETO_MENUS).

---

**Última atualização:** November 12, 2025
