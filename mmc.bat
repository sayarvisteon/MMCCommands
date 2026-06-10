@echo off
setlocal enabledelayedexpansion
:: MMC ADB Command Launcher
:: Usage: mmc <command>
:: Commands: home, power, media, etm, tel, vr, vol, tpkpa, tppsi, tpbar, logenable, shortlog, logpull, push

if "%1"=="" goto help
if /i "%1 %2"=="mmc home" goto home
if /i "%1"=="home" goto home
if /i "%1 %2"=="mmc power" goto power
if /i "%1"=="power" goto power
if /i "%1 %2"=="mmc media" goto media
if /i "%1"=="media" goto media
if /i "%1 %2"=="mmc etm" goto etm
if /i "%1"=="etm" goto etm
if /i "%1 %2"=="mmc tel" goto tel
if /i "%1"=="tel" goto tel
if /i "%1 %2"=="mmc vr" goto vr
if /i "%1"=="vr" goto vr
if /i "%1 %2"=="mmc vol" goto vol
if /i "%1"=="vol" goto vol
if /i "%1 %2"=="mmc tpkpa" goto tpkpa
if /i "%1"=="tpkpa" goto tpkpa
if /i "%1 %2"=="mmc tppsi" goto tppsi
if /i "%1"=="tppsi" goto tppsi
if /i "%1 %2"=="mmc tpbar" goto tpbar
if /i "%1"=="tpbar" goto tpbar
if /i "%1 %2"=="mmc shortlog" goto vstlog_enable2
if /i "%1"=="shortlog" goto vstlog_enable2
if /i "%1 %2"=="mmc logenable" goto vstlog_enable
if /i "%1"=="logenable" goto vstlog_enable
if /i "%1 %2"=="mmc logpull" goto vstlog_pull
if /i "%1"=="logpull" goto vstlog_pull
if /i "%1 %2"=="mmc push" goto push_apk
if /i "%1"=="push" goto push_apk
if /i "%1 %2"=="mmc ss" goto ss
if /i "%1"=="ss" goto ss
if /i "%1 %2"=="mmc video" goto video
if /i "%1"=="video" goto video
if /i "%1 %2"=="mmc seeyou" goto seeyou
if /i "%1"=="seeyou" goto seeyou
if /i "%1 %2"=="mmc rvc" goto rvc
if /i "%1"=="rvc" goto rvc
if /i "%1 %2"=="mmc vehtype" goto vehtype
if /i "%1"=="vehtype" goto vehtype
if /i "%1 %2"=="mmc 5p45" goto veh_5p45
if /i "%1"=="5p45" goto veh_5p45
if /i "%1 %2"=="mmc 5p45v" goto veh_5p45v
if /i "%1"=="5p45v" goto veh_5p45v
if /i "%1 %2"=="mmc 5f00" goto veh_5f00
if /i "%1"=="5f00" goto veh_5f00
if /i "%1 %2"=="mmc lhd" goto drv_lhd
if /i "%1"=="lhd" goto drv_lhd
if /i "%1 %2"=="mmc rhd" goto drv_rhd
if /i "%1"=="rhd" goto drv_rhd
if /i "%1 %2"=="mmc setdate" goto setdate
if /i "%1"=="setdate" goto setdate
if /i "%1 %2"=="mmc showtouch" goto showtouch
if /i "%1"=="showtouch" goto showtouch
if /i "%1 %2"=="mmc lang" goto lang
if /i "%1"=="lang" goto lang
if /i "%1 %2"=="mmc gnss" goto gnss
if /i "%1"=="gnss" goto gnss
if /i "%1 %2"=="mmc arabiconly" goto arabiconly
if /i "%1"=="arabiconly" goto arabiconly
goto help

:home
if /i "%2"=="lp" (
    echo [MMC] Sending Home key long press...
    adb shell cmd car_service inject-custom-input 1016
) else (
    echo [MMC] Sending Home key press...
    adb shell cmd car_service inject-custom-input 1016 && adb shell cmd car_service inject-custom-input 1017
)
echo [MMC] Done.
goto end

:power
if /i "%2"=="lp" (
    echo [MMC] Sending Power key long press...
    adb shell cmd car_service inject-custom-input 1012
) else (
    echo [MMC] Sending Power key press...
    adb shell cmd car_service inject-custom-input 1012 && adb shell cmd car_service inject-custom-input 1013
)
echo [MMC] Done.
goto end

:media
if /i "%2"=="lp" (
    echo [MMC] Sending Media key long press...
    adb shell cmd car_service inject-custom-input 1022
) else (
    echo [MMC] Sending Media key press...
    adb shell cmd car_service inject-custom-input 1022 && adb shell cmd car_service inject-custom-input 1023
)
echo [MMC] Done.
goto end

:etm
echo [MMC] Launching ETM Screen...
adb shell am start -n com.mmc.etm/com.mmc.etm.ETMLandingActivity
echo [MMC] ETM launch command sent.
goto end

