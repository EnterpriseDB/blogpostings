# Original work by: EnterpriseDB
# https://www.enterprisedb.com/
# Purpose : Provision BigAnimal Clusters
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
headers["Content-Type"] = "application/json"

# API URL
url = "https://portal.biganimal.com/api/v1/clusters"

# Perform API POST Request
try:
    response = requests.post(url, headers=headers, data=open('data.json', 'rb'))
    response.raise_for_status()
except requests.exceptions.HTTPError as errHTTP:
    print(errHTTP)
except requests.exceptions.ConnectionError as errorConnection:
    print(errorConnection)
except requests.exceptions.Timeout as errorTimeout:
    print(errorTimeout)
except requests.exceptions.RequestException as errException:
    print(errException)

# Provide status
print(f"Status Code: {response.status_code}, Response: {response.json()}")
