#!/bin/bash
# ============================================
# VITTO GD - Script de Restauração
# ============================================

# Configurações
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
BACKUP_DIR="$PROJECT_DIR/backups"

# Verificar se há backups
if [ ! -d "$BACKUP_DIR" ] || [ -z "$(ls -A $BACKUP_DIR/*.tar.gz 2>/dev/null)" ]; then
    echo "❌ Nenhum backup encontrado em $BACKUP_DIR"
    exit 1
fi

# Listar backups disponíveis
echo "📋 Backups disponíveis:"
echo ""
ls -1t "$BACKUP_DIR"/site_completo_*.tar.gz 2>/dev/null | head -10 | while read file; do
    DATE=$(basename "$file" | sed 's/site_completo_//;s/\.tar\.gz//')
    SIZE=$(du -h "$file" | cut -f1)
    echo "   $DATE ($SIZE)"
done

echo ""
echo "💡 Para restaurar, execute:"
echo "   tar -xzf $BACKUP_DIR/site_completo_AAAAMMDD_HHMMSS.tar.gz -C $PROJECT_DIR"
echo ""
echo "⚠️  Isso irá sobrescrever os arquivos atuais!"
