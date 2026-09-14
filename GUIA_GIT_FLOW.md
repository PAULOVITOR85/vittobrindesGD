# 🚀 Guia Rápido - Git Flow VITTO GD

## Estrutura do Projeto
```
site VITTO Brindes/
├── src/           ← Código fonte (HTML, JS, CSS)
├── data/          ← Dados dos produtos (produtos.js, .json)
├── scripts/       ← Scripts de backup/restore
├── backups/       ← Backups automáticos (git-ignored)
├── img/           ← Imagens do site
└── .gitignore
```

## Comandos Diários

### Criar nova feature
```bash
git checkout develop
git checkout -b feature/nome-da-feature
# ... trabalhar ...
git add .
git commit -m "feat(descricao): detalhes"
git checkout develop
git merge --no-ff feature/nome-da-feature
git branch -d feature/nome-da-feature
git push origin develop
```

### Criar release (produção)
```bash
git checkout develop
git checkout -b release/v1.1.0
# ... testar ...
git checkout main
git merge --no-ff release/v1.1.0
git tag -a v1.1.0 -m "Versão 1.1.0"
git checkout develop
git merge --no-ff release/v1.1.0
git push origin main develop --tags
```

### Hotfix (correção urgente)
```bash
git checkout main
git checkout -b hotfix/correcao
# ... corrigir ...
git checkout main
git merge --no-ff hotfix/correcao
git tag -a v1.0.1 -m "Hotfix"
git checkout develop
git merge --no-ff hotfix/correcao
git push origin main develop --tags
```

### Voltar a versão anterior
```bash
git log --oneline       # ver hashes
git checkout ABC123     # voltar ao commit
# ou
git checkout v1.0.0     # voltar à tag
```

## Backup Manual
```bash
./scripts/backup.sh
```

## Deploy
```bash
git push origin main --tags
```
