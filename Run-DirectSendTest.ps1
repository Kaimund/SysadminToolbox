# Run-DirectSendTest.ps1
# Copyright (C) 2023 Kaimund
# 
# This script attempts to send an email directly from the PC to a specified email address, and displays an error if it fails
# This is useful for diagnosing network issues with Direct Send from MFPs, such as blacklisted IP addresses
# You should ALWAYS use a static IP address if you have devices on the network which rely on direct send

$EmailFrom = Read-Host -Prompt "Email address to send FROM"

$EmailTo = Read-Host -Prompt "Email address to send TO"

$SMTPServer = Read-Host -Prompt "SMTP server to use"

$Subject = "Direct Send Email Test"
$Body = "This is an email to test whether the network is able to accept direct send emails."

Write-Host "Sending email..."

try {
    $SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer, 25)
    $SMTPClient.EnableSsl = $true
    $SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)
    Write-Host "Email sent successfully! The send completed without errors."
}
catch {
    Write-Error "Failed to send email. The error was: $_" -CategoryActivity "Sending email"
}
