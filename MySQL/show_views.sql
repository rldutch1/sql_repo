-- Show user created views in MySQL (exclude sys database):
select table_schema, table_name, definer from views where table_schema != 'sys' order by table_schema;

-- If you want to see the create statement, include the "view_definition" column:
select table_schema, table_name, definer, view_definition from views where table_schema != 'sys' order by table_schema;

