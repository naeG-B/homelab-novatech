# ==============================================================================
# Script: create-users.ps1
# Description: Automated Creation of OUs and Users in Active Directory
# ==============================================================================

Import-Module ActiveDirectory

$csvPath = "C:\Users\Administrator\Documents\scripts\users-novatech.csv"
$domainDN = "DC=novatech,DC=local"
$defaultPassword = ConvertTo-SecureString "SenhaInicial@2026" -AsPlainText -Force

# Check if CSV file exists
If (!(Test-Path $csvPath)) {
    Write-Host "Error: CSV file not found at $csvPath" -ForegroundColor Red
    Exit
}

$users = Import-Csv -Path $csvPath

Foreach ($user in $users) {
    $ouName = $user.Department
    $ouDN = "OU=$ouName,$domainDN"

    # 1. Create OU if it does not exist
    If (!([ADSI]::Exists("LDAP://$ouDN"))) {
        New-ADOrganizationalUnit -Name $ouName -Path $domainDN
        Write-Host "[+] Organizational Unit created: $ouName" -ForegroundColor Green
    }

    # 2. Create User if the account does not exist
    $userExists = Get-ADUser -Filter "SamAccountName -eq '$($user.Username)'"
    If (!$userExists) {
        New-ADUser `
            -Name "$($user.Firstname) $($user.Lastname)" `
            -GivenName $user.Firstname `
            -Surname $user.Lastname `
            -SamAccountName $user.Username `
            -UserPrincipalName "$($user.Username)@novatech.local" `
            -Path $ouDN `
            -Department $user.Department `
            -Title $user.Title `
            -EmailAddress $user.Email `
            -AccountPassword $defaultPassword `
            -Enabled $true `
            -ChangePasswordAtLogon $true

        Write-Host "[+] User created: $($user.Username) ($($user.Firstname) $($user.Lastname)) in OU $ouName" -ForegroundColor Cyan
    } Else {
        Write-Host "[!] User $($user.Username) already exists. Skipping." -ForegroundColor Yellow
    }
}