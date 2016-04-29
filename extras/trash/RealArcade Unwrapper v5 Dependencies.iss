[Setup]
AppName=RealArcade Demo Unwrapper Dependencies v5.1.4
AppVerName=RealArcade Demo Unwrapper Dependencies v5.1.4
DefaultDirName=C:\My Games
OutputBaseFilename=RAWrapperKillerDependencies
OutputDir=C:\URA\rawk\_release\dependencies
SetupIconFile=C:\URA\rawk\icons\rawk5.ico
SolidCompression=true
Compression=none
UseSetupLdr=true
DisableStartupPrompt=true
DisableReadyMemo=true
DisableReadyPage=true
DisableFinishedPage=true
ShowLanguageDialog=no
RestartIfNeededByRun=false
UsePreviousAppDir=false
AppendDefaultDirName=false
UsePreviousGroup=false
AppendDefaultGroupName=false
PrivilegesRequired=none
DirExistsWarning=no
Uninstallable=false
CreateUninstallRegKey=false
WizardImageFile=C:\Program Files\Inno Setup 5\WizModernImage.bmp
WizardSmallImageFile=C:\Program Files\Inno Setup 5\WizModernSmallImage.bmp
VersionInfoVersion=5.1.4
VersionInfoCompany=cRypTiCwaRe
VersionInfoDescription=Unpack ALL RealArcade RGS Games
VersionInfoProductName=RealArcade Wrapper Killer Lite
VersionInfoProductVersion=5.1.4
;LicenseFile=C:\URA\rawk\rawk_license.txt
;InfoBeforeFile=C:\URA\rawk\rawk_license.txt


[Run]
Filename: {app}\RAunWrap.bat; WorkingDir: {app}


[Files]
; Core Wrapper Killer Files
Source: RAunWrap.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden; 
Source: core_advanced_load_options.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_autolaunch.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_backup.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_check_ini_ver.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_clear_cache.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: core_config_ra_player.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_delete_backups.bat; DestDir: {app}; Attribs: Hidden; Flags: deleteafterinstall overwritereadonly; 
Source: core_patch_demo1.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_patch_demo3.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_patch_demo3a.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_patch_demo4.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_patch_demo4a.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_demo_type_check.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_demo_type_override.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_disable_old_reg_hacks.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_dupe_check.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_errorhandling.bat; DestDir: {app}; Attribs: Hidden; Flags: deleteafterinstall overwritereadonly; 
Source: core_cheats.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: core_clean_exe.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_clean_ini.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_clean_main.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: core_clean_pre.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_file_rename.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_game_patch.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_game_unpacked_ok.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_get_stats.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_handler.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_hotkey.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_invalid_folder.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_invalid_folder_gh.bat; DestDir: {app}; Attribs: Hidden; Flags: deleteafterinstall overwritereadonly; 
Source: core_multiple_exe_check.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_no_game_found.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_no_var_fix.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_override.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_patch_ra_db.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_pdf_fix.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_reg_check.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_reg_set.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_restore.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_rga_check.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_rga_download.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_rga_stub_creator.bat; DestDir: {app}; Attribs: Hidden; Flags: deleteafterinstall overwritereadonly; 
Source: core_rgs_loader.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_rgs_pre_release.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_rgs_unlock_license.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_rnarcade_spoofer.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_set_breakpoint.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_set_def_ini.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_set_global.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_shortcut_demo1.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: core_shortcut_demo1a.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_shortcut_demo2.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: core_shortcut_demo3.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: core_shortcut_demo4.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: core_shortcut_demo5.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: core_shortcut_demo6.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: core_shortcut_manual.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: core_show_stats.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_sonic_multi_fix.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_unsupported.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: core_update.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: demo1.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden; 
Source: demo1a.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: demo2.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden; 
Source: demo3.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden; 
Source: demo3a.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: demo4.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden; 
Source: demo4a.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: demo5.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden; 
Source: demo6.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden; 
Source: demoM.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: rawkreset.bat; DestDir: {sys}; Flags: overwritereadonly
Source: rgaload.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: radebug.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: mods.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: multi.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: dlc.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly

