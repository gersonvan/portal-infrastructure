# Core Architecture

## Visão Geral

O Portal Administrativo está sendo desenvolvido usando uma arquitetura modular inspirada no conceito de "racks", onde cada módulo é independente mas pode se integrar facilmente ao core do sistema.

## Estrutura Base

### Core do Portal

*   Sistema base que gerencia a integração entre módulos
*   Gerenciamento de autenticação e autorização
*   Gerenciamento de estado global
*   Roteamento e navegação
*   Temas e estilos globais

### Módulos (Racks)

Cada módulo é desenvolvido como uma unidade independente que:

*   Possui suas próprias rotas
*   Gerencia seu próprio estado
*   Tem seus próprios componentes
*   Pode se comunicar com outros módulos através de interfaces definidas

## Tecnologias

### Frontend

*   React 19 + Next.js 15.x (TypeScript)
*   Gerenciamento de Estado: Context API / Hooks
*   UI Framework: Tailwind CSS

### Backend

*   Node.js + NestJS 10.x (TypeScript)
*   Clean Architecture
*   REST APIs
*   Banco de Dados: SQL Server (Infraestrutura Local / On-Premise)

## Comunicação entre Módulos

### Events

*   Sistema de eventos para comunicação assíncrona
*   Pub/Sub para atualizações em tempo real

### APIs

*   Interfaces bem definidas para comunicação entre módulos
*   Versionamento de APIs
*   Documentação via OpenAPI/Swagger

## Desenvolvimento de Módulos

### Guidelines

1.  Independência: Módulos devem funcionar de forma autônoma
2.  Baixo Acoplamento: Minimizar dependências entre módulos
3.  Alta Coesão: Funcionalidades relacionadas juntas
4.  Interfaces Claras: APIs bem documentadas

### Estrutura de Diretórios

```
/src
  /core
    /auth
    /routing
    /state
    /ui
  /modules
    /[module-name]
      /components
      /services
      /types
      /utils
```

## Segurança

### Autenticação

*   Sistema centralizado de autenticação
*   Suporte a múltiplos métodos de auth
*   Gestão de sessões

### Autorização

*   RBAC (Role-Based Access Control)
*   Permissões granulares por módulo
*   Auditoria de acessos

## Performance

### Otimizações

*   Code Splitting por módulo
*   Lazy Loading de componentes
*   Caching estratégico

### Monitoramento

*   Métricas de performance por módulo
*   Rastreamento de erros
*   Analytics de uso

## Próximos Passos

1.  Definir biblioteca de UI
2.  Estabelecer padrões de código
3.  Criar módulo exemplo
4.  Documentar processo de criação de módulos