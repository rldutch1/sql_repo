-- http://stackoverflow.com/questions/5941809/include-headers-when-using-select-into-outfile
-- Show columns
select column_name
    from information_schema.columns
    where table_name = 'my_table'
    and table_schema = 'my_schema'
    order by ordinal_position;

-- "describe tablename" also works.

