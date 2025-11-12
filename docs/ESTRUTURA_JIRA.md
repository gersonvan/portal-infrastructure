# Proposta: Estrutura Jira para Multi-Tenant

Organização de Projeto e Epics para suportar múltiplas empresas

---

## 🎯 Recomendação: Um Projeto (PA) com Epics por Empresa

### Justificativa

**✅ Favorece Projeto Único:**
- Visão unificada do roadmap
- Planejamento de release integrado
- Issues relacionadas ficam próximas
- Relatórios consolidados
- Facilita migração AVP

**Estrutura:**

```
Projeto: PA (Portal Administrativo)

├── Componentes Compartilhados (Epic)
│   ├── Story: Seletor de Empresa (Frontend)
│   ├── Story: Multi-Tenant Middleware (Backend)
│   ├── Story: Sistema de Temas (Frontend)
│   └── Story: Isolamento de Dados (Backend)
│
├── Infra & Setup (Epic)
│   ├── Task: DB Schema com empresa_id
│   ├── Task: Docker/Env Setup
│   ├── Task: CI/CD Pipeline
│   └── Task: Documentação Técnica
│
├── Unigrande (Epic) - FASE 1
│   ├── Diploma Digital (Sub-epic)
│   │   ├── Story: Backend - Validação
│   │   ├── Story: Backend - Geração XML
│   │   ├── Story: Frontend - Formulário
│   │   └── Story: Integração Prefeitura
│   │
│   ├── Módulo Acadêmico (Sub-epic)
│   ├── Módulo Financeiro (Sub-epic)
│   └── ...
│
└── AVP (Epic) - FASE 2 (Futuro)
    ├── Diploma Digital (reutiliza)
    ├── Módulos (reutiliza)
    └── Customizações específicas
```

---

## 📌 Convenções de Naming

**Labels (use múltiplos):**
- `unigrande` / `avp` - Empresa específica
- `shared` - Código compartilhado
- `frontend` / `backend` / `database`
- `blocker` - Bloqueador
- `P0` / `P1` / `P2` - Prioridade

**Exemplo:**
- ID: `PA-42`
- Title: "Implementar seletor de empresa no header"
- Type: Story
- Epic: "Componentes Compartilhados"
- Labels: `shared`, `frontend`, `P0`

---

## 📈 Fluxo de Desenvolvimento

```
1. SETUP (Sprint 1-2)
   └─ Componentes Compartilhados + Infra

2. UNIGRANDE (Sprint 3-10)
   └─ Diploma Digital + Outros Módulos

3. VALIDAÇÃO (Sprint 11-12)
   └─ Produção + Ajustes

4. AVP (Futuro)
   └─ Reutiliza Setup
```

---

**Status:** Proposta - Aguardando aprovação PO
**Última atualização:** November 12, 2025
