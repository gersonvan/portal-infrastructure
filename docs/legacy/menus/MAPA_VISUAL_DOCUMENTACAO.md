# 🗺️ Mapa Visual da Documentação

Hierarquia visual de leitura recomendada

---

## 📍 Diagrama de Navegação Recomendada

```
                    🚀 COMEÇA AQUI
                         |
                    README.md (15 min)
                   "O que é o projeto?"
                         |
            ______________|_____________
           |              |              |
           v              v              v
      STAKEHOLDER   TECH LEAD      DEVELOPER
           |              |              |
    BACKLOG.md    MULTI_TENANT_     MULTI_TENANT_
    (5 min)      ARCHITECTURE.md   ARCHITECTURE.md
    "Timeline"    (15 min)         (15 min)
           |       "Como funciona"  "Como funciona"
           |              |              |
           v              v              v
    PROXIMOS_      ESTRUTURA_       GLOSSARIO.md
    PASSOS.md      JIRA.md          (Referência)
    (5 min)        (5 min)
    "O que fazer"   "Organização"
           |              |              |
           v              v              v
        FAQ.md     MAPEAMENTO_        FAQ.md
        (10 min)   EMPRESAS.md      (Consulta)
                   (10 min)
                         |
                    ✅ PRONTO PARA
                   COMEÇAR SPRINT 1
```

---

## 🎯 Por Perfil de Usuário

### 👔 **STAKEHOLDER / PO**

```
1️⃣ README.md (15 min)
   └─ Entender o que é Portal Administrativo
   
2️⃣ BACKLOG.md (5 min)
   └─ Ver timeline e fases
   
3️⃣ PROXIMOS_PASSOS.md (5 min)
   └─ Saber bloqueadores e reuniões críticas
   
4️⃣ FAQ.md - Seção "Project" (5 min)
   └─ Esclarecer dúvidas frequentes
   
⏱️ Total: ~30 minutos

✅ Resultado: Entender projeto, saber o que fazer, datas críticas
```

### 👨‍💼 **TECH LEAD / ARQUITETO**

```
1️⃣ README.md (10 min)
   └─ Contexto geral
   
2️⃣ MULTI_TENANT_ARCHITECTURE.md (20 min)
   └─ Entender decisões técnicas e código
   
3️⃣ ESTRUTURA_JIRA.md (5 min)
   └─ Validar organização projeto
   
4️⃣ FAQ.md - Seção "Architecture" (10 min)
   └─ Resolver dúvidas técnicas
   
5️⃣ GLOSSARIO.md (Consulta contínua)
   └─ Referência de termos
   
⏱️ Total: ~45 minutos

✅ Resultado: Validar viabilidade, aprovar arquitetura, definir tech stack
```

### 👨‍💻 **DESENVOLVEDOR FRONTEND**

```
1️⃣ README.md (10 min)
   └─ Entender projeto
   
2️⃣ MULTI_TENANT_ARCHITECTURE.md - Seção 6 (15 min)
   └─ Frontend: Context API, Seletor, Tema
   
3️⃣ FAQ.md - Seção "Frontend" (10 min)
   └─ State management, componentes, routing
   
4️⃣ GLOSSARIO.md (Consulta contínua)
   └─ Termos React, contexto, middleware
   
5️⃣ MAPEAMENTO_EMPRESAS.md (10 min)
   └─ Entender features a desenvolver
   
⏱️ Total: ~45-55 minutos

✅ Resultado: Entender arquitetura, saber padrões, pronto para código
```

### 👨‍💻 **DESENVOLVEDOR BACKEND**

```
1️⃣ README.md (10 min)
   └─ Entender projeto
   
2️⃣ MULTI_TENANT_ARCHITECTURE.md - Seção 5 (15 min)
   └─ Backend: Middleware, isolamento, RBAC
   
3️⃣ FAQ.md - Seção "Backend" (10 min)
   └─ Queries, validação, autenticação
   
4️⃣ GLOSSARIO.md (Consulta contínua)
   └─ Termos SQL, middleware, empresa_id
   
5️⃣ MAPEAMENTO_EMPRESAS.md (10 min)
   └─ Entender features a desenvolver
   
⏱️ Total: ~45-55 minutos

✅ Resultado: Entender isolamento, saber padrões, pronto para APIs
```

### 💾 **DBA / DATA ENGINEER**

```
1️⃣ README.md (10 min)
   └─ Entender projeto
   
2️⃣ MULTI_TENANT_ARCHITECTURE.md - Seção 3 (15 min)
   └─ Data Isolation: schema, empresa_id, row-level security
   
3️⃣ FAQ.md - Seção "Database" (10 min)
   └─ Backup, shared schema, queries
   
4️⃣ GLOSSARIO.md (Consulta contínua)
   └─ Termos SQL, isolamento, empresa_id
   
5️⃣ MAPEAMENTO_EMPRESAS.md (10 min)
   └─ Dados para cada módulo
   
⏱️ Total: ~45-55 minutos

✅ Resultado: Desenhar schema, validar isolamento, criar migrações
```

---

## 📚 Hierarquia de Importância

```
🔴 CRÍTICO (Leia primeiro)
├─ README.md
├─ MULTI_TENANT_ARCHITECTURE.md
└─ BACKLOG.md

🟡 IMPORTANTE (Leia no primeiro dia)
├─ docs/GLOSSARIO.md
├─ docs/FAQ.md
├─ docs/ESTRUTURA_JIRA.md
└─ PROXIMOS_PASSOS.md

🟢 REFERÊNCIA (Consulte quando necessário)
├─ docs/MAPEAMENTO_EMPRESAS.md
├─ docs/INDICE_DOCUMENTACAO.md
└─ Guias Confluence
```

