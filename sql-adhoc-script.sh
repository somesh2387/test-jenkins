  #!/bin/bash
  env=$1
  DB_URL=$(yq e .dbUrl $env.yaml)
  DB_USER=$(yq e .dbUsername $env.gpg.yaml)
  DB_PASS=$(yq e .dbPassword $env.gpg.yaml)
  MYSQL_URL=$2
  MYSQL_DB=$3
  SCRIPT_PATH=$4
  mysql -A -h "$MYSQL_URL" -u "$DB_USER" --password="$DB_PASS" --database="$MYSQL_DB" < "$SCRIPT_PATH"
