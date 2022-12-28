<#
Outro método para a implantação de recursos é, como já mencionado, usar um modelo do Azure Resource Manager. Um modelo do Resource Manager oferece a você um controle mais granular sobre seus recursos, e a Microsoft fornece um repositório GitHub chamado "Azure-QuickStart-Templates", que hospeda modelos do Azure Resource Manager que você pode referenciar em suas implantações. Um exemplo do PowerShell de implantação de um modelo baseado no GitHub é mostrado abaixo:
#>

#Define Variables for parameters to pass to template
$projectName = Read-Host -Prompt "Enter a project name"
$location = Read-Host -Prompt "Enter an Azure location (i.e. centralus)"
$adminUser = Read-Host -Prompt "Enter the SQL server administrator username"
$adminPassword = Read-Host -Prompt "Enter the SQl server administrator password" -AsSecureString
$resourceGroupName = "${projectName}rg"

#Create Resource Group and Deploy Template to Resource Group
New-AzResourceGroup -Name $resourceGroupName -Location $location

New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName `
 -TemplateUri "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/101-sql-logical-server/azuredeploy.json" `
 -administratorLogin $adminUser -administratorLoginPassword $adminPassword

Read-Host -Prompt "Press [ENTER] to continue ..."