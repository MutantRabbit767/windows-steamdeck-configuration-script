@echo off
title SteamDeck setup tool

echo Thanks for installing the SteamDeck setup tool for Windows.
echo ,

:drivercheck
set /p option= "Should I install the nessacary drivers? Input y/n:  "
echo,

if "%option%"=="y" (
    goto driverinstallation
) else (
    if "%option%"=="n" (
        goto debloatercheck
    ) else (
        goto drivercheck
    )
)

:driverinstallation
echo Downloading APU Driver. (this may take some time)
echo,
timeout 2
echo,
curl "https://steamdeck-packages.steamos.cloud/misc/windows/drivers/Aerith%%20Windows%%20Driver_2209130944.zip" --output apudriver.zip
echo Download complete, unzipping driver. (this may take some time)
timeout 2 /NOBREAK >cache
powershell -Command "Expand-Archive -Path apudriver.zip"
cls

echo Unzip complete, executing installer.
cd apudriver
cd "Aerith Windows Driver_2209130944"
cd 220913a-383120E-2209130944
start Setup.exe
cd ../../../

echo once you have finish the installation return here and press a key to continue.
timeout 10 /NOBREAK >cache
pause
cls

echo Downloading WI-FI driver.
curl "https://steamdeck-packages.steamos.cloud/misc/windows/drivers/RTLWlanE_WindowsDriver_2024.0.10.137_Drv_3.00.0039_Win11.L.zip" --output wifidriver.zip
echo Download complete, unzipping driver. (this may take some time)
timeout 2 /NOBREAK >cache
powershell -Command "Expand-Archive -Path wifidriver.zip"
cls

echo Unzip complete, executing installer.
cd wifidriver
cd "RTLWlanE_WindowsDriver_2024.0.10.137_Drv_3.00.0039_Win11.L"
start Install.bat
cd ../../

echo once you have finish the installation return here and press a key to continue.
timeout 10 /NOBREAK >cache
pause
cls

echo Downloading bluetooth driver.
curl "https://steamdeck-packages.steamos.cloud/misc/windows/drivers/RTBlueR_FilterDriver_1041.3005_1201.2021_new_L.zip" --output bluetoothdriver.zip
echo Download complete, unzipping driver. (this may take some time)
timeout 2 /NOBREAK >cache
powershell -Command "Expand-Archive -Path bluetoothdriver.zip"
cls

echo Unzip complete, executing installer.
cd bluetoothdriver
cd "RTBlueR_FilterDriver_1041.3005_1201.2021_new_L"
start InstallDriver.cmd
cd ../../

echo once you have finish the installation return here and press a key to continue.
timeout 10 /NOBREAK >cache
pause
cls

echo Downloading SD Card reader driver.
curl "https://steamdeck-packages.steamos.cloud/misc/windows/drivers/BayHub_SD_STOR_installV3.4.01.89_W10W11_logoed_20220228.zip" --output SDCardReaderDriver.zip
echo Download complete, unzipping driver. (this may take some time)
timeout 2 /NOBREAK >cache
powershell -Command "Expand-Archive -Path SDCardReaderDriver.zip"
cls

echo Unzip complete, executing installer.
cd SDCardReaderDriver
cd "BayHub_SD_STOR_ installV3.4.01.89_W10W11_logoed_20220228"
start setup.exe
cd ../../

echo once you have finish the installation return here and press a key to continue.
timeout 10 /NOBREAK >cache
pause
cls

echo Downloading first Audio driver.
curl "https://steamdeck-packages.steamos.cloud/misc/windows/drivers/cs35l41-V1.2.1.0.zip" --output AudioDriver1.zip
echo Download complete, unzipping driver. (this may take some time)
timeout 2 /NOBREAK >cache
powershell -Command "Expand-Archive -Path AudioDriver1.zip"
cls

echo Unzip complete, when the file explorer pops up, please right click cs35l41.inf and click Install.
timeout 2 /NOBREAK >cache
cd AudioDriver1
cd "cs35l41-V1.2.1.0"
explorer .
cd ../../

