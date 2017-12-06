To use PHP on an IIS 7 server to connect to an Access database, you will need to install the Microsoft Access Database Engine 2010 Redistributable package.

When attempting to connect to an Access database I got this error:
	SQLSTATE[HY000] SQLDriverConnect: 63 [Microsoft][ODBC Microsoft Access Driver]General error Unable to open registry key Temporary (volatile) Ace DSN for process 0xf8c Thread 0x1790 DBC 0x49598f8 Jet'.

The solution that I used was to open REGEDT32 and grant "Full Control" access to "Everyone" on the two keys below:

	HKLM\Software\ODBC
	HKLM\Software\WOW6432NODE\ODBC

When attempting to connect again to an Access database via UNC path, I got this error:
	SQLSTATE[HY000] SQLDriverConnect: -1032 [Microsoft][ODBC Microsoft Access Driver] The Microsoft Access database engine cannot open or write to the file '(unknown)'. It is already opened exclusively by another user, or you need permission to view and write its data.

The solution was to move the Access database to the server and change the connection string in PHP to avoid using UNC.
