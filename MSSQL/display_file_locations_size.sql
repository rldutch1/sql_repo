-- View SQL Server Database Name, File Locations, and Size

SELECT

    mdf.database_id,
    database_name = mdf.name,
    mdf.physical_name as mdf_data_file,
    ldf.physical_name as ldf_log_file,
    db_size_mb = CAST((mdf.size * 8.0)/1024 AS DECIMAL(8,2)),
    -- CAST((mdf.size * 8.0)/1024 AS DECIMAL(8,2)) as db_size_mb,
    log_size_mb = CAST((ldf.size * 8.0 / 1024) AS DECIMAL(8,2))
FROM (SELECT * FROM sys.master_files WHERE type_desc = 'ROWS' ) mdf
JOIN (SELECT * FROM sys.master_files WHERE type_desc = 'LOG' ) ldf
ON mdf.database_id = ldf.database_id;
