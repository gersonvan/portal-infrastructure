# 📑 Índice de Documentação - Ordem de Leitura Recomendada

Guia para navegação eficiente da documentação do Portal Administrativo

---

## 🚀 Leitura Rápida (15 minutos)

Para stakeholders e tomadores de decisão:

1. **[BACKLOG.md](./BACKLOG.md)** (5 min)
   - Visão geral de épicos e timeline
   - Fases do projeto (Nov 2024 - Dez 2026)

2. **[PROXIMOS_PASSOS.md](./PROXIMOS_PASSOS.md)** (5 min)
   - Bloqueadores críticos (Dez 15, 18, 20, 22)
   - Responsabilidades por função

3. **[README.md](../README.md)** (5 min)
   - Visão geral do Portal Administrativo
   - Contexto empresarial (Unigrande + AVP)

---

## 🏗️ Leitura Técnica (45 minutos)

Para arquitetos e tech leads:

### **Arquitectura & Design (20 min)**

1. **[MULTI_TENANT_ARCHITECTURE.md](./MULTI_TENANT_ARCHITECTURE.md)** (15 min)
   - Decisões arquiteturais (multi-tenant vs single-tenant)
   - Fluxo de login e contexto empresa
   - Data isolation strategy (empresa_id)
   - RBAC (user + role + enterprise)
   - Código de exemplo (SQL, TypeScript, React)

2. **[ESTRUTURA_JIRA.md](./ESTRUTURA_JIRA.md)** (5 min)
   - Organização de projeto (único vs múltiplos)
   - Epic structure
   - Labels e naming conventions

### **Especificações & Mapeamento (25 min)**

3. **[MAPEAMENTO_EMPRESAS.md](./MAPEAMENTO_EMPRESAS.md)** (10 min)
   - 8 módulos identificados
   - Features por módulo
   - Roadmap por empresa

4. **[GLOSSARIO.md](./GLOSSARIO.md)** (15 min)
   - 110+ termos técnicos
   - Referência durante desenvolvimento
   - Definições de componentes, padrões, conceitos

---

## 🎓 Leitura Completa (2-3 horas)

Para onboarding de novo desenvolvedor:

### **Fase 1: Contexto (30 min)**
- README.md - Visão geral
- BACKLOG.md - Timeline
- PROXIMOS_PASSOS.md - Bloqueadores

### **Fase 2: Arquitetura (60 min)**
- MULTI_TENANT_ARCHITECTURE.md - Decisões
- ESTRUTURA_JIRA.md - Organização
- GLOSSARIO.md - Consulta de termos

### **Fase 3: Detalhes (30-60 min)**
- MAPEAMENTO_EMPRESAS.md - Features
- FAQ.md - Respostas a dúvidas comuns
- Código-fonte (exemplos em cada arquivo)

### **Fase 4: Referência Rápida (Contínua)**
- GLOSSARIO.md - Definições
- FAQ.md - Dúvidas frequentes
- MULTI_TENANT_ARCHITECTURE.md - Padrões de implementação

---

## 📊 Estrutura Física de Arquivos

```
Portal Administrativo/
├── docs/
│   ├── BACKLOG.md                              ⭐ LEIA PRIMEIRO
│   ├── GLOSSARIO.md                            📚 Referência
│   ├── FAQ.md                                  ❓ Dúvidas
│   ├── MULTI_TENANT_ARCHITECTURE.md            🏗️ Técnico
│   ├── MAPEAMENTO_EMPRESAS.md                  🗺️ Features
│   ├── ESTRUTURA_JIRA.md                       📋 Projeto
│   ├── PROXIMOS_PASSOS.md                      ⏰ Próximos
│   ├── INDICE_DOCUMENTACAO.md                  📑 Este arquivo
│   ├── REQUIREMENTS.md                         📝 Requisitos (ver também `docs/REQUIREMENTS_SUMMARY.md`)
│   ├── MIGRATION_PLAN.md                       🔄 Migração
│   ├── PROMPT_INSTRUCTIONS.md                  🤖 IA Setup
│   ├── Levantamento UX.md                      👤 UX Input
│   ├── CONFLUENCE_MENUS_GUIDE.md               🔗 Confluence menus (consolidado)
│   ├── REQUIREMENTS_SUMMARY.md                 📝 Reqs resumo (próximos passos)
│   ├── legacy/                                 📦 Arquivos legados (ver `docs/legacy/`)
│   ├── modules/                                🔧 Módulos
│   └── portal-core/                            💻 Core Code
│
├── README.md                                   📄 Overview
├── RESUMO_ENTREGA.md                           📦 Delivery
├── MAPA_VISUAL_DOCUMENTACAO.md                 🎨 Visual
├── LOCALIZACAO_ARQUIVOS.md                     🗂️ Localização
└── .git/                                        📚 Histórico
```