:tel
if /i "%2"=="lp" (
    echo [MMC] Sending Tel button long press...
    adb shell cmd car_service inject-custom-input 1010
) else (
    echo [MMC] Sending Tel button press...
    adb shell cmd car_service inject-custom-input 1010 && adb shell cmd car_service inject-custom-input 1011
)
echo [MMC] Done.
goto end

:vr
if /i "%2"=="lp" (
    echo [MMC] Sending VR button long press...
    adb shell cmd car_service inject-custom-input 1008
) else (
    echo [MMC] Sending VR button press...
    adb shell cmd car_service inject-custom-input 1008 && adb shell cmd car_service inject-custom-input 1009
)
echo [MMC] Done.
goto end

:vol
if /i "%2"=="lp" (
    echo [MMC] Sending Volume hard key long press...
    adb shell cmd car_service inject-custom-input 1018
) else (
    echo [MMC] Sending Volume hard key press...
    adb shell cmd car_service inject-custom-input 1018 && adb shell cmd car_service inject-custom-input 1019
)
echo [MMC] Done.
goto end

:tpkpa
echo [MMC] Setting Tire Pressure unit to KPA...
adb shell settings put global pressure_set_value 1
echo [MMC] Tire Pressure unit set to KPA.
goto end

:tppsi
echo [MMC] Setting Tire Pressure unit to PSI...
adb shell settings put global pressure_set_value 2
echo [MMC] Tire Pressure unit set to PSI.
goto end

:tpbar
echo [MMC] Setting Tire Pressure unit to Bar...
adb shell settings put global pressure_set_value 3
echo [MMC] Tire Pressure unit set to Bar.
goto end

:vstlog_enable
echo [MMC] Step 1 - Rooting and remounting...
adb root && adb remount
echo [MMC] Step 2 - Rebooting device...
adb reboot
echo [MMC] Step 3 - Waiting for device to come back online...
adb wait-for-device
echo [MMC] Device detected. Waiting 30 seconds for system to stabilize...
timeout /t 30 /nobreak
echo [MMC] Step 4 - Rooting and remounting after reboot...
adb root && adb remount
echo [MMC] Waiting 2 seconds...
timeout /t 2 /nobreak
echo [MMC] Step 5 - Launching VST Logger app...
adb shell am start -n com.visteon.vstlogger/.MainActivity
echo.
echo  ============================================================
echo   VST Logger launched.
echo.
echo   ACTION REQUIRED on the device:
echo     1. Enable "HMI Log" in the VST Logger app
echo     2. Set the desired Log State
echo     3. Once done, perform a POWER CYCLE on the device
echo  ============================================================
echo.
goto end

:vstlog_enable2
echo [MMC] Step 1 - Rooting and remounting...
adb root && adb remount
echo [MMC] Launching VST Logger app...
adb shell am start -n com.visteon.vstlogger/.MainActivity
echo.
echo  ============================================================
echo   VST Logger launched.
echo.
echo   ACTION REQUIRED on the device:
echo     1. Enable "HMI Log" in the VST Logger app
echo     2. Set the desired Log State
echo     3. Once done, perform a POWER CYCLE on the device
echo  ============================================================
echo.
goto end

:vstlog_pull
if "%2"=="" (
    echo [MMC] Usage: mmc logpull ^<filename^>
    echo [MMC] Example: mmc logpull MMC12345-67890
    goto end
)
set "ZIPNAME=%2"
echo [MMC] Step 1 - Rooting and remounting...
adb root && adb remount
echo [MMC] Step 2 - Recording timestamp before pull...
powershell -NoProfile -Command "(Get-Date).ToString('o') | Set-Content '%TEMP%\mmc_pull_time.txt'"
echo [MMC] Step 3 - Pulling VST logs...
adb pull data/vstgloballogcontrol
echo [MMC] Step 4 - Zipping only newly pulled files into %ZIPNAME%.zip ...
powershell -NoProfile -Command "$since = Get-Content '%TEMP%\mmc_pull_time.txt' | Get-Date; $files = Get-ChildItem -Path '.\vstgloballogcontrol' -Recurse -File | Where-Object { $_.LastWriteTime -ge $since -and $_.Name -notlike '*.zip' }; if ($files.Count -eq 0) { Write-Host '[MMC] No new files detected after pull. Zipping entire folder instead...'; $files = Get-ChildItem -Path '.\vstgloballogcontrol' -Recurse -File | Where-Object { $_.Name -notlike '*.zip' } }; Compress-Archive -Path $files.FullName -DestinationPath '.\vstgloballogcontrol\%ZIPNAME%.zip' -Force; Write-Host ('[MMC] Zipped ' + $files.Count + ' files into vstgloballogcontrol\%ZIPNAME%.zip')"
goto end

:push_apk
echo [MMC] Searching for latest app-release.apk under %USERPROFILE%\Downloads ...
set "LATEST_APK="
set "LATEST_TIME=0"
for /r "%USERPROFILE%\Downloads" %%F in (app-release.apk) do (
    if "%%~tF" gtr "!LATEST_TIME!" (
        set "LATEST_TIME=%%~tF"
        set "LATEST_APK=%%F"
    )
)
if "!LATEST_APK!"=="" (
    echo [MMC] No app-release.apk found under %USERPROFILE%\Downloads
    goto end
)
echo [MMC] Found   : !LATEST_APK!
echo [MMC] Modified: !LATEST_TIME!
echo.
set /p USER_INPUT=[MMC] Enter app keyword (e.g. vehicle, audio, phone): 

