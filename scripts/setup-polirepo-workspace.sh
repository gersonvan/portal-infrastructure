# Setup de Workspace para Polirepo
# Clone todos os repositórios e configure ambiente de desenvolvimento

#!/bin/bash

set -e

# Configurações
GITHUB_ORG="gersonvan"
WORKSPACE="$HOME/avp-portal-workspace"

# Cores
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() {
    echo -e "${GREEN}[$(date +'%H:%M:%S')]${NC} $1"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log "🚀 Configurando workspace de desenvolvimento Polirepo..."
log "Workspace: $WORKSPACE"

# Criar diretório
mkdir -p "$WORKSPACE"
cd "$WORKSPACE"

# Repositórios
REPOS=(
    "portal-frontend"
    "portal-backend"
    "portal-infrastructure"
    "portal-docs"
)

# Clonar repositórios
for repo in "${REPOS[@]}"; do
    if [ -d "$repo" ]; then
        log "📂 $repo já existe, atualizando..."
        cd "$repo"
        git pull
        cd ..
    else
        log "📥 Clonando $repo..."
        git clone "https://github.com/$GITHUB_ORG/$repo.git"
    fi
done

# Configurar variáveis de ambiente
log "⚙️ Configurando variáveis de ambiente..."

if [ ! -f "portal-frontend/.env" ]; then
    if [ -f "portal-frontend/.env.example" ]; then
        cp portal-frontend/.env.example portal-frontend/.env
        log "✅ Frontend .env criado"
    fi
fi

if [ ! -f "portal-backend/.env" ]; then
    if [ -f "portal-backend/.env.example" ]; then
        cp portal-backend/.env.example portal-backend/.env
        log "✅ Backend .env criado"
    fi
fi

# Instalar dependências
log "📦 Instalando dependências..."

log "Frontend..."
cd portal-frontend
npm install
cd ..

log "Backend..."
cd portal-backend
npm install
cd ..

# Criar docker-compose.yml no workspace root
log "🐳 Criando docker-compose.yml..."

cat > docker-compose.yml << 'EOF'
version: '3.8'

services:
  database:
    image: mcr.microsoft.com/mssql/server:2022-latest
    environment:
      - ACCEPT_EULA=Y
      - MSSQL_SA_PASSWORD=PortalAdmin@2025
    ports:
      - "1433:1433"
    volumes:
      - mssql-data:/var/opt/mssql

  backend:
    build:
      context: ./portal-backend
      dockerfile: Dockerfile
    ports:
      - "3001:3001"
    volumes:
      - ./portal-backend/src:/app/src
    depends_on:
      - database
    env_file:
      - ./portal-backend/.env

  frontend:
    build:
      context: ./portal-frontend
      dockerfile: Dockerfile
    ports:
      - "3000:3000"
    volumes:
      - ./portal-frontend/src:/app/src
    depends_on:
      - backend
    env_file:
      - ./portal-frontend/.env

volumes:
  mssql-data:
EOF

# Criar script de atualização
cat > update-all.sh << 'EOF'
#!/bin/bash
echo "Atualizando todos os repositórios..."
for dir in portal-*; do
    if [ -d "$dir/.git" ]; then
        echo "Atualizando $dir..."
        cd "$dir"
        git pull
        cd ..
    fi
done
echo "✅ Todos os repositórios atualizados!"
EOF

chmod +x update-all.sh

log ""
log "╔════════════════════════════════════════════════════════╗"
log "║   ✅ WORKSPACE CONFIGURADO COM SUCESSO!                ║"
log "╚════════════════════════════════════════════════════════╝"
log ""
log "Próximos passos:"
log ""
log "1. Editar variáveis de ambiente:"
log "   - $WORKSPACE/portal-frontend/.env"
log "   - $WORKSPACE/portal-backend/.env"
log ""
log "2. Iniciar ambiente de desenvolvimento:"
log "   cd $WORKSPACE"
log "   docker-compose up -d"
log ""
log "3. Acessar aplicações:"
log "   - Frontend: http://localhost:3000"
log "   - Backend: http://localhost:3001"
log ""
log "4. Para atualizar todos os repositórios:"
log "   cd $WORKSPACE"
log "   ./update-all.sh"
log ""
