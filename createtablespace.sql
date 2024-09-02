-- should be run while connected as 'sys as sysdba'
-- Create User and Password using your User and Password or assign your user to Assginment2 tablespace.

-- Create STORAGE
CREATE TABLESPACE assignment2
  DATAFILE 'assignment2.dat' SIZE 40M 
  ONLINE; 
  

--Create Users
CREATE USER zhu3User IDENTIFIED BY zhu3Password ACCOUNT UNLOCK
	DEFAULT TABLESPACE assignment2
	QUOTA 50M ON assignment2;


-- Grant PRIVILEGES to Roles
--GRANT CONNECT, RESOURCE, CREATE VIEW, CREATE TRIGGER, CREATE PROCEDURE TO applicationAdmin;
--GRANT CONNECT, RESOURCE TO applicationUser;

-- Grant Role to User
--GRANT applicationAdmin TO zhu3User;



