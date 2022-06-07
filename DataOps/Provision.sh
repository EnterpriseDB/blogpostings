#password="YourPassword"
#ip_address="YourHostIPAddress"
#pg_user="YourPGUser"
#pg_instance="YourClusterName"
#pg_provider="YourCloudProvider"
#pg_region="YourRegion"

password=$1
ip_address="p-nqxst6p48l.zijplqw3xxpr7nxv.biganimal.io"
pg_user="edb_admin"
pg_instance="DO-DATAOPS-DEMO"
pg_provider="AWS"
pg_region="us-west23"

echo "CLUSTER PASSWORD:"
echo $password

# Drop 'staging' and 'prod' Databases
output=$(PGPASSWORD=$password psql -U $pg_user --host=$ip_address -f 1-DropDBs.sql)
echo $output

# Create 'staging' and 'prod' Databases
output=$(PGPASSWORD=$password psql -U $pg_user --host=$ip_address -f 2-CreateDBs.sql)
echo $output

# Create 'contacts' tables in 'staging' and 'prod'
output=$(PGPASSWORD=$password psql -U $pg_user --host=$ip_address -f 3-CreateContactsTables.sql)
echo $output

# Import data into 'staging.contactsscrubbed' Table
output=$(PGPASSWORD=$password psql -U $pg_user --host=$ip_address -f 4-InsertContactsCSVFile.sql)
echo $output

# Verify existence of 'staging.contactsscrubbed' Table
output=$(PGPASSWORD=$password psql -U $pg_user --host=$ip_address -f 5-CheckForContactsScrubbedTable.sql)
echo $output

# Count Tuplas in 'staging.contactsscrubbed' Table
output=$(PGPASSWORD=$password psql -U $pg_user --host=$ip_address -f 6-CountContactsScrubbedTuplas.sql)
echo $output

# Scrub data in 'staging.contactsscrubbed' Table
output=$(PGPASSWORD=$password psql -U $pg_user --host=$ip_address -f 7-DataScrubbing.sql)
echo $output

# Export 'contactsscrubbed' Table to CSV File
output=$(PGPASSWORD=$password psql -U $pg_user --host=$ip_address -f 8-ExportContactsScrubbedTable.sql)
echo $output

# Insert ContactsScrubbed CSV File into 'prod' db 'contacts' Table
output=$(PGPASSWORD=$password psql -U $pg_user --host=$ip_address -f 9-InsertContactsScrubbedCSVFile.sql)
echo $output
