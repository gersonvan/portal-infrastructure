# PowerShell - Setup de Workspace Polirepo
# Clone todos os repositórios e configure ambiente

param(
    [string]$GithubOrg = "gersonvan",
    [string]$WorkspacePath = "$env:USERPROFILE\avp-portal-workspace"
)

$ErrorActionPreference = "Stop"

function Write-Log {
    param([string]$Message)
    Write-Host "[$(Get-Date -Format 'HH:mm:ss')] " -ForegroundColor Green -NoNewline
    Write-Host $Message
}

Write-Log "🚀 Configurando workspace de desenvolvimento Polirepo..."
Write-Log "Workspace: $WorkspacePath"

# Criar diretório
New-Item -Path $WorkspacePath -ItemType Directory -Force | Out-Null
Set-Location $WorkspacePath

# Repositórios
$Repos = @(
    "portal-frontend",
    "portal-backend",
    "portal-infrastructure",
    "portal-docs"
)

# Clonar repositórios
foreach ($repo in $Repos) {
    if (Test-Path $repo) {
        Write-Log "📂 $repo já existe, atualizando..."
        Set-Location $repo
        git pull
        Set-Location ..
    } else {
        Write-Log "📥 Clonando $repo..."
        git clone "https://github.com/$GithubOrg/$repo.git"
    }
}

# Configurar variáveis de ambiente
Write-Log "⚙️ Configurando variáveis de ambiente..."

if (-not (Test-Path "portal-frontend\.env")) {
    if (Test-Path "portal-frontend\.env.example") {
        Copy-Item "portal-frontend\.env.example" "portal-frontend\.env"
        Write-Log "✅ Frontend .env criado"
    }
}

if (-not (Test-Path "portal-backend\.env")) {
    if (Test-Path "portal-backend\.env.example") {
        Copy-Item "portal-backend\.env.example" "portal-backend\.env"
        Write-Log "✅ Backend .env criado"
    }
}

# Instalar dependências
Write-Log "📦 Instalando dependências..."

Write-Log "Frontend..."
Set-Location portal-frontend
npm install
Set-Location ..

Write-Log "Backend..."
Set-Location portal-backend
npm install
Set-Location ..

# Criar docker-compose.yml
Write-Log "🐳 Criando docker-compose.yml..."

$DockerCompose = @"
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
"@

$DockerCompose | Out-File -FilePath "docker-compose.yml" -Encoding UTF8

# Criar script de atualização
$UpdateScript = @"
# Atualizar todos os repositórios
Write-Host "Atualizando todos os repositórios..."
Get-ChildItem -Directory -Filter "portal-*" | ForEach-Object {
    if (Test-Path "`$_\.git") {
        Write-Host "Atualizando `$_..."
        Set-Location `$_
        git pull
        Set-Location ..
    }
}
Write-Host "✅ Todos os repositórios atualizados!"
"@

$UpdateScript | Out-File -FilePath "update-all.ps1" -Encoding UTF8

Write-Host ""
Write-Host "╔════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║   ✅ WORKSPACE CONFIGURADO COM SUCESSO!                ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
Write-Host "Próximos passos:"
Write-Host ""
Write-Host "1. Editar variáveis de ambiente:"
Write-Host "   - $WorkspacePath\portal-frontend\.env"
Write-Host "   - $WorkspacePath\portal-backend\.env"
Write-Host ""
Write-Host "2. Iniciar ambiente de desenvolvimento:"
Write-Host "   cd $WorkspacePath"
Write-Host "   docker-compose up -d"
Write-Host ""
Write-Host "3. Acessar aplicações:"
Write-Host "   - Frontend: http://localhost:3000"
Write-Host "   - Backend: http://localhost:3001"
Write-Host ""
Write-Host "4. Para atualizar todos os repositórios:"
Write-Host "   cd $WorkspacePath"
Write-Host "   .\update-all.ps1"
Write-Host ""