; RGS Loader Files
;OLD Loader v1.0
;Source: loader.exe; DestDir: {pf}\unRealArcade\temp; Flags: overwritereadonly

;NEW Loader v2.0
;Source: loader2.exe; DestDir: {pf}\unRealArcade\temp; Flags: overwritereadonly

;RealArcade Spoofer
Source: rnaspoof.exe; DestDir: {pf}\unRealArcade\temp; Flags: overwritereadonly

;RealArcade Mods
;Source: rnamod.exe; DestDir: {pf}\unRealArcade\temp; Flags: overwritereadonly

;RealArcade Uninstaller
;Source: rnuninst.exe; DestDir: {pf}\unRealArcade\temp; Flags: overwritereadonly

; External System Files
Source: sys32\choice.exe; DestDir: {sys}; Flags: onlyifdoesntexist; Attribs: system
Source: sys32\color.exe; DestDir: {sys}; Flags: onlyifdoesntexist; Attribs: system
Source: sys32\cocolor.exe; DestDir: {sys}; Flags: onlyifdoesntexist; Attribs: system
Source: sys32\filver32.exe; DestDir: {sys}; Flags: onlyifdoesntexist; Attribs: system
;Source: sys32\wait.exe; DestDir: {sys}; Flags: onlyifdoesntexist; Attribs: system
Source: sys32\gpatch.exe; DestDir: {sys}; Flags: overwritereadonly
;Source: sys32\bspatch.exe; DestDir: {sys}; Flags: overwritereadonly
;Source: sys32\fsum.exe; DestDir: {sys}; Flags: overwritereadonly
Source: sys32\inifile.exe; DestDir: {sys}; Attribs: hidden; Flags: overwritereadonly
Source: sys32\nircmd.exe; DestDir: {sys}; Flags: onlyifdoesntexist; Attribs: system
Source: sys32\rar.exe; DestDir: {sys}; Flags: overwritereadonly
;Source: sys32\xtimer.exe; DestDir: {sys}; Flags: overwritereadonly
;Source: sys32\GPInstaller.dll; DestDir: {sys}; Flags: overwritereadonly
;Source: sys32\XZipSfx.dll; DestDir: {sys}; Flags: overwritereadonly
;Source: sys32\subfile.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly; 
;Source: sys32\inject.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly; 
;Source: sys32\now.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly; 
;Source: sys32\dummy.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly;
;Source: sys32\setlevel.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly;
;Source: sys32\gcfextr.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly;
Source: sys32\sfk.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly;

; RealArcade Root Folder Overwrite (BLANK DATABASE)
;Source: %RAroot%\db\GAMEFIND.DBF.1; DestDir: {pf}\Real\RealArcade\db; Flags: deleteafterinstall overwritereadonly
;Source: %RAroot%\db\GAMEFIND.DBF.2; DestDir: {pf}\Real\RealArcade\db; Flags: deleteafterinstall overwritereadonly
;Source: %RAroot%\db\GAMEFIND.DBF.3; DestDir: {pf}\Real\RealArcade\db; Flags: deleteafterinstall overwritereadonly

; RealArcade Root Folder Overwrite (CONFIG AND CATALOG GUI)
;Source: %RAroot%\myaccount.ini; DestDir: {pf}\Real\RealArcade; Flags: overwritereadonly
;Source: %RAroot%\myaccount.ini.ORIG; DestDir: {pf}\Real\RealArcade; Flags: onlyifdoesntexist
;Source: %RAroot%\catalog\arcade.cfg; DestDir: {pf}\Real\RealArcade\catalog; Flags: overwritereadonly
;Source: %RAroot%\catalog\arcade.cfg.ORIG; DestDir: {pf}\Real\RealArcade\catalog; Flags: onlyifdoesntexist
;Source: %RAroot%\catalog\coreinfo.cfg; DestDir: {pf}\Real\RealArcade\catalog; Flags: overwritereadonly
;Source: %RAroot%\catalog\coreinfo.cfg.ORIG; DestDir: {pf}\Real\RealArcade\catalog; Flags: onlyifdoesntexist

