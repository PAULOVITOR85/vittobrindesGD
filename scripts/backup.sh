#!/bin/bash
# ============================================
# VITTO GD - Script de Backup Automatizado
# ============================================

# Configurações
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
BACKUP_DIR="$PROJECT_DIR/backups"
DATE=$(date +%Y%m%d_%H%M%S)
KEEP_DAYS=30

# Criar diretório de backup se não existir
mkdir -p "$BACKUP_DIR"

echo "🔄 Iniciando backup - $DATE"

# ---------- Backup dos dados dos produtos ----------
echo "📦 Copiando dados dos produtos..."
cp "$PROJECT_DIR/data/produtos.js" "$BACKUP_DIR/produtos_${DATE}.js"
cp "$PROJECT_DIR/data/produtos.json" "$BACKUP_DIR/produtos_${DATE}.json"

# ---------- Backup do código fonte ----------
echo "💻 Compactando código fonte..."
tar -czf "$BACKUP_DIR/src_${DATE}.tar.gz" \
    -C "$PROJECT_DIR" \
    src/ data/produtos_src.json .gitignore

# ---------- Backup completo (site + imagens) ----------
echo "🖼️  Compactando site completo (com imagens)..."
tar -czf "$BACKUP_DIR/site_completo_${DATE}.tar.gz" \
    -C "$PROJECT_DIR" \
    src/ data/ img/ .gitignore manifest.json 2>/dev/null || \
tar -czf "$BACKUP_DIR/site_completo_${DATE}.tar.gz" \
    -C "$PROJECT_DIR" \
    src/ data/ img/ .gitignore

# ---------- Limpar backups antigos ----------
echo "🧹 Removendo backups antigos (>$KEEP_DAYS dias)..."
find "$BACKUP_DIR" -name "produtos_*.js" -mtime +$KEEP_DAYS -delete 2>/dev/null
find "$BACKUP_DIR" -name "produtos_*.json" -mtime +$KEEP_DAYS -delete 2>/dev/null
find "$BACKUP_DIR" -name "src_*.tar.gz" -mtime +$KEEP_DAYS -delete 2>/dev/null
find "$BACKUP_DIR" -name "site_completo_*.tar.gz" -mtime +$KEEP_DAYS -delete 2>/dev/null

# ---------- Resumo ----------
TOTAL_SIZE=$(du -sh "$BACKUP_DIR" | cut -f1)
BACKUP_COUNT=$(ls -1 "$BACKUP_DIR"/*.tar.gz 2>/dev/null | wc -l)

echo ""
echo "✅ Backup completo!"
echo "   📁 Local: $BACKUP_DIR"
echo "   📊 Tamanho total: $TOTAL_SIZE"
echo "   📋 Backups armazenados: $BACKUP_COUNT"
echo ""
