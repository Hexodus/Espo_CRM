@echo off
echo Generating secure passwords for EspoCRM Docker setup...
echo.

powershell -Command "$rootPass = -join ((33..126) | Get-Random -Count 16 | ForEach-Object {[char]$_}); $dbPass = -join ((33..126) | Get-Random -Count 16 | ForEach-Object {[char]$_}); Write-Host 'Generated passwords:'; Write-Host '-------------------'; Write-Host 'MySQL Root Password: ' -NoNewline; Write-Host $rootPass -ForegroundColor Green; Write-Host 'Database Password:  ' -NoNewline; Write-Host $dbPass -ForegroundColor Green; Write-Host ''; Write-Host 'Copy these passwords and update your .env file with them.'; Write-Host ''; Write-Host 'Would you like to automatically update your .env file with these passwords? (y/n)' -ForegroundColor Yellow; $response = Read-Host; if ($response -eq 'y') { $envContent = 'MYSQL_ROOT_PASSWORD=' + $rootPass + [Environment]::NewLine + 'MYSQL_DATABASE_PASSWORD=' + $dbPass; Set-Content -Path '.env' -Value $envContent; Write-Host '.env file has been updated with the new passwords.' -ForegroundColor Green; } else { Write-Host 'No changes were made to your .env file.' -ForegroundColor Yellow; }"

echo.
echo Press any key to exit...
pause > nul
