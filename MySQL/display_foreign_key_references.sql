-- To run from the command prompt type:
-- mysql -u rob -p < display_foreign_key_references.sql > current_fk_refs.txt

use INFORMATION_SCHEMA;
select concat(TABLE_SCHEMA,'.',TABLE_NAME,'.',COLUMN_NAME) as This_DB_Table_and_Column, concat(TABLE_SCHEMA,'.',REFERENCED_TABLE_NAME,'.',REFERENCED_COLUMN_NAME) as References_DB_Table_and_Column,CONSTRAINT_NAME from KEY_COLUMN_USAGE where referenced_table_name is not NULL order by This_DB_Table_and_Column;

-- The order by clause may not work on all DB's. If there is an error remove it and run again.