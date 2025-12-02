# PowerShell Script - Migração para Polirepo
# Portal Administrativo - AVP/Unigrande

param(
    [string]$GithubOrg = "gersonvan",
    [string]$OriginalRepo = "https://github.com/gersonvan/Portal-Administrativo.git",
    [switch]$SkipBackup = $false
)

$ErrorActionPreference = "Stop"

# Configurações
$Workspace = "C:\Temp\polirepo-migration-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
$Repos = @{
    "frontend" = "portal-frontend"
    "backend" = "portal-backend"
    "docs" = "portal-docs"
    "infrastructure" = "portal-infrastructure"
}

# Funções de Log
function Write-Log {
    param([string]$Message)
    Write-Host "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] " -ForegroundColor Green -NoNewline
    Write-Host $Message
}

function Write-Error-Log {
    param([string]$Message)
    Write-Host "[ERROR] " -ForegroundColor Red -NoNewline
    Write-Host $Message
    exit 1
}

function Write-Warning-Log {
    param([string]$Message)
    Write-Host "[WARNING] " -ForegroundColor Yellow -NoNewline
    Write-Host $Message
}

# Verificar pré-requisitos
function Test-Prerequisites {
    Write-Log "Verificando pré-requisitos..."
    
    # Verificar Git
    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        Write-Error-Log "Git não está instalado"
    }
    
    # Verificar GitHub CLI
    if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
        Write-Warning-Log "GitHub CLI (gh) não encontrado. Repositórios devem ser criados manualmente."
    }
    
    # Verificar Python (para git-filter-repo)
    if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
        Write-Warning-Log "Python não encontrado. git-filter-repo pode não estar disponível."
    } else {
        # Tentar instalar git-filter-repo
        $filterRepo = Get-Command git-filter-repo -ErrorAction SilentlyContinue
        if (-not $filterRepo) {
            Write-Log "Instalando git-filter-repo..."
            python -m pip install git-filter-repo
        }
    }
    
    Write-Log "✅ Pré-requisitos verificados"
}

# Criar workspace
function New-Workspace {
    Write-Log "Criando workspace em $Workspace..."
    New-Item -Path $Workspace -ItemType Directory -Force | Out-Null
    Set-Location $Workspace
    Write-Log "✅ Workspace criado"
}

# Backup do repositório original
function Backup-OriginalRepo {
    if ($SkipBackup) {
        Write-Warning-Log "Backup ignorado (parâmetro -SkipBackup)"
        return
    }
    
    Write-Log "Fazendo backup do repositório original..."
    git clone --mirror $OriginalRepo "backup-original.git"
    Write-Log "✅ Backup criado em $Workspace\backup-original.git"
}

# Criar repositórios no GitHub
function New-GithubRepos {
    if (Get-Command gh -ErrorAction SilentlyContinue) {
        Write-Log "Criando repositórios no GitHub..."
        
        foreach ($repo in $Repos.Values) {
            Write-Log "Criando $repo..."
            try {
                gh repo create "$GithubOrg/$repo" --private
            } catch {
                Write-Warning-Log "Repositório $repo pode já existir"
            }
        }
        
        Write-Log "✅ Repositórios criados"
    } else {
        Write-Warning-Log "Crie os seguintes repositórios manualmente no GitHub:"
        foreach ($repo in $Repos.Values) {
            Write-Host "  - $GithubOrg/$repo"
        }
        Read-Host "Pressione Enter quando os repositórios estiverem criados"
    }
}

