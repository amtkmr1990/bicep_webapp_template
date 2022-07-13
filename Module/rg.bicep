// this is file is not used under main module. But you can use this file to create rg 

// define scope 
targetScope = 'subscription' 

// define parameters 
param resourceGroupName string
param location string

// create resouce group 
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

