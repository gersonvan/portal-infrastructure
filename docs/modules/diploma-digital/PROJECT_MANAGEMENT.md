# Gerenciamento do Projeto — Diploma Digital (Unigrande)

**Data:** November 12, 2025  
**Versão:** 2.0 (Consolidado)  
**Empresa:** Unigrande  
**Baseado em:** PID v1.0 + PROJECT_CHARTER.md + DEVELOPMENT_ANALYSIS.md  
**Objetivo:** Documento único para planejamento, execução e monitoramento do MVP do Diploma Digital para Unigrande

---

## 📋 Sumário Executivo

O módulo de **Automação do Diploma Digital** é um projeto **viável em ~6 sprints (16-20 semanas)**. O MVP será entregue até **Março de 2026** com automação de 80% do processo, reduzindo tempo de processamento de 2-3h para 30 minutos por solicitação.

**Conclusão:** APROVADO para iniciar Sprint 0 desde que:
- ✅ Spike sobre API eDiploma seja concluído em Nov
- ✅ Acesso ao Lyceum seja provisionado antes do Sprint 1
- ✅ Design UX seja aprovado rapidamente

---

## 1️⃣ Visão e Contexto do Projeto

### 1.1. Contexto Atual (Pain Points)

O processo de emissão de diplomas digitais é atualmente **manual, fragmentado e com alto risco operacional**:

| Aspecto | Situação Atual | Problema |
|---|---|---|
| **Ferramentas** | Email, Word, WhatsApp, Lyceum, eDiploma | Fragmentação + perda de contexto |
| **Tempo/Solicitação** | 2-3 horas | Lentidão operacional |
| **Taxa de Erro** | ~15% de retrabalho | Risco de erros críticos |
| **Transparência** | Inexistente | Aluno desconectado do processo |
| **Segurança** | Dispersa em múltiplos locais | Risco de vazamento de dados |

### 1.2. Visão do Produto

Criar uma **solução digital integrada** que:
- Se integre aos portais existentes (Portal Aluno + Portal Administrativo)
- Automatize e centralize todo o ciclo de vida da emissão do diploma
- Orquestre o fluxo completo: solicitação → validação → geração → entrega
- Transforme o processo em experiência **eficiente, segura e transparente**

### 1.3. Objetivos do Negócio

| Objetivo | Target | Como Medir |
|---|---|---|
| **Eficiência** | Reduzir 80% do tempo | Tempo antigo vs tempo novo |
| **Qualidade** | Eliminar erros formatação | Taxa de retrabalho < 5% |
| **Segurança** | Centralizar dados sensíveis | Conformidade LGPD 100% |
| **UX Aluno** | Total transparência | NPS > 7 (MVP), > 8.5 (final) |
| **Satisfação Ana** | Reduzir 80% tarefas manuais | Validação direta com usuária |

---

## 2️⃣ Escopo do Projeto

### 2.1. MVP — O Que Está Incluso ✅

#### Módulo Aluno (Portal Aluno)
- ✅ Formulário de solicitação de diploma
- ✅ Upload de documentos (RG, certificado EM, outros)
- ✅ Visualização de status da solicitação em tempo real
- ✅ Notificações por email e portal

#### Módulo Administrativo (Portal Administrativo)
- ✅ Tela centralizada de análise com dados consolidados
- ✅ Integração com Lyceum (dados acadêmicos + financeiros)
- ✅ Sistema de aprovação/reprovação com justificativa
- ✅ Validações automáticas (situação acadêmica/financeira)

#### Processamento Automático
- ✅ Geração automática de CSVs (dados pessoais + histórico acadêmico)
- ✅ Conversão para PDF-A (conformidade MEC)
- ✅ Nomenclatura automática de arquivos
- ✅ Geração de pacote .zip para download/envio

#### Integrações
- ✅ **Plano A (Ideal):** Integração com API eDiploma (se disponível)
- ✅ **Plano B (Fallback):** Upload manual via .zip

### 2.2. Escopo Não Incluso — Phase 2+ ❌

- ❌ Assinatura digital automática de termos
- ❌ Dashboard com métricas avançadas
- ❌ Mecanismos antifraude documental
- ❌ Histórico de diplomas já emitidos
- ❌ Integrações com outros sistemas legados

---

## 3️⃣ Stakeholders e Equipe

### 3.1. Stakeholders Principais

