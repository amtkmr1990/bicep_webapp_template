<h1> Summary </h1>

This IaaC is for Azure and written in bicep language. 
This IaaC can create resource group, web app, app insights, App Service Plan. 

<h1> How it works </h1>

login to azure account using below command 

<code> az login </code>

main.bicep is the main module to run and parameters.json is the paramter file to pass 

<code> az deployment sub create -f .\main.bicep -p parameters.json -l eastus </code>

<h1> Refer related links </h1>

https://github.com/amtkmr1990/vnet-biceptemplate