:: ── REPO DICTIONARY ──────────────────────────────────────────────────────────
:: Each entry: keyword → REPO_NAME + REPO_PATH (/system/priv-app or /system_ext/priv-app)
:: Complete list from device: ls /system/priv-app & ls /system_ext/priv-app
:: ─────────────────────────────────────────────────────────────────────────────
set "REPO_NAME="
set "REPO_PATH="

:: ── /system_ext/priv-app ────────────────────────────────────────────────────
echo !USER_INPUT! | findstr /i "vehicle"      >nul && set "REPO_NAME=MMCVehicleApp"       & set "REPO_PATH=/system_ext/priv-app"
echo !USER_INPUT! | findstr /i "media"        >nul && set "REPO_NAME=MMCMediaPlayer"      & set "REPO_PATH=/system_ext/priv-app"
echo !USER_INPUT! | findstr /i "phone"        >nul && set "REPO_NAME=MMCPhoneApp"         & set "REPO_PATH=/system_ext/priv-app"
echo !USER_INPUT! | findstr /i "setting"      >nul && set "REPO_NAME=MMCSettingApp"       & set "REPO_PATH=/system_ext/priv-app"
echo !USER_INPUT! | findstr /i "gallery"      >nul && set "REPO_NAME=MMCGallery"          & set "REPO_PATH=/system_ext/priv-app"
echo !USER_INPUT! | findstr /i "launcher"     >nul && set "REPO_NAME=MMCLauncherApp"      & set "REPO_PATH=/system_ext/priv-app"
echo !USER_INPUT! | findstr /i "etm"          >nul && set "REPO_NAME=MMCETMApp"           & set "REPO_PATH=/system_ext/priv-app"
echo !USER_INPUT! | findstr /i "camera"       >nul && set "REPO_NAME=MMCCameraApp"        & set "REPO_PATH=/system_ext/priv-app"
echo !USER_INPUT! | findstr /i "systembar"    >nul && set "REPO_NAME=MMCSystemBarApp"     & set "REPO_PATH=/system_ext/priv-app"
echo !USER_INPUT! | findstr /i "dialer"       >nul && set "REPO_NAME=MMCCoreDialer"       & set "REPO_PATH=/system_ext/priv-app"
echo !USER_INPUT! | findstr /i "connectivity" >nul && set "REPO_NAME=MMCConnectivityUIApp" & set "REPO_PATH=/system_ext/priv-app"
echo !USER_INPUT! | findstr /i "swupdate"     >nul && set "REPO_NAME=MMCSWUpdateApp"      & set "REPO_PATH=/system_ext/priv-app"
echo !USER_INPUT! | findstr /i "wallpaper"    >nul && set "REPO_NAME=MMCWallpaperPlayer"  & set "REPO_PATH=/system_ext/priv-app"
echo !USER_INPUT! | findstr /i "callmenu"     >nul && set "REPO_NAME=MCallMenuApp"        & set "REPO_PATH=/system_ext/priv-app"
echo !USER_INPUT! | findstr /i "custominput"  >nul && set "REPO_NAME=MMCCustomInputApp"   & set "REPO_PATH=/system_ext/priv-app"
echo !USER_INPUT! | findstr /i "carsystemui"  >nul && set "REPO_NAME=MMC_CarSystemUI"     & set "REPO_PATH=/system_ext/priv-app"
:: ── /system/priv-app ────────────────────────────────────────────────────────
echo !USER_INPUT! | findstr /i "appstore"     >nul && set "REPO_NAME=MMCAppstore"         & set "REPO_PATH=/system/priv-app"
echo !USER_INPUT! | findstr /i "keyboard"     >nul && set "REPO_NAME=MMCKeyboardApp"      & set "REPO_PATH=/system/priv-app"
:: ── END REPO DICTIONARY ───────────────────────────────────────────────────────

if "!REPO_NAME!"=="" (
    echo [MMC] No matching repo found for "!USER_INPUT!". Update the repo dictionary in mmc.bat.
    goto end
)

echo [MMC] Matched repo  : !REPO_NAME!
echo [MMC] Target path   : !REPO_PATH!/!REPO_NAME!/
for %%F in ("!LATEST_APK!") do set "APK_DIR=%%~dpF"
set "RENAMED_APK=!APK_DIR!!REPO_NAME!.apk"

if exist "!RENAMED_APK!" (
    echo [MMC] Deleting old APK: !RENAMED_APK!
    del /q "!RENAMED_APK!"
)
ren "!LATEST_APK!" "!REPO_NAME!.apk"
echo [MMC] Renamed to    : !RENAMED_APK!
echo [MMC] Rooting and remounting...
adb root && adb remount
echo [MMC] Pushing to device...
adb push "!RENAMED_APK!" !REPO_PATH!/!REPO_NAME!/!REPO_NAME!.apk
echo [MMC] Push complete.
echo [MMC] Syncing...
adb shell sync
adb shell sync
adb shell sync
echo.
echo  ============================================================
echo   Push successful!
echo.
echo   ACTION REQUIRED:
echo     Reboot the device from POWER button
echo  ============================================================
echo.
goto end

