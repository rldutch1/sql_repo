-- Rename a Database
The normal way to rename a database is to dump it then import the data to a new database name. 
The commands below are what I copied from a Stack Exchange article but they didn't work for me. I am only leaving them here so that I can study them at some other time.

/*
mysql -e "CREATE DATABASE \`new_database\`;"
for table in `mysql -B -N -e "SHOW TABLES;" old_database`
do
  mysql -e "RENAME TABLE \`old_database\`.\`$table\` to \`new_database\`.\`$table\`"
done
mysql -e "DROP DATABASE \`old_database\`;"
*/
mysql -u robertholland -p
mysql -e "CREATE DATABASE \`united_states\`;"
for table in `mysql -B -N -e "SHOW TABLES;" test`
do
  mysql -e "RENAME TABLE \`test\`.\`$table\` to \`united_states\`.\`$table\`"
done
mysql -e "DROP DATABASE \`test\`;"
