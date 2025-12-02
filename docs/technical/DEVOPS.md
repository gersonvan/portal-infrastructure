# DevOps - Portal Administrativo

## Visão Geral

Este documento descreve a infraestrutura de DevOps e os processos de deployment para o Portal Administrativo.

## Índice

1. [Arquitetura de Deploy](#arquitetura-de-deploy)
2. [CI/CD Pipeline](#cicd-pipeline)
3. [Ambientes](#ambientes)
4. [Docker & Containerização](#docker--containerização)
5. [Deployment](#deployment)
6. [Monitoramento](#monitoramento)
7. [Troubleshooting](#troubleshooting)

---

## Arquitetura de Deploy

### Stack Tecnológica

- **Containerização:** Docker & Docker Compose
- **CI/CD:** GitHub Actions
- **Hospedagem:** On-Premise / Azure (a definir)
- **Banco de Dados:** SQL Server 2022
- **Armazenamento:** Azure Blob Storage
- **Autenticação:** Azure AD

### Diagrama de Infraestrutura

```
┌─────────────────────────────────────────────────────────┐
│                    INTERNET / VPN                        │
└────────────────────┬────────────────────────────────────┘
                     │
         ┌───────────▼──────────┐
         │   Nginx (Reverse     │
         │   Proxy / SSL)       │
         └───────────┬──────────┘
                     │
       ┌─────────────┴─────────────┐
       │                           │
┌──────▼──────┐           ┌────────▼────────┐
│  Frontend   │           │    Backend      │
│  (Next.js)  │◄─────────►│   (NestJS)      │
│  Port: 3000 │           │   Port: 3001    │
└─────────────┘           └────────┬────────┘
                                   │
                     ┌─────────────┴─────────────┐
                     │                           │
              ┌──────▼─────┐            ┌────────▼────────┐
              │ SQL Server │            │ Azure Blob      │
              │            │            │ Storage         │
              └────────────┘            └─────────────────┘
```

---

## CI/CD Pipeline

### GitHub Actions Workflows

#### 1. Frontend CI/CD (`.github/workflows/frontend-ci.yml`)

**Triggers:**
- Push para `main` ou `develop` com mudanças em `/frontend`
- Pull Requests para `main` ou `develop`

**Jobs:**
- **Test:** Lint, Type Check, Unit Tests
- **Build:** Build da aplicação Next.js
- **Deploy:** Deploy automático (a configurar)

#### 2. Backend CI/CD (`.github/workflows/backend-ci.yml`)

**Triggers:**
- Push para `main` ou `develop` com mudanças em `/backend`
- Pull Requests para `main` ou `develop`

**Jobs:**
- **Test:** Lint, Unit Tests, E2E Tests
- **Build:** Build da aplicação NestJS
- **Deploy:** Deploy automático (a configurar)

#### 3. Pull Request Checks (`.github/workflows/pr-checks.yml`)

**Validações:**
- Formato do título do PR (Conventional Commits)
- Verificação de conflitos
- Code Quality checks (TODO/FIXME, console.log)

### Branch Strategy

```
main (production)
  ↑
  │ PR com 2 aprovações
  │
develop (staging/QA)
  ↑
  │ PR com 1 aprovação
  │
feature/* (desenvolvimento)
```

**Convenção de Branches:**
- `feature/*` - Novas funcionalidades
- `fix/*` - Correções de bugs
- `hotfix/*` - Correções emergenciais em produção
- `refactor/*` - Refatorações
- `docs/*` - Atualizações de documentação

---

## Ambientes

### 1. Development (Local)

**Como iniciar:**

```bash
# Clone o repositório
git clone https://github.com/gersonvan/Portal-Administrativo.git
cd Portal-Administrativo

# Configure as variáveis de ambiente
cp .env.example .env
# Edite o .env com suas configurações

# Inicie o ambiente com Docker
docker-compose up -d

# Ou inicie manualmente
# Backend
cd backend
npm install
npm run start:dev

# Frontend (em outro terminal)
cd frontend
npm install
npm run dev
```

**Acessos:**
- Frontend: http://localhost:3000
- Backend: http://localhost:3001
- SQL Server: localhost:1433
- Azurite (Blob Storage): localhost:10000

### 2. QA/Staging (Develop Branch)

**Deploy:**
- Automático via GitHub Actions ao fazer merge em `develop`
- Ambiente: On-Premise Server / Azure (a definir)

**Acessos:**
- Frontend: https://portal-qa.avp.com.br (a configurar)
- Backend: https://api-qa.avp.com.br (a configurar)

### 3. Production (Main Branch)

**Deploy:**
- Automático via GitHub Actions ao fazer merge em `main`
- Requer aprovação manual

**Acessos:**
- Frontend: https://portal.avp.com.br (a configurar)
- Backend: https://api.avp.com.br (a configurar)

---

## Docker & Containerização

### Estrutura de Containers

#### Frontend Dockerfile (`frontend/Dockerfile`)

- **Base:** Node 20 Alpine
- **Multi-stage build:**
  - `deps` - Instalação de dependências
  - `builder` - Build da aplicação
  - `runner` - Imagem de produção otimizada
- **Standalone output:** Configurado para produção
- **Health check:** Endpoint `/api/health`

#### Backend Dockerfile (`backend/Dockerfile`)

- **Base:** Node 20 Alpine
- **Multi-stage build:**
  - `deps` - Instalação de dependências
  - `builder` - Build da aplicação
  - `runner` - Imagem de produção otimizada
- **Health check:** Endpoint `/health`

### Docker Compose

#### Desenvolvimento (`docker-compose.yml`)

```bash
# Iniciar todos os serviços
docker-compose up -d

# Ver logs
docker-compose logs -f

# Parar serviços
docker-compose down

# Rebuild após mudanças
docker-compose up -d --build
```

**Serviços:**
- `database` - SQL Server 2022
- `backend` - NestJS API
- `frontend` - Next.js App
- `azurite` - Azure Blob Storage Emulator

#### Produção (`docker-compose.prod.yml`)

```bash
# Iniciar ambiente de produção
docker-compose -f docker-compose.prod.yml up -d

# Com variáveis de ambiente
docker-compose -f docker-compose.prod.yml --env-file .env.production up -d
```

**Serviços adicionais:**
- `nginx` - Reverse Proxy com SSL

---

## Deployment

### Deploy Manual (On-Premise)

#### Pré-requisitos

- Docker e Docker Compose instalados
- Acesso SSH ao servidor
- Variáveis de ambiente configuradas

#### Processo

```bash
# 1. Conectar ao servidor
ssh user@server-ip

# 2. Navegar para o diretório do projeto
cd /var/www/portal-administrativo

# 3. Atualizar código
git pull origin main

# 4. Rebuild e restart containers
docker-compose -f docker-compose.prod.yml down
docker-compose -f docker-compose.prod.yml up -d --build

# 5. Verificar logs
docker-compose -f docker-compose.prod.yml logs -f
```

#### Rollback

```bash
# 1. Voltar para commit anterior
git log --oneline -n 5
git checkout <commit-hash>

# 2. Rebuild containers
docker-compose -f docker-compose.prod.yml up -d --build
```

### Deploy Automatizado (GitHub Actions)

**A configurar:**

1. Adicionar secrets no GitHub:
   - `SSH_PRIVATE_KEY`
   - `SERVER_HOST`
   - `SERVER_USER`
   - `DB_SA_PASSWORD`
   - `JWT_SECRET`
   - `AZURE_*` credentials

2. Descomentar seção de deploy nos workflows

3. Configurar deploy script

---

## Monitoramento

### Health Checks

**Endpoints:**
- Frontend: `GET /api/health`
- Backend: `GET /health`

**Docker Health Checks:**
- Executados automaticamente a cada 30s
- Timeout: 10s
- Retries: 3

### Logs

**Ver logs em produção:**

```bash
# Todos os serviços
docker-compose -f docker-compose.prod.yml logs -f

# Serviço específico
docker-compose -f docker-compose.prod.yml logs -f backend

# Últimas 100 linhas
docker-compose -f docker-compose.prod.yml logs --tail=100
```

### Métricas (A implementar)

- Application Insights (Azure)
- Prometheus + Grafana
- ELK Stack (Elasticsearch, Logstash, Kibana)

---

## Troubleshooting

### Problemas Comuns

#### 1. Container não inicia

```bash
# Verificar logs
docker-compose logs <service-name>

# Verificar status
docker-compose ps

# Reiniciar serviço
docker-compose restart <service-name>
```

#### 2. Erro de conexão com banco de dados

```bash
# Verificar se o SQL Server está rodando
docker-compose ps database

# Verificar logs do banco
docker-compose logs database

# Testar conexão
docker-compose exec database /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P <password>
```

#### 3. Build falha no CI/CD

- Verificar logs no GitHub Actions
- Verificar se todas as dependências estão corretas
- Verificar variáveis de ambiente

#### 4. Espaço em disco insuficiente

```bash
# Limpar imagens não utilizadas
docker system prune -a

# Limpar volumes não utilizados
docker volume prune
```

### Comandos Úteis

```bash
# Ver uso de espaço do Docker
docker system df

# Limpar tudo (cuidado!)
docker system prune -a --volumes

# Rebuild específico
docker-compose build --no-cache <service-name>

# Inspecionar container
docker inspect <container-name>

# Executar comando dentro do container
docker-compose exec <service-name> sh
```

---

## Próximos Passos

- [ ] Configurar ambiente de QA/Staging
- [ ] Implementar deploy automatizado
- [ ] Configurar SSL/TLS
- [ ] Implementar backup automatizado do banco
- [ ] Configurar monitoramento e alertas
- [ ] Documentar procedimentos de emergência
- [ ] Implementar blue-green deployment

---

**Última atualização:** Dezembro 2025  
**Responsável:** DevOps Team  
**Contato:** devops@avp.com.br
