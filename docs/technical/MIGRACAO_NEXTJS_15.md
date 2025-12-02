# Plano de Migração: Next.js 14 → Next.js 15

**Data de Criação:** 02 de Dezembro de 2025  
**Status:** Planejamento  
**Prioridade:** Média  
**Prazo Sugerido:** Janeiro 2026 (antes da Fase 4 - Autenticação)

---

## Contexto e Justificativa

### Situação Atual
- **Next.js:** 14.2.33
- **React:** 18
- **Fase do Projeto:** Fases 1-3 concluídas, Fase 4 (Autenticação) aguardando infraestrutura

### Por que migrar?

**Next.js 15** (lançado em outubro/2024) já tem **14 meses de maturidade** em dezembro/2025:

✅ **Estabilidade Comprovada**
- Múltiplos patches de correção já lançados
- Casos de uso em produção consolidados
- Ecossistema React 19 maduro

✅ **Benefícios Técnicos**
- **Turbopack estável** (não mais experimental) - builds até 700% mais rápidos
- **React 19** com Server Components mais maduros
- **Cache melhorado** - comportamento mais previsível e granular
- **Performance** - otimizações significativas em tempo de build e runtime

✅ **Timing Estratégico**
- Projeto ainda em fase inicial (Fase 0-3)
- Migração agora evita refatoração futura
- Suporte de longo prazo (LTS) mais recente

---

## Principais Mudanças do Next.js 15

### 1. React 19 (Obrigatório)

**Mudança:** Next.js 15 requer React 19+

**Impacto no Projeto:**
- ✅ Baixo - Projeto usa padrões modernos (hooks, Context API)
- ⚠️ Verificar compatibilidade do Storybook com React 19

**Breaking Changes do React 19:**
- `ref` agora é prop nativa (não precisa `forwardRef`)
- `useFormStatus`, `useFormState` built-in
- `use()` hook para Promises e Context

### 2. Turbopack Estável

**Mudança:** Turbopack sai do experimental e vira padrão

**Impacto:**
- ✅ Remover flag `--turbo` (se estiver usando)
- ✅ Builds de desenvolvimento até 700% mais rápidos
- ✅ HMR (Hot Module Replacement) mais confiável

### 3. Async Request APIs

**Mudança:** APIs como `headers()`, `cookies()`, `params` agora são assíncronas

**Impacto no Projeto:**
- ⚠️ **CRÍTICO** - Necessário refatorar código que usa essas APIs
- Exemplo:
  ```typescript
  // Next.js 14
  export function MyComponent() {
    const headersList = headers();
    const userAgent = headersList.get('user-agent');
  }

  // Next.js 15
  export async function MyComponent() {
    const headersList = await headers();
    const userAgent = headersList.get('user-agent');
  }
  ```

**Arquivos Afetados:**
- `frontend/src/middleware.ts` (se existir)
- Layouts e páginas que usam `cookies()` ou `headers()`

### 4. Caching Behavior

**Mudança:** `fetch()` não é mais cached por padrão

**Impacto:**
- ✅ Comportamento mais previsível
- ⚠️ Revisar chamadas API para adicionar `cache: 'force-cache'` onde necessário

### 5. Route Handlers

**Mudança:** GET handlers não são mais cached por padrão

**Impacto:**
- ⚠️ Verificar Route Handlers em `app/api/*`
- Adicionar `export const dynamic = 'force-static'` onde necessário

---

## Plano de Execução

### Fase 1: Preparação (1-2 dias)

#### 1.1 Auditoria de Dependências
```bash
cd frontend
npm outdated
```

**Verificar compatibilidade:**
- [ ] Storybook com React 19
- [ ] Tailwind CSS (deve ser compatível)
- [ ] class-variance-authority
- [ ] clsx / tailwind-merge

#### 1.2 Backup e Branch
```bash
git checkout -b migration/nextjs-15
git push -u origin migration/nextjs-15
```

#### 1.3 Documentar Estado Atual
```bash
npm list --depth=0 > migration-before.txt
npm run build > build-before.txt
```

---

### Fase 2: Atualização de Dependências (1 dia)

#### 2.1 Atualizar Next.js e React

**Executar:**
```bash
cd frontend
npm install next@latest react@latest react-dom@latest
```

**Versões Esperadas:**
- `next`: ^15.0.0
- `react`: ^19.0.0
- `react-dom`: ^19.0.0

#### 2.2 Atualizar TypeScript Types

```bash
npm install -D @types/react@latest @types/react-dom@latest
```

