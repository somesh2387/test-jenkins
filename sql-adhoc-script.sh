  #!/bin/bash
  DB_URL=$(yq e .dbUrl qa-02.gpg.yaml)
  DB_USER=$(yq e .dbUsername qa-02.gpg.yaml)
  echo $DB_USER
  DB_PASS=$(yq e .dbPassword qa-02.gpg.yaml)
  echo $DB_PASS
  MYSQL_URL=$1
  MYSQL_DB=$2
  mysql -A -h "$MYSQL_URL" -u "$DB_USER" --password="$DB_PASS" --database="$DB" -e "show tables"
