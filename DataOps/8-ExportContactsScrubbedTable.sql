-- Connect to database 'staging', select, and import csv file into 'contactsscrubbed' table
\x on
\c staging

-- Export contacts scrubbed table to csv file
\COPY contactsscrubbed(first_name, last_name, dob, email) TO '/home/doug/dataops-demo/8-ContactsScrubbed.csv' DELIMITER ',' CSV HEADER;