| Stakeholder | Papel | Interesse | Frequência |
|---|---|---|---|
| **Ana Oliveira** | Usuária Principal / Power User | Alto | Diária/Semanal |
| **Alunos Concluintes** | Usuários Finais | Médio | Por demanda |
| **Product Owner** | Gestão do backlog | Alto | Diária |
| **Equipe de TI** | Infraestrutura + suporte | Alto | Diária |
| **Direção de Reg. Acadêmico** | Aprovação final | Alto | Semanal |

### 3.2. Persona Principal — Ana Oliveira

**Perfil:** Analista Administrativa, 38 anos, Fortaleza  
**Experiência:** Conhece cada regra de negócio do processo de diploma  
**Frustrações principais:**
> "Eu preciso usar email, Word, WhatsApp, Lyceum e eDiploma. É muita troca de janelas!"

**Objetivos:**
1. Emitir diplomas SEM erros
2. Reduzir tempo por solicitação
3. Gerenciar tudo em UMA interface
4. Garantir proteção de dados sensíveis

---

## 4️⃣ Requisitos Funcionais (User Stories)

### 4.1. Épico 1: Solicitação e Acompanhamento do Aluno

#### HU-01: Como aluno, quero solicitar meu diploma e anexar documentos
- **Aceitação:** Aluno consegue enviar formulário + documentos e recebe confirmação
- **Documentos aceitos:** RG, Cert. EM, CPF, outros (validação de tipos/tamanho)
- **Armazenamento:** Azure Blob Storage com segurança

#### HU-02: Como aluno, quero acompanhar o status da minha solicitação
- **Aceitação:** Visualização clara de status em tempo real no portal
- **Notificações:** Email + notificação no portal quando há mudança
- **Histórico:** Poder ver todas as alterações do status

### 4.2. Épico 2: Análise e Validação Administrativa

#### HU-03: Como analista, quero ter uma tela única para validar todos os dados e documentos
- **Aceitação:** Dashboard consolidado com dados do Lyceum + documentos do aluno
- **Validações automáticas:** Situação acadêmica OK? Financeira OK? Sistema valida
- **Filtros:** Buscar por nome, matrícula, status, data

#### HU-04: Como analista, quero reprovar um documento e notificar o aluno
- **Aceitação:** Modal com justificativa, aluno recebe notificação
- **Reenvio:** Aluno consegue reenviar documento corrigido
- **Auditoria:** Log completo de quem rejeitou e quando

### 4.3. Épico 3: Geração de Arquivos e Envio para o eDiploma

#### HU-05: O sistema deve gerar automaticamente os arquivos CSV
- **Aceitação:** Geração de 2 CSVs (dados pessoais + histórico acadêmico)
- **Validação:** Verificar estrutura antes de gerar
- **Armazenamento:** Blob Storage

#### HU-06: O sistema deve gerar e nomear automaticamente documentos em PDF-A
- **Aceitação:** Conversão PDF-A (conformidade MEC) + nomenclatura padrão
- **Validação:** Verificar se PDF está válido e certificado
- **Padrão de nome:** Definido com TI (ex: `DIPLOMA_[CPF]_[DATA].pdf`)

#### HU-07: O sistema deve permitir envio do lote para o eDiploma
- **Plano A:** Via API eDiploma (se disponível após spike)
- **Plano B:** Gerar .zip para download + upload manual
- **Rastreamento:** Armazenar retorno + status de envio

### 4.4. Épico 4: Entrega do Diploma ao Aluno

#### HU-08: O sistema deve armazenar o retorno do eDiploma
- **Aceitação:** Receber arquivo final assinado do eDiploma
- **Armazenamento:** Blob Storage com backup
- **Status:** Marcar solicitação como "Concluída"

#### HU-09: Como aluno, quero acessar o link do meu diploma finalizado
- **Aceitação:** Link seguro com expiração (72h recomendado)
- **Download:** Arquivo PDF-A do diploma assinado
- **Auditoria:** Log de quem fez download e quando

---

## 5️⃣ Requisitos Não Funcionais

### 5.1. Segurança e Conformidade
- ✅ **LGPD:** Armazenamento seguro, criptografia, auditoria completa
- ✅ **MEC:** Geração PDF-A, nomenclatura padrão, conformidade formatos
- ✅ **Autenticação:** Azure AD (SSO), autenticação de dois fatores
- ✅ **Autorização:** Controle de acesso por papel (Student, Analyst, Admin)

