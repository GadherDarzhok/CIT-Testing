# Org Script from: https://community.fabric.microsoft.com/t5/Desktop/Install-Desktop-Power-BI-Using-PowerShell/td-p/3964041 Anonymous creatored the original script.
# Modified by: Tobias Martinsson
# Date: 2025-01-19
# Description: This script downloads and installs Power BI Desktop silently with additional parameters. And then cleans up the installer file.

# Define the URL for downloading Power BI Desktop
$url = "https://download.microsoft.com/download/8/8/0/880BCA75-79DD-466A-927D-1ABF1F5454B0/PBIDesktopSetup_x64.exe"

# Specify the destination path for the downloaded installer
$destination = "C:\Temp\Downloads\PBIDesktop_x64.exe"

# Download the Power BI Desktop installer
Invoke-WebRequest -Uri $url -OutFile $destination

# Define the installation path (optional, change as needed)
$installPath = "C:\Program Files\Power BI Desktop"

# Start the silent installation process with additional parameters
Start-Process -FilePath $destination -ArgumentList "/quiet ACCEPT_EULA=1 INSTALLLOCATION=$installPath" -Wait -NoNewWindow

# Cleanup - Remove the installer after installation
Remove-Item -Path $destination -Force