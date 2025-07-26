#!/bin/bash

# Configuration
DB_HOST="acmedevdb"
DB_USER="root"
DB_PASS="acme"
DB_NAME="atonu"
BACKUP_DIR="/export"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/export_dump.sql"

# Create backup directory if not exists
mkdir -p "$BACKUP_DIR"

# Perform the database dump
mariadb-dump -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_FILE"

# Check if dump was successful
if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
else
    echo "Backup failed!"
    exit 1
fi

