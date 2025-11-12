# 📍 Localização de Arquivos

Guia para encontrar rapidamente cada documento

---

## 📁 Estrutura de Pastas

```
Portal Administrativo/
│
├── 📄 README.md                              ← COMECE AQUI
│   Visão geral completa do projeto
│
├── 📄 RESUMO_ENTREGA.md
│   O que foi entregue
│
├── 📄 MAPA_VISUAL_DOCUMENTACAO.md
│   Hierarquia de leitura (este arquivo ajuda!)
│
├── 📄 LOCALIZACAO_ARQUIVOS.md
│   Onde encontrar cada coisa (você está aqui)
│
├── 📁 docs/                                  ← DOCUMENTAÇÃO TÉCNICA
│   │
│   ├── 📄 BACKLOG.md
│   │   Épicos, tasks, sprints (12+)
│   │   Timeline (5 fases, 2024-2026)
│   │
│   ├── 📄 GLOSSARIO.md
│   │   110+ definições técnicas (A-Z)
│   │
│   ├── 📄 FAQ.md
│   │   50+ respostas frequentes
│   │   Por categoria: Architecture, Frontend, Backend, etc
│   │
│   ├── 📄 MULTI_TENANT_ARCHITECTURE.md
│   │   7 seções: Overview, Login, Data Isolation, RBAC, Backend, Frontend, Security
│   │   Inclui código de exemplo
│   │
│   ├── 📄 MAPEAMENTO_EMPRESAS.md
│   │   8 módulos identificados
│   │   Features por módulo
│   │
│   ├── 📄 ESTRUTURA_JIRA.md
│   │   Proposta: Projeto único (PA) com epics por empresa
│   │   Naming conventions
│   │
│   ├── 📄 PROXIMOS_PASSOS.md
│   │   Bloqueadores críticos (Dez 15, 18, 20, 22)
│   │   Cronograma de alto nível
│   │   Responsabilidades
│   │
│   ├── 📄 INDICE_DOCUMENTACAO.md
│   │   Índice completo (por função)
│   │   Ordem de leitura recomendada
│   │
│   ├── 📄 CONFLUENCE_MENUS_GUIDE.md
│   │   Guia consolidado para navegação Confluence
│   │
│   ├── 📄 REQUIREMENTS_SUMMARY.md
│   │   Resumo e próximos passos para requisitos
│   │
│   ├── 📄 MIGRATION_PLAN.md
│   │   Plano de migração
│   │
│   ├── 📄 PROMPT_INSTRUCTIONS.md
│   │   Instruções para IA
│   │
│   ├── 📄 Levantamento UX.md
│   │   Input de UX/Design
│   │
│   ├── 📁 modules/
│   │   Estrutura de módulos (Acadêmico, Financeiro, etc)
│   │
│   ├── 📁 legacy/
│   │   Arquivos arquivados
│   │   └── 📁 menus/ - Originais dos guias Confluence
│   │   └── OLD_PORTAL_MAPPING.md - Mapeamento antigo
│   │
│   └── 📁 portal-core/
│       Código-fonte principal
│
└── 📁 .git/
    Histórico Git (full recovery possible)
```

---

## 🎯 Encontrando Documentos por Propósito

### "Preciso aprender sobre o projeto (rápido)"
📂 Localização: Raiz
📄 Arquivos:
- `README.md` (15 min - visão geral)
- `MAPA_VISUAL_DOCUMENTACAO.md` (este ajuda a navegar)

### "Preciso de cronograma e timeline"
📂 Localização: `docs/`
📄 Arquivos:
- `BACKLOG.md` (5 épicos, 12+ sprints)
- `PROXIMOS_PASSOS.md` (bloqueadores Dez 15, 18, 20, 22)

### "Preciso validar arquitetura técnica"
📂 Localização: `docs/`
📄 Arquivos:
- `MULTI_TENANT_ARCHITECTURE.md` (decisões + código)
- `ESTRUTURA_JIRA.md` (organização projeto)
- `FAQ.md` - Seção "Architecture" (10+ Q&A)

### "Preciso entender o isolamento de dados"
📂 Localização: `docs/`
📄 Arquivos:
- `MULTI_TENANT_ARCHITECTURE.md` - Seção 3
- `FAQ.md` - Seção "Database"
- `GLOSSARIO.md` - Termos: empresa_id, isolamento, row-level security

### "Preciso começar desenvolvimento"
📂 Localização: Raiz + docs/
📄 Arquivos:
1. `README.md` (entender projeto)
2. `docs/MULTI_TENANT_ARCHITECTURE.md` (padrões)
3. `docs/GLOSSARIO.md` (referência de termos)
4. `docs/FAQ.md` - Sua seção (Frontend/Backend/Database)

### "Preciso de definições de termos técnicos"
📂 Localização: `docs/`
📄 Arquivo:
- `GLOSSARIO.md` (110+ definições A-Z)

### "Preciso responder uma pergunta comum"
📂 Localização: `docs/`
📄 Arquivo:
- `FAQ.md` (50+ perguntas e respostas)
- Procure por palavra-chave com Ctrl+F

