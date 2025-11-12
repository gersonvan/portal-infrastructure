# Portal Administrativo - AVP/Unigrande

## Visão Geral

Este repositório contém a documentação técnica e de planejamento para o projeto do novo Portal Administrativo unificado para as empresas AVP e Unigrande. O objetivo é criar uma plataforma moderna, escalável e multi-tenant, que servirá como uma base ("rack") para diversos módulos de negócios, como o "Diploma Digital", entre outros.

A documentação aqui presente é um espelho da fonte de verdade mantida no [Confluence](https://avp-dev.atlassian.net/wiki/spaces/PA/overview), servindo como um recurso essencial para a equipe de desenvolvimento.

## Estrutura da Documentação

Toda a documentação do projeto está centralizada na pasta `/docs`. A estrutura foi organizada para facilitar o acesso às informações críticas:

- **/docs**: Raiz da documentação.
  - `ROADMAP_EXECUTIVO.md`: Visão macro do projeto, fases e entregas.
  - `DIAGRAMA_FLUXOS.md`: Desenhos e diagramas dos principais fluxos de sistema.
  - `BACKLOG.md`: Backlog de funcionalidades e requisitos.
  - `REQUIREMENTS.md`: Requisitos detalhados do projeto.
  - `MAPEAMENTO_EMPRESAS.md`: Detalhes sobre a integração das empresas na plataforma.
- **/docs/portal-core**: Documentação referente ao núcleo da plataforma.
  - `ARCHITECTURE.md`: Detalhes da arquitetura multi-tenant, tecnologias e padrões.
  - `DEVELOPMENT_STANDARDS.md`: Padrões de código, commits e branchs.
- **/docs/modules/diploma-digital**: Documentação específica do módulo de Diploma Digital.
  - `PROJECT_MANAGEMENT.md`: Gerenciamento consolidado do projeto do módulo.
- **/docs/legacy**: Arquivos de trabalho e versões antigas da documentação.

## Arquitetura e Tecnologias

A solução está sendo desenvolvida com uma arquitetura de micro-serviços e front-end desacoplado, utilizando as seguintes tecnologias:

- **Frontend**: React 18 + Next.js 14.x (TypeScript)
- **Backend**: Node.js + NestJS 10.x (TypeScript)
- **Banco de Dados**: SQL Server (Azure)
- **Autenticação**: Azure AD
- **Armazenamento**: Azure Blob Storage

Para mais detalhes, consulte o documento de [Arquitetura Core](docs/portal-core/ARCHITECTURE.md).

## Como Começar

1.  **Explore a Documentação**: Comece pelo `ROADMAP_EXECUTIVO.md` para uma visão geral e depois mergulhe nos documentos de `ARCHITECTURE.md` e `REQUIREMENTS.md`.
2.  **Ambiente de Desenvolvimento**: Siga as instruções em `DEVELOPMENT_STANDARDS.md` para configurar seu ambiente e entender nosso fluxo de trabalho com Git.
3.  **Backlog**: Consulte o `BACKLOG.md` para entender as próximas tarefas.

## Contato

- **Product Owner**: Gerson V.
- **Tech Lead**: Gerson V.
