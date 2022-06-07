-- Connect to database 'staging', select, and verify existence of 'contactsscrubbed' table
\x on
\c staging

SELECT
   COUNT(table_name)
FROM
   information_schema.tables
WHERE
   table_schema LIKE 'public' AND
   table_type LIKE 'BASE_TABLE' AND
   table_name = 'contactsscrubbed';
