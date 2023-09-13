#New-AzResourceGroup -Name arm-vscode -Location eastus

New-AzResourceGroupDeployment -ResourceGroupName arm-vscode -TemplateFile .\template.json -TemplateParameterFile .\parameters.json -Verbose