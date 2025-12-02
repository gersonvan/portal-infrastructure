# Portal Administrativo – Implementation Plan

**Memory Strategy:** Dynamic-MD (directory structure with Markdown logs)
**Last Modification:** Initial Setup by Setup Agent
**Project Overview:** Initialization of the "Portal Administrativo" (Phase 0), a multi-tenant platform for AVP/Unigrande. The goal is to establish a simple repository structure with Next.js 14 (Frontend) and NestJS 10 (Backend), connected to a SQL Server Dev DB, with basic multi-tenant middleware and an Azure AD Authentication POC.

## Phase 1: Estrutura Inicial e Padrões
**Goal:** Estabelecer a estrutura de diretórios, inicializar os frameworks e definir padrões de código.

### Task 1.1 – Inicialização da Estrutura de Diretórios │ Agent_Backend
- **Status:** [x] Complete
- **Objective:** Criar a estrutura de pastas raiz do projeto e configurar o controle de versão básico para suportar o padrão de repositório simples.
- **Output:** Estrutura de diretórios `/frontend` e `/backend` criadas, arquivo `.gitignore` configurado na raiz e `README.md` atualizado.
- **Guidance:** Garantir que o `.gitignore` seja abrangente para projetos Node.js (ignorando `node_modules`, `.env`, build artifacts) para evitar poluição do repositório.
- **Sub-tasks:**
    1. **Criação de Pastas:** Criar os diretórios raiz `/frontend` e `/backend` vazios.
    2. **Configuração Gitignore:** Criar um arquivo `.gitignore` na raiz do projeto que inclua regras para ignorar `node_modules`, `.env`, `dist`, `.next`, `.coverage` e logs em ambos os subdiretórios.
    3. **Documentação Inicial:** Atualizar o `README.md` na raiz para refletir a nova estrutura de repositório simples (sem monorepo tools) e instruções básicas de navegação.

### Task 1.2 – Inicialização do Backend (NestJS) │ Agent_Backend
- **Status:** [x] Complete
- **Objective:** Inicializar o projeto NestJS na pasta backend e configurar os padrões de qualidade de código.
- **Output:** Projeto NestJS funcional em `/backend` rodando na porta 3000 com ESLint e Prettier configurados.
- **Guidance:** Utilizar o Nest CLI para geração limpa. Manter as configurações de linting padrão do NestJS, pois são robustas e suficientes.
- **Sub-tasks:**
    1. **NestJS Init:** Executar o comando de inicialização do NestJS (versão 10.x) dentro da pasta `/backend`.
    2. **Limpeza de Boilerplate:** Remover arquivos de teste e controllers de exemplo desnecessários gerados pelo CLI, mantendo apenas o `AppModule` limpo.
    3. **Configuração de Linting:** Verificar e ajustar os arquivos `.eslintrc.js` e `.prettierrc` para garantir que as regras de formatação e linting estejam ativas e funcionais.
    4. **Validação de Execução:** Executar `npm run start:dev` e validar se o servidor inicia corretamente na porta 3000 sem erros.

### Task 1.3 – Inicialização do Frontend (Next.js) │ Agent_Frontend
- **Status:** [x] Complete
- **Objective:** Inicializar o projeto Next.js na pasta frontend com as tecnologias base definidas.
- **Output:** Projeto Next.js funcional

**Role:** You are the **Implementation Agent (Backend)** for the "Portal Administrativo" project.
**Phase:** Phase 1: Estrutura Inicial e Padrões
**Context:** The directory structure is ready. Now we need to initialize the backend application using NestJS.

## Task Objectives
Initialize a clean NestJS project in the `backend` directory and ensure code quality tools are configured.

## Detailed Instructions
1.  **Initialize NestJS:**
    *   Initialize a new NestJS project (version 10.x) inside the existing `backend` directory.
    *   Use `npm` as the package manager.
2.  **Clean Boilerplate:**
    *   Remove the default `app.controller.ts`, `app.controller.spec.ts`, and `app.service.ts` files if they are not needed for a clean architecture start, OR keep them minimal if you prefer a "Hello World" sanity check.
    *   Ensure `app.module.ts` is clean and imports only necessary modules.
3.  **Configure Linting & Formatting:**
    *   Verify that `.eslintrc.js` and `.prettierrc` are created.
    *   Ensure Prettier and ESLint are configured to work together (NestJS usually handles this out of the box, but verify).
    *   Add a `.prettierignore` file if it's missing, ignoring `dist` and `node_modules`.
4.  **Validation:**
    *   Run `npm install` to ensure dependencies are linked.
    *   Run `npm run start:dev` to verify the application starts successfully on port 3000.
    *   (Self-Correction): If port 3000 is busy, identify why, but the goal is to run on 3000.

## Constraints & Standards
*   **Directory:** All work must happen inside the `/backend` folder.
*   **Version:** NestJS v10.
*   **Package Manager:** npm.

