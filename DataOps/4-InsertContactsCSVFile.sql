-- Connect to 'staging' database
\c staging

-- Remove any existing tuplas in 'contacts' original table
TRUNCATE TABLE contacts;

-- Import values into 'contacts' original table from CSV File
\COPY contacts(first_name, last_name, dob, email) FROM '/home/doug/dataops-demo/4-Contacts.csv' DELIMITER ',' CSV HEADER;

-- Remove any existing tuplas in scrubbed table
TRUNCATE TABLE contactsscrubbed;

-- Import values into 'contacts' scrubbed table from CSV File
\COPY contactsscrubbed(first_name, last_name, dob, email) FROM '/home/doug/dataops-demo/4-Contacts.csv' DELIMITER ',' CSV HEADER;
