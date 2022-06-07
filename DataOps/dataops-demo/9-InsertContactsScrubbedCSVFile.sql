-- Connect to 'prod' database
\c prod

-- Remove any existing tuplas in 'contacts' table
TRUNCATE TABLE contacts;

-- Import values into 'contacts' table from CSV File
\COPY contacts(first_name, last_name, dob, email) FROM '/home/doug/dataops-demo/8-ContactsScrubbed.csv' DELIMITER ',' CSV HEADER;
