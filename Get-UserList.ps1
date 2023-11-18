# Get-UserList.ps1
# Copyright (C) 2023 Kaimund
# 
# Get a list of all users in Active Directory, including the user object location, last sign-in time, and whether the user is enabled or not
# Saves the output in a CSV file named users.csv

try { 
    Get-ADUser -Filter * -Properties Enabled,LastLogonDate,CanonicalName | Select-Object Name,GivenName,Surname,UserPrincipalName,Enabled,LastLogonDate,CanonicalName | Export-CSV users.csv -NoTypeInformation
    Write-Output 'User list saved to users.csv'
} catch {
    Write-Error 'Failed to retrieve user list! Please make sure you are running this script on a Windows Server with the Active Directory role installed!'
}