/*
Hello Robert,

Here is what I found so  far, it may not be exactly the same as
DESCRIBE in MySQL.

1) Open the Command Window
2) Key in the following:
SQLCMD -S localhost -E -i C:\yourscript.sql -o output.txt

3) In your script you will have something like this:

USE Northwind
GO
EXEC sp_help Customers

Note: The sp_help table will list the metadata about the table.

Hope this helps.

Kindest Regards,

Sunil
*/
