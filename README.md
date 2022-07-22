<h1> Summary </h1>

The following sample template creates 
- resource group
- web app with system managed identity 
- app insights
- App Service Plan Linux 
- web app private endpoint and link to subnet 

<h1> How it works </h1>

login to azure account using below command 

<code> az login </code>

main.bicep is the main module to run and parameters.json is the paramter file to pass 

<code> az deployment sub create -f .\main.bicep -p parameters.json -l eastus </code>

<h1> Refer related links </h1>

https://github.com/amtkmr1990/vnet-biceptemplate

https://github.com/amtkmr1990/bicep_VM_template

https://github.com/amtkmr1990/bicep_azuresqldb_template