:ss
if "%2"=="" (
    set "SS_FILE=screenshot"
    set "SS_COUNT=1"
) else (
    set "SS_FILE=%2"
    if "%3"=="" (
        set "SS_COUNT=1"
    ) else (
        set "SS_COUNT=%3"
    )
)

echo [MMC] Taking !SS_COUNT! screenshot(s)...
if "!SS_COUNT!"=="1" (
    adb exec-out screencap -p > !SS_FILE!.png
    echo [MMC] Captured !SS_FILE!.png
) else (
    for /L %%i in (1,1,!SS_COUNT!) do (
        adb exec-out screencap -p > !SS_FILE!_%%i.png
        echo [MMC] Captured !SS_FILE!_%%i.png
    )
)
echo [MMC] Done.
goto end

:video
if "%2"=="" (
    echo [MMC] Usage: mmc video ^<filename^>
    echo [MMC] Example: mmc video my_recording
    goto end
)
echo [MMC] Recording video to %2.mp4... (Press Ctrl+C in this window to stop recording)
scrcpy.exe --record "%2.mp4"
echo [MMC] Done.
goto end

:showtouch
echo [MMC] Enabling touch indicators...
adb shell settings put system show_touches 1
echo [MMC] Show touches enabled.
goto end

:gnss
echo [MMC] Step 1 - Rooting and remounting...
adb root && adb remount
echo [MMC] Step 2 - Setting GNSS simulation property...
adb shell setprop persist.vendor.gnss.simulation 1
echo [MMC] Step 3 - Rebooting device to apply GNSS simulation...
adb reboot
echo.
echo  ============================================================
echo   GNSS Simulation enabled!
echo   Device is now rebooting... Please wait for it to restart.
echo  ============================================================
echo.
goto end

:setdate
if "%2"=="" (
    echo [MMC] Usage: mmc setdate ^<MM/DD/YYYY^> or ^<M/D/YY^>
    echo [MMC] Example: mmc setdate 06/07/2026
    echo [MMC] Example: mmc setdate 6/7/26
    goto end
)
for /f "tokens=1,2,3 delims=/" %%A in ("%2") do (
    set "IN_MM=%%A"
    set "IN_DD=%%B"
    set "IN_YY=%%C"
)
if "!IN_DD!"=="1" set "IN_DD=01"
if "!IN_DD!"=="2" set "IN_DD=02"
if "!IN_DD!"=="3" set "IN_DD=03"
if "!IN_DD!"=="4" set "IN_DD=04"
if "!IN_DD!"=="5" set "IN_DD=05"
if "!IN_DD!"=="6" set "IN_DD=06"
if "!IN_DD!"=="7" set "IN_DD=07"
if "!IN_DD!"=="8" set "IN_DD=08"
if "!IN_DD!"=="9" set "IN_DD=09"
if "!IN_MM!"=="1" set "IN_MM=01"
if "!IN_MM!"=="2" set "IN_MM=02"
if "!IN_MM!"=="3" set "IN_MM=03"
if "!IN_MM!"=="4" set "IN_MM=04"
if "!IN_MM!"=="5" set "IN_MM=05"
if "!IN_MM!"=="6" set "IN_MM=06"
if "!IN_MM!"=="7" set "IN_MM=07"
if "!IN_MM!"=="8" set "IN_MM=08"
if "!IN_MM!"=="9" set "IN_MM=09"
if "!IN_YY!"=="25" set "IN_YY=2025"
if "!IN_YY!"=="26" set "IN_YY=2026"
if "!IN_YY!"=="27" set "IN_YY=2027"
if "!IN_YY!"=="28" set "IN_YY=2028"
if "!IN_YY!"=="29" set "IN_YY=2029"
if "!IN_YY!"=="30" set "IN_YY=2030"
for /f "tokens=1,2 delims=:" %%H in ("%TIME: =0%") do (
    set "IN_HH=%%H"
    set "IN_MIN=%%I"
)
set "ADB_DATE=!IN_MM!!IN_DD!!IN_HH!!IN_MIN!!IN_YY!.00"
echo [MMC] Rooting and remounting...
adb root && adb remount
echo [MMC] Setting device date: !IN_MM!/!IN_DD!/!IN_YY! !IN_HH!:!IN_MIN!
echo [MMC] ADB format: !ADB_DATE!
adb shell date !ADB_DATE!
echo [MMC] Date set successfully.
goto end

