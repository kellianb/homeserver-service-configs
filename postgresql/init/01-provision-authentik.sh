#!/bin/bash
set -e

USER=$(cat /run/secrets/PG_AUTHENTIK_USER)
PASSWORD=$(cat /run/secrets/PG_AUTHENTIK_PASSWORD)

psql -U "$POSTGRES_USER" -d "$POSTGRES_DB"\
 -c "CREATE USER $USER WITH PASSWORD '$PASSWORD';"

psql -U "$POSTGRES_USER" -d "$POSTGRES_DB"\
 -c "CREATE DATABASE authentik OWNER '$USER';"
