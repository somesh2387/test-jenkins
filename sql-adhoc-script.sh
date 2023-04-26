  #!/bin/bash
  DB_URL=$(yq -r .dbUrl swat.gpg.yaml)
  DB_USER=$(yq -r .dbUsername swat.gpg.yaml)
  echo $DB_USER
  DB_PASS=$(yq -r .dbPassword swat.gpg.yaml)
  echo $DB_PASS
  DB=$(echo "$DB_URL" | sed 's/^.*\/\([^?]*\)\?.*$/\1/')
  echo $DB
  regex="jdbc:mysql://([a-zA-Z0-9.-]+):[0-9]+/.*"
	if [[ $DB_URL =~ $regex ]]; then
    		MYSQL_URL="${BASH_REMATCH[1]}"
    		echo "Extracted string: $extractedString"
	else
    		echo "Extracted string: $extractedString"
	fi
  echo 'logging into db $DB as $DB_USER'
  mysql -A -h "$MYSQL_URL" -u "$DB_USER" --password="$DB_PASS" --database="$DB" -e "show tables"
