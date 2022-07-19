
@description('Generated from /subscriptions/bba2c874-6268-48fb-b2c2-4b110514f730/resourceGroups/rg-dbsrv-dev/providers/Microsoft.Sql/servers/dbsrv-amtkmr-dev')
resource dbsrvamtkmrdev 'Microsoft.Sql/servers@2021-11-01-preview' = {
  properties: {
    administratorLogin: 'CloudSAca96c399'
    version: '12.0'
    minimalTlsVersion: '1.2'
    publicNetworkAccess: 'Enabled'
    administrators: {
      administratorType: 'ActiveDirectory'
      principalType: 'Group'
      login: 'DBAdmin'
      sid: '455b78e9-5a63-4dd6-a827-b19424431663'
      tenantId: '3322a0cd-1b4f-4f8b-bbe5-c1f04af3d6da'
      azureADOnlyAuthentication: true
    }
    restrictOutboundNetworkAccess: 'Disabled'
  }
  location: 'eastus'
  tags: {
  }
  name: 'dbsrv-amtkmr-dev'
}
@description('Generated from /subscriptions/bba2c874-6268-48fb-b2c2-4b110514f730/resourceGroups/rg-dbsrv-dev/providers/Microsoft.Sql/servers/dbsrv-amtkmr-dev/databases/db-amtkmr-dev')
resource dbamtkmrdev 'Microsoft.Sql/servers/databases@2021-11-01-preview' = {
  sku: {
    name: 'Standard'
    tier: 'Standard'
    capacity: 10
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 268435456000
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Local'
    maintenanceConfigurationId: '/subscriptions/bba2c874-6268-48fb-b2c2-4b110514f730/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
  }
  location: 'eastus'
  tags: {
  }
  name: 'dbsrv-amtkmr-dev/db-amtkmr-dev'
}


