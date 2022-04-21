password="YourPassword"
ip_address="YourHostIPAddress"
pg_user="YourPGUser"
pg_instance="YourClusterName"
pg_provider="YourCloudProvider"
pg_region="YourRegion"

# Drop Database objects
output=$(PGPASSWORD=$password psql -U $pg_user --host=$ip_address -f 1-dropobjects.sql)
echo $output

# Create Database
output=$(PGPASSWORD=$password psql -U $pg_user --host=$ip_address -f 2-createdbobjects.sql)
echo $output

# Create table
output=$(PGPASSWORD=$password psql -U $pg_user --host=$ip_address -f 3-createtable.sql)
echo $output

# Add data
output=$(PGPASSWORD=$password psql -U $pg_user --host=$ip_address -f 4-adddata.sql)
echo $output
