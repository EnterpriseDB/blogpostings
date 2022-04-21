-- Connect to database 'demo' and select tuplas from salespeople table
\x on
\c demo
SELECT COUNT(*) FROM salespeople;
