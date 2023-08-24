# Execute-query-in-specific-database
In some cases we need to run script in all servers. We can use for it registered servers definition in SQL Server. But we need to determine right database names. We can use this script which databases we need to execute some scripts.
You can add condition for your choosing when take database name to cursor. In my case condition as below:
WHERE name NOT IN ('master','model','msdb','tempdb')  and name like 'SK%' and name not like '%test%'
You add script after --add here script

Use registered servers and this script I can change my procedure or do something else in all servers at the same time.

About registered servers:
https://learn.microsoft.com/en-us/sql/ssms/register-servers/register-servers?view=sql-server-ver16
