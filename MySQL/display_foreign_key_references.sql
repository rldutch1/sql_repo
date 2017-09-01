-- To run from the command prompt type:
-- mysql -u rob -p < display_foreign_key_references.sql > current_fk_refs.txt

use INFORMATION_SCHEMA;
select concat(TABLE_SCHEMA,'.',TABLE_NAME,'.',COLUMN_NAME) as This_DB_Table_and_Column, concat(TABLE_SCHEMA,'.',REFERENCED_TABLE_NAME,'.',REFERENCED_COLUMN_NAME) as References_DB_Table_and_Column,CONSTRAINT_NAME from KEY_COLUMN_USAGE where referenced_table_name is not NULL order by This_DB_Table_and_Column;

-- The order by clause may not work on all DB's. If there is an error remove it and run again.

-- Same query but this one shows the cascade rules.
use INFORMATION_SCHEMA;
select
concat(kcu.TABLE_SCHEMA,'.',kcu.TABLE_NAME,'.',kcu.COLUMN_NAME) as This_DB_Table_and_Column,
concat(kcu.TABLE_SCHEMA,'.',kcu.REFERENCED_TABLE_NAME,'.',kcu.REFERENCED_COLUMN_NAME) as References_DB_Table_and_Column,
kcu.CONSTRAINT_NAME,
rc.update_rule,
rc.delete_rule
from
KEY_COLUMN_USAGE KCU
join REFERENTIAL_CONSTRAINTS RC on (rc.CONSTRAINT_NAME= kcu.CONSTRAINT_NAME)
where kcu.referenced_table_name is not NULL order by This_DB_Table_and_Column;
-- The order by clause may not work on all DB's. If there is an error remove it and run again.
