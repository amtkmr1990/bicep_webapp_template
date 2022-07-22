This IaaC is for Azure and written in bicep language. 
This IaaC can create resource group, web app, app insights, App Service Plan. 

login to azure account using below command 

az login 

main.bicep is the main module to run 

az deployment sub create -f .\main.bicep -l eastus 

