// Original work by: EnterpriseDB
// https://www.enterprisedb.com/
// Purpose : List BigAnimal clusters
// Author  : Doug Ortiz
// Date    : January 28, 2022
// Version : 1.0
// Copyright © 2020 EnterpriseDB

package main

import (
  "net/http"
  "fmt"
  "io/ioutil"
  )

func main() {
     // Assign variables values
     // Set 'token'
     var token = "<yourtoken>"
     // URL
     var url = "https://portal.biganimal.com/api/v1/clusters"
     // Provide filter for cluster name, provider, postgres type, postgres version and sort by cluster name
     filter := "?name=DO-go&provider=azure&pgType=epas&pgVersion=14&sort=%2Bname"
     filteredurl := url + filter
     fmt.Println("Filter: ", filteredurl)

     // GET API Request
     request, errorHttp := http.NewRequest("GET", filteredurl, nil)
     if errorHttp != nil {
       panic(errorHttp)
     }
     request.Header.Set("Accept", "application/json")
     request.Header.Set("Authorization", "Bearer " + token)

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
