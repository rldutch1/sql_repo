-- Source:(https://msdn.microsoft.com/en-us/library/ms189828.aspx);

-- Enabling a disabled login:
	alter login robert DISABLE;
	alter login robert ENABLE;

-- Change password:
	alter login robert with password = 'newpassword';

-- Change the password of a login using HASHED (changes the password of the robert login to an already hashed value):
	ALTER LOGIN robert WITH
	PASSWORD = 0x01000CF35567C60BFB41EBDE4CF700A985A13D773D6B45B90900 HASHED ;
	GO

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
*/
	alter login robert with credential = windowscredential;

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

