# Quick Start - Docker

## Desenvolvimento Local com Docker

### 1️⃣ Pré-requisitos

- **Docker Desktop** instalado e rodando
- **Git** instalado
- **8GB RAM** mínimo disponível

### 2️⃣ Clone e Configure

```bash
# Clone o repositório
git clone https://github.com/gersonvan/Portal-Administrativo.git
cd Portal-Administrativo

# Configure variáveis de ambiente
cp .env.example .env

# Edite o .env com suas configurações (opcional para dev)
```

### 3️⃣ Inicie o Ambiente

```bash
# Inicie todos os serviços
docker-compose up -d

# Acompanhe os logs
docker-compose logs -f
```

**Aguarde alguns minutos** para todos os serviços iniciarem.

### 4️⃣ Acesse as Aplicações

- **Frontend:** http://localhost:3000
- **Backend API:** http://localhost:3001
- **SQL Server:** localhost:1433
  - User: `sa`
  - Password: `PortalAdmin@2025`
- **Azurite (Storage):** localhost:10000

### 5️⃣ Comandos Úteis

```bash
# Parar serviços
docker-compose down

# Parar e remover volumes (limpar banco)
docker-compose down -v

# Rebuild após mudanças no código
docker-compose up -d --build

# Ver status dos containers
docker-compose ps

# Ver logs de um serviço específico
docker-compose logs -f backend
docker-compose logs -f frontend

# Acessar shell de um container
docker-compose exec backend sh
docker-compose exec frontend sh

# Reiniciar um serviço
docker-compose restart backend
```

## Desenvolvimento Sem Docker

Se preferir rodar sem Docker:

### Backend

```bash
cd backend
npm install
npm run start:dev
```

### Frontend

```bash
cd frontend
npm install
npm run dev
```

**Nota:** Você precisará ter o SQL Server instalado localmente ou apontar para uma instância remota.

## Troubleshooting

### Porta já em uso

Se alguma porta (3000, 3001, 1433) já estiver em uso:

```bash
# Windows
netstat -ano | findstr :3000
taskkill /PID <PID> /F

# Linux/Mac
lsof -ti:3000 | xargs kill -9
```

Ou edite o `docker-compose.yml` para usar portas diferentes.

### Container não inicia

```bash
# Ver logs detalhados
docker-compose logs <service-name>

# Rebuild do zero
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```

### Erro de memória

Aumente a memória disponível para Docker Desktop:
- Windows/Mac: Settings → Resources → Memory (mínimo 4GB, recomendado 8GB)

## Próximos Passos

Após o ambiente estar rodando:

1. Acesse http://localhost:3000
2. Veja a documentação em `/docs`
3. Explore os endpoints da API: http://localhost:3001/api