### 5.2. Usabilidade
- ✅ **Interface:** Design intuitivo, minimização de cliques
- ✅ **Feedback:** Mensagens claras de erro/sucesso
- ✅ **Ajuda:** Tooltips contextuais, videos de procedimentos
- ✅ **Mobile:** Responsivo para tablets (alunos + analistas)

### 5.3. Performance e Escalabilidade
- ✅ **Tempo resposta:** < 2s em operações críticas
- ✅ **Throughput:** Processar 3x volume atual (MVP) → 5x (final)
- ✅ **Disponibilidade:** 99.5% uptime (Azure SLA)
- ✅ **Escalabilidade:** Arquitetura serverless (Azure Functions)

---

## 6️⃣ Decomposição Técnica e Estimativas

### 6.1. Estimativas por User Story

| Épico | HU | Descrição | Story Points | Sprints |
|---|---|---|---|---|
| **1** | HU-01 | Solicitação de diploma | 60 | 1.5 |
| **1** | HU-02 | Acompanhamento status | 39 | 1 |
| **2** | HU-03 | Tela análise (Admin) | 82 | 2 |
| **2** | HU-04 | Rejeição + notificação | 34 | 1 |
| **3** | HU-05 | Geração CSV | 29 | 0.75 |
| **3** | HU-06 | Geração PDF-A | 42 | 1 |
| **3** | HU-07 | Envio eDiploma | 41 | 1 |
| **4** | HU-08 | Armazenar retorno | 29 | 0.75 |
| **4** | HU-09 | Acesso diploma | 23 | 0.5 |
| **Spike** | Spike | Investigar API eDiploma | 4 | 0.5 |
| **TOTAL MVP** | 9 HU | - | **~383 pts** | **~6 sprints** |

### 6.2. Exemplo de Decomposição — HU-01 (Solicitação)

| Task | Componente | Pts | Descrição |
|---|---|---|---|
| T1.1 | Backend | 5 | Criar modelos (SolicitacaoDiploma, DocumentoAluno) |
| T1.2 | Backend | 8 | API REST: POST /diplomas/solicitar |
| T1.3 | Backend | 5 | Validar documentos (tipo, tamanho, extensão) |
| T1.4 | Backend | 8 | Integração Azure Blob Storage |
| T1.5 | Frontend | 13 | Tela de solicitação (formulário + upload) |
| T1.6 | Backend | 5 | Middleware autenticação/autorização |
| T1.7 | QA | 8 | Testes unitários + integração |
| T1.8 | QA | 8 | Testes E2E (fluxo completo) |
| **Total** | - | **60** | - |

---

## 7️⃣ Roadmap e Timeline

### 7.1. Estrutura de Sprints

```
SPRINT 0 — PREPARAÇÃO (Nov 12-19) — 27 pts
├─ Spike: Investigar API eDiploma ........... 4 pts
├─ Setup infraestrutura Azure .............. 5 pts
├─ Setup projeto NestJS + Next.js .......... 5 pts
├─ Design UX/Wireframes .................... 13 pts
└─ Deliverables: Ambientes prontos, design aprovado, spike concluído

SPRINT 1 — MVP P1: ALUNO (Dez 01-15) — 99 pts
├─ HU-01: Solicitação diploma .............. 60 pts
├─ HU-02: Acompanhamento status ............ 39 pts
└─ Deliverables: Aluno consegue solicitar e acompanhar

SPRINT 2 — MVP P2: ADMIN (Dez 16-22 + Jan 06) — 116 pts
├─ HU-03: Tela análise centralizada ........ 82 pts
├─ HU-04: Rejeição + notificação ........... 34 pts
└─ Deliverables: Ana consegue validar solicitações

SPRINT 3 — MVP P3: ARQUIVOS (Jan 06-19) — 108 pts
├─ HU-05: Geração CSV ...................... 29 pts
├─ HU-06: Geração PDF-A .................... 42 pts
├─ HU-07: Envio eDiploma ................... 37 pts
└─ Deliverables: Sistema gera e envia arquivos automaticamente

SPRINT 4 — MVP P4: ENTREGA (Jan 20-31) — 52 pts
├─ HU-08: Armazenar retorno eDiploma ....... 29 pts
├─ HU-09: Acesso diploma aluno ............. 23 pts
└─ Deliverables: Aluno acessa diploma finalizado

SPRINT 5 — VALIDAÇÃO (Fev 01-14) — 47 pts
├─ UAT com Ana Oliveira .................... 21 pts
├─ Correção de bugs ........................ 13 pts
├─ Otimizações performance ................. 13 pts
└─ Deliverables: Sistema validado, pronto para go-live

GO-LIVE → Março 2026
```

