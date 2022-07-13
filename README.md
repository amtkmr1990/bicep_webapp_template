This IaaC is for Azure and written in bicep language. 
This IaaC can create resource group, web app, app insights, App Service Plan. 

login to azure account using below command 

az login 

main.bicep is the main module to run 

az deployment sub create -f .\main.bicep -l eastus 

This command will ask for below parameters 
Please provide string value for 'location' (? for help):  
Please provide string value for 'rgName' (? for help): 
Please provide string value for 'appServiceName' (? for help): 
Please provide string value for 'webAppName' (? for help): 