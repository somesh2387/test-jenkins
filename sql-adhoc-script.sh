  #!/bin/bash
  env=$1
  DB_URL=$(yq e .dbUrl $env.yaml)
  echo $env
  DB_USER=$(yq e .dbUsername $env.gpg.yaml)
  echo $DB_USER
  DB_PASS=$(yq e .dbPassword $env.gpg.yaml)
  echo $DB_PASS
  MYSQL_URL=$2
  MYSQL_DB=$3
  SCRIPT_PATH=$4
  mysql -A -h "$MYSQL_URL" -u "$DB_USER" --password="$DB_PASS" --database="$MYSQL_DB" < "$SCRIPT_PATH" | tee output.log
