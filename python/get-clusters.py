# Original work by: EnterpriseDB
# https://www.enterprisedb.com/
# Purpose : List BigAnimal Clusters
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

# Headers
headers = CaseInsensitiveDict()
headers["Accept"] = "application/json"
headers["Authorization"] = "Bearer " + token
#headers["Content-Type"] = "application/json"

# URL, filter and filteredurl
url = "https://portal.biganimal.com/api/v1/clusters"
# Adjust filter accordingly
filter = "?name=DO-python&provider=azure&pgType=epas&pgVersion=14&sort=%2Bname"
filteredurl = url+filter

# Perform API Get Request
try:
    response = requests.get(filteredurl, headers=headers)
    response.raise_for_status()
    print("Filter: ")
    print(filteredurl)
except requests.exceptions.HTTPError as errHTTP:
    print(errHTTP)
except requests.exceptions.ConnectionError as errorConnection:
    print(errorConnection)
except requests.exceptions.Timeout as errorTimeout:
    print(errorTimeout)
except requests.exceptions.RequestException as errException:
    print(errException)

# Provide status
print("")
print(f"Status Code: {response.status_code}, Response: {response.json()}")
