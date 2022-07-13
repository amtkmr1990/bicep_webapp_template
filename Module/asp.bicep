targetScope = 'resourceGroup'

param appServiceName string

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServiceName
  location: resourceGroup().location
  tags: {
    type: 'ASP'
    domain: 'IT'
    owner:'Amit'
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
  sku: {
    name: 'P1v2'
    tier: 'PremiumV2'
    size: 'P1v2'
    family: 'Pv2'
    capacity: 1
  }
}

output aspname string = appServicePlan.name
