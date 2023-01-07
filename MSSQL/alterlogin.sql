-- Source:(https://msdn.microsoft.com/en-us/library/ms189828.aspx):

-- Source: https://msdn.microsoft.com/en-us/library/ms189751.aspx:
-- Create login (requires ALTER ANY LOGIN permission on the server or membership in the securityadmin fixed server role.)
	create login <login_name> with password = '<enterStrongPasswordHere>';
	go

-- Same thing except require a password change:
	create login <login_name> with password = '<enterStrongPasswordHere>' MUST_CHANGE;
	go

-- Create a login from a Windows domain account:
	create login [<domainName>\<login_name>] from WINDOWS;
	go

-- Enabling a disabled login:
	alter login robert DISABLE;
	alter login robert ENABLE;

-- Change password:
	alter login robert with password = 'newpassword';

-- Change the password of a login using HASHED (changes the password of the robert login to an already hashed value):
	alter login robert WITH
	password = 0x01000CF35567C60BFB41EBDE4CF700A985A13D773D6B45B90900 HASHED ;
	go

-- Change the name of a login (from robert to rob):
	alter login robert with name = rob;

-- Map a login to a credential (You must have ALTER ANY CREDENTIAL permission to map a credential):
/*
A credential is a record that contains the authentication information (credentials) required to connect
to a resource outside SQL Server. This information is used internally by SQL Server. Most credentials
contain a Windows user name and password.
The information stored in a credential enables a user who has connected to SQL Server by way of SQL
Server Authentication to access resources outside the server instance. When the external resource is
Windows, the user is authenticated as the Windows user specified in the credential. A single credential
can be mapped to multiple SQL Server logins. However, a SQL Server login can be mapped to only one
credential.

-- To see credentials already on the server:
-- select * from sys.credentials;
-- select * from sys.database_credentials;
*/
	alter login robert with credential = windowscredential;

-- Source: https://msdn.microsoft.com/en-us/library/ms189522.aspx
-- Create a credential (creates the credential called AlterEgo. The credential contains the Windows user Mary5 and a password.):
	create credential AlterEgo with identity = 'Mary5',
  secret = '<EnterStrongPasswordHere>';
	go

-- Map a login to an Extensible Key Management credential.
	alter login robert
	add credential EKMProvider1;
	go

-- Unlocking a login (replace **** with the desired account password):
	alter login [robert] with password = '****' UNLOCK;
	go

-- Unlocking a login without changing the password. (turn the check policy off then on again):
	alter login [robert] with check_policy = OFF;
	alter login [robert] with check_policy = ON;
	go

