#!/bin/bash

if [ -z "$REDMINE_DB_NAME" ]; then
  echo "ERROR: The environment variable REDMINE_DB_NAME is not set."
  exit 1
else
  echo "REDMINE_DB_NAME is set to: $REDMINE_DB_NAME"
fi

if [ -z "$REDMINE_DB_USER" ]; then
  echo "ERROR: The environment variable REDMINE_DB_USER is not set."
  exit 1
else
  echo "REDMINE_DB_USER is set to: $REDMINE_DB_USER"
fi

if [ -z "$REDMINE_DB_PASSWORD" ]; then
  echo "ERROR: The environment variable REDMINE_DB_PASSWORD is not set."
  exit 1
else
  echo "REDMINE_DB_PASSWORD is set."
fi

if [ -z "$REDMINE_DB_HOST" ]; then
  echo "ERROR: The environment variable REDMINE_DB_HOST is not set."
  exit 1
else
  echo "REDMINE_DB_HOST is set."
fi

echo "All checks passed."
