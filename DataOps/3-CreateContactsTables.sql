-- Connect to database 'staging'
\c staging

-- Create the 'contacts' Original table
CREATE TABLE contacts (
  id SERIAL NOT NULL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  dob DATE,
  email VARCHAR(255)
);

-- Create the 'contactsscrubbed' scrubbed table
CREATE TABLE contactsscrubbed (
  id SERIAL NOT NULL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  dob DATE,
  email VARCHAR(255)
);

-- Connect to database 'prod'
\c prod

-- Create the 'Contacts' table
CREATE TABLE contacts (
  id SERIAL NOT NULL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  dob DATE,
  email VARCHAR(255)
);