:lang
if "%2"=="" goto lang_menu
set "LANG_BYTE="
set "LANG_NAME="
echo %2 | findstr /i "norq no_rq"        >nul && set "LANG_BYTE=0x00" & set "LANG_NAME=No Request"
echo %2 | findstr /i "japanese"          >nul && set "LANG_BYTE=0x01" & set "LANG_NAME=Japanese"
echo %2 | findstr /i "english"           >nul && set "LANG_BYTE=0x02" & set "LANG_NAME=English"
echo %2 | findstr /i "french"            >nul && set "LANG_BYTE=0x03" & set "LANG_NAME=French"
echo %2 | findstr /i "spanish"           >nul && set "LANG_BYTE=0x04" & set "LANG_NAME=Spanish"
echo %2 | findstr /i "german"            >nul && set "LANG_BYTE=0x05" & set "LANG_NAME=German"
echo %2 | findstr /i "portuguese"        >nul && set "LANG_BYTE=0x06" & set "LANG_NAME=Portuguese"
echo %2 | findstr /i "dutch"             >nul && set "LANG_BYTE=0x07" & set "LANG_NAME=Dutch"
echo %2 | findstr /i "italian"           >nul && set "LANG_BYTE=0x08" & set "LANG_NAME=Italian"
echo %2 | findstr /i "swedish"           >nul && set "LANG_BYTE=0x09" & set "LANG_NAME=Swedish"
echo %2 | findstr /i "danish"            >nul && set "LANG_BYTE=0x0A" & set "LANG_NAME=Danish"
echo %2 | findstr /i "russian"           >nul && set "LANG_BYTE=0x0B" & set "LANG_NAME=Russian"
echo %2 | findstr /i "chinese"           >nul && set "LANG_BYTE=0x0C" & set "LANG_NAME=Chinese"
echo %2 | findstr /i "arabic"            >nul && set "LANG_BYTE=0x0D" & set "LANG_NAME=Arabic"
echo %2 | findstr /i "vietnamese"        >nul && set "LANG_BYTE=0x0E" & set "LANG_NAME=Vietnamese"
echo %2 | findstr /i "malay"             >nul && set "LANG_BYTE=0x0F" & set "LANG_NAME=Malay"
echo %2 | findstr /i "thai"              >nul && set "LANG_BYTE=0x10" & set "LANG_NAME=Thai"
echo %2 | findstr /i "indonesian"        >nul && set "LANG_BYTE=0x11" & set "LANG_NAME=Indonesian"
echo %2 | findstr /i "turkish"           >nul && set "LANG_BYTE=0x12" & set "LANG_NAME=Turkish"
echo %2 | findstr /i "ukrainian"         >nul && set "LANG_BYTE=0x13" & set "LANG_NAME=Ukrainian"
if not defined LANG_BYTE (
    echo [MMC] Unknown language: %2
    goto lang_menu
)
goto lang_inject

:lang_menu
cls
echo ======================================================
echo          MMC DEFAULT LANGUAGE - VHAL INJECT
echo ======================================================
echo  0.  No Request   (0x00)    10. Thai        (0x10)
echo  1.  Japanese     (0x01)    11. Indonesian  (0x11)
echo  2.  English      (0x02)    12. Turkish     (0x12)
echo  3.  French       (0x03)    13. Ukrainian   (0x13)
echo  4.  Spanish      (0x04)
echo  5.  German       (0x05)
echo  6.  Portuguese   (0x06)
echo  7.  Dutch        (0x07)
echo  8.  Italian      (0x08)
echo  9.  Swedish      (0x09)
echo  A.  Danish       (0x0A)
echo  B.  Russian      (0x0B)
echo  C.  Chinese      (0x0C)
echo  D.  Arabic       (0x0D)
echo  E.  Vietnamese   (0x0E)
echo  F.  Malay        (0x0F)
echo  X.  Exit
echo ======================================================
set /p lang_choice="Select language: "
if /i "%lang_choice%"=="0" set "LANG_BYTE=0x00" & set "LANG_NAME=No Request"
if /i "%lang_choice%"=="1" set "LANG_BYTE=0x01" & set "LANG_NAME=Japanese"
if /i "%lang_choice%"=="2" set "LANG_BYTE=0x02" & set "LANG_NAME=English"
if /i "%lang_choice%"=="3" set "LANG_BYTE=0x03" & set "LANG_NAME=French"
if /i "%lang_choice%"=="4" set "LANG_BYTE=0x04" & set "LANG_NAME=Spanish"
if /i "%lang_choice%"=="5" set "LANG_BYTE=0x05" & set "LANG_NAME=German"
if /i "%lang_choice%"=="6" set "LANG_BYTE=0x06" & set "LANG_NAME=Portuguese"
if /i "%lang_choice%"=="7" set "LANG_BYTE=0x07" & set "LANG_NAME=Dutch"
if /i "%lang_choice%"=="8" set "LANG_BYTE=0x08" & set "LANG_NAME=Italian"
if /i "%lang_choice%"=="9" set "LANG_BYTE=0x09" & set "LANG_NAME=Swedish"
if /i "%lang_choice%"=="A" set "LANG_BYTE=0x0A" & set "LANG_NAME=Danish"
if /i "%lang_choice%"=="B" set "LANG_BYTE=0x0B" & set "LANG_NAME=Russian"
if /i "%lang_choice%"=="C" set "LANG_BYTE=0x0C" & set "LANG_NAME=Chinese"
if /i "%lang_choice%"=="D" set "LANG_BYTE=0x0D" & set "LANG_NAME=Arabic"
if /i "%lang_choice%"=="E" set "LANG_BYTE=0x0E" & set "LANG_NAME=Vietnamese"
if /i "%lang_choice%"=="F" set "LANG_BYTE=0x0F" & set "LANG_NAME=Malay"
if /i "%lang_choice%"=="10" set "LANG_BYTE=0x10" & set "LANG_NAME=Thai"
if /i "%lang_choice%"=="11" set "LANG_BYTE=0x11" & set "LANG_NAME=Indonesian"
if /i "%lang_choice%"=="12" set "LANG_BYTE=0x12" & set "LANG_NAME=Turkish"
if /i "%lang_choice%"=="13" set "LANG_BYTE=0x13" & set "LANG_NAME=Ukrainian"
if /i "%lang_choice%"=="X"  goto end
if not defined LANG_BYTE (
    echo [MMC] Invalid selection.
    pause
    goto lang_menu
)

