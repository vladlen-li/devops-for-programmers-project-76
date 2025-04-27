#!/bin/bash
key_file="get_vault_key"
if [ ! -f "$key_file" ]; then
  echo "ERROR: vault key not found: $key_file"
  exit 1
fi

if [ -z "$DATABASE_NAME" ]; then
  echo "ERROR: The environment variable DATABASE_NAME is not set."
  exit 1
else
  echo "DATABASE_NAME is set"
fi

if [ -z "$DATABASE_HOST" ]; then
  echo "ERROR: The environment variable DATABASE_HOST is not set."
  exit 1
else
  echo "DATABASE_HOST is set."
fi

echo "All checks passed."