### "Preciso entender os módulos"
📂 Localização: `docs/`
📄 Arquivo:
- `MAPEAMENTO_EMPRESAS.md` (8 módulos com features)

### "Preciso saber próximos passos"
📂 Localização: `docs/`
📄 Arquivo:
- `PROXIMOS_PASSOS.md` (4 reuniões críticas)

### "Preciso organizar menu Confluence"
📂 Localização: `docs/`
📄 Arquivo:
- `CONFLUENCE_MENUS_GUIDE.md` (guia consolidado)

---

## 🔍 Busca por Tipo de Conteúdo

### Documentação Técnica
- `docs/MULTI_TENANT_ARCHITECTURE.md` - Arquitetura
- `docs/ESTRUTURA_JIRA.md` - Jira
- `docs/GLOSSARIO.md` - Termos
- `docs/FAQ.md` - Respostas

### Documentação de Planejamento
- `docs/BACKLOG.md` - Timeline
- `docs/PROXIMOS_PASSOS.md` - O que fazer
- `docs/MAPEAMENTO_EMPRESAS.md` - Módulos

### Documentação de Referência
- `README.md` - Overview
- `RESUMO_ENTREGA.md` - Resumo de entrega
- `MAPA_VISUAL_DOCUMENTACAO.md` - Hierarquia
- `INDICE_DOCUMENTACAO.md` - Índice completo

### Documentação Operacional
- `LOCALIZACAO_ARQUIVOS.md` - Este arquivo (onde encontrar coisas)
- `docs/CONFLUENCE_MENUS_GUIDE.md` - Guia consolidado Confluence

---

## 📍 Guia Rápido por Função

### Se você é **PO/Stakeholder**
```
1️⃣  README.md (raiz)
2️⃣  docs/BACKLOG.md
3️⃣  docs/PROXIMOS_PASSOS.md
4️⃣  docs/INDICE_DOCUMENTACAO.md (para próximos passos)
```

### Se você é **Tech Lead**
```
1️⃣  README.md (raiz)
2️⃣  docs/MULTI_TENANT_ARCHITECTURE.md
3️⃣  docs/ESTRUTURA_JIRA.md
4️⃣  docs/FAQ.md (seção Architecture)
5️⃣  docs/GLOSSARIO.md (consulta)
```

### Se você é **Desenvolvedor Frontend**
```
1️⃣  README.md (raiz)
2️⃣  docs/MULTI_TENANT_ARCHITECTURE.md (seção Frontend)
3️⃣  docs/GLOSSARIO.md (Ctrl+F para termos)
4️⃣  docs/FAQ.md (seção Frontend)
5️⃣  docs/MAPEAMENTO_EMPRESAS.md
```

### Se você é **Desenvolvedor Backend**
```
1️⃣  README.md (raiz)
2️⃣  docs/MULTI_TENANT_ARCHITECTURE.md (seção Backend)
3️⃣  docs/GLOSSARIO.md (Ctrl+F para termos)
4️⃣  docs/FAQ.md (seção Backend + Database)
5️⃣  docs/MAPEAMENTO_EMPRESAS.md
```

### Se você é **DBA**
```
1️⃣  README.md (raiz)
2️⃣  docs/MULTI_TENANT_ARCHITECTURE.md (seção Data Isolation)
3️⃣  docs/FAQ.md (seção Database)
4️⃣  docs/GLOSSARIO.md (empresa_id, isolamento)
5️⃣  docs/MAPEAMENTO_EMPRESAS.md
```

### Se você é **UX/Designer**
```
1️⃣  README.md (raiz)
2️⃣  docs/MAPEAMENTO_EMPRESAS.md
3️⃣  docs/MULTI_TENANT_ARCHITECTURE.md (seção Frontend)
4️⃣  docs/GLOSSARIO.md (Ctrl+F)
5️⃣  docs/FAQ.md (seção Frontend)
```

---

## 📞 Como Usar Este Arquivo

**Você está procurando um documento?**
1. Veja seção "Encontrando Documentos por Propósito"
2. Encontre seu caso de uso
3. Siga para o arquivo indicado

**Você não sabe por onde começar?**
1. Veja seção "Guia Rápido por Função"
2. Encontre sua função
3. Siga a ordem recomendada

**Você quer navegar a estrutura?**
1. Veja seção "Estrutura de Pastas" no topo
2. Procure a pasta/arquivo
3. Leia a descrição

---

## 🆘 Sumário de Arquivo Não Encontrado

Se procura um arquivo e não consegue encontrar:

1. **Confira a estrutura** (seção "Estrutura de Pastas" acima)
2. **Use Ctrl+F** para buscar por nome/termo
3. **Consulte INDICE_DOCUMENTACAO.md** (índice completo)
4. **Veja MAPA_VISUAL_DOCUMENTACAO.md** (hierarquia visual)

---

**Versão:** 1.0  
**Criado:** November 12, 2025  
**Status:** 🟢 Completo