echo once you have finish the installation return here and press a key to continue.
timeout 10 /NOBREAK >cache
pause
cls

echo Downloading second Audio driver.
curl "https://steamdeck-packages.steamos.cloud/misc/windows/drivers/NAU88L21_x64_1.0.6.0_WHQL%%20-%%20DUA_BIQ_WHQL.zip" --output AudioDriver2.zip
echo Download complete, unzipping driver. (this may take some time)
timeout 2 /NOBREAK >cache
powershell -Command "Expand-Archive -Path AudioDriver2.zip"
cls

echo Unzip complete, when the file explorer pops up, please right click NAU88L21.inf and click Install.
timeout 2 /NOBREAK >cache
cd AudioDriver2
cd "NAU88L21_x64_1.0.6.0_WHQL - DUA_BIQ_WHQL"
explorer .
cd ../../

echo once you have finish the installation return here and press a key to continue.
timeout 10 /NOBREAK >cache
pause
cls
echo Installation finished, cleaning up installation files..
timeout 1 /NOBREAK >cache
rmdir /s /q apudriver
rmdir /s /q wifidriver
rmdir /s /q bluetoothdriver
rmdir /s /q SDCardReaderDriver
rmdir /s /q AudioDriver1
rmdir /s /q AudioDriver2
del /q apudriver.zip
del /q wifidriver.zip
del /q bluetoothdriver.zip
del /q SDCardReaderDriver.zip
del /q AudioDriver1.zip
del /q AudioDriver2.zip
del /q cache
cls
echo All cleaned up!
echo ,

:debloatercheck
set /p option="Should I install a debloater? "
echo,

if "%option%"=="y" (
    goto debloaterinstallation
) else (
    if "%option%"=="n" (
        goto steaminstallationcheck
    ) else (
        goto debloatercheck
    )
)

:debloaterinstallation

echo Downloading debloater.
curl "https://codeload.github.com/Sycnex/Windows10Debloater/zip/refs/heads/master" --output debloater.zip
echo Download complete, unzipping debloater. (this may take some time)
timeout 2 /NOBREAK >cache
powershell -Command "Expand-Archive -Path debloater.zip"
cls

echo Unzip complete, when the window pops up, press "REMOVE BLOATWARE WITH CUSTOM BLOCKLIST", then press "disable" under cortana, after that press "DISABLE TELEMETRY / TASKS", lastly press "REMOVE BLOATWARE KEYS".
echo ,
echo ,
copy .\debloaterdata .\debloater\Windows10Debloater-master\custom-lists.ps1 
timeout 2 /NOBREAK >cache
cd debloater
cd Windows10Debloater-master
powershell -Command "set-executionpolicy remotesigned"
powershell -Command "./Windows10DebloaterGUI.ps1"
powershell -Command "set-executionpolicy default"
cd ../../

cls
echo "Debloat Complete. Cleaning up debloater files."
timeout 1 /NOBREAK >cache
rmdir /s /q debloater
del /q debloater.zip
del /q cache
cls
echo All cleaned up!
echo ,

:steaminstallationcheck
set /p option="Should I install steam? "
echo,

if "%option%"=="y" (
    goto steaminstallation
) else (
    if "%option%"=="n" (
        goto restartcheck
    ) else (
        goto steaminstallationcheck
    )
)

:steaminstallation

curl "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe" --output SteamSetup.exe
echo Download complete, executing installer.
echo ,
start SteamSetup.exe

echo once you have finish the installation return here and press a key to continue.
timeout 10 /NOBREAK >cache
pause
cls
echo Cleaning up installation files.
timeout 1 /NOBREAK >cache
del /q SteamSetup.exe
del /q cache

:restartcheck
set /p option="All finished! Looks like your SteamDeck is ready for Windows. Would you like to restart to complete the installation? "
echo,

if "%option%"=="y" (
    goto restart
) else (
    if "%option%"=="n" (
        goto end
    ) else (
        goto restartcheck
    )
)

:restart 
shutdown /r /t 0

:end