#### 2.3 Atualizar ESLint Config

```bash
npm install -D eslint-config-next@latest
```

#### 2.4 Atualizar Storybook (se necessário)

```bash
npx storybook@latest upgrade
```

**Verificar:** Storybook deve suportar React 19. Caso contrário, aguardar atualização ou considerar alternativas.

---

### Fase 3: Refatoração de Código (2-3 dias)

#### 3.1 Async Request APIs

**Buscar usos de APIs assíncronas:**
```bash
# Buscar no código
grep -r "headers()" src/
grep -r "cookies()" src/
grep -r "params" src/app/
```

**Refatorar para async/await:**
- Converter componentes para `async`
- Adicionar `await` antes de `headers()`, `cookies()`, `params`

#### 3.2 Caching Explícito

**Revisar chamadas fetch:**
```bash
grep -r "fetch(" src/
```

**Adicionar cache quando necessário:**
```typescript
// Para dados que devem ser cached
fetch('https://api.example.com/data', {
  cache: 'force-cache'
})

// Para dados sempre frescos (padrão no Next 15)
fetch('https://api.example.com/data', {
  cache: 'no-store'
})
```

#### 3.3 Route Handlers

**Revisar handlers em `app/api/*`:**
```typescript
// Se quiser cache estático
export const dynamic = 'force-static';

// Se quiser sempre dinâmico (padrão no Next 15)
export const dynamic = 'force-dynamic';
```

#### 3.4 Remover forwardRef Desnecessários

React 19 não precisa de `forwardRef` para passar `ref`:

```typescript
// Antes (React 18)
const Button = forwardRef<HTMLButtonElement, ButtonProps>((props, ref) => {
  return <button ref={ref} {...props} />;
});

// Depois (React 19)
const Button = ({ ref, ...props }: ButtonProps & { ref?: Ref<HTMLButtonElement> }) => {
  return <button ref={ref} {...props} />;
};
```

---

### Fase 4: Testes e Validação (2-3 dias)

#### 4.1 Build Local

```bash
npm run build
```

**Verificar:**
- [ ] Build completa sem erros
- [ ] Warnings de depreciação (documentar para correção futura)
- [ ] Tamanho dos bundles (devem ser menores ou iguais)

#### 4.2 Testes de Desenvolvimento

```bash
npm run dev
```

**Validar:**
- [ ] Hot reload funciona
- [ ] Turbopack ativo (verificar logs)
- [ ] Páginas carregam corretamente
- [ ] Não há erros no console do browser

#### 4.3 Storybook

```bash
npm run storybook
```

**Verificar:**
- [ ] Storybook inicia sem erros
- [ ] Componentes renderizam corretamente
- [ ] Interações funcionam

#### 4.4 Testes Manuais

**Checklist de funcionalidades:**
- [ ] Navegação entre páginas
- [ ] Seletor de empresa (multi-tenant)
- [ ] Seletor de tema
- [ ] Responsividade
- [ ] Performance (comparar com Next 14)

#### 4.5 Performance Benchmarks

**Comparar tempos:**
```bash
# Build time
time npm run build

# Dev startup
time npm run dev
```

**Documentar melhorias esperadas:**
- Build: ~30-50% mais rápido
- Dev startup: ~50-70% mais rápido com Turbopack
- HMR: ~2-5x mais rápido

---

### Fase 5: Deploy e Monitoramento (1 dia)

#### 5.1 Deploy em Homologação

**Pré-requisitos:**
- [ ] CI/CD configurado para Next.js 15
- [ ] Variáveis de ambiente validadas
- [ ] Documentação atualizada

#### 5.2 Smoke Tests em Homologação

**Validar em ambiente:**
- [ ] Build de produção funciona
- [ ] SSR funciona corretamente
- [ ] Cache está configurado corretamente
- [ ] Não há memory leaks

#### 5.3 Rollback Plan

**Se houver problemas críticos:**
```bash
git checkout main
npm install
npm run build
# Deploy da main
```

#### 5.4 Merge para Main

```bash
git checkout main
git merge migration/nextjs-15
git push origin main
```

---

## Documentação a Atualizar

### Arquivos Técnicos

- [ ] `docs/technical/architecture/CORE_ARCHITECTURE.md`
  - Atualizar de "Next.js 14.x" para "Next.js 15.x"
  - Atualizar de "React 18" para "React 19"