### 7.2. Calendar Gantt

```
2025                                  2026
Nov   |  Dez       |  Jan       |  Fev    |  Mar
|-----|-----------|-----------|---------|----
S0 |SP1|SP2|SP3|SP4|SP5|GO
```

**Duração Total:** ~4 meses (Nov 2025 → Mar 2026)

---

## 8️⃣ Arquitetura Técnica

### 8.1. Stack Tecnológico

| Camada | Tecnologia | Versão | Justificativa |
|---|---|---|---|
| **Frontend** | React 18 + Next.js | 14.x | TypeScript, SSR, otimizações built-in |
| **Backend** | Node.js + NestJS | 10.x | TypeScript, modular, testável, produção-ready |
| **Database** | SQL Server (Azure) | 2022 | Conformidade Azure, LGPD, backup automático |
| **Autenticação** | Azure AD | v2 | SSO, integração infraestrutura |
| **Storage** | Azure Blob | Standard | Escalável, seguro, baixo custo |
| **Processamento** | Azure Functions | Node.js 18 | Serverless, PDF-A conversion |
| **CI/CD** | GitHub Actions | - | Integrado com repo |
| **Monitoramento** | Application Insights | - | Logs, alertas, performance |

### 8.2. Arquitetura de Alto Nível

```
┌─────────────────────────────────────────────────────────────┐
│                    PORTAIS (Frontend)                        │
│                                                               │
│  ┌──────────────────┐          ┌──────────────────┐          │
│  │  Portal Aluno    │          │  Portal Admin     │          │
│  │  • Solicitação   │          │  • Dashboard      │          │
│  │  • Acompanhamento│          │  • Análise        │          │
│  └──────────────────┘          │  • Aprovação      │          │
│                                 └──────────────────┘          │
└─────────────────────────┬───────────────────────────────────┘
                          │ HTTP/REST
┌─────────────────────────▼───────────────────────────────────┐
│              API BACKEND (NestJS)                            │
│                                                               │
│  ┌────────────────────────────────────────────────────────┐ │
│  │  Controllers (Routes)                                  │ │
│  │  • /diplomas/solicitar, /status, /validar, etc.       │ │
│  └────────────────────────────────────────────────────────┘ │
│                          │                                   │
│  ┌────────────────────────────────────────────────────────┐ │
│  │  Services (Business Logic)                             │ │
│  │  • SolicitacaoService                                  │ │
│  │  • ValidacaoService (Lyceum integration)              │ │
│  │  • GeracaoArquivosService                              │ │
│  │  • eDiplomaService                                      │ │
│  └────────────────────────────────────────────────────────┘ │
│           │           │           │           │              │
└───────────┼───────────┼───────────┼───────────┼──────────────┘
            │           │           │           │
    ┌───────▼┐ ┌────────▼─┐ ┌──────▼──┐ ┌─────▼──────┐
    │  SQL   │ │  Azure   │ │ Azure   │ │  Azure     │
    │ Server │ │  Blob    │ │Function │ │ Active Dir │
    │        │ │ Storage  │ │ (PDF-A) │ │   (SSO)    │
    └────────┘ └──────────┘ └─────────┘ └────────────┘
            │           │           │
            └───────────┼───────────┘
                        │
        ┌───────────────┼───────────────┐
        │               │               │
    ┌───▼──┐        ┌───▼──┐       ┌───▼──┐
    │Lyceum│        │eDiploma│     │Email │
    │ (DB) │        │(API)   │     │(SMTP)│
    └──────┘        └────────┘     └──────┘

Legend:
 • Portais: React/Next.js
 • API: Node.js/NestJS
 • Banco: Azure SQL
 • Armazenamento: Azure Blob
 • Processamento: Azure Functions
 • Integrações: Lyceum, eDiploma, Email
```

### 8.3. Infraestrutura Azure (Recursos Necessários)

