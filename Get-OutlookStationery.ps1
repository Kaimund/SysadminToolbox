# Get-OutlookStationery.ps1
# Copyright (C) 2023 Kaimund
# 
# Use this script to extract the binary values of your current stationery template in Outlook 2016 and above and print it to the console
# You can then paste these values into the respective variables in the Set-OutlookStationery.ps1 script

$registryPath = "registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Common\MailSettings"

try {
    Write-Output "Simple:"
    (Get-ItemProperty -Path $registryPath -Name "TextFontSimple" -ErrorAction Stop | Select-Object -ExpandProperty "TextFontSimple" | ForEach-Object { '{0:X2}' -f $_ }) -join ','
    Write-Output "ComposeFontComplex:"
    (Get-ItemProperty -Path $registryPath -Name "ComposeFontComplex" -ErrorAction Stop | Select-Object -ExpandProperty "ComposeFontComplex" | ForEach-Object { '{0:X2}' -f $_ }) -join ','
    Write-Output "ReplyFontComplex:"
    (Get-ItemProperty -Path $registryPath -Name "ReplyFontComplex" -ErrorAction Stop | Select-Object -ExpandProperty "ReplyFontComplex" | ForEach-Object { '{0:X2}' -f $_ }) -join ','
    Write-Output "TextFontComplex:"
    (Get-ItemProperty -Path $registryPath -Name "TextFontComplex" -ErrorAction Stop | Select-Object -ExpandProperty "TextFontComplex" | ForEach-Object { '{0:X2}' -f $_ }) -join ','
} catch {
    Write-Error "Hmm... it doesn't look like there is any custom stationery set in Outlook 2016 or later."
}