- [ ] `docs/technical/IMPLEMENTACAO_FASE_1_A_3.md`
  - Adicionar seção "Migração Next.js 15"
  - Documentar mudanças e lições aprendidas

- [ ] `README.md`
  - Atualizar versões no tech stack

### Package.json

Adicionar comentário sobre Turbopack:
```json
{
  "scripts": {
    "dev": "next dev",  // Turbopack habilitado por padrão no Next.js 15
  }
}
```

---

## Riscos e Mitigações

### 🔴 Alto Risco

**1. Incompatibilidade do Storybook com React 19**

**Mitigação:**
- Verificar versão do Storybook antes da migração
- Se incompatível, atualizar Storybook primeiro OU aguardar atualização
- Alternativa: desabilitar Storybook temporariamente (não recomendado)

**2. Async Request APIs quebram código existente**

**Mitigação:**
- Auditoria completa de usos de `headers()`, `cookies()`, `params`
- Testes manuais extensivos
- Considerar codemod automático (se disponível)

### 🟡 Médio Risco

**3. Cache behavior afeta performance**

**Mitigação:**
- Documentar todas as chamadas `fetch()`
- Testar performance antes/depois
- Monitorar métricas em homologação

**4. Dependências de terceiros incompatíveis**

**Mitigação:**
- Verificar `npm outdated` antes da migração
- Testar todas as dependências principais
- Ter plano de substituição para libs críticas

### 🟢 Baixo Risco

**5. Breaking changes menores**

**Mitigação:**
- Ler changelog completo do Next.js 15
- Seguir guia oficial de migração
- Testes manuais abrangentes

---

## Checklist de Migração Completa

### Pré-Migração
- [ ] Ler changelog oficial do Next.js 15
- [ ] Verificar compatibilidade de todas as dependências
- [ ] Criar branch de migração
- [ ] Backup do estado atual (logs, package-lock)

### Execução
- [ ] Atualizar Next.js, React e React DOM
- [ ] Atualizar TypeScript types
- [ ] Atualizar ESLint config
- [ ] Atualizar Storybook (se necessário)
- [ ] Refatorar código para async request APIs
- [ ] Revisar e ajustar caching behavior
- [ ] Revisar route handlers
- [ ] Remover `forwardRef` desnecessários

### Validação
- [ ] Build local sem erros
- [ ] Dev server funciona com Turbopack
- [ ] Storybook funciona
- [ ] Testes manuais de todas as funcionalidades
- [ ] Performance benchmarks
- [ ] Deploy em homologação
- [ ] Smoke tests em homologação

### Pós-Migração
- [ ] Atualizar documentação técnica
- [ ] Atualizar README
- [ ] Merge para main
- [ ] Deploy em produção (quando aplicável)
- [ ] Monitoramento de 48h pós-deploy
- [ ] Retrospectiva da migração

---

## Estimativa de Esforço

| Fase | Duração | Responsável |
|------|---------|-------------|
| 1. Preparação | 1-2 dias | DevOps + Backend |
| 2. Atualização de Dependências | 1 dia | Backend |
| 3. Refatoração de Código | 2-3 dias | Frontend + Backend |
| 4. Testes e Validação | 2-3 dias | QA + Frontend |
| 5. Deploy e Monitoramento | 1 dia | DevOps |
| **Total** | **7-10 dias** | **Equipe Completa** |

---

## Recursos e Referências

### Documentação Oficial
- [Next.js 15 Release Notes](https://nextjs.org/blog/next-15)
- [Next.js 14 to 15 Upgrade Guide](https://nextjs.org/docs/app/building-your-application/upgrading/version-15)
- [React 19 Release Notes](https://react.dev/blog/2024/04/25/react-19)

### Ferramentas
- [Next.js Codemods](https://nextjs.org/docs/app/building-your-application/upgrading/codemods)
- [React 19 Upgrade Guide](https://react.dev/blog/2024/04/25/react-19-upgrade-guide)

### Comunidade
- [Next.js GitHub Discussions](https://github.com/vercel/next.js/discussions)
- [Next.js Discord](https://nextjs.org/discord)

---

## Notas Finais

**Momento Ideal:** Janeiro/2026 - antes de iniciar a Fase 4 (Autenticação Azure AD)

**Vantagens de Migrar Agora:**
- Codebase ainda pequeno e gerenciável
- Antes de features críticas (autenticação)
- Tempo para estabilizar antes da produção (Q1 2026)

**Decisão Final:** A migração é **recomendada** e deve ser priorizada após conclusão da Fase 3 e antes do início da Fase 4.
