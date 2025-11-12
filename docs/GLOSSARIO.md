# 📚 GLOSSÁRIO - Portal Administrativo

**Versão:** 1.0  
**Última atualização:** November 12, 2025

---

## 📖 Termos e Definições

### A

**Aluno**
- Pessoa registrada no sistema acadêmico da instituição
- Pode ter múltiplas matrículas
- Dados podem ser isolados por empresa

**AVP**
- Uma das empresas que usará o Portal Administrativo
- Sigla: AVP (empresa parceira)
- Status: Fase 2 (futuro)

**Atividades**
- Tarefas e responsabilidades na instituição
- Podem ser complementares (extra-curriculares)
- Módulo: Administrativo

---

### B

**Backlog**
- Lista priorizada de todas as tarefas do projeto
- Organizado por épicos e sprints
- Atualizado continuamente

**Boleto**
- Documento de cobrança de mensalidade/taxas
- Gerado automaticamente pelo sistema
- Módulo: Financeiro

**Backend**
- Servidor e lógica de negócio
- Node.js + TypeScript
- Implementa isolamento de dados por empresa

---

### C

**Componentes Compartilhados**
- Código reutilizável entre Unigrande e AVP
- Botões, inputs, tables, modais
- Tema pode variar por empresa

**Contexto (Tenant)**
- Informação de qual empresa o usuário está usando
- Muda dinamicamente sem logout
- Usado para filtrar dados e aplicar tema

**Contratos**
- Documentos formais com docentes/colaboradores
- Módulo: Administrativo
- Isolados por empresa

**Convênios**
- Parcerias com outras instituições
- Módulo: Administrativo
- Específicos por empresa

---

### D

**Diploma Digital**
- Certificado de conclusão do curso em formato digital
- Pode ser assinado digitalmente
- Publicado no DOU (Diário Oficial da União)
- Piloto: Unigrande

**DOU (Diário Oficial da União)**
- Publicação oficial dos diplomas
- Obrigatório por lei
- Integração externa

---

### E

**Empresa**
- Organização que usa o Portal Administrativo
- Exemplos: Unigrande, AVP
- Cada uma tem seus dados isolados

**Empresa ID (empresa_id)**
- Identificador único da empresa
- Adicionado em TODAS as tabelas
- Usado para filtrar dados no backend

**Épico**
- Grande funcionalidade ou projeto
- Composto por várias stories
- Exemplos: "Diploma Digital", "Módulo Financeiro"

---

### F

**Frontend**
- Interface do usuário (UI)
- React + TypeScript + TailwindCSS/MUI
- Exibe dados conforme empresa selecionada

**Fase**
- Período do projeto com objetivos específicos
- Fase 0: Setup (Dez 2024)
- Fase 1: Diploma Digital (Jan-Mar 2025)
- Fase 2: Expandir Módulos (Abr-Jun 2025)
- Fase 3: Produção (Jul-Set 2025)
- Fase 4: Prep AVP (Out-Dez 2025)
- Fase 5: AVP Live (Jan 2026+)

**Fluxo**
- Sequência de etapas em um processo
- Exemplo: Fluxo de geração de diploma

---

### G

**Glossário**
- Este documento!
- Definições de termos técnicos e de negócio
- Consultar quando tiver dúvida

---

### H

---

### I

**Integração**
- Conexão com sistemas externos
- Exemplos: Prefeitura SP, DOU, NFSe
- Módulo: Financeiro, Acadêmico

**Isolamento de Dados**
- Garantir que dados de uma empresa não vazem para outra
- Implementado via empresa_id
- Validado em CADA query

---

### J

**Jira**
- Ferramenta de gerenciamento de projetos
- Projeto: PA (Portal Administrativo)
- Contém epics, stories, tasks

---

### L

**Lançamento de Notas**
- Registro de avaliações dos alunos
- Módulo: Coordenação
- Isolado por empresa

**Lotação Docente**
- Designação de professores para disciplinas/carga
- Módulo: RH
- Isolada por empresa

---

### M

**Mapeamento de Funcionalidades**
- Documento que lista quais features cada empresa tem
- Unigrande pode ter features diferentes de AVP
- Precisa de validação com UX/PO

