# Regenera db/init/01_academicore.sql con el estado actual de la base de datos.
# Ejecutar desde la raíz del repo (o cualquier carpeta):  .\scripts\export-db.ps1
#
# El dump incluye esquema + datos + flyway_schema_history, por lo que un clon
# fresco del repo arranca con TODO cargado al primer `docker compose up -d`.
# Después de regenerar el archivo:  git add db/init/ && git commit && git push

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$dest = Join-Path $repoRoot 'db\init\01_academicore.sql'

New-Item -ItemType Directory -Force -Path (Split-Path $dest) | Out-Null

Write-Host "Generando pg_dump dentro del contenedor..."
docker exec academicore-db pg_dump -U academicore -d academicore `
    --no-owner --no-privileges --clean --if-exists `
    -f /tmp/academicore_dump.sql

Write-Host "Copiando el dump al repo..."
docker cp "academicore-db:/tmp/academicore_dump.sql" $dest

$kb = [math]::Round((Get-Item $dest).Length / 1KB)
Write-Host "Listo: $dest ($kb KB)"
Write-Host "Para compartirlo: git add db/init/01_academicore.sql; git commit; git push"