:lang_inject
echo [MMC] Setting Default Language: !LANG_NAME! (!LANG_BYTE!)...
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557957193 -i 0x20 0x03 0x08 0x00 0x00 0x00 0x00 !LANG_BYTE! 0x00 0x00 0x00 0x00"
echo.
echo  ============================================================
echo   Language set to !LANG_NAME!.
echo.
echo   ACTION REQUIRED:
echo     Perform a POWER REBOOT on the device for changes to apply.
echo  ============================================================
echo.
goto end

:arabiconly
echo [MMC] Setting Default Language: Arabic (Custom Byte Sequence)...
adb shell dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557957193 -i 0x20 0x03 0x08 0x00 0x00 0x02 0x00 0x00 0x03 0x00 0x00 0x00
echo.
echo  ============================================================
echo   Language set to Arabic (Custom).
echo.
echo   ACTION REQUIRED:
echo     Perform a POWER REBOOT on the device for changes to apply.
echo  ============================================================
echo.
goto end

:drv_lhd
echo [MMC] Setting Driving Hand: LHD (0x00)...
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557957193 -i 0x20 0x03 0x08 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00"
echo.
echo  ============================================================
echo   Driving Hand set to LHD.
echo.
echo   ACTION REQUIRED:
echo     Perform a POWER REBOOT on the device for changes to apply.
echo  ============================================================
echo.
goto end

:drv_rhd
echo [MMC] Setting Driving Hand: RHD (0x01)...
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557957193 -i 0x20 0x03 0x08 0x00 0x00 0x00 0x01 0x00 0x00 0x00 0x00 0x00"
echo.
echo  ============================================================
echo   Driving Hand set to RHD.
echo.
echo   ACTION REQUIRED:
echo     Perform a POWER REBOOT on the device for changes to apply.
echo  ============================================================
echo.
goto end

:vehtype
cls
echo ======================================================
echo          MMC VEHICLE TYPE - VHAL INJECT
echo ======================================================
echo  1.  5P45   (0x00)
echo  2.  5P45V  (0x01)
echo  3.  5F00   (0x02)
echo  0.  Exit
echo ======================================================
set /p vt_choice="Select vehicle type (0-3): "
if "%vt_choice%"=="1" set "VT_BYTE=0x00" & set "VT_NAME=5P45"
if "%vt_choice%"=="2" set "VT_BYTE=0x01" & set "VT_NAME=5P45V"
if "%vt_choice%"=="3" set "VT_BYTE=0x02" & set "VT_NAME=5F00"
if "%vt_choice%"=="0" goto end
if not defined VT_BYTE (
    echo [MMC] Invalid selection.
    pause
    goto vehtype
)
echo [MMC] Setting Vehicle Type: %VT_NAME% (%VT_BYTE%)...
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557957193 -i 0x20 0x03 0x08 0x00 0x00 %VT_BYTE% 0x00 0x00 0x00 0x00 0x00 0x00"
call :kill_vehicle
echo [MMC] Vehicle Type set to %VT_NAME%.
pause
goto end

:veh_5p45
echo [MMC] Setting Vehicle Type: 5P45 (0x00)...
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557957193 -i 0x20 0x03 0x08 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00"
call :kill_vehicle
echo [MMC] Vehicle Type set to 5P45.
goto end

:veh_5p45v
echo [MMC] Setting Vehicle Type: 5P45V (0x01)...
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557957193 -i 0x20 0x03 0x08 0x00 0x00 0x01 0x00 0x00 0x00 0x00 0x00 0x00"
call :kill_vehicle
echo [MMC] Vehicle Type set to 5P45V.
goto end

:veh_5f00
echo [MMC] Setting Vehicle Type: 5F00 (0x02)...
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557957193 -i 0x20 0x03 0x08 0x00 0x00 0x02 0x00 0x00 0x00 0x00 0x00 0x00"
call :kill_vehicle
echo [MMC] Vehicle Type set to 5F00.
goto end