```yaml
Recursos Azure para MVP:
  - Azure App Service (x2 para API + Frontend)
  - Azure SQL Database (Standard S1 ou S2)
  - Azure Blob Storage (Standard LRS)
  - Azure Functions (Consumption Plan — pay-per-use)
  - Azure Active Directory (já contratado)
  - Azure Key Vault (secrets/passwords)
  - Azure Application Insights (monitoramento)
```

---

## 9️⃣ Integrações Críticas

### 9.1. Sistema Lyceum (Dados Acadêmicos)

| Aspecto | Detalhes |
|---|---|
| **Método** | Leitura direta do banco (read-only) |
| **Dados** | Situação acadêmica, financeira, dados pessoais |
| **Acesso** | Via credenciais AD (impersonação) |
| **Frequência** | Real-time (validação automática) |
| **Risco** | Sistema legado → Spike técnico necessário |

**Ação Imediata:** Provisionar acesso Lyceum antes de Sprint 1

### 9.2. Sistema eDiploma

| Aspecto | Plano A | Plano B |
|---|---|---|
| **Método** | Via API REST | Upload manual |
| **Arquivos** | Envio automático CSVs + PDFs | Gerar .zip para download |
| **Status** | Retorno automático | Manual |
| **Timeline** | Se API disponível | Fallback garantido |
| **Risco** | Spike necessário | Mitigado com Plano B |

**Ação Imediata:** Investigar disponibilidade API eDiploma (Spike S0)

### 9.3. Sistema de Email (Notificações)

| Aspecto | Detalhes |
|---|---|
| **Provider** | SMTP (Azure Mail ou Office 365) |
| **Templates** | Email para alunos (status changes) |
| **Frequency** | Imediato (real-time) |
| **Fallback** | Notificação no portal se email falhar |

---

## 🔟 Riscos Técnicos e Mitigação

### Risco 1: API eDiploma Não Disponível ⚠️ ALTO

| Aspecto | Descrição |
|---|---|
| **Impacto** | HU-07 e HU-08 ficariam bloqueadas |
| **Probabilidade** | Média (definida no PID) |
| **Mitigation** | Spike em Sprint 0 (4 pts); Plano B garantido |
| **Action** | Contatar fornecedor eDiploma HOJE |

### Risco 2: Integração Lyceum Complexa ⚠️ MÉDIO

| Aspecto | Descrição |
|---|---|
| **Impacto** | HU-03 (dashboard admin) atrasaria |
| **Probabilidade** | Média (sistema legado) |
| **Mitigation** | Alocado 21 pts; paralelizar com mock data |
| **Action** | Provisionar acesso Lyceum antes Sprint 1 |

### Risco 3: Conversão PDF-A Complexa ⚠️ MÉDIO

| Aspecto | Descrição |
|---|---|
| **Impacto** | HU-06 pode estourar estimativa |
| **Probabilidade** | Média (conformidade MEC exigente) |
| **Mitigation** | Azure Functions abstrai complexidade; fallback com iText |
| **Action** | POC com PDF-A em Sprint 0 |

### Risco 4: Escopo Creep ⚠️ ALTO

| Aspecto | Descrição |
|---|---|
| **Impacto** | Sprints estouram, projeto atrasa |
| **Probabilidade** | Alta (stakeholders pedem features) |
| **Mitigation** | Scope congelado (MVP apenas); features extras → Phase 2 |
| **Action** | Comunicar limites de escopo em kickoff |

### Risco 5: Design UX Atrasado ⚠️ MÉDIO

| Aspecto | Descrição |
|---|---|
| **Impacto** | Frontend não consegue começar Sprint 1 |
| **Probabilidade** | Média (frequente em projetos) |
| **Mitigation** | Design UX em Sprint 0 (13 pts); reutilizar design system |
| **Action** | Agendar design workshop em Nov |

---

## 1️⃣1️⃣ Dependências Críticas (Bloqueadores)

```
ANTES DE SPRINT 1 — CRÍTICO:
├─ ✅ Acesso ao Lyceum (Read-only database)
├─ ✅ API eDiploma investigada (Spike concluído)
├─ ✅ Azure subscription com permissões completas
├─ ✅ Design UX aprovado por Ana
├─ ✅ Repositório Git estruturado
└─ ✅ CI/CD pipeline funcional

ANTES DE SPRINT 2 — IMPORTANTE:
├─ ✅ Conectividade Lyceum testada
├─ ✅ Estrutura banco Lyceum documentada
└─ ✅ Credenciais AD para acesso legado

ANTES DE SPRINT 3 — IMPORTANTE:
├─ ✅ Azure Functions configuradas
├─ ✅ Conformidade PDF-A validada
└─ ✅ eDiploma (Plano A ou B) definido
```

