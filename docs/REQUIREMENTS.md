# Levantamento de Requisitos

## Sistemas Existentes (Módulos Principais)
# Levantamento de Requisitos

## Sistemas Existentes
*Lista de sistemas e funcionalidades atualmente em produção no portal antigo*

### 1. Módulo Acadêmico
- Features relacionadas a Diplomas:
  - Diploma (processo básico)
  - Diploma Digital [EM DESENVOLVIMENTO - Ver DIPLOMA_DIGITAL.md]
  - Gerar Arquivo Diploma
  - Gerar Arquivo Diploma Digital
  - Registro do Diploma
  - Status do Processo de Diploma
- Features Acadêmicas Gerais:
  - Censo Aluno
  - DOU (Diário Oficial da União)
  - Ementa

### 2. Módulo Administrativo
- Gestão de Atividades:
  - Atividades
  - Atividades Complementares
  - Eventos da Atividade
- Gestão de Documentos:
  - Contratos
  - Convênios
- Gestão Financeira:
  - Emissão Nota Fiscal
  - Nota Fiscal
  - Nota de Pagamento
  - Gerar Arquivo de Boletos
- Recursos Humanos:
  - Lotar Docente

### 3. Módulo de Coordenação
- Gestão Acadêmica:
  - Lançamento de notas do PRD
  - Pro-Uni
  - Pré-Inscrito
- Gestão de Atividades:
  - Atividades
  - Atividades Complementares
  - Eventos da Atividade
- Gestão de Carga Horária:
  - Carga Horária
  - Lotar Docente
- Gestão de Documentos:
  - Contratos
  - Convênios
- Gestão Financeira:
  - Nota Fiscal
  - Gerar Arquivo de Boletos

### 4. Módulo Financeiro
- Gestão Financeira:
  - Financeiro (geral)
  - Contas a pagar

### 5. Módulo de Recursos Humanos
- Gestão de Docentes:
  - Carga Horária
  - Lotar Docente
  - Bloquear Lotação Por Unidade
  - Transferência de Docente
- Gestão Financeira:
  - Nota Fiscal
  - Nota Fiscais Logs
  - Nota de Pagamento
- Configurações:
  - Portal Configuração

### 6. Módulo de Relacionamentos
- Gestão de Pessoas:
  - Cadastro de Colaboradores
  - Chamada Relacionamento
  - Pré-Inscrito
- Gestão de Benefícios:
  - Manutenção de Bolsas

### 7. Módulo de Relatórios
- Ferramentas:
  - Conversão de Arquivo Texto
  - Lista de Frequência

### 8. Módulo de Configurações
- Gestão do Sistema:
  - Atualizar Unidades
  - Perfil
  - Usuário
  - Usuários

## Estrutura Original do Sistema

### Mapeamento Acessos online

#### Acadêmico
* Censo Aluno
* Diploma
* Diploma Digital
* Dou
* Ementa
* Gerar Arquivo Diploma
* Gerar Arquivo Diploma Digital
* Registro do Diploma
* Status do Processo de Diploma

#### Acadêmico
* Diploma

#### Financeiro
* Financeiro

#### Administrativo
* Atividades
* Atividades Complementares
* Contratos
* Convênios
* Lotar Docente
* Emissão Nota Fiscal
* Eventos da Atividade
* Gerar Arquivo de Boletos
* Nota Fiscal
* Nota de Pagamento

#### Coordenação
* Atividades
* Atividades Complementares
* Carga Horária
* Contratos
* Convênios
* Lotar Docente
* Eventos da Atividade
* Gerar Arquivo de Boletos
* Nota Fiscal
* Lançamento de notas do PRD
* Pré-Inscrito
* Pro-Uni

#### Financeiro
* Contas a pagar

#### Recursos Humanos
* Carga Horária
* Bloquear Lotação Por Unidade
* Lotar Docente
* Nota Fiscal
* Nota Fiscais Logs
* Nota de Pagamento
* Portal Configuração
* Transferência de Docente

