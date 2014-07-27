CREATE USER 'monty'@'localhost' IDENTIFIED BY 'some_pass';

GRANT ALL PRIVILEGES ON *.* TO 'monty'@'localhost'
WITH GRANT OPTION;

CREATE USER 'monty'@'%' IDENTIFIED BY 'some_pass';
GRANT ALL PRIVILEGES ON *.* TO 'monty'@'%'
WITH GRANT OPTION;

CREATE USER 'admin'@'localhost';

GRANT RELOAD,PROCESS ON *.* TO 'admin'@'localhost';

CREATE USER 'dummy'@'localhost';
