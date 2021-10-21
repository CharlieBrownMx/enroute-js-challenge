
-- add necessary privileges for the main database
GRANT ALL PRIVILEGES ON employees.* TO 'enroute'@'%';
GRANT ALL PRIVILEGES ON enroute.* TO 'enroute'@'%';

GRANT RELOAD ON *.* TO 'enroute'@'%';
