# Roadmap Executivo 2026

**Visão macro do projeto Portal Administrativo**

Status: Em Planejamento | Última atualização: November 12, 2025

---

## 📅 Timeline Geral

```
Q4 2024 (AGO-OUT)          → Planejamento & Arquitetura
├─ Setup técnico
├─ Definições UX
└─ Estrutura Jira

Q4 2024 (NOV-DEZ)          → Sprint 1-2: Fundação
├─ Multi-tenant implementation
├─ Componentes compartilhados
└─ Setup infraestrutura

Q1 2025 (JAN-MAR)          → Sprint 3-6: Diploma Digital (Unigrande)
├─ Backend (validação, XML, assinatura)
├─ Frontend (formulário, visualização)
├─ Integração com Prefeitura (SP)
└─ Testes & QA

Q2 2025 (ABR-JUN)          → Sprint 7-10: Outros Módulos Unigrande
├─ Módulo Acadêmico
├─ Módulo Financeiro
├─ Módulo Administrativo
└─ Testes & Deploy Staging

Q3 2025 (JUL-SET)          → Validação & Ajustes
├─ Testes em Produção (Unigrande)
├─ Ajustes pós-feedback
├─ Documentação final
└─ Preparar para AVP

Q4 2025 (OUT-DEZ)          → Planejamento AVP & Debt
├─ Análise funcionalidades AVP
├─ Planejamento Sprint AVP
├─ Refatoração técnica
└─ Otimizações

2026 (JAN+)                → Implementação AVP
├─ Sprint AVP (reutiliza Setup)
├─ Integração
└─ Go-live AVP
```

---

## 🎯 Fases Principais

### FASE 0: Setup (NOV-DEZ 2024) ⏳ ATUAL

**Objetivo:** Estrutura técnica pronta para desenvolvimento

**Tarefas Críticas:**

- [ ] Validar decisões com PO/UX
- [ ] Completar mapeamento de funcionalidades
- [ ] Criar projeto Jira (PA)
- [ ] Setup ambiente dev (Docker, DB, etc)
- [ ] CI/CD pipeline
- [ ] Banco de dados schema com empresa_id

**Entregas:**

*   Arquitetura multi-tenant documentada e validada
*   Ambiente pronto para código
*   Sprints planejadas

**Go/No-Go:** End of December

---

### FASE 1: Diploma Digital Unigrande (JAN-MAR 2025)

**Objetivo:** Piloto funcional e deployado em produção

**Módulo:** Acadêmico - Diploma Digital

**Tarefas:**

*   Backend: Validação, XML, Assinatura
*   Frontend: Formulário, Visualização, Download
*   Integração: Prefeitura SP, DOU
*   QA: Testes unitários, E2E, performance
*   Docs: Documentação completa

**Entregas:**

*   Diploma Digital funcional em Staging
*   Testes passando 100%
*   Documentação técnica e de usuário

**Go/No-Go:** End of March 2025

---

### FASE 2: Expansão Unigrande (ABR-JUN 2025)

**Objetivo:** Outros módulos Unigrande funcionais

**Módulos:**

*   Acadêmico (expandido)
*   Financeiro
*   Administrativo
*   Coordenação
*   RH (parcial)
*   Relacionamentos (parcial)

**Entregas:**

*   Todos módulos em Staging
*   Testes passando
*   Pronto para migração de dados

**Go/No-Go:** End of June 2025

---

### FASE 3: Validação & Deploy (JUL-SET 2025)

**Objetivo:** Unigrande em produção com feedback do usuário

**Tarefas:**

*   Deploy para produção
*   Treinamento de usuários
*   Suporte 24/7
*   Coleta de feedback
*   Ajustes pós-feedback
*   Otimizações

**Entregas:**

*   Unigrande GO LIVE
*   Documentação de lições aprendidas
*   Roadmap refinado para AVP

**Go/No-Go:** End of September 2025

---

### FASE 4: Preparação AVP (OUT-DEZ 2025)

**Objetivo:** Estrutura pronta para AVP, Unigrande estável

**Tarefas:**

*   Análise detalhada de AVP
*   Planejamento diferenças
*   Refatoração técnica
*   Débito técnico reduzido
*   Otimizações de performance

**Entregas:**

*   Roadmap AVP definido
*   Código pronto para reutilização
*   Documentação atualizada

---

### FASE 5: AVP (JAN+ 2026)

