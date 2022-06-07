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
pg_region="us-west2"

echo "CLUSTER PASSWORD:"
echo $password

export CONTACTS_SCRUBBED_TABLE_FOUND="0"
set echo off

# Get Tuplas count
output=$(PGPASSWORD=$password psql -U $pg_user --host=$ip_address -f 5-CheckForContactsScrubbedTable.sql)

# Remove '|' and spaces
contacts_scrubbed_table_found=`echo $output | sed 's/^[^|]*|//' | sed 's/ //g'`
echo "Contacts Scrubbed Table found: "
echo $contacts_scrubbed_table_found

# Display tuplas found
echo "CONTACTS_SCRUBBED_TABLE_FOUND=$contacts_scrubbed_table_found" >> $GITHUB_ENV
