-- To run from the command prompt type:
-- mysql -u rob -p < display_foreign_key_references.sql > current_fk_refs.txt

create VIEW `vw_fk_constraints` AS
select distinct(concat(`kcu`.`TABLE_SCHEMA`,'.',`kcu`.`TABLE_NAME`,'.',`kcu`.`COLUMN_NAME`)) AS `This_DB.Table.and_column`
,concat(`kcu`.`TABLE_SCHEMA`,'.',`kcu`.`REFERENCED_TABLE_NAME`,'.',`kcu`.`REFERENCED_COLUMN_NAME`) AS `References_This_DB.Table.and_Column`
,`kcu`.`CONSTRAINT_NAME` AS `constraint_name`
,`rc`.`UPDATE_RULE` AS `update_rule`
,`rc`.`DELETE_RULE` AS `delete_rule`
from (`information_schema`.`KEY_COLUMN_USAGE` `kcu`  join `information_schema`.`REFERENTIAL_CONSTRAINTS` `rc` on(`kcu`.`TABLE_NAME` = `rc`.`TABLE_NAME`))
where `kcu`.`REFERENCED_TABLE_NAME` is not null
and `kcu`.`TABLE_SCHEMA` = 'united_states';


use INFORMATION_SCHEMA;
select concat(TABLE_SCHEMA,'.',TABLE_NAME,'.',COLUMN_NAME) as This_DB_Table_and_Column,
concat(TABLE_SCHEMA,'.',REFERENCED_TABLE_NAME,'.',REFERENCED_COLUMN_NAME) as References_This_DB_Table_and_Column,
CONSTRAINT_NAME
from KEY_COLUMN_USAGE
where referenced_table_name is not NULL
order by This_DB_Table_and_Column;

-- The order by clause may not work on all DB's. If there is an error remove it and run again.

-- Same query but this one shows the cascade rules.
use INFORMATION_SCHEMA;
select
concat(kcu.TABLE_SCHEMA,'.',kcu.TABLE_NAME,'.',kcu.COLUMN_NAME) as This_DB_Table_and_Column,
concat(kcu.TABLE_SCHEMA,'.',kcu.REFERENCED_TABLE_NAME,'.',kcu.REFERENCED_COLUMN_NAME) as References_This_DB_Table_and_Column,
kcu.CONSTRAINT_NAME,
rc.update_rule,
rc.delete_rule
from
KEY_COLUMN_USAGE KCU
join REFERENTIAL_CONSTRAINTS RC on (rc.CONSTRAINT_NAME= kcu.CONSTRAINT_NAME)
where kcu.referenced_table_name is not NULL order by This_DB_Table_and_Column;
-- The order by clause may not work on all DB's. If there is an error remove it and run again.
-- On Tracy's Ubuntu MySQL server I got this error message: Unknown column 'kcu.TABLE_SCHEMA' in 'field list'

-- This is a quick way to view all of the constraints:
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS

