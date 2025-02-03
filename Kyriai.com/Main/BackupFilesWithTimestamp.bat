@echo off
:: Batch Script to Backup Important Files with Timestamp

:: Set up backup directory and timestamp
set backupDir=D:\Backups
set timestamp=%date:~-4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%
set timestamp=%timestamp: =0%

:: Display a message
echo ========================================
echo Backup Script Started at %timestamp%
echo ========================================

:: Pause for a moment so user can see the message
timeout /t 2 /nobreak >nul

:: Create backup directory with timestamp
mkdir "%backupDir%\Backup_%timestamp%"
echo Backup folder created: %backupDir%\Backup_%timestamp%

:: Backup Documents and Pictures folders
echo Backing up Documents folder...
xcopy /s /i /e C:\Users\%username%\Documents "%backupDir%\Backup_%timestamp%\Documents" >nul
echo Documents folder backed up.

echo Backing up Pictures folder...
xcopy /s /i /e C:\Users\%username%\Pictures "%backupDir%\Backup_%timestamp%\Pictures" >nul
echo Pictures folder backed up.

:: Backup Desktop folder
echo Backing up Desktop folder...
xcopy /s /i /e C:\Users\%username%\Desktop "%backupDir%\Backup_%timestamp%\Desktop" >nul
echo Desktop folder backed up.

:: Display completion message
echo ========================================
echo Backup Completed Successfully!
echo Backup folder located at: %backupDir%\Backup_%timestamp%
echo ========================================
timeout /t 5 /nobreak >nul
exit
