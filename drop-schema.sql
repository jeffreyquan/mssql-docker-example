DECLARE @sql NVARCHAR(MAX);
SET @sql = N'';

SELECT @sql = @sql + N'
  ALTER TABLE ' + QUOTENAME(s.name) + N'.'
  + QUOTENAME(t.name) + N' DROP CONSTRAINT '
  + QUOTENAME(c.name) + ';'
FROM sys.objects AS c
INNER JOIN sys.tables AS t
ON c.parent_object_id = t.[object_id]
INNER JOIN sys.schemas AS s
ON t.[schema_id] = s.[schema_id]
WHERE c.[type] IN ('D','C','F','PK','UQ') and schema_name(c.schema_id) = '$(DROP_SCHEMA)'
ORDER BY c.[type];

PRINT @sql;
EXEC sys.sp_executesql @sql;


DECLARE @DropTables NVARCHAR(max) = ''
SELECT @DropTables += 'DROP ' + 
  (CASE
    WHEN t.TABLE_TYPE = 'VIEW' THEN 'VIEW '
    ELSE 'TABLE '
  END) + 
  QUOTENAME(TABLE_SCHEMA) + '.' + QUOTENAME(TABLE_NAME) + ';'
FROM INFORMATION_SCHEMA.TABLES as t where TABLE_SCHEMA = '$(DROP_SCHEMA)'
PRINT @DropTables;
EXEC sys.sp_executesql @DropTables;