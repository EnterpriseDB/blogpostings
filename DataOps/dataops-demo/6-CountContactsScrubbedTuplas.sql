-- Connect to database 'staging', select, and count tuplas from 'contactsscrubbed' table
\x on
\c staging

SELECT COUNT(*) 
FROM contactsscrubbed;
