# 📑 Índice de Documentação - Ordem de Leitura Recomendada

Guia para navegação eficiente da documentação do Portal Administrativo.

---

## 🚀 Leitura Rápida (15 minutos)

Para stakeholders e tomadores de decisão:

1. **[BACKLOG.md](./management/BACKLOG.md)** (5 min)
   - Visão geral de épicos e timeline
   - Fases do projeto (Nov 2024 - Dez 2026)

2. **[ROADMAP_EXECUTIVO.md](./management/ROADMAP_EXECUTIVO.md)** (5 min)
   - Visão macro estratégica

3. **[README.md](../README.md)** (5 min)
   - Visão geral do Portal Administrativo
   - Contexto empresarial (Unigrande + AVP)

---

## 🏗️ Leitura Técnica (45 minutos)

Para arquitetos e tech leads:

### **Arquitetura & Design (20 min)**

1. **[CORE_ARCHITECTURE.md](./technical/architecture/CORE_ARCHITECTURE.md)** (10 min)
   - Visão geral da arquitetura modular ("Racks")
   - Stack tecnológica

2. **[MULTI_TENANT.md](./technical/architecture/MULTI_TENANT.md)** (15 min)
   - Decisões arquiteturais (multi-tenant vs single-tenant)
   - Fluxo de login e contexto empresa
   - Data isolation strategy (empresa_id)
   - RBAC (user + role + enterprise)

3. **[ESTRUTURA_JIRA.md](./management/ESTRUTURA_JIRA.md)** (5 min)
   - Organização de projeto (único vs múltiplos)
   - Epic structure
   - Labels e naming conventions

### **Especificações & Mapeamento (25 min)**

4. **[MAPEAMENTO_EMPRESAS.md](./technical/architecture/MAPEAMENTO_EMPRESAS.md)** (10 min)
   - 8 módulos identificados
   - Features por módulo
   - Roadmap por empresa

5. **[DEVOPS.md](./technical/DEVOPS.md)** (10 min)
   - Infraestrutura e CI/CD
   - Docker e containerização
   - Ambientes e deployment
   
6. **[MIGRACAO_MONOREPO_POLIREPO.md](./technical/MIGRACAO_MONOREPO_POLIREPO.md)** (5 min)
   - Estratégia de migração para polirepo
   - Scripts automatizados
   - Decisão: quando migrar

5. **[GLOSSARIO.md](./management/GLOSSARIO.md)** (15 min)
   - 110+ termos técnicos
   - Referência durante desenvolvimento
   - Definições de componentes, padrões, conceitos

---

## 🎓 Leitura Completa (2-3 horas)

Para onboarding de novo desenvolvedor:

### **Fase 1: Contexto (30 min)**
- README.md - Visão geral
- [BACKLOG.md](./management/BACKLOG.md) - Timeline

### **Fase 2: Arquitetura (60 min)**
- [CORE_ARCHITECTURE.md](./technical/architecture/CORE_ARCHITECTURE.md) - Core
- [MULTI_TENANT.md](./technical/architecture/MULTI_TENANT.md) - Decisões
- [ESTRUTURA_JIRA.md](./management/ESTRUTURA_JIRA.md) - Organização
- [GLOSSARIO.md](./management/GLOSSARIO.md) - Consulta de termos

### **Fase 3: Detalhes (30-60 min)**
- [MAPEAMENTO_EMPRESAS.md](./technical/architecture/MAPEAMENTO_EMPRESAS.md) - Features
- [FAQ.md](./management/FAQ.md) - Respostas a dúvidas comuns
- Código-fonte (exemplos em cada arquivo)

### **Fase 4: Referência Rápida (Contínua)**
- [GLOSSARIO.md](./management/GLOSSARIO.md) - Definições
- [FAQ.md](./management/FAQ.md) - Dúvidas frequentes
- [DEVELOPMENT_STANDARDS.md](./technical/standards/DEVELOPMENT_STANDARDS.md) - Padrões de código

---

## 📊 Estrutura Física de Arquivos

```
Portal Administrativo/
├── docs/
│   ├── management/                     🏢 Gestão
│   │   ├── BACKLOG.md
│   │   ├── ROADMAP_EXECUTIVO.md
│   │   ├── ESTRUTURA_JIRA.md
│   │   ├── MIGRATION_PLAN.md
│   │   ├── REQUIREMENTS.md
│   │   └── meetings/
│   │
│   ├── technical/                      ⚙️ Técnica
│   │   ├── architecture/
│   │   │   ├── CORE_ARCHITECTURE.md
│   │   │   ├── MULTI_TENANT.md
│   │   │   └── DIAGRAMAS.md
│   │   └── standards/
│   │       └── DEVELOPMENT_STANDARDS.md
│   │
│   ├── business-modules/               📦 Módulos de Negócio
│   │   ├── academico/
│   │   │   └── diploma-digital/
│   │   └── core/
│   │
│   ├── legacy/                         🏛️ Legado
│   └── INDICE_DOCUMENTACAO.md          📑 Este arquivo
```
