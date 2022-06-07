-- Connect to database 'staging', select, and scrub data from 'contactsscrubbed' table
\x on
\c staging

-- Scrub issues in names
-- Jackal
UPDATE contactsscrubbed 
  SET first_name=REPLACE(first_name,'Jackal','Jack') 
WHERE position('Jackal' in first_name) > 0;

-- Janex
UPDATE contactsscrubbed 
  SET first_name=REPLACE(first_name,'Janex','Jane') 
WHERE position('Janex' in first_name) > 0;

-- Scrub issues in email
-- gmail.com
UPDATE contactsscrubbed 
  SET email=REPLACE(email,'gma.com','gmail.com') 
WHERE position('gma.com' in email) > 0;

-- microsoft.com
UPDATE contactsscrubbed 
  SET email=REPLACE(email,'micro.com','microsoft.com') 
WHERE position('micro.com' in email) > 0;
