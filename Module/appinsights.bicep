targetScope = 'resourceGroup'

resource appInsights 'Microsoft.Insights/components@2020-02-02-preview' = {
  name: 'appInsights'
  location: resourceGroup().location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}
output appInsightsKey string = appInsights.properties.InstrumentationKey
