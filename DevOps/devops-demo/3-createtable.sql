-- Connect to database 'demo'
\c demo

-- Create the salespeople table
CREATE TABLE salespeople ( 
	salesperson_id INT NOT NULL PRIMARY KEY, 
	name VARCHAR(50) 
);
