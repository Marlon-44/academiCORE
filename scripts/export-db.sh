#!/usr/bin/env bash
# Regenera db/init/01_academicore.sql con el estado actual de la base de datos.
# Uso: ./scripts/export-db.sh   (desde cualquier carpeta)
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="$REPO_ROOT/db/init/01_academicore.sql"

mkdir -p "$(dirname "$DEST")"

echo "Generando pg_dump (stdout -> repo)..."
docker exec academicore-db pg_dump -U academicore -d academicore \
    --no-owner --no-privileges --clean --if-exists > "$DEST"

SIZE=$(du -h "$DEST" | cut -f1)
echo "Listo: $DEST ($SIZE)"
echo "Para compartirlo: git add db/init/01_academicore.sql && git commit && git push"
