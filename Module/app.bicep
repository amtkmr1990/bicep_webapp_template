targetScope = 'resourceGroup'

param webAppName string 
param appServicePlan string
param appInsightsKey string

resource webApplication 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppName
  location: resourceGroup().location
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
