# GitHub Branch Protection Guide

## Recommended Branch Protection Rules

### For `main` branch (Production)

1. **Navigate to:** Repository Settings → Branches → Add rule

2. **Branch name pattern:** `main`

3. **Protection rules to enable:**

   ✅ **Require pull request reviews before merging**
   - Required approving reviews: 2
   - Dismiss stale pull request approvals when new commits are pushed
   - Require review from Code Owners (if CODEOWNERS file exists)

   ✅ **Require status checks to pass before merging**
   - Require branches to be up to date before merging
   - Status checks required:
     - `Frontend CI/CD / test`
     - `Frontend CI/CD / build`
     - `Backend CI/CD / test`
     - `Backend CI/CD / build`
     - `Pull Request Checks / pr-validation`

   ✅ **Require conversation resolution before merging**

   ✅ **Require signed commits**

   ✅ **Require linear history**

   ✅ **Include administrators**

   ✅ **Restrict who can push to matching branches**
   - Add: Tech Leads, DevOps Team

   ✅ **Allow force pushes** - ❌ Disabled

   ✅ **Allow deletions** - ❌ Disabled

### For `develop` branch (Staging/QA)

1. **Branch name pattern:** `develop`

2. **Protection rules to enable:**

   ✅ **Require pull request reviews before merging**
   - Required approving reviews: 1

   ✅ **Require status checks to pass before merging**
   - Same status checks as main

   ✅ **Require conversation resolution before merging**

   ✅ **Include administrators**

   ✅ **Allow force pushes** - ❌ Disabled

### For feature branches

**Branch name pattern:** `feature/*`, `fix/*`, `hotfix/*`

- No specific protection rules
- Developers can push directly
- Must create PR to merge into develop

## CODEOWNERS File

Create a `.github/CODEOWNERS` file:

```
# Global owners
* @gersonvan

# Frontend
/frontend/ @frontend-team-lead

# Backend
/backend/ @backend-team-lead

# Documentation
/docs/ @product-owner @tech-lead

# CI/CD and Infrastructure
/.github/ @devops-team
/docker-compose*.yml @devops-team
```

## Branch Naming Convention

- `feature/` - New features
- `fix/` - Bug fixes
- `hotfix/` - Emergency fixes for production
- `refactor/` - Code refactoring
- `docs/` - Documentation updates
- `test/` - Test additions or updates
- `chore/` - Maintenance tasks

## Commit Message Convention

Follow Conventional Commits:

```
type(scope): subject

[optional body]

[optional footer]
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only changes
- `style`: Code style changes (formatting, missing semi colons, etc)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks
- `perf`: Performance improvements

**Examples:**
```
feat(diploma): add digital signature validation
fix(auth): resolve token expiration issue
docs: update deployment instructions
```