---

## 1️⃣2️⃣ Definição de Pronto (Definition of Done)

### Por Task
- ✅ Código escrito, revisado e mergeado
- ✅ Testes unitários (cobertura ≥ 80%)
- ✅ Testes de integração executados
- ✅ Documentação técnica atualizada
- ✅ PR aprovado por 1+ reviewer

### Por User Story
- ✅ Todas as tasks completas
- ✅ Testes E2E passando
- ✅ Validado com PO/Ana Oliveira
- ✅ Documentação de usuário finalizada
- ✅ Ready to deploy (sem débitos técnicos)

### Por Sprint
- ✅ Todas as HU do Sprint em "Done"
- ✅ Spike (se houver) concluído
- ✅ Testes E2E passando no staging
- ✅ Sprint Review com stakeholders
- ✅ Sprint Retro com lições aprendidas

---

## 1️⃣3️⃣ Cerimônias Ágeis

### Scrum Ceremonies

| Cerimônia | Frequência | Duração | Participantes | Objetivo |
|---|---|---|---|---|
| **Daily Standup** | Diário (9:00 AM) | 15 min | Time dev | Sincronização, bloqueadores |
| **Sprint Planning** | Início sprint | 2h | PO, time | Definir sprint backlog |
| **Sprint Review** | Fim sprint | 1.5h | Time + stakeholders | Demonstrar incremento |
| **Sprint Retro** | Fim sprint | 1h | Time | Melhorias processo |
| **Refinement** | Terça 14:00 | 1h | PO, time | Clarificar user stories |
| **Validação Ana** | Sexta 15:00 | 1h | Ana, PO, tech lead | Feedback continuo |

---

## 1️⃣4️⃣ Checklist Sprint 0 (Preparação)

### Semana 1 (Nov 12-19)

#### ✅ Administrativa
- [ ] Kickoff com time (PO, devs, QA, DevOps)
- [ ] Kickoff com stakeholders (Ana, TI, Direção)
- [ ] Definir horários reuniões (daily, refinement, etc)
- [ ] Criar sala Teams/Slack para comunicação
- [ ] Designar escalação para problemas críticos

#### ✅ Técnica
- [ ] Provisionar Azure subscription (DEV, STAGING, PROD)
- [ ] Criar repositório Git (main + dev branches)
- [ ] Setup CI/CD pipeline (GitHub Actions ou Azure DevOps)
- [ ] Criar ambientes: DEV, STAGING, PROD
- [ ] Documentar setup desenvolvimento local (README)
- [ ] Configurar Azure SQL Database (initial schema)
- [ ] Configurar Azure Blob Storage (containers)
- [ ] Setup Application Insights (logs)

#### ✅ Negócio
- [ ] Contatar fornecedor eDiploma (spike)
- [ ] Confirmar acesso Lyceum com TI
- [ ] Provisionar credenciais Azure AD
- [ ] Agendar workshop UX/Design
- [ ] Validar escopo com Ana Oliveira
- [ ] Aprovar timeline e milestones

### Sprint 0 Deliverables

- ✅ Repositório Git estruturado com boilerplate
- ✅ Ambientes Azure criados e testados (DEV, STG, PROD)
- ✅ CI/CD pipeline funcional (build, test, deploy)
- ✅ Wireframes/Design UX aprovados
- ✅ Spike eDiploma concluído
- ✅ Documentação de setup dev finalizada
- ✅ Time pronto para Sprint 1
- ✅ Acesso Lyceum confirmado (ou plano de acesso)

---

## 1️⃣5️⃣ KPIs e Métricas de Sucesso

### Métricas Técnicas (Sprints)

| Métrica | Target | Como Medir |
|---|---|---|
| **Velocity** | 50-60 pts/sprint | Story points concluídos / sprint |
| **Burn-down** | Linear (ideal) | Pts restantes vs dias |
| **Defect Escape** | < 5% | Bugs encontrados pós-MVP / total bugs |
| **Test Coverage** | ≥ 80% | Linhas testadas / total linhas |
| **Deployment Frequency** | 2x/semana | Deploys por semana |
| **Build Success Rate** | ≥ 99% | Builds sucesso / total builds |

