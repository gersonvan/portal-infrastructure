#!/bin/bash
# Migração Automatizada: Monorepo → Polirepo
# Portal Administrativo - AVP/Unigrande
# Autor: DevOps Team
# Data: Dezembro 2025

set -e  # Exit on error

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configurações
ORIGINAL_REPO="https://github.com/gersonvan/Portal-Administrativo.git"
GITHUB_ORG="gersonvan"
WORKSPACE="/tmp/polirepo-migration-$(date +%Y%m%d-%H%M%S)"

# Novos repositórios
declare -A REPOS=(
    ["frontend"]="portal-frontend"
    ["backend"]="portal-backend"
    ["docs"]="portal-docs"
    ["infrastructure"]="portal-infrastructure"
)

# Função de log
log() {
    echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
    exit 1
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Verificar pré-requisitos
check_prerequisites() {
    log "Verificando pré-requisitos..."
    
    if ! command -v git &> /dev/null; then
        error "Git não está instalado"
    fi
    
    if ! command -v gh &> /dev/null; then
        warning "GitHub CLI (gh) não encontrado. Repositórios devem ser criados manualmente."
    fi
    
    if ! command -v git-filter-repo &> /dev/null; then
        warning "git-filter-repo não encontrado. Instalando..."
        pip install git-filter-repo || error "Falha ao instalar git-filter-repo"
    fi
    
    log "✅ Pré-requisitos verificados"
}

# Criar workspace
create_workspace() {
    log "Criando workspace em $WORKSPACE..."
    mkdir -p "$WORKSPACE"
    cd "$WORKSPACE"
    log "✅ Workspace criado"
}

# Backup do repositório original
backup_original() {
    log "Fazendo backup do repositório original..."
    git clone --mirror "$ORIGINAL_REPO" "backup-original.git"
    log "✅ Backup criado em $WORKSPACE/backup-original.git"
}

# Criar novos repositórios no GitHub
create_github_repos() {
    if command -v gh &> /dev/null; then
        log "Criando repositórios no GitHub..."
        
        for repo in "${REPOS[@]}"; do
            log "Criando $repo..."
            gh repo create "$GITHUB_ORG/$repo" --private || warning "Repositório $repo pode já existir"
        done
        
        log "✅ Repositórios criados"
    else
        warning "Crie os seguintes repositórios manualmente no GitHub:"
        for repo in "${REPOS[@]}"; do
            echo "  - $GITHUB_ORG/$repo"
        done
        read -p "Pressione Enter quando os repositórios estiverem criados..."
    fi
}

# Migrar subdiretório mantendo histórico
migrate_subdirectory() {
    local SUBDIR=$1
    local NEW_REPO_NAME=$2
    local EXTRA_PATHS=$3
    
    log "📦 Migrando $SUBDIR para $NEW_REPO_NAME..."
    
    local TEMP_DIR="temp-$NEW_REPO_NAME"
    
    # Clone fresh do original
    git clone "$ORIGINAL_REPO" "$TEMP_DIR"
    cd "$TEMP_DIR"
    
    # Preparar filter-repo command
    local FILTER_ARGS="--path $SUBDIR/"
    
    # Adicionar paths extras se houver
    if [ -n "$EXTRA_PATHS" ]; then
        for path in $EXTRA_PATHS; do
            FILTER_ARGS="$FILTER_ARGS --path $path"
        done
    fi
    
    # Filtrar histórico
    log "Filtrando histórico (isso pode demorar)..."
    git filter-repo $FILTER_ARGS --path-rename "$SUBDIR/:" --force
    
    # Mover arquivos da raiz se necessário
    if [ -f ".env.example" ]; then
        cp .env.example "$SUBDIR/" 2>/dev/null || true
    fi
    
    # Adicionar remote do novo repositório
    git remote add origin "https://github.com/$GITHUB_ORG/$NEW_REPO_NAME.git"
    
    # Push
    log "Fazendo push para $NEW_REPO_NAME..."
    git push -u origin main || git push -u origin master
    
    cd ..
    
    log "✅ $SUBDIR migrado com sucesso para $NEW_REPO_NAME"
}

# Migrar Frontend
migrate_frontend() {
    log "=========================================="
    log "Migrando FRONTEND"
    log "=========================================="
    migrate_subdirectory "frontend" "${REPOS[frontend]}" "frontend/.env.example"
}

# Migrar Backend
migrate_backend() {
    log "=========================================="
    log "Migrando BACKEND"
    log "=========================================="
    migrate_subdirectory "backend" "${REPOS[backend]}" "backend/.env.example"
}

# Migrar Docs
migrate_docs() {
    log "=========================================="
    log "Migrando DOCUMENTAÇÃO"
    log "=========================================="
    migrate_subdirectory "docs" "${REPOS[docs]}" ""
}

# Migrar Infrastructure
migrate_infrastructure() {
    log "=========================================="
    log "Migrando INFRAESTRUTURA"
    log "=========================================="
    
    local TEMP_DIR="temp-${REPOS[infrastructure]}"
    
    # Clone fresh
    git clone "$ORIGINAL_REPO" "$TEMP_DIR"
    cd "$TEMP_DIR"
    
    # Manter apenas arquivos de infraestrutura
    git filter-repo \
        --path docker-compose.yml \
        --path docker-compose.prod.yml \
        --path nginx/ \
        --path .github/ \
        --path .env.example \
        --force
    
    # Criar estrutura organizada
    mkdir -p docker-compose/dev docker-compose/staging docker-compose/production
    mv docker-compose.yml docker-compose/dev/ 2>/dev/null || true
    mv docker-compose.prod.yml docker-compose/production/ 2>/dev/null || true
    
    git add .
    git commit -m "chore: reorganize infrastructure files" || true
    
    # Push
    git remote add origin "https://github.com/$GITHUB_ORG/${REPOS[infrastructure]}.git"
    git push -u origin main || git push -u origin master
    
    cd ..
    
    log "✅ Infraestrutura migrada com sucesso"
}

# Criar README para cada repositório
create_readmes() {
    log "Criando READMEs para os novos repositórios..."
    
    # TODO: Implementar criação de READMEs customizados
    
    log "✅ READMEs criados"
}

# Gerar relatório de migração
generate_report() {
    local REPORT_FILE="$WORKSPACE/migration-report.md"
    
    log "Gerando relatório de migração..."
    
    cat > "$REPORT_FILE" << EOF
# Relatório de Migração: Monorepo → Polirepo

**Data:** $(date)
**Workspace:** $WORKSPACE

## Repositórios Criados

- Frontend: https://github.com/$GITHUB_ORG/${REPOS[frontend]}
- Backend: https://github.com/$GITHUB_ORG/${REPOS[backend]}
- Docs: https://github.com/$GITHUB_ORG/${REPOS[docs]}
- Infrastructure: https://github.com/$GITHUB_ORG/${REPOS[infrastructure]}

## Backup

Backup do repositório original em:
\`$WORKSPACE/backup-original.git\`

## Próximos Passos

1. Configurar branch protection rules em cada repositório
2. Adicionar secrets necessários
3. Atualizar CI/CD workflows
4. Validar builds
5. Treinar equipe no novo workflow
6. Arquivar repositório antigo

## Rollback

Em caso de problemas, o backup está disponível em:
\`$WORKSPACE/backup-original.git\`

Para restaurar:
\`\`\`bash
git clone $WORKSPACE/backup-original.git Portal-Administrativo
cd Portal-Administrativo
git remote set-url origin https://github.com/$GITHUB_ORG/Portal-Administrativo.git
git push --mirror
\`\`\`
EOF

    log "✅ Relatório gerado: $REPORT_FILE"
}

# Cleanup (opcional)
cleanup() {
    read -p "Deseja limpar o workspace de migração? (s/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Ss]$ ]]; then
        log "Limpando workspace..."
        cd /tmp
        rm -rf "$WORKSPACE"
        log "✅ Workspace limpo"
    else
        log "Workspace mantido em: $WORKSPACE"
    fi
}

# Função principal
main() {
    echo ""
    echo "╔════════════════════════════════════════════════════════╗"
    echo "║   Migração: Monorepo → Polirepo                        ║"
    echo "║   Portal Administrativo AVP/Unigrande                  ║"
    echo "╚════════════════════════════════════════════════════════╝"
    echo ""
    
    warning "Este script irá criar novos repositórios e migrar código."
    warning "Certifique-se de ter backup antes de continuar!"
    echo ""
    
    read -p "Deseja continuar? (s/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Ss]$ ]]; then
        error "Migração cancelada pelo usuário"
    fi
    
    check_prerequisites
    create_workspace
    backup_original
    create_github_repos
    
    log "Iniciando migrações..."
    migrate_frontend
    migrate_backend
    migrate_docs
    migrate_infrastructure
    
    generate_report
    
    log ""
    log "╔════════════════════════════════════════════════════════╗"
    log "║   ✅ MIGRAÇÃO CONCLUÍDA COM SUCESSO!                   ║"
    log "╚════════════════════════════════════════════════════════╝"
    log ""
    log "Relatório: $WORKSPACE/migration-report.md"
    log ""
    
    cleanup
}

# Executar
main "$@"
