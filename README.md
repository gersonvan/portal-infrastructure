# Portal Administrativo - Infrastructure

[![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)](https://github.com/features/actions)
[![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)](https://nginx.org/)

## 📋 Sobre

Repositório contendo toda a infraestrutura como código (IaC) do Portal Administrativo:
- Configurações Docker e Docker Compose
- Pipelines CI/CD (GitHub Actions)
- Configurações Nginx
- Scripts de deployment e automação

## 🏗️ Estrutura do Projeto

```
.
├── .github/
│   └── workflows/          # GitHub Actions workflows
│       ├── frontend-ci.yml
│       ├── backend-ci.yml
│       └── pr-checks.yml
├── docker-compose/
│   ├── dev/               # Ambiente de desenvolvimento
│   │   └── docker-compose.yml
│   └── production/        # Ambiente de produção
│       └── docker-compose.yml
├── nginx/
│   ├── nginx.conf         # Configuração do proxy reverso
│   └── ssl/              # Certificados SSL/TLS
└── scripts/              # Scripts de automação
```

## 📦 Repositórios Relacionados

Este é o repositório de infraestrutura da arquitetura polirepo:

- **[portal-frontend](https://github.com/gersonvan/portal-frontend)** - Aplicação Next.js 15
- **[portal-backend](https://github.com/gersonvan/portal-backend)** - API NestJS 10
- **[portal-infrastructure](https://github.com/gersonvan/portal-infrastructure)** - Infraestrutura (este repositório)
- **[portal-docs](https://github.com/gersonvan/portal-docs)** - Documentação completa

## 🚀 Quick Start

### Pré-requisitos

- Docker 20.10+
- Docker Compose 2.0+

### Desenvolvimento

```powershell
# Clone o repositório
git clone https://github.com/gersonvan/portal-infrastructure.git
cd portal-infrastructure

# Clone os repositórios de código (se necessário)
git clone https://github.com/gersonvan/portal-frontend.git ../portal-frontend
git clone https://github.com/gersonvan/portal-backend.git ../portal-backend

# Inicie os serviços
docker-compose -f docker-compose/dev/docker-compose.yml up -d
```

### Produção

```powershell
# Configure as variáveis de ambiente
cp .env.example .env
# Edite .env com suas configurações

# Deploy
docker-compose -f docker-compose/production/docker-compose.yml up -d
```

## 🔄 CI/CD

### Workflows Disponíveis

#### Frontend CI (`frontend-ci.yml`)
- **Trigger**: Push em `portal-frontend`
- **Etapas**: Lint → Test → Build → Docker Build
- **Deploy**: Automático para staging (branch main)

#### Backend CI (`backend-ci.yml`)
- **Trigger**: Push em `portal-backend`
- **Etapas**: Lint → Test → Build → Docker Build
- **Deploy**: Automático para staging (branch main)

#### PR Checks (`pr-checks.yml`)
- **Trigger**: Pull Requests
- **Validações**: Code style, testes, build

### Configuração de Secrets

Configure no GitHub (Settings → Secrets and variables → Actions):

```
DOCKER_USERNAME         # Docker Hub username
DOCKER_PASSWORD         # Docker Hub token
AZURE_TENANT_ID        # Azure AD tenant
AZURE_CLIENT_ID        # Azure AD client
AZURE_CLIENT_SECRET    # Azure AD secret
SQL_SERVER_PASSWORD    # Senha do SQL Server
```

## 🐳 Docker

### Imagens

- **Frontend**: `gersonvan/portal-frontend:latest`
- **Backend**: `gersonvan/portal-backend:latest`
- **Database**: `mcr.microsoft.com/mssql/server:2022-latest`
- **Proxy**: `nginx:alpine`

### Volumes

```yaml
sql-data:          # Dados do SQL Server
nginx-ssl:         # Certificados SSL
```

### Networks

```yaml
portal-network:    # Rede interna
```

## 🔧 Configuração Nginx

O Nginx atua como reverse proxy:

```
https://portal.example.com     → Frontend (Next.js)
https://portal.example.com/api → Backend (NestJS)
```

### SSL/TLS

Coloque os certificados em `nginx/ssl/`:
- `cert.pem` - Certificado
- `key.pem` - Chave privada

## 📚 Documentação Completa

Para documentação técnica detalhada, consulte o [repositório de documentação](https://github.com/gersonvan/portal-docs):

- [Arquitetura](https://github.com/gersonvan/portal-docs/tree/main/technical/architecture)
- [Multi-tenant](https://github.com/gersonvan/portal-docs/blob/main/technical/architecture/MULTI_TENANT.md)
- [DevOps](https://github.com/gersonvan/portal-docs/blob/main/technical/DEVOPS.md)
- [Padrões de Desenvolvimento](https://github.com/gersonvan/portal-docs/blob/main/technical/standards/DEVELOPMENT_STANDARDS.md)

## 🤝 Contribuindo

1. Faça fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto é proprietário e confidencial.

## 🆘 Suporte

- **Documentação**: [portal-docs](https://github.com/gersonvan/portal-docs)
- **Issues**: [GitHub Issues](https://github.com/gersonvan/portal-infrastructure/issues)
