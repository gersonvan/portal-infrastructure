# Estratégia de Migração: Monorepo → Polirepo

## Visão Geral

**Status Atual:** Monorepo (frontend + backend + docs no mesmo repositório)  
**Objetivo:** Polirepo (repositórios separados mantendo histórico Git)  
**Data:** Dezembro 2025

---

## 📋 Índice

1. [Análise da Situação Atual](#análise-da-situação-atual)
2. [Estratégia de Migração](#estratégia-de-migração)
3. [Estrutura Proposta](#estrutura-proposta)
4. [Plano de Execução](#plano-de-execução)
5. [Vantagens e Desvantagens](#vantagens-e-desvantagens)
6. [Scripts de Migração](#scripts-de-migração)

---

## Análise da Situação Atual

### Estrutura Monorepo Atual

```
Portal-Administrativo/  (monorepo)
├── frontend/           # Next.js app
├── backend/            # NestJS API
├── docs/               # Documentação
├── .github/            # CI/CD compartilhado
├── docker-compose.yml  # Orquestração local
└── README.md
```

### Desafios Identificados

1. **Deploy Acoplado**: Mudanças no frontend podem acionar CI/CD do backend
2. **Versionamento**: Difícil versionar frontend e backend independentemente
3. **Permissões**: Difícil separar permissões por equipe
4. **Escalabilidade**: Times grandes podem ter conflitos constantes
5. **CI/CD**: Pipelines mais lentos (executa tudo mesmo com mudanças mínimas)

---

## Estratégia de Migração

### Opção 1: Migração com Preservação de Histórico (RECOMENDADA)

Usar `git filter-repo` ou `git subtree` para extrair cada subprojeto mantendo o histórico.

**Vantagens:**
- ✅ Mantém todo histórico de commits
- ✅ Preserva authorship e datas
- ✅ Git blame funciona corretamente

**Desvantagens:**
- ⚠️ Processo mais complexo
- ⚠️ Requer ferramentas específicas

### Opção 2: Migração Limpa (Fresh Start)

Criar novos repositórios e copiar código atual sem histórico.

**Vantagens:**
- ✅ Processo simples e rápido
- ✅ Limpa histórico de commits desnecessários
- ✅ Fácil de executar

**Desvantagens:**
- ❌ Perde histórico de desenvolvimento
- ❌ Git blame não funciona
- ❌ Perde contexto de decisões antigas

---

## Estrutura Proposta

### Polirepo Target

```
Organização: gersonvan/avp-portal (ou similar)

Repositórios:
├── portal-frontend          # Next.js
├── portal-backend           # NestJS
├── portal-docs              # Documentação (opcional)
├── portal-infrastructure    # Docker, K8s, Terraform
└── portal-shared            # Bibliotecas compartilhadas (futuro)
```

### Estrutura de Cada Repositório

#### portal-frontend
```
portal-frontend/
├── .github/workflows/       # CI/CD específico
├── src/
├── public/
├── Dockerfile
├── package.json
├── README.md
└── .env.example
```

#### portal-backend
```
portal-backend/
├── .github/workflows/       # CI/CD específico
├── src/
├── test/
├── Dockerfile
├── package.json
├── README.md
└── .env.example
```

#### portal-infrastructure
```
portal-infrastructure/
├── docker-compose/
│   ├── dev/
│   ├── staging/
│   └── production/
├── kubernetes/
├── terraform/
├── nginx/
├── scripts/
└── README.md
```

#### portal-docs (Opcional)
```
portal-docs/
├── management/
├── technical/
├── business-modules/
└── README.md
```

---

## Plano de Execução

### Fase 1: Preparação (1-2 dias)

**1.1 Backup do Repositório Atual**
```bash
# Clone completo com todo histórico
git clone --mirror https://github.com/gersonvan/Portal-Administrativo.git backup-portal-admin
```

**1.2 Documentação de Dependências**
- Mapear dependências entre frontend e backend
- Documentar variáveis de ambiente compartilhadas
- Listar assets compartilhados

**1.3 Comunicação**
- Informar equipe sobre a migração
- Definir data e hora (fora do horário de trabalho)
- Preparar rollback plan

### Fase 2: Criação dos Novos Repositórios (2-3 horas)

**2.1 Criar Repositórios no GitHub**
```bash
# Via GitHub CLI
gh repo create gersonvan/portal-frontend --private
gh repo create gersonvan/portal-backend --private
gh repo create gersonvan/portal-infrastructure --private
gh repo create gersonvan/portal-docs --private
```

**2.2 Configurar Settings**
- Branch protection rules
- CODEOWNERS
- Secrets e variáveis de ambiente
- Webhooks (se necessário)

### Fase 3: Migração do Código (Opção 1 - Com Histórico)

#### 3.1 Migrar Frontend

```bash
# Clone do repositório original
git clone https://github.com/gersonvan/Portal-Administrativo.git temp-frontend
cd temp-frontend

# Instalar git-filter-repo (se não tiver)
# pip install git-filter-repo

# Filtrar apenas o diretório frontend
git filter-repo --path frontend/ --path-rename frontend/:

# Adicionar novo remote
git remote add origin https://github.com/gersonvan/portal-frontend.git

# Push
git push -u origin main
```

#### 3.2 Migrar Backend

```bash
# Clone do repositório original
git clone https://github.com/gersonvan/Portal-Administrativo.git temp-backend
cd temp-backend

# Filtrar apenas o diretório backend
git filter-repo --path backend/ --path-rename backend/:

# Adicionar arquivos raiz necessários
git remote add origin https://github.com/gersonvan/portal-backend.git
git push -u origin main
```

#### 3.3 Migrar Infraestrutura

```bash
# Clone do repositório original
git clone https://github.com/gersonvan/Portal-Administrativo.git temp-infra
cd temp-infra

# Filtrar arquivos de infraestrutura
git filter-repo --path docker-compose.yml \
                --path docker-compose.prod.yml \
                --path nginx/ \
                --path .github/workflows/

# Reorganizar estrutura
git remote add origin https://github.com/gersonvan/portal-infrastructure.git
git push -u origin main
```

#### 3.4 Migrar Documentação

```bash
# Clone do repositório original
git clone https://github.com/gersonvan/Portal-Administrativo.git temp-docs
cd temp-docs

# Filtrar apenas docs
git filter-repo --path docs/ --path-rename docs/:

git remote add origin https://github.com/gersonvan/portal-docs.git
git push -u origin main
```

### Fase 4: Ajustes Pós-Migração (2-4 horas)

**4.1 Atualizar CI/CD**
- Remover path filters (não são mais necessários)
- Ajustar workflows para estrutura simplificada
- Configurar deploy independente

**4.2 Atualizar Docker Compose**
- Criar novo docker-compose que referencia múltiplos repositórios
- Usar git submodules ou clone scripts

**4.3 Atualizar Documentação**
- README de cada repositório
- Links entre repositórios
- Guia de contribuição atualizado

**4.4 Configurar Dependências Entre Repositórios**
- Definir versionamento semântico
- Configurar dependabot
- Documentar APIs entre serviços

### Fase 5: Validação e Testes (1-2 dias)

**5.1 Testes Locais**
```bash
# Clonar todos os repositórios
mkdir avp-portal-workspace
cd avp-portal-workspace

git clone https://github.com/gersonvan/portal-frontend.git
git clone https://github.com/gersonvan/portal-backend.git
git clone https://github.com/gersonvan/portal-infrastructure.git

# Testar ambiente local
cd portal-infrastructure
docker-compose -f docker-compose/dev/docker-compose.yml up
```

**5.2 Validar CI/CD**
- Fazer commits de teste em cada repositório
- Verificar que pipelines executam corretamente
- Validar builds e testes

**5.3 Testar Deploy**
- Deploy em ambiente de QA
- Validar integração entre serviços
- Testar rollback

### Fase 6: Migração da Equipe (1 semana)

**6.1 Treinamento**
- Workshop sobre novo workflow
- Documentação de novos processos
- Guia de troubleshooting

**6.2 Período de Transição**
- Manter monorepo por 1-2 semanas (somente leitura)
- Suporte intensivo à equipe
- Coleta de feedback

**6.3 Arquivamento do Monorepo**
```bash
# Marcar como deprecated
# Adicionar README explicando migração
# Fazer archive do repositório no GitHub
```

---

## Vantagens e Desvantagens

### Vantagens do Polirepo

| Aspecto | Benefício |
|---------|-----------|
| **Independência** | Deploy e versionamento independente |
| **Performance CI/CD** | Pipelines mais rápidos (só roda o necessário) |
| **Permissões** | Controle granular por equipe |
| **Escalabilidade** | Times crescem sem conflitos |
| **Clone** | Desenvolvedores clonam só o que precisam |
| **Complexidade** | Cada repo tem seu próprio ritmo |

### Desvantagens do Polirepo

| Aspecto | Desafio |
|---------|---------|
| **Coordenação** | Mudanças cross-repo são mais complexas |
| **Versionamento** | Precisa gerenciar compatibilidade entre repos |
| **Tooling** | Precisa de ferramentas para orquestração |
| **Onboarding** | Novos devs precisam clonar múltiplos repos |
| **Code Sharing** | Compartilhar código requer npm packages |

---

## Scripts de Migração

### Script 1: Migração Automatizada com Histórico

```bash
#!/bin/bash
# migrate-to-polirepo.sh

set -e

ORIGINAL_REPO="https://github.com/gersonvan/Portal-Administrativo.git"
WORKSPACE="/tmp/polirepo-migration"

echo "🚀 Iniciando migração para Polirepo..."

# Criar workspace
mkdir -p $WORKSPACE
cd $WORKSPACE

# Função para migrar subdiretório
migrate_subdirectory() {
    local SUBDIR=$1
    local NEW_REPO=$2
    local RENAME_PATH=$3
    
    echo "📦 Migrando $SUBDIR..."
    
    # Clone fresh
    git clone $ORIGINAL_REPO temp-$SUBDIR
    cd temp-$SUBDIR
    
    # Filtrar histórico
    git filter-repo --path $SUBDIR/ --path-rename $RENAME_PATH
    
    # Adicionar novo remote
    git remote add origin $NEW_REPO
    
    # Push
    git push -u origin main
    
    cd ..
    rm -rf temp-$SUBDIR
    
    echo "✅ $SUBDIR migrado com sucesso!"
}

# Migrar cada componente
migrate_subdirectory "frontend" "https://github.com/gersonvan/portal-frontend.git" "frontend/:"
migrate_subdirectory "backend" "https://github.com/gersonvan/portal-backend.git" "backend/:"
migrate_subdirectory "docs" "https://github.com/gersonvan/portal-docs.git" "docs/:"

echo "🎉 Migração concluída!"
```

### Script 2: Setup de Desenvolvimento Local

```bash
#!/bin/bash
# setup-dev-workspace.sh

set -e

WORKSPACE="$HOME/avp-portal-workspace"

echo "🔧 Configurando workspace de desenvolvimento..."

# Criar estrutura
mkdir -p $WORKSPACE
cd $WORKSPACE

# Clonar repositórios
repos=(
    "portal-frontend"
    "portal-backend"
    "portal-infrastructure"
    "portal-docs"
)

for repo in "${repos[@]}"; do
    echo "📥 Clonando $repo..."
    git clone "https://github.com/gersonvan/$repo.git"
done

# Copiar .env.example
echo "⚙️ Configurando variáveis de ambiente..."
cp portal-frontend/.env.example portal-frontend/.env
cp portal-backend/.env.example portal-backend/.env

# Instalar dependências
echo "📦 Instalando dependências do frontend..."
cd portal-frontend && npm install && cd ..

echo "📦 Instalando dependências do backend..."
cd portal-backend && npm install && cd ..

echo "✅ Workspace configurado!"
echo "Para iniciar: cd $WORKSPACE/portal-infrastructure && docker-compose up"
```

### Script 3: Docker Compose para Polirepo

```yaml
# portal-infrastructure/docker-compose/dev/docker-compose.yml

version: '3.8'

services:
  database:
    image: mcr.microsoft.com/mssql/server:2022-latest
    environment:
      - ACCEPT_EULA=Y
      - MSSQL_SA_PASSWORD=PortalAdmin@2025
    ports:
      - "1433:1433"
    volumes:
      - mssql-data:/var/opt/mssql

  backend:
    build:
      context: ../../../portal-backend
      dockerfile: Dockerfile
    ports:
      - "3001:3001"
    volumes:
      - ../../../portal-backend/src:/app/src
    depends_on:
      - database
    env_file:
      - ../../../portal-backend/.env

  frontend:
    build:
      context: ../../../portal-frontend
      dockerfile: Dockerfile
    ports:
      - "3000:3000"
    volumes:
      - ../../../portal-frontend/src:/app/src
    depends_on:
      - backend
    env_file:
      - ../../../portal-frontend/.env

volumes:
  mssql-data:
```

---

## Alternativa: Hybrid Approach (Git Submodules)

Se quiser manter alguma coordenação entre repos:

### Estrutura com Submodules

```
portal-workspace/  (repositório orchestrator)
├── .gitmodules
├── frontend/      (submodule → portal-frontend)
├── backend/       (submodule → portal-backend)
├── docs/          (submodule → portal-docs)
└── docker-compose.yml
```

### Setup

```bash
# Criar repo orchestrator
git init portal-workspace
cd portal-workspace

# Adicionar submodules
git submodule add https://github.com/gersonvan/portal-frontend.git frontend
git submodule add https://github.com/gersonvan/portal-backend.git backend
git submodule add https://github.com/gersonvan/portal-docs.git docs

# Commit
git add .
git commit -m "chore: add submodules"
```

### Clone com Submodules

```bash
# Clone completo
git clone --recursive https://github.com/gersonvan/portal-workspace.git

# Ou clone normal + init submodules
git clone https://github.com/gersonvan/portal-workspace.git
cd portal-workspace
git submodule init
git submodule update
```

---

## Recomendações Finais

### Para o Portal Administrativo AVP

Baseado no contexto do projeto, **recomendo:**

1. **Fase Inicial (Agora - Dezembro 2025)**
   - ✅ Manter monorepo durante desenvolvimento inicial
   - ✅ Focar em entregar Fase 0 e Fase 1
   - ✅ Estrutura atual está adequada para time pequeno

2. **Fase de Crescimento (Q2 2026)**
   - 🔄 Avaliar migração para polirepo quando:
     - Time crescer > 5 desenvolvedores
     - Houver times separados (frontend/backend)
     - Deploy independente for necessário
     - CI/CD estiver muito lento

3. **Abordagem Gradual**
   - Primeiro: Extrair `portal-shared` (se houver código compartilhado)
   - Segundo: Extrair `portal-backend` (mais estável)
   - Terceiro: Extrair `portal-frontend` (mudanças mais frequentes)
   - Quarto: Extrair `portal-docs` (se necessário)

### Decisão Imediata vs. Futura

| Cenário | Recomendação |
|---------|--------------|
| **Time pequeno (1-3 devs)** | Manter monorepo |
| **Projeto em fase inicial** | Manter monorepo |
| **Deploy sempre junto** | Manter monorepo |
| **Time grande (5+ devs)** | Migrar para polirepo |
| **Times separados** | Migrar para polirepo |
| **Deploy independente** | Migrar para polirepo |

---

## Próximos Passos

**Se decidir migrar agora:**
1. [ ] Executar backup completo
2. [ ] Criar novos repositórios
3. [ ] Executar script de migração
4. [ ] Validar em ambiente de dev
5. [ ] Treinar equipe
6. [ ] Migrar em produção

**Se decidir aguardar:**
1. [ ] Documentar critérios para decisão futura
2. [ ] Manter estrutura de pastas organizada
3. [ ] Preparar código para futura separação
4. [ ] Revisar decisão a cada trimestre

---

**Última atualização:** Dezembro 2025  
**Status:** Proposta - Aguardando Decisão  
**Responsável:** DevOps Team
