#==========Deployment Parameters======
$resourceGroupName = 'testRssg'
$location = 'Southeast Asia'
$deploymentName = 'armTemplateDeployment'
$templatePath = 'E:\prasun\azureDeploy.json'

#========Creating Azure Resource Group========
$resourceGroup = Get-AzResourceGroup | Where-Object { $_.ResourceGroupName -eq $resourceGroupName }
if ($resourceGroup -eq $null)
{
  New-AzResourceGroup -Name $resourceGroupName -Location $location -force
}

#========Deploying Azure function template=======
New-AzResourceGroupDeployment -Name $deploymentName -ResourceGroupName $resourceGroupName -TemplateUri $templatePath