---

## 🔍 Matriz: Perfil x Documento

| Documento | Stakeholder | Tech Lead | Frontend | Backend | DBA | QA |
|-----------|-------------|-----------|----------|---------|-----|-----|
| README.md | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ |
| BACKLOG.md | ⭐⭐⭐ | ⭐⭐ | ⭐⭐ | ⭐⭐ | ⭐ | ⭐⭐ |
| MULTI_TENANT_ARCH | ⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ |
| ESTRUTURA_JIRA | ⭐⭐ | ⭐⭐⭐ | ⭐⭐ | ⭐⭐ | ⭐ | ⭐⭐ |
| MAPEAMENTO_EMP | ⭐⭐ | ⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ |
| GLOSSARIO.md | ⭐ | ⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ |
| FAQ.md | ⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | ⭐ |
| PROXIMOS_PASSOS | ⭐⭐⭐ | ⭐⭐ | ⭐ | ⭐ | ⭐ | ⭐ |

---

## ⏱️ Tempos de Leitura

```
📍 QUICK (5-10 min)
   - README.md (15 min) - Mas ler rápido
   - PROXIMOS_PASSOS.md (5 min)
   - ESTRUTURA_JIRA.md (5 min)

📍 MEDIUM (30-45 min)
   - BACKLOG.md (10 min)
   - MULTI_TENANT_ARCHITECTURE.md (20 min)
   - FAQ.md seção específica (10 min)

📍 THOROUGH (1-2 horas)
   - Todos os documentos acima
   - GLOSSARIO.md (30 min)
   - MAPEAMENTO_EMPRESAS.md (15 min)
   - Reler e fazer anotações
```

---

## 🎓 Trilhas de Aprendizado

### Trilha "Começar em 1 Hora"
```
⏱️ 60 minutos total

1. README.md (15 min)
2. BACKLOG.md (10 min)
3. MULTI_TENANT_ARCHITECTURE.md - Overview (15 min)
4. FAQ.md - sua seção (15 min)
5. PROXIMOS_PASSOS.md (5 min)

✅ Resultado: Entender projeto, saber próximos passos
```

### Trilha "Onboarding Completo"
```
⏱️ 2-3 horas total

1. README.md (15 min)
2. BACKLOG.md (10 min)
3. MULTI_TENANT_ARCHITECTURE.md (20 min)
4. ESTRUTURA_JIRA.md (5 min)
5. MAPEAMENTO_EMPRESAS.md (10 min)
6. GLOSSARIO.md (30 min - ler e anotar)
7. FAQ.md - sua seção (15 min)
8. PROXIMOS_PASSOS.md (5 min)

✅ Resultado: Preparado para começar tarefas reais
```

### Trilha "Deep Dive Arquitetura"
```
⏱️ 3-4 horas total

Tudo da trilha "Onboarding" +
1. MULTI_TENANT_ARCHITECTURE.md - Releitura (30 min)
2. FAQ.md - Todas as seções (30 min)
3. Código-fonte (exemplos em MULTI_TENANT_ARCHITECTURE.md)
4. Desenhar diagramas pessoais
5. Fazer anotações técnicas

✅ Resultado: Expert em arquitetura multi-tenant
```

---

## 🚀 Guia Rápido de Início

### Você é um stakeholder?
👉 Leia: `README.md` → `BACKLOG.md` → `PROXIMOS_PASSOS.md`

### Você é tech lead?
👉 Leia: `README.md` → `MULTI_TENANT_ARCHITECTURE.md` → `ESTRUTURA_JIRA.md`

### Você é desenvolvedor?
👉 Leia: `README.md` → `MULTI_TENANT_ARCHITECTURE.md` → `docs/GLOSSARIO.md` (consulta)

### Você é designer/UX?
👉 Leia: `README.md` → `MAPEAMENTO_EMPRESAS.md` → `MULTI_TENANT_ARCHITECTURE.md` (seção 6)

### Você é DBA?
👉 Leia: `README.md` → `MULTI_TENANT_ARCHITECTURE.md` (seção 3) → `FAQ.md` (Database)

---

## 🔗 Links por Tipo de Pergunta

**"O que é Portal Administrativo?"**
→ [README.md](./README.md)

**"Qual é a timeline?"**
→ [docs/BACKLOG.md](./docs/BACKLOG.md)

**"Como funciona o multi-tenant?"**
→ [docs/MULTI_TENANT_ARCHITECTURE.md](./docs/MULTI_TENANT_ARCHITECTURE.md)

**"Qual é a próxima reunião?"**
→ [docs/PROXIMOS_PASSOS.md](./docs/PROXIMOS_PASSOS.md)

**"O que é [termo técnico]?"**
→ [docs/GLOSSARIO.md](./docs/GLOSSARIO.md)

**"Por que decidimos X?"**
→ [docs/FAQ.md](./docs/FAQ.md)

**"Como funciona o Jira?"**
→ [docs/ESTRUTURA_JIRA.md](./docs/ESTRUTURA_JIRA.md)

**"Quais são os módulos?"**
→ [docs/MAPEAMENTO_EMPRESAS.md](./docs/MAPEAMENTO_EMPRESAS.md)

---

**Versão:** 1.0  
**Criado:** November 12, 2025  
**Status:** 🟢 Completo
