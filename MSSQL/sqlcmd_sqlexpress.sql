I installed SQL Server 2008 Express and was disappointed when I couldn't find the query
analyzer. I found that you can also use the command line 'sqlcmd' to access the SQL Server Express database instance.
It is a pain to use but it works. You can write your code in a text
file then import it using the sqlcmd command. You also have to end
your query with a new line and type the word 'go'.


Example of query file named test.sql:
use master;
select name, crdate from sysdatabases where xtype='u' order by crdate desc;
go

Example of sqlcmd:
sqlcmd -S %computername%\RLH -d play -i "test.sql" -o outfile.sql & notepad outfile.sql

The RLH is the database server instance on my computer (%computername%).
The "d" means to use the play database.
The "-i" means to import the query test.sql.
The "-o" means to send the query output to a file called outfile.sql.
The "& notepad" means to open notepad and and display outfile.sql.

There is also free program called HeidiSQL that will allow you to access the SQL Server 2008 Express database instances on your computer.
HeidiSQL works with MySQL as well. 