#### Relacionamentos
* Cadastro de Colaboradores
* Chamada Relacionamento
* Pré-Inscrito
* Manutenção de Bolsas

#### Relatórios
* Conversão de Arquivo Texto
* Lista de Frequência

#### Configurações
* Atualizar Unidades
* Perfil
* Usuário
* Usuários

## Observações Importantes
1. Existem features duplicadas entre módulos:
   - Lotar Docente (aparece em Administrativo, Coordenação e RH)
   - Nota Fiscal (aparece em vários módulos)
   - Atividades (aparece em Administrativo e Coordenação)
   - Pré-Inscrito (aparece em Coordenação e Relacionamentos)

2. Algumas features parecem estar em módulos não ideais e podem precisar de reorganização

3. Há redundâncias no sistema:
   - Dois módulos Acadêmico com funcionalidades diferentes
   - Dois módulos Financeiro
   - Usuário/Usuários nas configurações

1. Sistema Acadêmico
   - Funcionalidades principais:
     - Gestão de Diplomas (regular e digital)
     - Censo do Aluno
     - Ementas
     - Registro e Status de Diplomas
     - Publicações no DOU
   - Usuários principais: Secretaria Acadêmica
   - Nível de criticidade: Alto
   - Dependências: Módulo de Configurações

2. Sistema Administrativo
   - Funcionalidades principais:
     - Gestão de Atividades e Atividades Complementares
     - Gestão de Contratos e Convênios
     - Lotação de Docentes
     - Faturamento (Notas Fiscais)
   - Usuários principais: Administrativo
   - Nível de criticidade: Alto
   - Dependências: Módulo Financeiro, RH

3. Sistema de Coordenação
   - Funcionalidades principais:
     - Gestão de Atividades
     - Controle de Carga Horária
     - Gestão de Contratos
     - Lançamento de notas PRD
     - Gestão ProUni
   - Usuários principais: Coordenadores
   - Nível de criticidade: Alto
   - Dependências: Módulo Acadêmico, Administrativo

4. Sistema Financeiro
   - Funcionalidades principais:
     - Contas a Pagar
     - Gestão Financeira Geral
     - Geração de Boletos
   - Usuários principais: Setor Financeiro
   - Nível de criticidade: Alto
   - Dependências: Módulo Administrativo

5. Sistema de Recursos Humanos
   - Funcionalidades principais:
     - Gestão de Carga Horária
     - Gestão de Lotação Docente
     - Faturamento (Notas Fiscais)
     - Transferências de Docentes
   - Usuários principais: RH
   - Nível de criticidade: Alto
   - Dependências: Módulo de Configurações

6. Sistema de Relacionamentos
   - Funcionalidades principais:
     - Gestão de Colaboradores
     - Gestão de Chamadas
     - Gestão de Pré-Inscritos
     - Manutenção de Bolsas
   - Usuários principais: Setor de Relacionamentos
   - Nível de criticidade: Médio
   - Dependências: Módulo de Configurações

7. Sistema de Relatórios
   - Funcionalidades principais:
     - Conversão de Arquivos
     - Geração de Listas de Frequência
   - Usuários principais: Todos os setores
   - Nível de criticidade: Médio
   - Dependências: Todos os módulos

8. Sistema de Configurações
   - Funcionalidades principais:
     - Gestão de Unidades
     - Gestão de Perfis
     - Gestão de Usuários
   - Usuários principais: Administradores do Sistema
   - Nível de criticidade: Alto
   - Dependências: Nenhuma

## Prioridades de Migração
*Critérios para priorização:*
- Criticidade do sistema
- Complexidade da migração
- Benefício da modernização
- Dependências entre sistemas
- Impacto nos usuários

## Requisitos Não-Funcionais
1. Performance
   - Tempo de resposta
   - Capacidade de usuários simultâneos
   - Volume de dados

2. Segurança
   - Autenticação
   - Autorização
   - Proteção de dados

3. Manutenibilidade
   - Padrões de código
   - Documentação
   - Testes

4. Disponibilidade
   - Tempo de uptime
   - Estratégia de backup
   - Plano de contingência