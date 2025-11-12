# ⏰ Próximos Passos & Bloqueadores Críticos

Cronograma e responsabilidades para os próximos 30 dias

---

## 🚨 Bloqueadores Críticos (DEZEMBRO 2024)

### 1️⃣ **15 de Dezembro - Reunião PO/Stakeholders**

**Decisões Requeridas:**
- ✔️ Validar arquitetura multi-tenant (compartilhamento vs isolamento)
- ✔️ Confirmar padrão "seletor de empresa" (sem logout)
- ✔️ Aprovar estrutura Jira (projeto único PA)
- ✔️ Definir prioridade de módulos Unigrande

**Responsável:** PO + Stakeholders  
**Duração:** 2-3h  
**Entregáveis para apresentar:**
- BACKLOG.md (épicos e sprints)
- MULTI_TENANT_ARCHITECTURE.md (decisões técnicas)
- ESTRUTURA_JIRA.md (proposta de organização)
- MAPEAMENTO_EMPRESAS.md (8 módulos identificados)

**Saída esperada:** Aprovação de direção técnica

---

### 2️⃣ **18 de Dezembro - Validação Tech Leads**

**Decisões Requeridas:**
- ✔️ Context API vs Redux vs Zustand (state management)
- ✔️ Middleware autenticação (Express vs Nest.js)
- ✔️ Estratégia isolamento dados (row-level security)
- ✔️ Plano de testes multi-tenant

**Responsável:** Tech Leads (Frontend + Backend)  
**Duração:** 2-3h  
**Referências técnicas:**
- MULTI_TENANT_ARCHITECTURE.md (seções 5-6)
- FAQ.md (Architecture e Backend)
- GLOSSARIO.md (termos técnicos)

**Saída esperada:** Aprovação de viabilidade + timeline realista

---

### 3️⃣ **20 de Dezembro - UX Completa Mapeamento**

**Atividades UX:**
- ✔️ Validar MAPEAMENTO_EMPRESAS (8 módulos identificados)
- ✔️ Detalhar funcionalidades por módulo (Acadêmico, Financeiro, etc)
- ✔️ Confirmar diferenças Unigrande vs AVP
- ✔️ Criar wireframes Seletor de Empresa

**Responsável:** UX + Product Design  
**Duração:** 4-6h  
**Entregáveis:**
- Documento detalhado (módulos + sub-features + diferenças)
- Wireframes para componentes compartilhados
- Proposta visual para seletor de empresa

**Saída esperada:** Documento validado de mapeamento

---

### 4️⃣ **22 de Dezembro - Reunião de Sincronização (Final)**

**Objetivo:** Consolidar decisões e definir começar Sprint 1

**Participantes:** PO + Tech Leads + UX + DBA  
**Duração:** 2-3h

**Agenda:**
1. Resumir decisões de Dez 15, 18, 20 ✅
2. Validar Backlog (epics + primeira sprint)
3. Confirmar setup (DB, Docker, Env)
4. Designar responsabilidades
5. Agendar Sprint Planning (primeiros dias 2025)

**Saída esperada:** Time pronto para iniciar desenvolvimento

---

## 📅 Cronograma de Alto Nível (Dezembro-Março)

```
DEZEMBRO 2024
├─ 08: Reunião Sincronização Equipes (apresentação desta documentação)
├─ 15: PO/Stakeholders validam direção ⚠️ CRÍTICO
├─ 18: Tech Leads validam viabilidade ⚠️ CRÍTICO
├─ 20: UX completa mapeamento ⚠️ CRÍTICO
├─ 22: Reunião Final (consolidar + planejar) ⚠️ CRÍTICO
└─ 26-31: Recesso (planejamento final)

JANEIRO 2025 (SPRINT 1-2)
├─ 02: Sprint Planning & Kickoff
├─ 13-17: Sprint 1 Review + Sprint 2 Planning
└─ 27-31: Sprint 2 Review

FEVEREIRO 2025 (SPRINT 3-4)
├─ 03-07: Sprint 3
├─ 17-21: Sprint 3 Review + Sprint 4 Planning
└─ 24-28: Sprint 4 Review

MARÇO 2025 (SPRINT 5-6)
├─ 03-07: Sprint 5 (MVP pronto)
├─ 17-21: Sprint 5 Review + Sprint 6 Planning
└─ 24-28: Sprint 6 Review (Preparar Homolog)

ABRIL 2025 (Homologação Unigrande)
```

---

## 👥 Responsabilidades por Função

### **Product Owner**
- [ ] Validar decisões arquitetura (Dez 15)
- [ ] Detalhar user stories
- [ ] Priorizar backlog
- [ ] Coordenar com Stakeholders
- **Deadline:** Sprint 1 Planning (jan 2)

### **Tech Leads**
- [ ] Validar viabilidade (Dez 18)
- [ ] Definir tech stack final
- [ ] Criação estrutura projeto
- [ ] Setup CI/CD
- **Deadline:** Sprint 1 kickoff (jan 2)

### **UX/Product Design**
- [ ] Completar mapeamento (Dez 20)
- [ ] Criar wireframes
- [ ] Validar seletor de empresa
- [ ] Design system (temas por empresa)
- **Deadline:** Sprint 1 Planning (jan 2)

### **DBA/Data Engineer**
- [ ] Schema DB com empresa_id
- [ ] Validação row-level security
- [ ] Backup strategy
- [ ] Migration plan
- **Deadline:** Sprint 1 Planning (jan 2)

### **Frontend Lead**
- [ ] State management decision
- [ ] Setup projeto React
- [ ] Context API/Redux setup
- [ ] Componentes compartilhados (Seletor, Tema)
- **Deadline:** Sprint 2 (jan 13)

### **Backend Lead**
- [ ] Middleware autenticação
- [ ] Setup Express/Nest.js
- [ ] Rotas com isolamento
- [ ] Validação X-Empresa-ID
- **Deadline:** Sprint 2 (jan 13)

---

## ✅ Checklist Pré-Sprint

- [ ] Arquitetura aprovada (Dez 15)
- [ ] Viabilidade validada (Dez 18)
- [ ] Mapeamento finalizado (Dez 20)
- [ ] Backlog detalhado (Dez 22)
- [ ] Tech stack definido (Dez 22)
- [ ] Ambiente setup (Dev/Test/Prod)
- [ ] Database criado com schema
- [ ] CI/CD pipeline operacional
- [ ] Repositório criado
- [ ] Time aculturado em multi-tenant

---

## 🎯 Métricas de Sucesso (Primeiras 4 Semanas)

- ✅ Componentes compartilhados desenvolvidos
- ✅ Multi-tenant middleware testado
- ✅ Seletor de empresa funcional
- ✅ Database isolado por empresa_id
- ✅ Certificado que sem contexto empresa, API retorna erro
- ✅ First issue Diploma Digital em dev

---

**Status:** Planejamento - Pronto para começar Dez 8  
**Última atualização:** November 12, 2025
**Próxima revisão:** Após reunião Dez 22