### Métricas de Negócio (Pós-MVP)

| Métrica | Target MVP | Target Final | Como Medir |
|---|---|---|---|
| **Redução Tempo** | 60% | 80% | (Tempo antigo - novo) / antigo |
| **Taxa Erro** | < 5% | < 1% | Erros / 100 diplomas |
| **Satisfação Ana** | > 7 | > 8.5 | NPS survey |
| **Taxa Conclusão** | ≥ 90% | ≥ 95% | Solicitações completas / total |
| **Uptime** | 99% | 99.5% | Monitoramento contínuo |

---

## 1️⃣6️⃣ Plano de Implantação (Rollout)

### Fase 1: Piloto (2 semanas)
- Grupo: 5-10 solicitações com Ana
- Suporte: Full-time on-site
- Ajustes: Rápidos baseados em feedback

### Fase 2: Expansão Controlada (2 semanas)
- Volume: 25-30 solicitações
- Operação: Paralela com sistema antigo
- Refinamentos: Usabilidade e performance

### Fase 3: Transição Completa (1 semana)
- Todas novas solicitações no novo sistema
- Sistema antigo: Mantido para consulta
- Suporte: Dedicado no local

### Critérios de Sucesso
1. ✅ Zero perda de dados
2. ✅ Sem interrupção de serviço
3. ✅ Ana operando independentemente
4. ✅ Tempo processamento < 30 min
5. ✅ Satisfação Ana > 7/10

---

## 1️⃣7️⃣ Próximos Passos Imediatos

### Hoje (Nov 12) — CRÍTICO

- [ ] Executivo aprova projeto + timeline
- [ ] Contatar fornecedor eDiploma (spike inicial)
- [ ] Provisionar Azure subscription
- [ ] Chamar kickoff com time

### Esta Semana (Nov 13-19)

- [ ] Execução Sprint 0 em paralelo
- [ ] Spike eDiploma progride
- [ ] Design UX iniciado
- [ ] Acesso Lyceum confirmado
- [ ] CI/CD pipeline setup

### Próxima Semana (Nov 20+)

- [ ] Sprint Review 0 + Retro
- [ ] Sprint Planning 1
- [ ] **INÍCIO SPRINT 1** (Módulo Aluno)

---

## 1️⃣8️⃣ Conclusão Executiva

### ✅ Viabilidade do Projeto

O **MVP do Diploma Digital é VIÁVEL** em ~6 sprints (16-20 semanas) com conclusão planejada para **Março de 2026**.

**Equipe:** 4-5 pessoas (multidisciplinar)  
**Custo:** ~$500-700/mês (infraestrutura Azure)  
**ROI:** Redução 80% tempo (2-3h → 30 min) + zero erros

### ✅ Critérios de Sucesso

- ✅ Spike eDiploma concluído rapidamente (Nov)
- ✅ Acesso Lyceum provisionado (antes Sprint 1)
- ✅ Design UX aprovado (Sprint 0)
- ✅ Escopo congelado (apenas MVP até Mar 2026)
- ✅ Validação contínua com Ana Oliveira

### ⚠️ Riscos Críticos

| Risco | Impacto | Probabilidade | Mitigação |
|---|---|---|---|
| eDiploma API indisponível | Alto | Média | Plano B + Spike |
| Lyceum acesso atrasado | Alto | Média | Acessar ASAP |
| Escopo creep | Alto | Alta | Scope congelado |
| Design UX atrasado | Médio | Média | Sprint 0 (13 pts) |
| PDF-A complexo | Médio | Média | Azure Fn + iText |

### 🚀 Recomendação

**APROVADO PARA INICIAR SPRINT 0**

Próxima revisão: **Nov 19** (Sprint Review 0)

---

## Histórico de Revisões

| Data | Versão | Descrição | Autor |
|---|---|---|---|
| 2025-11-12 | 2.0 | Consolidação PROJECT_CHARTER + DEVELOPMENT_ANALYSIS | Gen AI |
| 2025-11-05 | 1.0 | PROJECT_CHARTER versão inicial | - |

---

**Documento Consolidado em:** November 12, 2025  
**Próxima Revisão:** Nov 19, 2025 (após Sprint Review 0)  
**Responsáveis:** Product Owner + Tech Lead
