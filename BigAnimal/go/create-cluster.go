// Original work by: EnterpriseDB
// https://www.enterprisedb.com/
// Purpose : Provision BigAnimal clusters
// Author  : Doug Ortiz
// Date    : January 28, 2022
// Version : 1.0
// Copyright © 2020 EnterpriseDB

package main

import (
  "net/http"
  "fmt"
  "os"
  "io/ioutil"
  )

func main() {
     // Assign variables values
     // Set 'token'
     var token = "<yourtoken>"
     // URL
     var url = "https://portal.biganimal.com/api/v1/clusters"

     // Read 'data.json' BigAnimal configuration parameters file
     jsonFile, errJsonFile := os.Open("data.json")
     
     // Check for errors
     if errJsonFile != nil {
       panic(errJsonFile)
     }

     // POST API Request
     request, errorHttp := http.NewRequest("POST", url, jsonFile)
     request.Header.Set("Accept", "application/json")
     request.Header.Set("Authorization", "Bearer " + token)
     request.Header.Set("Content-Type", "application/json")

     // Perform client call
     client := &http.Client{}
     response, errorHttp := client.Do(request)
     
     // Check for errors
     if errorHttp != nil {
       panic(errorHttp)
     }

     // Close response
     defer response.Body.Close()

     // Provide status
     fmt.Println("Response Status: ", response.Status)
     respBody, _ := ioutil.ReadAll(response.Body)
     fmt.Println("Response Body: ", string(respBody))
}
