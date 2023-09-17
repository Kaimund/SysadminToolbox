# Set-OutlookStationery.ps1
# Copyright (C) 2023 Kaimund
# 
# This script overwrites your stationery in Outlook 2016 and above to that defined by the four variables below
# Use the Get-OutlookStationery script to generate the desired variables
# Once you've populated the data below, upload the script to Intune to deploy on your endpoints

# CHANGE THESE FOUR VARIABLES TO THE DESIRED VALUES
$valueSimple = ""
$valueComposeComplex = ""
$valueReplyComplex = ""
$valueTextComplex = ""

# Main Script
$registryPath = "HKCU:\SOFTWARE\Microsoft\Office\16.0\Common\MailSettings"

# Convert the comma-separated binary to binary that can be saved to the registry
$hexSimple = $valueSimple.Split(',') | ForEach-Object { "0x$_" }
$hexComposeComplex = $valueComposeComplex.Split(',') | ForEach-Object { "0x$_" }
$hexReplyComplex = $valueReplyComplex.Split(',') | ForEach-Object { "0x$_" }
$hexTextComplex = $valueTextComplex.Split(',') | ForEach-Object { "0x$_" }

# Set the registry keys accordingly, creating them if they do not exist
if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Name NewTheme -PropertyType string
    New-ItemProperty -Path $registryPath -Name "ComposeFontSimple" -Value ([byte[]]$hexSimple) -PropertyType Binary -Force
    New-ItemProperty -Path $registryPath -Name "ReplyFontSimple" -Value ([byte[]]$hexSimple) -PropertyType Binary -Force
    New-ItemProperty -Path $registryPath -Name "TextFontSimple" -Value ([byte[]]$hexSimple) -PropertyType Binary -Force
    New-ItemProperty -Path $registryPath -Name "ComposeFontComplex" -Value ([byte[]]$hexComposeComplex) -PropertyType Binary -Force
    New-ItemProperty -Path $registryPath -Name "ReplyFontComplex" -Value ([byte[]]$hexReplyComplex) -PropertyType Binary -Force
    New-ItemProperty -Path $registryPath -Name "TextFontComplex" -Value ([byte[]]$hexTextComplex) -PropertyType Binary -Force
} else {
    Set-ItemProperty -Path $registryPath -Name NewTheme -Value $null
    Set-ItemProperty -Path $registryPath -Name ThemeFont -Value 2
    Set-ItemProperty -Path $registryPath -Name "ComposeFontSimple" -Value ([byte[]]$hexSimple) -Force
    Set-ItemProperty -Path $registryPath -Name "ReplyFontSimple" -Value ([byte[]]$hexSimple) -Force
    Set-ItemProperty -Path $registryPath -Name "TextFontSimple" -Value ([byte[]]$hexSimple) -Force
    Set-ItemProperty -Path $registryPath -Name "ComposeFontComplex" -Value ([byte[]]$hexComposeComplex) -Force
    Set-ItemProperty -Path $registryPath -Name "ReplyFontComplex" -Value ([byte[]]$hexReplyComplex) -Force
    Set-ItemProperty -Path $registryPath -Name "TextFontComplex" -Value ([byte[]]$hexTextComplex) -Force
}