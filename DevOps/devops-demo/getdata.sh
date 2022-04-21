password="YourPassword"
ip_address="YourHostIPAddress"
pg_user="YourPGUser"
pg_instance="YourClusterName"
pg_provider="YourCloudProvider"
pg_region="YourRegion"

export TUPLAS_FOUND="0"
set echo off

# Get Tuplas count
output=$(PGPASSWORD=$password psql -U $pg_user --host=$ip_address -f 5-getdata.sql)

# Remove '|' and spaces
tuplas_found=`echo $output | sed 's/^[^|]*|//' | sed 's/ //g'`
echo "Tuplas found: "
echo $tuplas_found

# Display tuplas found
echo "TUPLAS_FOUND=$tuplas_found" >> $GITHUB_ENV
