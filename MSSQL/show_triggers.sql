-- Display Triggers:
-- https://stackoverflow.com/questions/4305691/need-to-list-all-triggers-in-sql-server-database-with-table-name-and-tables-sch

SELECT
    [so].[name] AS [trigger_name],
    USER_NAME([so].[uid]) AS [trigger_owner],
    USER_NAME([so2].[uid]) AS [table_schema],
    OBJECT_NAME([so].[parent_obj]) AS [table_name],
    OBJECTPROPERTY( [so].[id], 'ExecIsUpdateTrigger') AS [isupdate],
    OBJECTPROPERTY( [so].[id], 'ExecIsDeleteTrigger') AS [isdelete],
    OBJECTPROPERTY( [so].[id], 'ExecIsInsertTrigger') AS [isinsert],
    OBJECTPROPERTY( [so].[id], 'ExecIsAfterTrigger') AS [isafter],
    OBJECTPROPERTY( [so].[id], 'ExecIsInsteadOfTrigger') AS [isinsteadof],
    OBJECTPROPERTY([so].[id], 'ExecIsTriggerDisabled') AS [disabled],
    [so].[type] as [type]
FROM sysobjects AS [so]
INNER JOIN sysobjects AS so2 ON so.parent_obj = so2.Id
-- WHERE [so].[type] = 'TR' -- Show specific type of trigger.
