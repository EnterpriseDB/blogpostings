// Original work by: EnterpriseDB
// https://www.enterprisedb.com/
// Purpose : Delete BigAnimal clusters
// Author  : Doug Ortiz
// Date    : January 28, 2022
// Version : 1.0
// Copyright © 2020 EnterpriseDB

package main

import (
  "net/http"
  "fmt"
  )

func main() {
     // Assign variables values
     // Set 'token'
     var token = "<yourtoken>"
     // URL, Cluster ID, and Postgres Cluster ID
     var url = "https://portal.biganimal.com/api/v1/clusters"
     pgId := "<yourbiganimalclusterid>"
     filter := "/" + pgId
     filteredurl := url + filter
     fmt.Println("Filter: ", filteredurl)

     // DELETE API Request
     request, errorHttp := http.NewRequest("DELETE", filteredurl, nil)
     if errorHttp != nil {
       panic(errorHttp)
     }
     request.Header.Set("Accept", "*/*")
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
     fmt.Println("Successfully deleted cluster: " + pgId + " !")
}
