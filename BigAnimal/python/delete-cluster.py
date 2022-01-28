# Original work by: EnterpriseDB
# https://www.enterprisedb.com/
# Purpose : Delete BigAnimal Clusters
# Author  : Doug Ortiz
# Date    : January 28, 2022
# Version : 1.0
# Copyright © 2020 EnterpriseDB

import requests
from requests.structures import CaseInsensitiveDict
import json

# Assign variables values
# Set 'token'
token = "<yourtoken>"
headers = CaseInsensitiveDict()
headers["Accept"] = "*/*"
headers["Authorization"] = "Bearer " + token

# Postgres Cluster ID, URL, filter and filteredurl
# pgId must be retrieved or known prior to making the API call
pgId = "<yourbiganimalclusterid>"
url = "https://portal.biganimal.com/api/v1/clusters"
filter = "/" + pgId
filteredurl = url+filter
print("Filter: ")
print(filteredurl)

# Perform API Delete Request
try:
    response = requests.delete(filteredurl, headers=headers)
    response.raise_for_status()
    print("")
    print("Cluster: " + pgId + " deleted successfully!")
except requests.exceptions.HTTPError as errHTTP:
    print(errHTTP)
except requests.exceptions.ConnectionError as errorConnection:
    print(errorConnection)
except requests.exceptions.Timeout as errorTimeout:
    print(errorTimeout)
except requests.exceptions.RequestException as errException:
    print(errException)