:kill_vehicle
echo [MMC] Finding com.mmc.vehicle PID...
for /f "tokens=*" %%P in ('adb shell "ps -A | grep com.mmc.vehicle | awk '{print $2}'"') do set "VEH_PID=%%P"
if defined VEH_PID (
    echo [MMC] Killing PID !VEH_PID!...
    adb shell "su 0 kill !VEH_PID!"
    echo [MMC] com.mmc.vehicle killed.
) else (
    echo [MMC] com.mmc.vehicle not found, skipping kill.
)
goto :eof

:seeyou
echo [MMC] Injecting VHAL extended_on x50...
for /L %%i in (1,1,50) do (
    adb shell dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 286265121 -s "extended_on"
)
echo [MMC] Done.
goto end

:rvc
cls
echo ======================================================
echo          MMC RVC TEST - INTERACTIVE MENU
echo ======================================================
echo  1.  Static Guidelines
echo  2.  Dynamic Guidelines
echo  3.  Dynamic Guidelines with Motion
echo  4.  RVC Engage + Hardware Clicks
echo  5.  Launch Camera Settings
echo  6.  SVC Test
echo  7.  Launch ETM Landing Activity
echo  9.  Hysteresis Test
echo  10. Audio Beep
echo  11. ENABLE RVC
echo  12. CLOSE RVC
echo  13. RVC Popup Notification
echo  14. RVC HW Toggle
echo  15. RESET RVC Popup
echo  8.  Exit
echo ======================================================
set /p rvc_choice="Select a use case (1-15): "
if "%rvc_choice%"=="1"  goto rvc_static
if "%rvc_choice%"=="2"  goto rvc_dynamic
if "%rvc_choice%"=="3"  goto rvc_motion
if "%rvc_choice%"=="4"  goto rvc_hwclicks
if "%rvc_choice%"=="5"  goto rvc_camsettings
if "%rvc_choice%"=="6"  goto rvc_svc
if "%rvc_choice%"=="7"  goto rvc_etm
if "%rvc_choice%"=="9"  goto rvc_hysteresis
if "%rvc_choice%"=="10" goto rvc_beep
if "%rvc_choice%"=="11" goto rvc_enable
if "%rvc_choice%"=="12" goto rvc_close
if "%rvc_choice%"=="13" goto rvc_popup
if "%rvc_choice%"=="14" goto rvc_hwtoggle
if "%rvc_choice%"=="15" goto rvc_resetpopup
if "%rvc_choice%"=="8"  goto end
echo [MMC] Invalid selection.
pause
goto rvc

:rvc_resetpopup
echo [MMC] Resetting RVC Popup...
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557957201 -i {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}"
timeout /t 1 >nul
adb shell "cmd car_service inject-custom-input 1014 && cmd car_service inject-custom-input 1015"
echo [MMC] Popup Reset Complete.
pause
goto rvc

:rvc_hwtoggle
echo [MMC] RVC HW Toggle...
adb shell "dumpsys car_service inject-vhal-event 557875300 8"
adb shell "cmd car_service inject-custom-input 1014 && cmd car_service inject-custom-input 1015"
timeout /t 2
adb shell "cmd car_service inject-custom-input 1014 && cmd car_service inject-custom-input 1015"
pause
goto rvc

:rvc_popup
echo [MMC] RVC Popup Notification...
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557957201 -i {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}"
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557957201 -i {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}"
timeout /t 1 >nul
adb shell "cmd car_service inject-custom-input 1014 && cmd car_service inject-custom-input 1015"
pause
goto rvc

:rvc_enable
echo [MMC] Enabling RVC...
adb shell "dumpsys car_service inject-vhal-event 557891680 2"
pause
goto rvc

:rvc_close
echo [MMC] Closing RVC...
adb shell "dumpsys car_service inject-vhal-event 557891680 1"
pause
goto rvc

:rvc_beep
echo [MMC] Audio Beep...
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557891680 -i 2"
timeout /t 1 >nul
for /L %%i in (1,1,4) do (
    adb shell "cmd car_service inject-custom-input 1014 && cmd car_service inject-custom-input 1015"
    timeout /t 1 >nul
)
pause
goto rvc

:rvc_static
echo [MMC] Static Guidelines...
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557957193 -i 0x20 0x03 0x08 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00"
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557957193 -i 0x20 0x04 0x02 0x00 0x04 0x80 0x00"
timeout /t 1 >nul
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557957193 -i 0x20 0x04 0x02 0x00 0x04 0x40"
call :rvc_killcam
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557891680 -i 2"
timeout /t 5
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557891680 -i 1"
pause
goto rvc

:rvc_dynamic
echo [MMC] Dynamic Guidelines...
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557957193 -i 0x20 0x04 0x02 0x00 0x04 0x80"
call :rvc_killcam
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557891680 -i 2"
adb shell settings put global CAMERA_PREDICTIVE_GUIDELINE_STATUS 1
timeout /t 3
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557891680 -i 3"
pause
goto rvc