; RealArcade Root Folder Overwrite (HTML FILES GUI)
;Source: %RAroot%\Html\rawk_ra1_direct_dl.htm; DestDir: {pf}\Real\RealArcade\Html; Attribs: readonly; Flags: overwritereadonly
;Source: %RAroot%\Html\rawk_unwrapped_games.htm; DestDir: {pf}\Real\RealArcade\Html; Attribs: readonly; Flags: overwritereadonly
;Source: %RAroot%\Html\rawk_launch.htm; DestDir: {pf}\Real\RealArcade\Html; Attribs: readonly; Flags: overwritereadonly
;Source: %RAroot%\Html\quicklaunch_plus_rawk_ra1_direct_dl.htm; DestDir: {pf}\Real\RealArcade\Html; Attribs: readonly; Flags: overwritereadonly
;Source: %RAroot%\Html\quicklaunch_plus_rawk_unwrapped_games.htm; DestDir: {pf}\Real\RealArcade\Html; Attribs: readonly; Flags: overwritereadonly
;Source: %RAroot%\Html\quicklaunch_plus_rawk_launch.htm; DestDir: {pf}\Real\RealArcade\Html; Attribs: readonly; Flags: overwritereadonly
;Source: %RAroot%\Html\rawkrgsdl.css; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly
;Source: %RAroot%\Html\rawkdlgradient.png; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly
;Source: %RAroot%\Html\rawkextracterror.png; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly
;Source: %RAroot%\Html\rawkremovedfromservers.png; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly
;Source: %RAroot%\Html\rawkdlavailable.png; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly
;Source: %RAroot%\Html\rawkdldiscontinued.png; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly
;Source: %RAroot%\Html\rawkdlgradient.png; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly
;Source: %RAroot%\Html\rawkdlraghmerger.png; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly
;Source: %RAroot%\Html\rawkdlrgaonly.png; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly
;Source: %RAroot%\Html\rawk_launch.js; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly; Attribs: readonly
;Source: %RAroot%\Html\rawk_logo.png; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly

; RealArcade Root Folder Overwrite (GUI IMAGES)
;Source: %RAroot%\img\137.png; DestDir: {pf}\Real\RealArcade\img; Flags: overwritereadonly
;Source: %RAroot%\img\137.png.ORIG; DestDir: {pf}\Real\RealArcade\img; Flags: onlyifdoesntexist

; Registry Access
Source: registry\rawk_licensekeys.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: registry\rawk_prefs.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: registry\rawk_reset.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: registry\rga_stub_bypass.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: registry\rga_stub_remove.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: registry\rgs_open_default.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly

; Config Files
Source: config\launch.ini; DestDir: {app}; Flags: deleteafterinstall overwritereadonly
Source: config\rawkdb.ini; DestDir: {pf}\unRealArcade\rawk\temp; Flags: overwritereadonly deleteafterinstall
Source: config\dlc.ini; DestDir: {pf}\unRealArcade\rawk\temp; Flags: overwritereadonly deleteafterinstall
Source: config\patch.ini; DestDir: {pf}\unRealArcade\rawk\temp; Flags: overwritereadonly deleteafterinstall
Source: config\rnarcade.ini; DestDir: {pf}\unRealArcade\rawk\temp; Flags: overwritereadonly deleteafterinstall
Source: config\servers.ini; DestDir: {pf}\unRealArcade\rawk\temp; Flags: overwritereadonly deleteafterinstall

; External VBS Scripts
Source: scripts\filesize.vbs; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden

; Cheats
Source: cheats\stj.ini; DestDir: {app}\cheats\; Flags: deleteafterinstall overwritereadonly