**Objetivo:** AVP funcional em produção

**Vantagem:** Reutiliza 70-80% do código Unigrande

**Entregas:**

*   AVP em produção
*   Ambas empresas estáveis

---

## 📊 Macro Capacidade

```
Equipe estimada:

Frontend (2-3 devs)
├─ Components compartilhados
├─ Temas (Unigrande, AVP)
└─ Features específicas

Backend (2-3 devs)
├─ Multi-tenant setup
├─ APIs por módulo
└─ Integrações

DevOps (1 dev)
├─ Infra
├─ CI/CD
└─ Deploy

QA (1-2 devs)
├─ Testes automatizados
├─ E2E
└─ Performance

PM/PO (1)
├─ Backlog
├─ Priorização
└─ Stakeholder alignment

Total: 7-10 pessoas
```

---

## 🎯 Critérios de Sucesso

### FASE 0 (Setup)

- [ ] Todos documentos técnicos validados
- [ ] Jira estruturado com epics
- [ ] Ambiente dev 100% funcional
- [ ] Schema DB com isolamento preparado

### FASE 1 (Diploma Digital)

- [ ] Diploma Digital funcional
- [ ] 100% dos testes passando
- [ ] Performance < 2s (95 percentile)
- [ ] Zero bugs críticos
- [ ] Integração SP validada

### FASE 2 (Expansão)

- [ ] Todos módulos básicos
- [ ] Migração de dados validada
- [ ] Performance OK
- [ ] Documentação 100%

### FASE 3 (Produção)

- [ ] Go Live Unigrande
- [ ] 99.9% uptime
- [ ] Usuarios treinados
- [ ] Suporte operacional

### FASE 4 (Prep AVP)

- [ ] AVP requirements definidos
- [ ] Código refatorado para reutilização
- [ ] Débito técnico < 10%

### FASE 5 (AVP Live)

- [ ] Go Live AVP
- [ ] Ambas estáveis

---

## ⚠️ Riscos Identificados

| Risco | Probabilidade | Impacto | Mitigação |
| --- | --- | --- | --- |
| Integração com Prefeitura (SP) complexa | Alta | Alto | Iniciar early, ter backup manual |
| Migração de dados Unigrande | Média | Alto | Testes extensivos, rollback plan |
| Requisitos AVP mal definidos | Média | Médio | Reuniões frequentes, reviews |
| Performance em produção | Média | Alto | Load testing early, otimizações |
| Falta de recursos | Baixa | Alto | Escalabilidade da equipe |
| Mudança de escopo | Alta | Médio | Gestão rigorosa de mudanças |

---

## 🔄 Dependências Críticas

```
FASE 0 (Setup) ◄─────────── Bloqueador para TUDO
    ↓
FASE 1 (Diploma Digital) ◄─ Bloqueador para Fase 2
    ↓
FASE 2 (Expansão) ◄────────── Bloqueador para Fase 3
    ↓
FASE 3 (Produção) ◄────────── Bloqueador para Fase 4
    ↓
FASE 4 (Prep AVP) ◄────────── Bloqueador para Fase 5
    ↓
FASE 5 (AVP Live)
```

---

## 📈 Métricas Rastreadas

*   Velocity (pontos/sprint)
*   Bug density (bugs/1000 LOC)
*   Test coverage (%)
*   Deployment frequency
*   Lead time para change
*   Mean time to recovery
*   Uptime (%)
*   User satisfaction (NPS)

---

## 📞 Stakeholders

| Papel | Responsabilidade | Frequência |
| --- | --- | --- |
| **Product Owner** | Priorização, decisões | Diária |
| **Tech Lead** | Arquitetura, decisões técnicas | Diária |
| **UX Lead** | Validação UX, design | 2x/semana |
| **QA Lead** | Testes, qualidade | Diária |
| **DevOps** | Infra, deploy | Sob demanda |
| **Sponsor/Exec** | Aprovação, recursos | Semanal |

---

**Próxima revisão:** December 15, 2024

**Links relacionados:**

*   [Multi-Tenant Architecture](../pages/MULTI_TENANT_ARCHITECTURE)
*   [Estrutura Jira](../pages/ESTRUTURA_JIRA)
*   [Mapeamento Empresas](../pages/MAPEAMENTO_EMPRESAS)
*   [Backlog do Projeto](../pages/BACKLOG)
