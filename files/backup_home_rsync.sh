#!/usr/bin/env bash
set -Eeuo pipefail

SRC="$HOME/"
DST="/tmp/backup/"
LOG_TAG="backup_home_rsync"

mkdir -p "$DST"

# Запускаем rsync
rsync -av --delete --checksum --exclude='.*' "$SRC" "$DST"
RSYNC_RC=$?

if [[ $RSYNC_RC -eq 0 ]]; then
  logger -t "$LOG_TAG" "Backup completed successfully"
else
  logger -t "$LOG_TAG" "Backup FAILED with exit code $RSYNC_RC"
fi

exit "$RSYNC_RC"