## Final Report
When you have completed the task, please provide a **Final Report** in the following format:
1.  **Changes Summary:** List of files created/modified (summary is fine for the huge node_modules list).
2.  **Configuration Details:** Brief description of the linting setup.
3.  **Validation Results:** Output of the start command confirming the server is running.
4.  # APM Task Assignment: Task 1.2 – Backend Initialization (NestJS)

 em `/frontend` rodando em uma porta dedicada (ex: 3001) com TypeScript e Tailwind CSS.
- **Guidance:** Atentar para a porta de execução para evitar conflito com o backend (3000). Configurar o script `dev` para usar uma porta diferente se necessário (ex: `next dev -p 3001`).
- **Sub-tasks:**
    1. **Next.js Init:** Inicializar o projeto Next.js (versão 14.x) em `/frontend` selecionando: TypeScript, ESLint, Tailwind CSS e App Router.
    2. **Ajuste de Porta:** Configurar o `package.json` ou variável de ambiente para garantir que o frontend rode na porta 3001 (ou outra livre) por padrão.
    3. **Harmonização Prettier/ESLint:** Instalar e configurar o Prettier para trabalhar em conjunto com o ESLint do Next.js, garantindo formatação consistente.
    4. **Validação de Execução:** Executar `npm run dev` e validar se a aplicação carrega no navegador na porta configurada.

## Phase 2: Backend Core (NestJS & Banco de Dados)
**Goal:** Configurar a base da API, documentação e conexão de dados.

### Task 2.1 – Configuração do Swagger (OpenAPI) │ Agent_Backend
- **Status:** [x] Complete
- **Objective:** Configurar a geração automática de documentação da API usando Swagger/OpenAPI.
- **Output:** Endpoint `/api/docs` acessível exibindo a documentação da API.
- **Guidance:** A documentação é essencial para o desenvolvimento do frontend. Configurar o `DocumentBuilder` com título e versão corretos.
- **Sub-tasks:**
    1. **Instalação de Dependências:** Instalar `@nestjs/swagger`.
    2. **Configuração Main:** No arquivo `main.ts`, configurar o `DocumentBuilder` e o `SwaggerModule` para expor a documentação na rota `/api/docs`.
    3. **Validação:** Iniciar o servidor e acessar a rota no navegador para confirmar a renderização da UI do Swagger.

### Task 2.2 – Conexão com Banco de Dados (SQL Server) │ Agent_Backend
- **Status:** [x] Complete
- **Objective:** Estabelecer a conexão da aplicação NestJS com o banco de dados SQL Server de desenvolvimento.
- **Output:** Módulo de banco de dados configurado e conexão estabelecida com sucesso ao iniciar a aplicação.
- **Guidance:** Usar `TypeORM` como ORM. As credenciais devem vir estritamente de variáveis de ambiente (`.env`). **Não commitar credenciais.**
- **Sub-tasks:**
    1. **Instalação de Drivers:** Instalar `typeorm`, `@nestjs/typeorm` e `mssql`.
    2. **Configuração de Ambiente:** Criar arquivo `.env` (e `.env.example`) com as chaves: `DB_HOST`, `DB_PORT`, `DB_USERNAME`, `DB_PASSWORD`, `DB_DATABASE`.
    3. **Configuração do Módulo:** Configurar o `TypeOrmModule.forRootAsync` no `AppModule` para usar as variáveis de ambiente.
    4. **Teste de Conexão:** Iniciar a aplicação e verificar nos logs se a conexão com o banco foi estabelecida com sucesso. (Solicitar credenciais ao usuário se necessário).

### Task 2.3 – Middleware Multi-tenant (Core) │ Agent_Backend
- **Status:** [x] Complete
- **Objective:** Implementar a lógica base de multi-tenancy para identificar a empresa da requisição.
- **Output:** Middleware/Guard funcional que intercepta o header `x-tenant-id` e injeta o contexto na requisição.
- **Guidance:** O middleware deve ser leve. Para esta fase, validar contra uma lista estática ou tabela simples se possível, mas o foco é a extração e injeção do contexto (Request Scope).
- **Sub-tasks:**
    1. **Criação do Middleware:** Criar uma classe middleware (ex: `TenantMiddleware`) que leia o header `x-tenant-id`.
    2. **Validação Básica:** Implementar lógica para verificar se o ID recebido é válido (pode ser um mock inicial ou consulta simples).
    3. **Injeção de Contexto:** Armazenar o tenant identificado no objeto `request` ou em um serviço de armazenamento de contexto (AsyncLocalStorage ou Request Scoped Service) para uso nos controllers/services.
    4. **Endpoint de Teste:** Criar um endpoint simples que retorne o ID do tenant atual para validar o funcionamento do middleware.

## Phase 3: Frontend Core (Next.js & Storybook)
**Goal:** Configurar o ambiente de desenvolvimento de UI e componentes base.

### Task 3.1 – Configuração do Storybook │ Agent_Frontend
- **Status:** [x] Complete
- **Objective:** Configurar o ambiente de desenvolvimento isolado de componentes com Storybook.
- **Output:** Storybook rodando e acessível, configurado para TypeScript e Tailwind.
- **Guidance:** O Storybook deve refletir o estilo da aplicação principal (Tailwind).
- **Sub-tasks:**
    1. **Inicialização:** Executar `npx storybook@latest init` na pasta `/frontend`.
    2. **Configuração de Estilos:** Garantir que o Tailwind CSS esteja sendo carregado corretamente dentro do preview do Storybook (`preview.ts/js`).
    3. **Story de Exemplo:** Criar ou ajustar uma story de exemplo (ex: Button) para confirmar que os estilos estão sendo aplicados.
    4. **Validação:** Executar `npm run storybook` e verificar a interface.

