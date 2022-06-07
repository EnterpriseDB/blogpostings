# dataops-demo
# Getting Started

`dataops-demo` is a repository containing the code for the webinar and blog posts related to **If DataOps is not DevOps plus Data, then what is it, exactly?**.

# Pre-Requisites

`dataops-demo` is dependent on following components. The following
components are required before using the code in this repository.

1. A PostgreSQL cluster
2. GitHub Actions
3. Previously configured credentials for connecting to the PostgreSQL cluster

# Installation

# SQL Scripts

The scripts listed below accomplish the following:

  1. '1-DropDBs.sql' - Drops the 'staging', and 'prod' database
  2. '2-CreateDBs.sql' - Creates the 'staging', and 'prod' database
  3. '3-CreateContactsTables.sql' - Creates the 'contacts', and 'contactsscrubbed' table in 'staging' database. Creates the 'contacts' table in 'prod' database
  4. '4-InsertContactsCSVFile.sql' - Inserts the ' '4-Contacts.csv' file into 'staging.contacts', and 'staging.contactsscrubbed' tables
  5. '5-CheckForContactsScrubbedTable.sql' - Verifies existence of the 'staging.contactsscrubbed' table
  6. '6-CountContactsScrubbedTuplas.sql' - Counts the tuplas in 'staging.contactsscrubbed' table
  7. '7-DataScrubbing.sql' - Updates the data in 'staging.contacts' and 'staging.contactsscrubbed' table to correct, and clean data.
  8. '8-ExportContactsScrubbedTable.sql' - Exports the cleaned table 'staging.contactsscrubbed' to '8-contactsScrubbed.csv' file
  9. '9-InsertContactsScrubbedCSVFile.sql' - Imports the '8-ContactsScrubbed.csv' file into 'prod.contacts'

# Bash Scripts

The scripts listed below accomplish the following:

  1. 'Provision.sh' - Assigns PostgreSQL credentials and calls the SQL Scripts listed above
  2. 'CheckForContactsScrubbedTable.sh' - Assigns PostgreSQL credentials and gets the checks for the existence of the 'staging.contacts' table
  3. 'CountContactsScrubbedTuplas.sh' - Assigns PostgreSQL credentials and gets the count of tuplas from the 'staging.contacts' table
  
# Pipeline steps

The pipeline code is to be located in '.github/workflows/workflows.yml'. The steps for the pipeline are:

  1. CreateDBAndObjects - Calls the 'Provision.sh' script
  2. GetDBTuplas - Calls the 'getdata.sh' script
  3. DisplayTuplasFound - Displays the count of the tuplas in 'salesperson' table
  4. NoTuplasFound - Checks if there are any tuplas and if none are available fails the pipeline

# How to Use

Fork the repository or make the modifications to your code based on this repository:

  1. Make modifications to the *.sql files to match your credentials
  2. Commit change(s)
  3. Navigate to the **Actions** page of the GitHub repository
  4. Connect with 'psql' to the target PostgreSQL cluster, execute the following command:
     `GRANT PG_read_server_files to postgres;`

# License

Original work Copyright 2019-2020, EnterpriseDB Corporation

All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

3. Neither the name of EnterpriseDB nor the names of its contributors may be
used to endorse or promote products derived from this software without specific
prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE.
