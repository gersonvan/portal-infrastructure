# Diagrama de Fluxos

Este documento apresenta os fluxos principais dos processos do Portal Administrativo.

## 1. Fluxo Geral do Portal

```
┌─────────────────────────────────────────────────────────────────┐
│                      PORTAL ADMINISTRATIVO                       │
│                                                                   │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐       │
│  │  Acadêmico   │    │ Administrativo│   │  Financeiro  │       │
│  │              │    │               │   │              │       │
│  │ • Diploma    │    │ • Atividades  │   │ • Contas a   │       │
│  │ • Censo      │    │ • Contratos   │   │   Pagar      │       │
│  │ • DOU        │    │ • Lotação     │   │ • Notas      │       │
│  └──────────────┘    └──────────────┘    └──────────────┘       │
│                                                                   │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐       │
│  │ Coordenação  │    │      RH      │    │Relacionamento│       │
│  │              │    │              │    │              │       │
│  │ • Notas      │    │ • Carga      │    │ • Colaborad. │       │
│  │ • Carga      │    │ • Lotação    │    │ • Chamadas   │       │
│  │ • ProUni     │    │ • Transfer.  │    │ • Bolsas     │       │
│  └──────────────┘    └──────────────┘    └──────────────┘       │
│                                                                   │
└─────────────────────────────────────────────────────────────────┘
```

## 2. Fluxo de Autenticação e Autorização

```
┌────────────────┐
│  Usuário entra │
│  no Portal     │
└────────┬───────┘
         │
         ▼
┌────────────────────────────┐
│  Sistema de Autenticação   │
│  (JWT / Session)           │
└────────┬───────────────────┘
         │
    ┌────┴────┐
    │          │
    ▼ SIM     ▼ NÃO
┌─────────┐  ┌──────────────┐
│ Valida  │  │ Rejeita e    │
│ Credenc.│  │ Redireciona  │
└────┬────┘  │ para Login   │
     │       └──────────────┘
     ▼
┌────────────────────────────┐
│  Verifica Permissões       │
│  (RBAC - Papéis)           │
└────────┬───────────────────┘
         │
    ┌────┴────┐
    │          │
    ▼ SIM     ▼ NÃO
┌─────────┐  ┌──────────────┐
│ Concede │  │ Acesso       │
│ Acesso  │  │ Negado       │
└────┬────┘  └──────────────┘
     │
     ▼
┌────────────────────────────┐
│  Usuário dentro do Portal  │
│  com Permissões Ativas     │
└────────────────────────────┘
```

## 3. Fluxo do Módulo Diploma Digital

```
┌─────────────────────────────────────────────────────────┐
│                   DIPLOMA DIGITAL                        │
└─────────────────────────────────────────────────────────┘

PREPARAÇÃO:
┌──────────────┐
│  Dados do    │
│  Aluno       │
└──────┬───────┘
       │
       ▼
┌──────────────────────────────────┐
│  Validar Informações             │
│  • Datas                         │
│  • Documentação                  │
│  • Dados Pessoais                │
└──────┬───────────────────────────┘
       │
    ┌──┴──┐
    │     │
    ▼ OK │ Erro
┌────────┐└─────────────────┐
│Prosseg.│                  │
└───┬────┘         ┌────────┴──────┐
    │              │  Solicitar     │
    │              │  Correções     │
    ▼              └────────┬───────┘
┌──────────────┐   │
│  Preparação  │            │
│  do Arquivo  │    ┌───────┘
└──────┬───────┘    │
       │            │
       ▼            │
┌───────────────────┴────────────┐
│  Gerar XML para Envio (SP)     │
└──────┬────────────────────────┘
       │
       ▼
┌───────────────────────────────┐
│  Assinar Digitalmente         │
│  (Certificado Digital A1)     │
└──────┬────────────────────────┘
       │
       ▼
┌───────────────────────────────┐
│  Enviar para Secretaria (SP)  │
└──────┬────────────────────────┘
       │
       ▼
┌───────────────────────────────┐
│  Validação em SP              │
│  • Assinatura                 │
│  • Dados                      │
│  • Conformidade MEC           │
└──────┬────────────────────────┘
       │
    ┌──┴──┐
    │     │
    ▼ OK │ Rejeição
┌────────┐ ┌────────────────────┐
│Diploma │ │ Retornar Erros e   │
│Emitido │ │ Solicitar Correção │
│   ✓    │ └────────┬───────────┘
└────────┘          │
                    │ (volta ao início)
```

---

## Legenda dos Símbolos

| Símbolo | Significado |
| --- | --- |
| ┌─ ─┐ | Processo/Caixa |
| ► ◄ | Fluxo de dados |
| ▼ ▲ | Fluxo vertical |
| ✓ | Sucesso/Completo |
| ✗ | Erro/Falha |
| ○ | Decisão |

---

## Próximos Passos

*   Adicionar mais fluxos conforme forem definidos
*   Detalhar fluxos por módulo específico
*   Criar versões visuais com ferramentas como Lucidchart/Draw.io
*   Documentar exceções e tratamento de erros