---

## 🎯 Por Função - O que Ler Primeiro

### **Product Owner / Stakeholder**
- ⭐ README.md
- ⭐ BACKLOG.md
- ⭐ PROXIMOS_PASSOS.md
- 📚 MAPEAMENTO_EMPRESAS.md
- ❓ FAQ.md (seção Project)

### **Tech Lead / Arquiteto**
- ⭐ MULTI_TENANT_ARCHITECTURE.md
- 📋 ESTRUTURA_JIRA.md
- 🏗️ MAPEAMENTO_EMPRESAS.md (features)
- ❓ FAQ.md (Architecture, Backend)
- 📚 GLOSSARIO.md (termos técnicos)

### **Frontend Developer**
- ⭐ MULTI_TENANT_ARCHITECTURE.md (seção 6 - Frontend)
- ❓ FAQ.md (Frontend)
- 📚 GLOSSARIO.md (termos React)
- 🏗️ MAPEAMENTO_EMPRESAS.md (features)
- 📋 ESTRUTURA_JIRA.md (labels)

### **Backend Developer**
- ⭐ MULTI_TENANT_ARCHITECTURE.md (seção 5 - Backend)
- ❓ FAQ.md (Backend, Database)
- 📚 GLOSSARIO.md (middleware, isolamento)
- 🏗️ MAPEAMENTO_EMPRESAS.md (features)
- 📋 ESTRUTURA_JIRA.md (labels)

### **DBA / Data Engineer**
- ⭐ MULTI_TENANT_ARCHITECTURE.md (seção 3 - Data Isolation)
- ❓ FAQ.md (Database)
- 📚 GLOSSARIO.md (empresa_id, schema)
- 🏗️ MAPEAMENTO_EMPRESAS.md (dados por módulo)

### **QA / Tester**
- ⭐ BACKLOG.md (Definition of Done)
- ❓ FAQ.md (Tests)
- 📚 GLOSSARIO.md (multi-tenant terms)
- 🏗️ MAPEAMENTO_EMPRESAS.md (features a testar)

---

## 🔍 Busca Rápida

**Tenho dúvida sobre...**

- **Arquitetura multi-tenant?**
  → MULTI_TENANT_ARCHITECTURE.md + FAQ.md

- **Como começar desenvolvimento?**
  → README.md → MULTI_TENANT_ARCHITECTURE.md → GLOSSARIO.md

- **Qual é o timeline?**
  → BACKLOG.md → PROXIMOS_PASSOS.md

- **Definição de um termo técnico?**
  → GLOSSARIO.md (A-Z)

- **Por que decidimos X?**
  → MULTI_TENANT_ARCHITECTURE.md + FAQ.md

- **O que fazer agora?**
  → PROXIMOS_PASSOS.md

- **Como está organizado o Jira?**
  → ESTRUTURA_JIRA.md

- **Que features cada módulo tem?**
  → MAPEAMENTO_EMPRESAS.md

- **Preciso de um exemplo de código?**
  → MULTI_TENANT_ARCHITECTURE.md (seções 5-6)

---

## 📈 Atualização Contínua

**Frequência de atualização:**

- `BACKLOG.md` - A cada Sprint (semanal)
- `GLOSSARIO.md` - Mensal (conforme novos termos)
- `FAQ.md` - Quinzenal (respostas a dúvidas)
- `ESTRUTURA_JIRA.md` - Após decisões Jira
- `MAPEAMENTO_EMPRESAS.md` - Conforme UX evolui
- `PROXIMOS_PASSOS.md` - A cada milestone
- Todos os outros - Conforme necessário

---

## ✨ Dicas de Uso

1. **Use Ctrl+F / Cmd+F** para buscar termos em GLOSSARIO.md
2. **Imprima MULTI_TENANT_ARCHITECTURE.md** para estudar offline
3. **Guarde PROXIMOS_PASSOS.md** como referência de bloqueadores
4. **Compartilhe README.md** com stakeholders novos
5. **Revise FAQ.md** antes de fazer decisões arquiteturais
6. **Consulte ESTRUTURA_JIRA.md** ao criar issues
7. **Reference BACKLOG.md** em planejamentos

---

**Versão:** 1.0  
**Última atualização:** November 12, 2025  
**Status:** 📍 Documentação em construção  
**Próxima revisão:** Após Reunião Dez 22
