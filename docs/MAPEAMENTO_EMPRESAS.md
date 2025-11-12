# 🗺️ MAPEAMENTO DE FUNCIONALIDADES POR EMPRESA

Análise baseada em REQUIREMENTS.md para separar funcionalidades Unigrande vs AVP

**Data:** November 12, 2025

---

## 📊 Visão Geral

Análise inicial do REQUIREMENTS.md mostra que ambas empresas compartilham a mesma **estrutura de módulos**, mas as **funcionalidades específicas ainda precisam ser definidas**.

---

## 8 Módulos Identificados

```
Módulo Acadêmico
├── Diplomas (piloto: Unigrande)
├── Censo de Alunos
├── Ementas
└── DOU (Diário Oficial da União)

Módulo Financeiro
├── Contas a Pagar
├── Notas Fiscais (NFSe)
└── Geração de Boletos

Módulo Administrativo
├── Atividades
├── Atividades Complementares
├── Contratos
├── Convênios
└── Lotar Docente

Módulo de Coordenação
├── Gestão de Carga Horária
├── Lançamento de Notas
├── ProUni
└── Pré-Inscritos

Módulo de Recursos Humanos
├── Carga Horária
├── Lotação Docente
├── Transferências
└── Folha de Pagamento

Módulo de Relacionamentos
├── Cadastro de Colaboradores
├── Chamadas
├── Pré-Inscritos
└── Manutenção de Bolsas

Módulo de Relatórios
├── Conversão de Arquivos
└── Listas de Frequência

Módulo de Configurações
├── Gestão de Usuários
├── Gestão de Perfis
└── Gestão de Unidades
```

---

## ⚠️ Próximos Passos

Para completar este mapeamento, é preciso:

1. **Reunião com UX/PO**
   - [ ] Validar se ambas têm mesma estrutura
   - [ ] Confirmar diferenças específicas

2. **Levantamento de Requisitos Unigrande**
   - [ ] Detalhar cada módulo
   - [ ] Priorizar funcionalidades
   - [ ] Documentar processos específicos

3. **Levantamento de Requisitos AVP**
   - [ ] Similar ao Unigrande
   - [ ] Identificar diferenças
   - [ ] Planejar integração futura

4. **Análise de Reutilização**
   - [ ] Componentes reutilizáveis?
   - [ ] Lógica de negócio compartilhada?
   - [ ] Banco de dados compatível?

---

**Última atualização:** November 12, 2025
**Status:** Análise Preliminar - Aguardando Levantamento com UX/PO