**Middleware**
- Função que valida requisições antes de chegar ao endpoint
- No nosso caso: valida se usuário tem acesso à empresa
- Backend

**Módulo**
- Grande área funcional do sistema
- Exemplos: Acadêmico, Financeiro, RH
- Pode ter sub-módulos

**Multi-Tenant**
- Sistema que suporta múltiplas empresas
- Dados isolados por empresa_id
- Uma codebase para várias empresas

---

### N

**NFSe (Nota Fiscal de Serviço Eletrônica)**
- Documento fiscal para serviços educacionais
- Gerado automaticamente
- Módulo: Financeiro

---

### O

**Opção 1 (Duas Identidades)**
- Proposta de arquitetura com seletor de empresa
- UX preferência: evita confusão do usuário
- Implementado como padrão

**Opção 2 (Uma Identidade)**
- Proposta alternativa com categorias
- Não foi escolhida
- Aumentaria confusão

---

### P

**Papel/Role**
- Permissão de acesso no sistema
- Exemplos: Secretária Acadêmica, Coordenador, Admin
- Um usuário pode ter papéis diferentes por empresa

**Prefeitura SP**
- Órgão municipal de São Paulo
- Responsável por validar diplomas
- Integração obrigatória para Unigrande

**ProUni**
- Programa de bolsas do governo
- Módulo: Coordenação
- Isolado por empresa

---

### Q

---

### R

**RBAC (Role-Based Access Control)**
- Sistema de controle de acesso por papéis
- Implementado como: usuário + papel + empresa
- Não só usuário + papel

**Requisitos**
- Documento que detalha o que o sistema deve fazer
- REQUIREMENTS.md

---

### S

**Schema**
- Estrutura do banco de dados
- Todas as tabelas, colunas, relacionamentos
- Inclui empresa_id

**Secretária Acadêmica**
- Papel que gerencia informações de alunos
- Módulo: Acadêmico
- Pode ser diferentes por empresa

**Seletor de Empresa**
- Dropdown no header do Portal
- Permite trocar de empresa sem logout
- Frontend

**Sprint**
- Período de desenvolvimento (2 semanas geralmente)
- Tem objetivos definidos
- Inclui planejamento, execução, revisão

**Story**
- Funcionalidade pequena dentro de um épico
- Exemplo: "Criar form de preenchimento de diploma"
- Tem acceptance criteria

---

### T

**Tabela (Database)**
- Estrutura que armazena dados
- Toda tabela tem empresa_id (se dados são por empresa)
- Exemplos: alunos, diplomas, notas

**Tema/Theme**
- Esquema de cores, logo, estilo visual
- Pode variar por empresa
- Mudado dinamicamente quando seleciona empresa

**Tenant**
- Sinônimo de "empresa" no contexto multi-tenant
- Um tenant = uma empresa
- Isolado de outros tenants

**Token JWT**
- Autenticação do usuário
- Contém: user_id, available_enterprises
- Enviado a cada requisição

---

### U

**Unigrande**
- Uma das empresas que usará o Portal
- Status: Fase 1 (piloto com Diploma Digital)
- Prototipagem em andamento

**Unidade**
- Campus ou unidade física da instituição
- Pode ter múltiplas unidades por empresa
- Exemplo: Campus São Paulo, Campus Rio de Janeiro

---

### V

**Validação**
- Verificar se dados estão corretos
- Backend valida antes de salvar
- Exemplo: diploma tem todos campos obrigatórios?

---

### X

**X-Empresa-ID**
- Header HTTP que contém o ID da empresa
- Enviado por cada request
- Backend usa para filtrar dados

---

### Z

---

## 📝 Como Usar

1. **Procure por uma letra** (A-Z)
2. **Ache o termo**
3. **Leia a definição**
4. **Se tiver mais dúvida, consulte o documento relacionado**

---

## 🔗 Documentos Relacionados

- REQUIREMENTS.md (o que o sistema faz)
- MULTI_TENANT_ARCHITECTURE.md (como multi-tenant funciona)
- FAQ.md (perguntas frequentes)

---

**Próxima atualização:** Depois de cada decisão arquitetural