# Migrar subdiretório
function Move-Subdirectory {
    param(
        [string]$Subdir,
        [string]$NewRepoName
    )
    
    Write-Log "📦 Migrando $Subdir para $NewRepoName..."
    
    $TempDir = "temp-$NewRepoName"
    
    # Clone
    git clone $OriginalRepo $TempDir
    Set-Location $TempDir
    
    # Filtrar histórico (usando git-filter-repo se disponível)
    if (Get-Command git-filter-repo -ErrorAction SilentlyContinue) {
        Write-Log "Filtrando histórico..."
        git filter-repo --path "$Subdir/" --path-rename "$Subdir/:" --force
    } else {
        Write-Warning-Log "git-filter-repo não disponível. Usando método alternativo..."
        # Método alternativo: git filter-branch (mais lento)
        git filter-branch --subdirectory-filter $Subdir -- --all
    }
    
    # Adicionar remote
    git remote add origin "https://github.com/$GithubOrg/$NewRepoName.git"
    
    # Push
    Write-Log "Fazendo push para $NewRepoName..."
    try {
        git push -u origin main
    } catch {
        git push -u origin master
    }
    
    Set-Location ..
    
    Write-Log "✅ $Subdir migrado com sucesso"
}

# Gerar relatório
function New-MigrationReport {
    $ReportFile = Join-Path $Workspace "migration-report.md"
    
    Write-Log "Gerando relatório de migração..."
    
    $Report = @"
# Relatório de Migração: Monorepo → Polirepo

**Data:** $(Get-Date)
**Workspace:** $Workspace

## Repositórios Criados

- Frontend: https://github.com/$GithubOrg/$($Repos['frontend'])
- Backend: https://github.com/$GithubOrg/$($Repos['backend'])
- Docs: https://github.com/$GithubOrg/$($Repos['docs'])
- Infrastructure: https://github.com/$GithubOrg/$($Repos['infrastructure'])

## Backup

Backup do repositório original em:
``$Workspace\backup-original.git``

## Próximos Passos

1. Configurar branch protection rules
2. Adicionar secrets necessários
3. Atualizar CI/CD workflows
4. Validar builds
5. Treinar equipe
6. Arquivar repositório antigo

## Rollback

Em caso de problemas:
``````powershell
git clone $Workspace\backup-original.git Portal-Administrativo
cd Portal-Administrativo
git remote set-url origin https://github.com/$GithubOrg/Portal-Administrativo.git
git push --mirror
``````
"@

    $Report | Out-File -FilePath $ReportFile -Encoding UTF8
    
    Write-Log "✅ Relatório gerado: $ReportFile"
}

# Main
function Start-Migration {
    Write-Host ""
    Write-Host "╔════════════════════════════════════════════════════════╗"
    Write-Host "║   Migração: Monorepo → Polirepo                        ║"
    Write-Host "║   Portal Administrativo AVP/Unigrande                  ║"
    Write-Host "╚════════════════════════════════════════════════════════╝"
    Write-Host ""
    
    $Confirm = Read-Host "Deseja continuar com a migração? (s/N)"
    if ($Confirm -ne "s" -and $Confirm -ne "S") {
        Write-Error-Log "Migração cancelada pelo usuário"
    }
    
    Test-Prerequisites
    New-Workspace
    Backup-OriginalRepo
    New-GithubRepos
    
    Write-Log "Iniciando migrações..."
    
    Move-Subdirectory -Subdir "frontend" -NewRepoName $Repos["frontend"]
    Move-Subdirectory -Subdir "backend" -NewRepoName $Repos["backend"]
    Move-Subdirectory -Subdir "docs" -NewRepoName $Repos["docs"]
    
    New-MigrationReport
    
    Write-Host ""
    Write-Host "╔════════════════════════════════════════════════════════╗" -ForegroundColor Green
    Write-Host "║   ✅ MIGRAÇÃO CONCLUÍDA COM SUCESSO!                   ║" -ForegroundColor Green
    Write-Host "╚════════════════════════════════════════════════════════╝" -ForegroundColor Green
    Write-Host ""
    Write-Host "Relatório: $Workspace\migration-report.md"
    
    $Cleanup = Read-Host "Deseja limpar o workspace? (s/N)"
    if ($Cleanup -eq "s" -or $Cleanup -eq "S") {
        Set-Location C:\Temp
        Remove-Item -Path $Workspace -Recurse -Force
        Write-Log "✅ Workspace limpo"
    } else {
        Write-Log "Workspace mantido em: $Workspace"
    }
}

# Executar
Start-Migration