; Mods
Source: patches\stj.ini; DestDir: {app}\patches\; Flags: deleteafterinstall overwritereadonly

; Misc Files
Source: cliptemp.txt; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: fix1.tmp; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: fix2.tmp; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: fix3.tmp; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
;Source: rgastub.bin; DestDir: {app}; Flags: deleteafterinstall overwritereadonly
Source: gameInitializer.rgi; DestDir: {app}; Flags: deleteafterinstall overwritereadonly
Source: ghx\n7-89-o9-3r-4t-r9\profile.ini; DestDir: {commonappdata}\n7-89-o9-3r-4t-r9; Flags: overwritereadonly; Attribs: Hidden; 


[Dirs]
Name: {app}\cheats; attribs: hidden; Flags: deleteafterinstall
Name: {app}\patches; attribs: hidden; Flags: deleteafterinstall
Name: {commonappdata}\n7-89-o9-3r-4t-r9; Attribs: Hidden; 


[Registry]
;OLD Loader v1.0
;Root: HKCR; SubKey: RealArcade.rgs.1; ValueType: string; ValueName: ; ValueData: RealArcade Secured Installer
;Root: HKCR; SubKey: RealArcade.rgs.1; ValueType: binary; ValueName: EditFlags; ValueData: 00 00 01 00
;Root: HKCR; SubKey: RealArcade.rgs.1\DefaultIcon; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER\RGSinst.exe,0
;Root: HKCR; SubKey: RealArcade.rgs.1\shell\open\command; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER\RGSinst.exe /m application/vnd.rn-rn_secured_installer %1

;NEW Loader v2.0
Root: HKCR; SubKey: RealArcade.rgs.1; ValueName: @; ValueData: """RGS Loader Install Package"""; ValueType: string;
Root: HKCR; SubKey: RealArcade.rgs.1; ValueName: EditFlags; ValueData: "00 00 01 00"; ValueType: binary;
Root: HKCR; SubKey: RealArcade.rgs.1\DefaultIcon; ValueName: @; ValueData: "C:\\PROGRA~1\\UNREAL~1\\LOADER2\\RGSinst.exe,0"; ValueType: string;
Root: HKCR; SubKey: RealArcade.rgs.1\shell\open\command; ValueName: @; ValueData: """C:\\PROGRA~1\\UNREAL~1\\LOADER2\\RGSinst.cmd %1"""; ValueType: string;
Root: HKCR; SubKey: realarcade\DefaultIcon; ValueName: @; ValueData: "C:\\PROGRA~1\\UNREAL~1\\LOADER2\\RGSinst.exe,0"; ValueType: string;
Root: HKCR; SubKey: realarcade\shell\open\command; ValueName: @; ValueData: """C:\\PROGRA~1\\UNREAL~1\\LOADER2\\RGSinst.cmd %1"""; ValueType: string;
Root: HKCR; SubKey: .rgs; ValueName: "Content Type"; ValueData: "application/vnd.rn-rn_secured_installer"; ValueType: string;
Root: HKCR; SubKey: .rgs; ValueName: "Content Type"; ValueData: "application/vnd.rn-rn_secured_installer"; ValueType: string;
Root: HKCR; SubKey: .mez; ValueName: "Content Type"; ValueData: "application/vnd.rn-rn_game_info"; ValueType: string;
Root: HKCR; SubKey: .mez; ValueName: "Content Type"; ValueData: "application/vnd.rn-rn_game_info"; ValueType: string;
Root: HKCR; SubKey: .rgp; ValueName: "Content Type"; ValueData: "application/vnd.rn-rn_game_package"; ValueType: string;
Root: HKCR; SubKey: .rgp; ValueName: "Content Type"; ValueData: "application/vnd.rn-rn_game_package"; ValueType: string;
Root: HKCR; SubKey: .rgp; ValueName: "Content Type"; ValueData: "application/vnd.rn-rn_game_package"; ValueType: string;
