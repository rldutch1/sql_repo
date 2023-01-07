To use PHP on an IIS 7 server to connect to an Access database, you will need to install the Microsoft Access Database Engine 2010 Redistributable package.

When attempting to connect to an Access database I got this error:
	SQLSTATE[HY000] SQLDriverConnect: 63 [Microsoft][ODBC Microsoft Access Driver]General error Unable to open registry key Temporary (volatile) Ace DSN for process 0xf8c Thread 0x1790 DBC 0x49598f8 Jet'.

The solution that I used was to open REGEDT32 and grant "Full Control" access to "Everyone" on the two keys below:

	HKLM\Software\ODBC
	HKLM\Software\WOW6432NODE\ODBC

When attempting to connect again to an Access database via UNC path, I got this error:
	SQLSTATE[HY000] SQLDriverConnect: -1032 [Microsoft][ODBC Microsoft Access Driver] The Microsoft Access database engine cannot open or write to the file '(unknown)'. It is already opened exclusively by another user, or you need permission to view and write its data.

This error can be caused by:

1. The file is still open on the machine or if it is on the network then someone still has it open.
2. If the file is on a network, then this has caused this error due to security settings and the advice is to move the file locally onto the server.
3. If the file is local then there are still permission issues that ares till present

Solution
If you have already ensured that the file is not open anywhere else and you have copied it locally to the server please see the below steps:

1. Ensure the file is saved locally on the server and is in a folder instead of being in the root folder.
2. Once the file is in a folder, go to the privileges of that folder and make sure the following users have full access of read and write: "network service" and "asp".
3. After granting these users access onto the folder and you still see the error, grant the user "Everyone" and test if this resolves the error.

For further information, you could refer to:
http://community.landesk.com/support/docs/DOC-24626

http://www.vbforums.com/showthread.php?398478-RESOLVED-Webform-error-quot-It-is-already-opened-exclusively-by-another-user-or-you-need-(-)-quot

The solution for me was to move the Access database to the server and change the connection string in PHP to avoid using UNC.
