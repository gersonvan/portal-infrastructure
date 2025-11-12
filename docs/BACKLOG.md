# 📋 BACKLOG - Portal Administrativo

**Visão:** Gestão centralizada de todas as tarefas do projeto Portal Administrativo

**Última atualização:** November 12, 2025  
**Status:** Em Planejamento

---

## 🎯 Visão Geral

Este backlog organiza todas as tarefas do Portal Administrativo em prioridades, fases e sprints.

---

## 📊 Epics (Alto Nível)

### Epic 1: Componentes Compartilhados (FASE 0)
- Seletor de Empresa (Frontend)
- Multi-Tenant Middleware (Backend)
- Sistema de Temas (Frontend)
- Isolamento de Dados (Backend)

### Epic 2: Infra & Setup (FASE 0)
- Database schema com empresa_id
- Docker & ambiente dev
- CI/CD pipeline
- Documentação técnica

### Epic 3: Diploma Digital - Unigrande (FASE 1)
- Backend: Validação
- Backend: Geração XML
- Backend: Assinatura Digital
- Frontend: Formulário
- Frontend: Visualização
- Integração: Prefeitura SP

### Epic 4: Módulos Expandidos - Unigrande (FASE 2)
- Módulo Acadêmico
- Módulo Financeiro
- Módulo Administrativo
- Módulo Coordenação
- Módulo RH (parcial)

### Epic 5: Validação & Deploy (FASE 3)
- Testes em produção
- Ajustes pós-feedback
- Treinamento usuários
- Documentação final

### Epic 6: Prep AVP (FASE 4)
- Análise requisitos AVP
- Refatoração técnica
- Otimizações
- Planejamento AVP

---

## 📌 Tarefas por Prioridade

### 🔴 CRÍTICA (P0) - Bloqueia tudo

#### Fase 0: Setup
- [ ] Validar decisões arquiteturais com PO (Dez 15)
- [ ] Completar mapeamento de funcionalidades (Dez 22)
- [ ] Aprovar estrutura Jira (Dez 20)
- [ ] Setup database schema com empresa_id
- [ ] Criar middleware de tenant (Backend)
- [ ] Criar Context API de tenant (Frontend)
- [ ] System de temas por empresa

---

### 🟠 ALTA (P1) - Crítico para FASE 1

#### Diploma Digital - Unigrande
- [ ] Backend: Validar diploma (estrutura, campos obrigatórios)
- [ ] Backend: Gerar XML conforme padrão (DOU/Prefeitura)
- [ ] Backend: Implementar assinatura digital
- [ ] Frontend: Form para dados do diploma
- [ ] Frontend: Visualização/preview do diploma
- [ ] Integração: Enviar para Prefeitura SP
- [ ] Integração: Publicar no DOU
- [ ] QA: Testes end-to-end do fluxo completo

---

### 🟡 MÉDIA (P2) - Importante, não bloqueia

#### Módulos Unigrande (FASE 2)
- [ ] Acadêmico: Censo de alunos
- [ ] Acadêmico: Ementas
- [ ] Financeiro: Contas a pagar
- [ ] Financeiro: Notas Fiscais (NFSe)
- [ ] Financeiro: Geração de boletos
- [ ] Administrativo: Gestão de atividades
- [ ] Administrativo: Contratos
- [ ] Administrativo: Convênios

---

### 🔵 BAIXA (P3) - Futuro (FASE 4+)

#### AVP (FASE 5)
- [ ] Análise requisitos AVP
- [ ] Customizações específicas AVP
- [ ] Testes em Staging AVP
- [ ] Deploy produção AVP

---

## 📈 Roadmap por Sprint

### Sprint 0 (Setup) - Dez 23 ~ Dez 31
**Objetivo:** Ambiente pronto, decisões validadas

**Stories:**
- Setup Docker & ambiente dev
- Database initial schema
- Boilerplate Frontend (React + TS + TailwindCSS)
- Boilerplate Backend (Node.js + TS)
- CI/CD pipeline básico
- Documentação técnica final

**Entrega:** Ambiente 100% funcional

---

### Sprint 1 (Componentes Compartilhados) - Jan 6 ~ Jan 20
**Objetivo:** Fundação multi-tenant pronta

**Stories:**
- Seletor de empresa no header
- Context API de tenant (Frontend)
- Middleware de tenant (Backend)
- Sistema de temas por empresa
- Database isolation validation
- Testes unitários básicos

**Entrega:** Multi-tenant working end-to-end

---

### Sprint 2 ~ Sprint 6 (Diploma Digital) - Jan 20 ~ Mar 31
**Objetivo:** Diploma Digital funcionando em produção

**Sprint 2-3: Backend**
- Validação de dados do diploma
- Geração XML
- Assinatura digital

**Sprint 4: Frontend**
- Form de preenchimento
- Visualização do diploma
- Download/compartilhamento

**Sprint 5-6: Integração & QA**
- Integração Prefeitura SP
- Publicação DOU
- Testes end-to-end
- Deploy Staging

**Entrega:** Diploma Digital pronto para produção

---

### Sprint 7 ~ Sprint 10 (Expandir Módulos) - Abr 1 ~ Jun 30
**Objetivo:** Outros módulos Unigrande funcionando

**Módulos:**
- Acadêmico (expandido)
- Financeiro
- Administrativo
- Coordenação

**Entrega:** Todos módulos em Staging

---

### Sprint 11 ~ Sprint 12 (Validação) - Jul 1 ~ Set 30
**Objetivo:** Unigrande em produção, feedback do usuário

**Tarefas:**
- Deploy para produção
- Treinamento usuários
- Suporte 24/7
- Ajustes pós-feedback

**Entrega:** Unigrande GO LIVE

---

### Sprint 13 ~ Sprint 16 (Prep AVP) - Out 1 ~ Dez 31
**Objetivo:** Estrutura pronta para AVP

**Tarefas:**
- Análise requisitos AVP
- Refatoração de código
- Redução de débito técnico
- Otimizações

**Entrega:** AVP roadmap definido

---

## 🔗 Dependências

```
Setup ◄─────── Bloqueador para TUDO
  ↓
Componentes Compartilhados ◄─── Bloqueador para features
  ↓
Diploma Digital ◄─── Bloqueador para Expandir
  ↓
Módulos ◄─── Bloqueador para Produção
  ↓
Produção ◄─── Bloqueador para AVP
```

---

## ✅ Definition of Done

### Por Story
- [ ] Código escrito e revisado
- [ ] Testes escritos (unit + integration)
- [ ] Documentação atualizada
- [ ] PR aprovada
- [ ] Deployed em Staging

### Por Sprint
- [ ] Todas stories completas
- [ ] Testes passando 100%
- [ ] Code review feito
- [ ] Documentação atualizada
- [ ] Sprint review com stakeholders

---

**Próxima revisão:** December 1, 2025
