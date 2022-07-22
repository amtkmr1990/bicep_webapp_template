targetScope = 'resourceGroup'

param webAppName string 
param appServicePlan string
param appInsightsKey string
param subnetidforprivatelink string
param privateEndpointName string
param privateLinkConnectionName string
param subnetidforvnetinjection string
@description('Resource Id of Private DNS Zone Group of Web App example: privatelink.azurewebsites.net')
param privateDnsZonesId string
param location string = resourceGroup().location

var webapp_dns_name = '.azurewebsites.net'

resource webApplication 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppName
  location: location
  tags: {
    type: 'app'
  }
  properties: {
    serverFarmId: resourceId('Microsoft.Web/serverfarms', appServicePlan)
    siteConfig: {
      linuxFxVersion: 'PHP|7.4'
      minTlsVersion: '1.2'
      http20Enabled: false
    }
  }
  identity: {
    type:'SystemAssigned'
  }

}

resource appsetting 'Microsoft.Web/sites/config@2022-03-01' = {
  name: 'web'
  parent: webApplication
  properties: {
    appSettings: [
      {
        name: 'APPINSIGHTS_INSTUMENTATIONKEY'
        value: appInsightsKey
      }
    ]
  }  
}


resource privateEndpoint 'Microsoft.Network/privateEndpoints@2022-01-01' = {
  name: privateEndpointName
  location: location
  properties: {
    subnet: {
      id: subnetidforprivatelink
    }
    privateLinkServiceConnections: [
      {
        name: privateLinkConnectionName
        properties: {
          privateLinkServiceId: webApplication.id 
          groupIds: [
            'sites'
          ]
        }
      }
    ]
  }
}

resource webAppBinding 'Microsoft.Web/sites/hostNameBindings@2019-08-01' = {
  parent: webApplication
  name: '${webApplication.name}${webapp_dns_name}'
  properties: {
    siteName: webApplication.name
    hostNameType: 'Verified'
  }
}

//DNS registration for the private endpoint of Web App
resource privateDnsZoneGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2020-03-01' = {
  parent: privateEndpoint
  name: 'dnsgroupname'
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'config1'
        properties: {
          privateDnsZoneId: privateDnsZonesId
        }
      }
    ]
  }
}

// Web App Vnet Injection 
resource webAppNetworkConfig 'Microsoft.Web/sites/networkConfig@2022-03-01' = {
  parent: webApplication
  name: 'virtualNetwork'
  properties: {
    subnetResourceId: subnetidforvnetinjection
  }
}


output webappid string = webApplication.id