### Task 3.2 – Componentes Base (Atomic Design) │ Agent_Frontend
- **Status:** [x] Complete
- **Objective:** Estabelecer a estrutura de diretórios Atomic Design e criar um componente base (Button).
- **Output:** Estrutura de pastas (`atoms`, `molecules`, etc.) e componente Button funcional com Storybook.
- **Sub-tasks:**
    1. **Estrutura:** Criar pastas `atoms`, `molecules`, `organisms`, `templates` em `src/components`.
    2. **Componente Button:** Implementar `Button` com variantes usando Tailwind.
    3. **Story:** Criar `Button.stories.tsx` para documentar o componente.

### Task 3.3 – Sistema de Temas (Theme System) │ Agent_Frontend
- **Status:** [x] Complete
- **Objective:** Criar a infraestrutura para suportar múltiplos temas (branding das empresas) na aplicação.
- **Output:** `ThemeProvider` implementado e dois temas básicos (AVP e Unigrande) definidos.
- **Guidance:** Usar Context API do React para prover o tema. As variáveis de tema (cores primárias, secundárias) devem ser facilmente trocáveis (ex: CSS Variables ou configuração dinâmica do Tailwind).
- **Sub-tasks:**
    1. **Definição de Tokens:** Definir os tokens de design que variarão por tema (ex: `primary-color`, `secondary-color`, `logo-url`).
    2. **Criação do Contexto:** Implementar o `ThemeContext` e `ThemeProvider` que gerenciam o estado do tema atual.
    3. **Implementação de Temas:** Criar objetos/arquivos de definição para os temas "AVP" e "Unigrande".
    4. **Aplicação de Estilos:** Configurar o Tailwind ou CSS global para consumir as variáveis do tema ativo.

### Task 3.4 – Componente Seletor de Empresa │ Agent_Frontend
- **Status:** [x] Complete
- **Objective:** Desenvolver o componente de UI que permite ao usuário trocar de empresa (tenant).
- **Output:** Componente `CompanySelector` funcional e documentado no Storybook.
- **Guidance:** Este componente é a chave para testar o multi-tenancy no frontend. Ele deve persistir a escolha para que a navegação não perca o contexto.
- **Sub-tasks:**
    1. **Estrutura Visual:** Criar o componente visual (Dropdown ou Lista) listando as empresas (mockadas).
    2. **Lógica de Seleção:** Ao clicar, atualizar o `ThemeContext` e salvar o ID da empresa selecionada no `localStorage` (ou Cookies).
    3. **Documentação:** Criar uma story para o `CompanySelector` no Storybook.
    4. **Integração:** Adicionar o componente em um layout base ou página inicial para teste.

## Phase 4: POC de Autenticação (Azure AD)
**Goal:** Validar a integração com Azure AD e fluxo de segurança.

### Task 4.1 – Configuração Azure AD (Backend) │ Agent_Backend
- **Objective:** Implementar a validação de tokens JWT do Azure AD no backend.
- **Output:** Estratégia Passport configurada e rota protegida funcional.
- **Guidance:** Utilizar `passport-azure-ad`. O foco é validar o token, não gerar (quem gera é o Azure).
- **Sub-tasks:**
    1. **Instalação de Pacotes:** Instalar `passport`, `@nestjs/passport` e `passport-azure-ad`.
    2. **Configuração da Estratégia:** Implementar a `BearerStrategy` com as configurações do tenant Azure (Client ID, Tenant ID - via `.env`).
    3. **Auth Guard:** Criar ou configurar o `AuthGuard('oauth-bearer')` para proteger rotas.
    4. **Rota Protegida:** Criar um endpoint `/api/profile` ou similar protegido pelo Guard para teste.

### Task 4.2 – Integração Frontend-Backend (Auth) │ Agent_Frontend
- **Objective:** Criar um fluxo mínimo de login no frontend para obter um token e consumir a API protegida.
- **Output:** Página de login simples que autentica (ou simula) e exibe dados da API protegida.
- **Guidance:** Para a POC, a simplicidade é chave. Se a configuração completa do MSAL/Next-Auth for complexa demais para o tempo, focar em garantir que, dado um token válido (mesmo que obtido manualmente), o frontend consiga chamar o backend.
- **Sub-tasks:**
    1. **Setup de Auth (POC):** Configurar `next-auth` com provider Azure AD (preferencial) ou preparar o cliente HTTP para enviar o header `Authorization: Bearer ...`.
    2. **Página de Login:** Criar uma página simples com botão "Login com Azure AD".
    3. **Consumo de API:** Criar uma função que chame a rota protegida do backend (Task 4.1) enviando o token obtido.
    4. **Validação Final:** Verificar se o fluxo completo (Login -> Obter Token -> Chamar API -> Ver Dados) funciona.