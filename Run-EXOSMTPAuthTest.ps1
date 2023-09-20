# Run-EXOSMTPAuthTest.ps1
# Copyright (C) 2023 Kaimund
# 
# This script attempts to send an email directly from the PC to a specified email address, authenticating with Microsoft 365's SMTP Servers (Exchange Online)
# This is useful for diagnosing network issues with SMTP Auth from MFPs

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

$EmailFrom = Read-Host -Prompt "Email address to send FROM"

$AccPwd = Read-Host -Prompt "Please enter the password for this account" -AsSecureString

$EmailTo = Read-Host -Prompt "Email address to send TO"

$SMTPServer = "smtp.office365.com"

$Subject = "Authenticated SMTP Email Test"
$Body = "This is an email to test whether the network is able to accept authenticated SMTP emails."

Write-Host "Sending email..."

try {
    $SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 587)
    $SMTPClient.EnableSsl = $true
    $SMTPClient.Credentials = New-Object System.Net.NetworkCredential($EmailFrom, $AccPwd)
    $SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)
    Write-Host "Email sent successfully! The send completed without errors."
}
catch {
    Write-Error "Failed to send email. The error was: $_" -CategoryActivity "Sending email"
}
