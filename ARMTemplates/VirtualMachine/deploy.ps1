#New-AzResourceGroup -Name arm-vscode -Location eastus

New-AzResourceGroupDeployment -ResourceGroupName test3 -TemplateFile .\template.json -TemplateParameterFile .\parameters.json -Verbose