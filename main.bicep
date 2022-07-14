targetScope = 'subscription'

param location string 
param rgName string
param appServiceName string 
param webAppName string 
param subnetidforprivatelink  string
param privateendpointname string
param privateLinkConnectionName string
param subnetidforvnetinjection string


resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: rgName
  location: location
}

module asp 'Module/asp.bicep' = {
  scope: rg
  name: 'asp'
  params: {
    appServiceName: appServiceName
  }
}

module app 'Module/app.bicep' = {
  name: 'app'
  scope: rg
  params: {
    appServicePlan: asp.outputs.aspname 
    webAppName: webAppName
    appInsightsKey: appinsights.outputs.appInsightsKey
    subnetidforprivatelink: subnetidforprivatelink 
    privateEndpointName: privateendpointname 
    privateLinkConnectionName: privateLinkConnectionName
    subnetidforvnetinjection: subnetidforvnetinjection
  }
  dependsOn: [
    asp,appinsights
  ]
}

module appinsights 'Module/appinsights.bicep' = {
  name: 'appinsights'
  scope: rg
  dependsOn: [
    
  ]
}
