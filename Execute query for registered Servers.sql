declare @name nvarchar(50)

DECLARE db_cursor CURSOR FOR
SELECT name
FROM MASTER.dbo.sysdatabases
WHERE name NOT IN ('master','model','msdb','tempdb')  and name like 'SK%' and name not like '%test%'

OPEN db_cursor
FETCH NEXT FROM db_cursor INTO @name

WHILE @@FETCH_STATUS = 0
BEGIN
 DECLARE @exec nvarchar(max) = QUOTENAME(@name) + N'.sys.sp_executesql',
        @sql  nvarchar(max) = N'
    print @@servername
    print db_name()
--add here script
        '
        EXEC @exec @sql

      FETCH NEXT FROM db_cursor INTO @name
END

CLOSE db_cursor
DEALLOCATE db_cursor