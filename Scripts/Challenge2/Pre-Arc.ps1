# This script is used to prepare the Azure Virtual machine for Azure Arc onboarding. THis is only intended for lab purposes and should not be
# used in production. This script will disable the Windows Azure Guest Agent and block access to the Azure Instance Metadata Service (IMDS) endpoint.
#Before running, make sure to remove extensions on the Azure VM.

#Sets variable so the Arc installer will not identify the machine as an Azure VM. 
[System.Environment]::SetEnvironmentVariable("MSFT_ARC_TEST",'true', [System.EnvironmentVariableTarget]::Machine)

#Disables the Windows Azure Guest Agent service 
Set-Service WindowsAzureGuestAgent -StartupType Disabled -Verbose
Start-Sleep -Seconds 2
Stop-Service WindowsAzureGuestAgent -Force -Verbose

#Blocks access to the Azure Instance Metadata Service (IMDS) endpoint.
New-NetFirewallRule -Name BlockAzureIMDS -DisplayName "Block access to Azure IMDS" -Enabled True -Profile Any -Direction Outbound -Action Block -RemoteAddress 169.254.169.254