:rvc_motion
echo [MMC] Dynamic Motion Sequence...
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557957193 -i 0x20 0x04 0x02 0x00 0x04 0x80"
call :rvc_killcam
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557891680 -i 2"
adb shell settings put global CAMERA_PREDICTIVE_GUIDELINE_STATUS 1
for %%v in (-1000 500 -495 485 -475 465 -455 445 -435 425 -415 405 -395 385) do (
    echo Injecting Steering Angle: %%v
    adb shell "dumpsys car_service inject-vhal-event 559972444 %%v"
    ping -n 1 -w 100 127.0.0.1 >nul
)
pause
goto rvc

:rvc_hwclicks
echo [MMC] Hardware Clicks...
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557891680 -i 2"
timeout /t 3
adb shell "cmd car_service inject-custom-input 1014 && cmd car_service inject-custom-input 1015"
timeout /t 2
adb shell "cmd car_service inject-custom-input 1014 && cmd car_service inject-custom-input 1015"
timeout /t 2
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557891680 -i 9"
pause
goto rvc

:rvc_camsettings
echo [MMC] Camera Settings Toggle...
adb shell "cmd car_service inject-custom-input 1014 && cmd car_service inject-custom-input 1015"
timeout /t 5
adb shell "cmd car_service inject-custom-input 1014 && cmd car_service inject-custom-input 1015"
pause
goto rvc

:rvc_svc
echo [MMC] SVC Transition...
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557957193 -i 0x20 0x03 0x08 0x00 0x00 0x00 0x04 0x00 0x00 0x00 0x00 0x00"
call :rvc_killcam
adb shell "dumpsys car_service inject-vhal-event 557875204 1"
timeout /t 3
adb shell "dumpsys car_service inject-vhal-event 557875204 0"
pause
goto rvc

:rvc_etm
echo [MMC] Launching ETM Landing Activity...
adb shell am start -n com.mmc.etm/.ETMLandingActivity
pause
goto rvc

:rvc_hysteresis
echo [MMC] Hysteresis Testing...
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557891680 -i 2"
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557891680 -i 9"
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557891680 -i 10"
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557891680 -i 9"
timeout /t 3
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557891680 -i 2"
timeout /t 2
adb shell "dumpsys android.hardware.automotive.vehicle.IVehicle/default --set 557891680 -i 9"
pause
goto rvc

:rvc_killcam
echo [MMC] Killing com.mmc.camera...
adb shell "ps -A | grep com.mmc.camera | awk '{print $2}' | xargs su 0 kill"
timeout /t 3 >nul
goto :eof

:help
echo.
echo  MMC ADB Command Launcher
echo  ------------------------
echo  Usage: mmc ^<command^>
echo.
echo  Available commands:
echo    mmc home [lp]     -  Home key press (add lp for Long Press)
echo    mmc power [lp]    -  Power key press (add lp for Long Press)
echo    mmc media [lp]    -  Media key press (add lp for Long Press)
echo    mmc etm           -  Launch ETM Screen
echo    mmc tel [lp]      -  Tel button press (add lp for Long Press)
echo    mmc vr [lp]       -  VR button press (add lp for Long Press)
echo    mmc vol [lp]      -  Volume hard key press (add lp for Long Press)
echo    mmc tpkpa         -  Tire Pressure unit: KPA
echo    mmc tppsi         -  Tire Pressure unit: PSI
echo    mmc tpbar         -  Tire Pressure unit: Bar
echo    mmc logenable     -  Enable VST logging (root+remount+reboot+root+remount+wait+launch)
echo    mmc shortlog      -  Enable VST logging, skip reboot (root+remount+launch)
echo    mmc logpull ^<name^>  -  Pull VST logs, zip latest pulled files as ^<name^>.zip
echo    mmc push          -  Find latest app-release.apk, match repo, rename and adb push
echo    mmc ss ^<filename^> ^<N^> -  Take N screenshots, optionally named ^<filename^>.png
echo    mmc video ^<filename^> -  Record screen via scrcpy and save to ^<filename^>.mp4
echo    mmc seeyou        -  Inject VHAL extended_on x50
echo    mmc rvc           -  Open RVC interactive test menu
echo    mmc lhd           -  Set Driving Hand to LHD (0x00) + power reboot prompt
echo    mmc rhd           -  Set Driving Hand to RHD (0x01) + power reboot prompt
echo    mmc lang          -  Set Default Language interactively
echo    mmc lang ^<name^>   -  Set language directly  e.g. mmc lang english
echo    mmc arabiconly    -  Set Arabic using custom byte sequence
echo    mmc setdate ^<MM/DD/YYYY^>  -  Set device date (US format)  e.g. mmc setdate 06/07/2026
echo    mmc showtouch     -  Enable touch indicators on screen
echo    mmc gnss          -  Enable GNSS simulation (sets prop and reboots device)
echo    mmc 5p45          -  Inject VEH_TYPE 5P45  (0x00) + kill com.mmc.vehicle
echo    mmc 5p45v         -  Inject VEH_TYPE 5P45V (0x01) + kill com.mmc.vehicle
echo    mmc 5f00          -  Inject VEH_TYPE 5F00  (0x02) + kill com.mmc.vehicle
echo.

:end
