# Portal Administrativo - AVP/Unigrande

## Visão Geral

Este repositório contém o código-fonte e a documentação técnica para o projeto do novo Portal Administrativo unificado para as empresas AVP e Unigrande. O objetivo é criar uma plataforma moderna, escalável e multi-tenant, que servirá como uma base ("rack") para diversos módulos de negócios.

## Estrutura do Repositório

- **/frontend**: Aplicação Next.js (React).
  - Para iniciar: Vá para a pasta `/frontend` e execute `npm install`.
- **/backend**: Aplicação NestJS (Node.js).
  - Para iniciar: Vá para a pasta `/backend` e execute `npm install`.
- **/docs**: Documentação do projeto.

## Estrutura da Documentação

Toda a documentação do projeto está centralizada na pasta `/docs`. A estrutura foi reorganizada por domínios para facilitar a escalabilidade:

- **/docs/management**: Documentação de Gestão e Produto.
- **/docs/technical**: Documentação Técnica e Arquitetural.
- **/docs/business-modules**: Documentação específica por Módulo de Negócio.
- **/docs/legacy**: Arquivos de trabalho e versões antigas da documentação.

## Arquitetura e Tecnologias

A solução está sendo desenvolvida com uma arquitetura de micro-serviços e front-end desacoplado, utilizando as seguintes tecnologias:

- **Frontend**: React 18 + Next.js 14.x (TypeScript)
- **Backend**: Node.js + NestJS 10.x (TypeScript)
- **Banco de Dados**: SQL Server (Infra Local / On-Premise)
- **Autenticação**: Azure AD
- **Armazenamento**: Azure Blob Storage

Para mais detalhes, consulte o documento de [Arquitetura Core](docs/technical/architecture/CORE_ARCHITECTURE.md).

## Como Começar

### Configuração Inicial

#### Backend (NestJS)
```bash
cd backend
npm install

# Configure as variáveis de ambiente
cp .env.example .env
# Edite o arquivo .env com suas credenciais do SQL Server

# Inicie o servidor de desenvolvimento
npm run start:dev
```

O backend estará disponível em `http://localhost:3001`  
Documentação da API (Swagger): `http://localhost:3001/api/docs`

#### Frontend (Next.js)
```bash
cd frontend
npm install

# Inicie o servidor de desenvolvimento
npm run dev
```

A aplicação estará disponível em `http://localhost:3001`

#### Storybook (Desenvolvimento de Componentes)
```bash
cd frontend
npm run storybook
```

O Storybook estará disponível em `http://localhost:6006`

### Status da Implementação

✅ **Fase 1:** Estrutura Inicial e Padrões (Concluída)  
✅ **Fase 2:** Backend Core - API, Banco de Dados, Multi-tenancy (Concluída)  
✅ **Fase 3:** Frontend Core - Storybook, Componentes, Temas (Concluída)  
⏸️ **Fase 4:** Autenticação Azure AD (Aguardando Infraestrutura)

Para detalhes completos da implementação, consulte:
- [Documentação de Implementação - Fases 1 a 3](docs/technical/IMPLEMENTACAO_FASE_1_A_3.md)

### Funcionalidades Implementadas

**Backend:**
- ✅ API REST com NestJS 10
- ✅ Documentação automática com Swagger
- ✅ Conexão TypeORM + SQL Server
- ✅ Middleware Multi-tenant (validação via header `x-tenant-id`)
- ✅ Suporte para empresas: AVP e Unigrande

**Frontend:**
- ✅ Next.js 14 com App Router
- ✅ Sistema de temas dinâmico (AVP e Unigrande)
- ✅ Biblioteca de componentes com Storybook
- ✅ Atomic Design (Button, CompanySelector, etc.)
- ✅ Tailwind CSS + CSS Variables
- ✅ Persistência de tema em localStorage

1.  **Explore a Documentação**: Comece pelo [Roadmap Executivo](docs/management/ROADMAP_EXECUTIVO.md) para uma visão geral.
2.  **Ambiente de Desenvolvimento**: Siga as instruções em [Padrões de Desenvolvimento](docs/technical/standards/DEVELOPMENT_STANDARDS.md) para configurar seu ambiente.

## Contato

- **Product Owner**: Gerson
- **Tech Lead**: Rayan
- **UX**: Bianca
- **Front-End**: Pedro Henrique
- **Back-End**: Guilherme / Pedro Soeiro
