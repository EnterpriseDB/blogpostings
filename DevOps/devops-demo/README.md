# devops-demo
# Getting Started

`devops-demo` is a repository containing the code for the webinar and blog posts related to **Streamlining database provisioning with DevOps**.

# Pre-Requisites

`devops-demo` is dependent on following components. The following
components are required before using the code in this repository.

1. A PostgreSQL cluster
2. GitHub Actions
3. Previously configured credentials for connecting to the PostgreSQL cluster

# Installation

# SQL Scripts

The scripts listed below accomplish the following:

  1. '1-dropobjects.sql' - Drops the 'demo' database
  2. '2-createdbobjects.sql' - Creates the 'demo' database
  3. '3-createtable.sql' - Connects to the 'demo' database and creates a table named 'salesperson'
  4. '4-adddata.sql' - Connects to the 'demo' database and inserts values into the table 'salesperson'
  5. '5-getdata.sql' - Connects to the 'demo' database and gets a count of the tuplas for the 'salesperson' table

# Bash Scripts

The scripts listed below accomplish the following:

  1. 'provision.sh' - Assigns PostgreSQL credentials and calls the SQL Scripts listed above
  2. 'getdata.sh' - Assigns PostgreSQL credentials and gets the count of tuplas from the 'salesperson' table
  
# Pipeline steps

The pipeline code is to be located in '.github/workflows/workflows.yml'. The steps for the pipeline are:

  1. CreateDBAndObjects - Calls the 'provision.sh' script
  2. GetDBTuplas - Calls the 'getdata.sh' script
  3. DisplayTuplasFound - Displays the count of the tuplas in 'salesperson' table
  4. NoTuplasFound - Checks if there are any tuplas and if none are available fails the pipeline

# How to Use

Fork the repository or make the modifications to your code based on this repository:

  1. Make modifications to the *.sql files to match your credentials
  2. Commit change(s)
  3. Navigate to the **Actions** page of the GitHub repository
  4. A database named 'demo' should be available in your PostgreSQL cluster if the pipeline was successful

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
