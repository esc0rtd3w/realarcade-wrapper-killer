[Setup]
AppName=RealArcade Demo Unwrapper v5.7.1
AppVerName=RealArcade Demo Unwrapper v5.7.1
DefaultDirName=C:\My Games
OutputBaseFilename=RAWrapperKiller
OutputDir=..\..\release
SetupIconFile=..\icons\rawk5.ico
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
;PrivilegesRequired=none
PrivilegesRequired=admin
DirExistsWarning=no
Uninstallable=false
CreateUninstallRegKey=false
WizardImageFile=inno\WizModernImage.bmp
WizardSmallImageFile=inno\WizModernSmallImage.bmp
VersionInfoVersion=5.7.1
VersionInfoCompany=cRypTiCwaRe
VersionInfoDescription=Unpack ALL RealArcade/Gamehouse RGS/RGA/RFS Games
VersionInfoProductName=RealArcade Wrapper Killer
VersionInfoProductVersion=5.7.1
;LicenseFile=..\rawk_license.txt
;InfoBeforeFile=..\rawk_info.txt


[Run]
Filename: {app}\RAunWrap.cmd; WorkingDir: {app}


[Files]

; Embed the Wrapper Killer itself (this is so it can be launched after game extraction locally)
; This must be built without embed and then place that built file in \embed\ and rebuild with embed on
;Source: ..\_release\embed\rawk.exe; DestDir: "C:\Program Files\unRealArcade"; Flags: overwritereadonly


; Copy the source EXE to unRealArcade folder (this obsoletes the above EMBED duplication)
; Using batch files to do this (added 20131030)



; Core Wrapper Killer Files
Source: ..\RAunWrap.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_advanced_load_options.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_am_instant_server.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_autolaunch.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_backup.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_check_dependencies.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_check_exit_status.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_check_ini_ver.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_check_local_rawk.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_check_non_rgs.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_clear_cache.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_config_ra_player.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_delete_backups.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_patch_demo1.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_patch_demo3.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_patch_demo3a.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_patch_demo4.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_patch_demo4a.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_patch_demoGH.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_patch_demoZY.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_demo_type_check.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_demo_type_override.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_disable_old_reg_hacks.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_dlc.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_dupe_check.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_errorhandling.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_cheats.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_clean_exe.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_clean_gh.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_clean_reg_hacks.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_clean_zy.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_clean_ini.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_clean_main.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_clean_pre.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_debug.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_file_rename.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_game_patch.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_gamehouse_hotkey.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_gamehouse_main.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_gamehouse_override.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_game_unpacked_ok.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_get_demo_type.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_get_stats.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_gh_web_scraper.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_ghx_install.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_ghx_reset.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_handler.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_hotkey.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_ini_output.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_invalid_folder.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_invalid_folder_gh.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_invalid_folder_zylom.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_licensing_activemark.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_licensing_gamehouse.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_licensing_main.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_licensing_realarcade.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_licensing_zylom.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_mods.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_multicmp.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_multiple_exe_check.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_no_game_found.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_no_var_fix.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_override.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_patch_ra_db.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_pdf_fix.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_rawk_cleanup_loader.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_rawk_cleanup_root.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_rawk_unpack.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_reg_check.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_reg_set.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_restore.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_rfs_stub_info.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_rga_download.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_stub_creator.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
;Source: ..\core_rga_stub_creator.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
;Source: ..\core_rga_stub_creator.cmd; DestDir: "C:\Program Files\unRealArcade\rga\"; Flags: overwritereadonly
Source: ..\core_rga_stub_info.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
;Source: ..\core_rga_stub_info.cmd; DestDir: "C:\Program Files\unRealArcade\rga\"; Flags: overwritereadonly

; Mac OSX DMG Support
Source: ..\core_dmg_loader.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly

; Newer 2015/2016 RFS Activemark Support
Source: ..\core_rfs_loader.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly

Source: ..\core_rgs_game_patcher.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_rgs_loader.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_rgs_pre_release.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_rgs_unlock_license.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_rnarcade_spoofer.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_set_breakpoint.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_set_def_ini.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_set_global.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_shortcut_demo1.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_shortcut_demo1a.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_shortcut_demo2.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_shortcut_demo3.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_shortcut_demo4.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_shortcut_demo5.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_shortcut_demo6.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_shortcut_manual.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_shortcut_demoGH.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_shortcut_demoZY.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_show_stats.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_sonic_multi_fix.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_unsupported.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_update.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_zylom_hotkey.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_zylom_main.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_zylom_override.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\demo1.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\demo1a.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\demo2.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\demo3.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\demo3a.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\demo4.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\demo4a.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\demo5.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\demo6.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\demoM.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\demoGH.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\demoZY.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly



; All Loaders

; RGS Loader v1.0
Source: ..\loaders\loaderRGSv1.exe; DestDir: "C:\Program Files\unRealArcade\temp"; Flags: overwritereadonly

; RGS Loader v2.0
Source: ..\loaders\loaderRGSv2.exe; DestDir: "C:\Program Files\unRealArcade\temp"; Flags: overwritereadonly

; RGA Loader Files
Source: ..\loaders\loaderRGA.exe; DestDir: "C:\Program Files\unRealArcade\temp"; Flags: overwritereadonly

; DMG Loader Files
Source: ..\loaders\loaderDMG.exe; DestDir: "C:\Program Files\unRealArcade\temp"; Flags: overwritereadonly

; RFS Loader Files
Source: ..\loaders\loaderRFS.exe; DestDir: "C:\Program Files\unRealArcade\temp"; Flags: overwritereadonly

; AMI Loader Files
Source: ..\loaders\loaderAMI.exe; DestDir: "C:\Program Files\unRealArcade\temp"; Flags: overwritereadonly



;RealArcade Spoofer
Source: ..\rna\rnaspoof.exe; DestDir: "C:\Program Files\unRealArcade\temp"; Flags: overwritereadonly

;RealArcade Mods
Source: ..\rna\rnamod.exe; DestDir: "C:\Program Files\unRealArcade\temp"; Flags: overwritereadonly
Source: ..\rna\rnamod-x64.exe; DestDir: "C:\Program Files\unRealArcade\temp"; Flags: overwritereadonly

;RealArcade Restore RA Player
Source: ..\rna\rnarestore.exe; DestDir: "C:\Program Files\unRealArcade\temp"; Flags: overwritereadonly
Source: ..\rna\rnarestore-x64.exe; DestDir: "C:\Program Files\unRealArcade\temp"; Flags: overwritereadonly

;RealArcade Uninstaller
Source: ..\rna\rnuninst.exe; DestDir: "C:\Program Files\unRealArcade\temp"; Flags: overwritereadonly

;RealArcade Downloader (Default) (Will Load on Both x86 and x64 Platforms)
Source: ..\gui\uradl.exe; DestDir: "C:\Program Files\unRealArcade\temp"; Flags: overwritereadonly

;RealArcade Downloader (64-bit) (Obsoleted 20160526)
;Source: ..\gui\uradl-x64.exe; DestDir: "C:\Program Files\unRealArcade\temp"; Flags: overwritereadonly


; AM Instant Server
Source: ..\services\ami\aminstantservice.exe; DestDir: "C:\Program Files\unRealArcade\services\ami"; Flags: overwritereadonly

; GH Web Scraper
Source: ..\tools\GHWebScraper\bin\Release\GHWebScraper.exe; DestDir: "C:\Program Files\unRealArcade\tools"; Flags: overwritereadonly

; URA Web Browser
Source: ..\tools\URABrowser\Debug\URABrowser.exe; DestDir: "C:\Program Files\unRealArcade\tools"; Flags: overwritereadonly

; AM Instant Injector
Source: ..\tools\AMInjector\Debug\AMInjector.exe; DestDir: "C:\Program Files\unRealArcade\tools"; Flags: overwritereadonly

; AM Game Monitor
Source: ..\tools\AMI_Game_Monitor\Debug\AMI_Game_Monitor.exe; DestDir: "C:\Program Files\unRealArcade\tools"; Flags: overwritereadonly

; Game Lists
Source: ..\gamelist\am-instant.txt; DestDir: "C:\Program Files\unRealArcade\gamelist"; Flags: overwritereadonly
Source: ..\gamelist\content-id.txt; DestDir: "C:\Program Files\unRealArcade\gamelist"; Flags: overwritereadonly
Source: ..\gamelist\names-DE.txt; DestDir: "C:\Program Files\unRealArcade\gamelist"; Flags: overwritereadonly
Source: ..\gamelist\names-EN.txt; DestDir: "C:\Program Files\unRealArcade\gamelist"; Flags: overwritereadonly
Source: ..\gamelist\names-ES.txt; DestDir: "C:\Program Files\unRealArcade\gamelist"; Flags: overwritereadonly
Source: ..\gamelist\names-FR.txt; DestDir: "C:\Program Files\unRealArcade\gamelist"; Flags: overwritereadonly
Source: ..\gamelist\names-IT.txt; DestDir: "C:\Program Files\unRealArcade\gamelist"; Flags: overwritereadonly
Source: ..\gamelist\names-JP.txt; DestDir: "C:\Program Files\unRealArcade\gamelist"; Flags: overwritereadonly
Source: ..\gamelist\names-NL.txt; DestDir: "C:\Program Files\unRealArcade\gamelist"; Flags: overwritereadonly

; Unix Utilities
Source: ..\sys32\unix-utils.exe; DestDir: "C:\Program Files\unRealArcade\temp"; Flags: overwritereadonly


; External System Files (Local)
;Source: ..\sys32\choice.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\color.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\cocolor.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\ctext.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\filver32.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\wait.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\gpatch.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\bspatch.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\fsum.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\inifile.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\nircmd.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\rar.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\xtimer.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\GPInstaller.dll; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\XZipSfx.dll; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\subfile.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\inject.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\nop.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\now.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\dummy.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\setlevel.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\gcfextr.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\sfk.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\qgrep.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\tail.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\Unlocker.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\UnlockerCOM.dll; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\UnlockerDriver5.sys; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\wun.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\innounp.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\lua\luac.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\lua\luadec.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\uniq.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\hidecon.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\hideexec.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\quiet.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;

; External System Files (System)
Source: ..\sys32\choice.exe; DestDir: {sys}; Flags: onlyifdoesntexist; Attribs: system
Source: ..\sys32\color.exe; DestDir: {sys}; Flags: onlyifdoesntexist; Attribs: system
Source: ..\sys32\cocolor.exe; DestDir: {sys}; Flags: onlyifdoesntexist; Attribs: system
Source: ..\sys32\ctext.exe; DestDir: {sys}; Flags: onlyifdoesntexist; Attribs: system
Source: ..\sys32\filver32.exe; DestDir: {sys}; Flags: onlyifdoesntexist; Attribs: system
Source: ..\sys32\wait.exe; DestDir: {sys}; Flags: onlyifdoesntexist; Attribs: system
Source: ..\sys32\gpatch.exe; DestDir: {sys}; Flags: overwritereadonly
Source: ..\sys32\bspatch.exe; DestDir: {sys}; Flags: overwritereadonly
Source: ..\sys32\fsum.exe; DestDir: {sys}; Flags: overwritereadonly
Source: ..\sys32\inifile.exe; DestDir: {sys}; Attribs: hidden; Flags: overwritereadonly
Source: ..\sys32\nircmd.exe; DestDir: {sys}; Flags: onlyifdoesntexist; Attribs: system
Source: ..\sys32\rar.exe; DestDir: {sys}; Flags: overwritereadonly
Source: ..\sys32\xtimer.exe; DestDir: {sys}; Flags: overwritereadonly
Source: ..\sys32\GPInstaller.dll; DestDir: {sys}; Flags: overwritereadonly
Source: ..\sys32\XZipSfx.dll; DestDir: {sys}; Flags: overwritereadonly
Source: ..\sys32\subfile.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\inject.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\nop.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\now.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\dummy.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\setlevel.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\gcfextr.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\sfk.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\qgrep.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\tail.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\Unlocker.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\UnlockerCOM.dll; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\UnlockerDriver5.sys; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\wun.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\innounp.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\wget.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
;Source: ..\sys32\lua\luac.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
;Source: ..\sys32\lua\luadec.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\uniq.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
;Source: ..\sys32\hidecon.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
;Source: ..\sys32\hideexec.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\quiet.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\sevenZ.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly

; Tasklist and Taskkill (Local)
; Fixes game termination problems for an OS like Windows XP Home Edition
;Source: ..\sys32\taskkill.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\tasklist.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;

; Tasklist and Taskkill (System)
; Fixes game termination problems for an OS like Windows XP Home Edition
Source: ..\sys32\taskkill.exe; DestDir: {sys}; Attribs: System; Flags: onlyifdoesntexist
Source: ..\sys32\tasklist.exe; DestDir: {sys}; Attribs: System; Flags: onlyifdoesntexist

; FireCMD Utilities (Local)
;Source: ..\sys32\fcmd\getdecimal.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\fcmd\getdir.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\fcmd\getint.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\fcmd\getpassword.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\fcmd\gettext.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\fcmd\kill.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\fcmd\openfile.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\fcmd\pathc.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\fcmd\savefile.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;

; FireCMD Utilities (System)
;Source: ..\sys32\fcmd\getdecimal.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
;Source: ..\sys32\fcmd\getdir.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
;Source: ..\sys32\fcmd\getint.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
;Source: ..\sys32\fcmd\getpassword.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
;Source: ..\sys32\fcmd\gettext.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
;Source: ..\sys32\fcmd\fckill.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
;Source: ..\sys32\fcmd\openfile.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
;Source: ..\sys32\fcmd\pathc.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
;Source: ..\sys32\fcmd\savefile.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly

; QT DLL's (Local)
;Source: ..\sys32\fcmd\QtCore4.dll; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
;Source: ..\sys32\fcmd\QtGui4.dll; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly

; QT DLL's (System)
;Source: ..\sys32\fcmd\QtCore4.dll; DestDir: {sys}; Attribs: System; Flags: onlyifdoesntexist
;Source: ..\sys32\fcmd\QtGui4.dll; DestDir: {sys}; Attribs: System; Flags: onlyifdoesntexist



; RealArcade Root Folder Overwrite (BLANK DATABASE)
;Source: ..\%RAroot%\db\GAMEFIND.DBF.1; DestDir: "C:\Program Files\Real\RealArcade\db"; Flags: deleteafterinstall overwritereadonly
;Source: ..\%RAroot%\db\GAMEFIND.DBF.2; DestDir: "C:\Program Files\Real\RealArcade\db"; Flags: deleteafterinstall overwritereadonly
;Source: ..\%RAroot%\db\GAMEFIND.DBF.3; DestDir: "C:\Program Files\Real\RealArcade\db"; Flags: deleteafterinstall overwritereadonly

; RealArcade Root Folder Overwrite (CONFIG AND CATALOG GUI)
;Source: ..\%RAroot%\myaccount.ini; DestDir: "C:\Program Files\Real\RealArcade"; Flags: overwritereadonly
;Source: ..\%RAroot%\myaccount.ini.ORIG; DestDir: "C:\Program Files\Real\RealArcade"; Flags: onlyifdoesntexist
;Source: ..\%RAroot%\catalog\arcade.cfg; DestDir: "C:\Program Files\Real\RealArcade\catalog"; Flags: overwritereadonly
;Source: ..\%RAroot%\catalog\arcade.cfg.ORIG; DestDir: "C:\Program Files\Real\RealArcade\catalog"; Flags: onlyifdoesntexist
;Source: ..\%RAroot%\catalog\coreinfo.cfg; DestDir: "C:\Program Files\Real\RealArcade\catalog"; Flags: overwritereadonly
;Source: ..\%RAroot%\catalog\coreinfo.cfg.ORIG; DestDir: "C:\Program Files\Real\RealArcade\catalog"; Flags: onlyifdoesntexist

; RealArcade Root Folder Overwrite (HTML FILES GUI)
;Source: ..\%RAroot%\Html\rawk_ra1_direct_dl.htm; DestDir: "C:\Program Files\Real\RealArcade\Html; Attribs: readonly"; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawk_unwrapped_games.htm; DestDir: "C:\Program Files\Real\RealArcade\Html; Attribs: readonly"; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawk_launch.htm; DestDir: "C:\Program Files\Real\RealArcade\Html; Attribs: readonly"; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\quicklaunch_plus_rawk_ra1_direct_dl.htm; DestDir: "C:\Program Files\Real\RealArcade\Html; Attribs: readonly"; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\quicklaunch_plus_rawk_unwrapped_games.htm; DestDir: "C:\Program Files\Real\RealArcade\Html; Attribs: readonly"; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\quicklaunch_plus_rawk_launch.htm; DestDir: "C:\Program Files\Real\RealArcade\Html; Attribs: readonly"; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawkrgsdl.css; DestDir: "C:\Program Files\Real\RealArcade\Html"; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawkdlgradient.png; DestDir: "C:\Program Files\Real\RealArcade\Html"; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawkextracterror.png; DestDir: "C:\Program Files\Real\RealArcade\Html"; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawkremovedfromservers.png; DestDir: "C:\Program Files\Real\RealArcade\Html"; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawkdlavailable.png; DestDir: "C:\Program Files\Real\RealArcade\Html"; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawkdldiscontinued.png; DestDir: "C:\Program Files\Real\RealArcade\Html"; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawkdlgradient.png; DestDir: "C:\Program Files\Real\RealArcade\Html"; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawkdlraghmerger.png; DestDir: "C:\Program Files\Real\RealArcade\Html"; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawkdlrgaonly.png; DestDir: "C:\Program Files\Real\RealArcade\Html"; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawk_launch.js; DestDir: "C:\Program Files\Real\RealArcade\Html"; Flags: overwritereadonly; Attribs: readonly
;Source: ..\%RAroot%\Html\rawk_logo.png; DestDir: "C:\Program Files\Real\RealArcade\Html"; Flags: overwritereadonly

; RealArcade Root Folder Overwrite (GUI IMAGES)
;Source: ..\%RAroot%\img\137.png; DestDir: "C:\Program Files\Real\RealArcade\img"; Flags: overwritereadonly
;Source: ..\%RAroot%\img\137.png.ORIG; DestDir: "C:\Program Files\Real\RealArcade\img"; Flags: onlyifdoesntexist

; Registry Access
Source: ..\registry\rawk_licensekeys.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\registry\rawk_prefs.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\registry\rawk_reset.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\registry\rga_stub_bypass.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\registry\rga_stub_remove.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\registry\rgs_open_default.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly

; AMI Service Registry
Source: ..\registry\ami-launch-fix-32.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\registry\ami-launch-fix-64.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\registry\ami-launch-fix-remove.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\registry\ami-remove-all.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\registry\ami-remove-licensing.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly

; Config Files
Source: ..\config\launch.ini; DestDir: {app}; Flags: deleteafterinstall overwritereadonly
Source: ..\config\rawkdb.ini; DestDir: "C:\Program Files\unRealArcade\rawk\temp"; Flags: overwritereadonly deleteafterinstall
Source: ..\config\dlc.ini; DestDir: "C:\Program Files\unRealArcade\rawk\temp"; Flags: overwritereadonly deleteafterinstall
Source: ..\config\patch.ini; DestDir: "C:\Program Files\unRealArcade\rawk\temp"; Flags: overwritereadonly deleteafterinstall
Source: ..\config\rnarcade.ini; DestDir: "C:\Program Files\unRealArcade\rawk\temp"; Flags: overwritereadonly deleteafterinstall
Source: ..\config\servers.ini; DestDir: "C:\Program Files\unRealArcade\rawk\temp"; Flags: overwritereadonly deleteafterinstall
Source: ..\config\stub.ini; DestDir: "C:\Program Files\unRealArcade\rawk\temp"; Flags: overwritereadonly deleteafterinstall
Source: ..\config\ghdb.ini; DestDir: "C:\Program Files\unRealArcade\rawk\temp"; Flags: overwritereadonly deleteafterinstall
Source: ..\config\zydb.ini; DestDir: "C:\Program Files\unRealArcade\rawk\temp"; Flags: overwritereadonly deleteafterinstall

; External VBS Scripts
Source: ..\scripts\filesize.vbs; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden

; Cheats
Source: ..\cheats\stj.ini; DestDir: {app}\cheats\; Flags: deleteafterinstall overwritereadonly

; Mods / Patches (Windows)
;Source: ..\patches\windows\.ini; DestDir: {win}; Flags: overwritereadonly

; Humongous Games (Register Screen Bypass)
Source: ..\patches\windows\hegames.ini; DestDir: {win}; Flags: overwritereadonly

; Mods / Patches (System32)
;Source: ..\patches\system32\.ini; DestDir: {sys}; Flags: overwritereadonly

; Mods / Patches (Game)
Source: ..\patches\Puzzler World 2.ini; DestDir: {app}\patches\; Flags: deleteafterinstall overwritereadonly
Source: ..\patches\stj.ini; DestDir: {app}\patches\; Flags: deleteafterinstall overwritereadonly
Source: ..\patches\Yahtzee.ini; DestDir: {app}\patches\; Flags: deleteafterinstall overwritereadonly

; GHX Specific
Source: ..\ghx\n7-89-o9-3r-4t-r9\profile.ini; DestDir: {commonappdata}\n7-89-o9-3r-4t-r9; Flags: overwritereadonly
Source: ..\ghx\92-75-56-55-p5-r9\profile.ini; DestDir: {commonappdata}\92-75-56-55-p5-r9; Flags: overwritereadonly
;Source: ..\ghx\ghx_reset.cmd; DestDir: {commonappdata}\n7-89-o9-3r-4t-r9\; Flags: overwritereadonly
;Source: ..\ghx\ghx_reset.cmd; DestDir: {commonappdata}\92-75-56-55-p5-r9\; Flags: overwritereadonly
Source: ..\ghx\ghx_reset.cmd; DestDir: "C:\Program Files\unRealArcade\ghx\"; Flags: overwritereadonly
Source: ..\ghx\ghx_reset_dev.cmd; DestDir: "C:\Program Files\unRealArcade\ghx\"; Flags: overwritereadonly
Source: ..\ghx\ghx_install.cmd; DestDir: "C:\Program Files\unRealArcade\ghx\"; Flags: overwritereadonly
Source: ..\ghx\WINDOWS\win.ini; DestDir: {win}; Flags: overwritereadonly
Source: ..\ghx\ghx_countdown.txt; DestDir: "C:\Program Files\unRealArcade\ghx\"; Flags: overwritereadonly
Source: ..\ghx\ghx_countdown_minutes_values.txt; DestDir: "C:\Program Files\unRealArcade\ghx\"; Flags: overwritereadonly
Source: ..\ghx\ghx_countdown_values_only.txt; DestDir: "C:\Program Files\unRealArcade\ghx\"; Flags: overwritereadonly

; Misc Files
Source: ..\fixes\all\cliptemp.txt; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\fixes\v1\fix1.tmp; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\fixes\v1\fix2.tmp; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\fixes\v1\fix3.tmp; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly

; New ACID 1.20.128 RFS/RGA Stub Hybrid
Source: ..\stub\stub-chunk1.bin; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\stub\stub-chunk2-installation-id.bin; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\stub\stub-chunk3-offering.bin; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\stub\stub-chunk4-filler.bin; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\stub\stub-chunk5-language-country.bin; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\stub\stub-chunk6.bin; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly

;Source: ..\rga\rfsstub.bin; DestDir: {app}; Flags: deleteafterinstall overwritereadonly
;Source: ..\rga\rgastub.bin; DestDir: {app}; Flags: deleteafterinstall overwritereadonly
;Source: ..\rgi\v1\template\gameInitializer.rgi; DestDir: {app}; Flags: deleteafterinstall overwritereadonly
;Source: ..\rgi\v3\template\gameInstall.rgi; DestDir: {app}; Flags: deleteafterinstall overwritereadonly

; RGA Specific

; OGM Service
Source: ..\core_ogm_service.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\services\ogm\ogmservice.exe; DestDir: "C:\Program Files\unRealArcade\services\ogm"; Flags: overwritereadonly
Source: ..\services\ogm\rgaQuery.url; DestDir: "C:\Program Files\unRealArcade\services\ogm"; Flags: overwritereadonly
Source: ..\services\ogm\rgaQuery.json; DestDir: "C:\Program Files\unRealArcade\services\ogm"; Flags: overwritereadonly


[Dirs]
Name: {app}\cheats; Attribs: hidden; Flags: deleteafterinstall
Name: {app}\patches; Attribs: hidden; Flags: deleteafterinstall
Name: {commonappdata}\n7-89-o9-3r-4t-r9
Name: {commonappdata}\92-75-56-55-p5-r9
;Name: "C:\Program Files\unRealArcade\ghx"
;Name: "C:\Program Files\unRealArcade\ghx\timer"
;Name: "C:\Program Files\unRealArcade\rga"


[Registry]
; RGS Loader v1.0
; This loader has been superceded by the 2.0 loader.
; The 2.0 loader can load this version from itself if issues arise
;Root: HKCR; SubKey: RealArcade.rgs.1; ValueType: string; ValueName: ; ValueData: RealArcade Secured Installer
;Root: HKCR; SubKey: RealArcade.rgs.1; ValueType: binary; ValueName: EditFlags; ValueData: 00 00 01 00
;Root: HKCR; SubKey: RealArcade.rgs.1\DefaultIcon; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER~4\RGSinst.exe,0
;Root: HKCR; SubKey: RealArcade.rgs.1\shell\open\command; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER~4\RGSinst.exe /m application/vnd.rn-rn_secured_installer %1

; RGS Loader v2.0
Root: HKCR; SubKey: RealArcade.rgs.1; ValueName: @; ValueData: """RGS Loader Install Package"""; ValueType: string
Root: HKCR; SubKey: RealArcade.rgs.1; ValueName: EditFlags; ValueData: 00 00 01 00; ValueType: binary
Root: HKCR; SubKey: RealArcade.rgs.1\DefaultIcon; ValueName: @; ValueData: C:\\PROGRA~1\\UNREAL~1\\LOADER~2\\RGSinst.exe,0; ValueType: string
Root: HKCR; SubKey: RealArcade.rgs.1\shell\open\command; ValueName: @; ValueData: """C:\\PROGRA~1\\UNREAL~1\\LOADER~2\\RGSinst.cmd %1"""; ValueType: string
Root: HKCR; SubKey: realarcade\DefaultIcon; ValueName: @; ValueData: C:\\PROGRA~1\\UNREAL~1\\LOADER~2\\RGSinst.exe,0; ValueType: string
Root: HKCR; SubKey: realarcade\shell\open\command; ValueName: @; ValueData: """C:\\PROGRA~1\\UNREAL~1\\LOADER~2\\RGSinst.cmd %1"""; ValueType: string
Root: HKCR; SubKey: .rgs; ValueName: Content Type; ValueData: application/vnd.rn-rn_secured_installer; ValueType: string
Root: HKCR; SubKey: .rgs; ValueName: Content Type; ValueData: application/vnd.rn-rn_secured_installer; ValueType: string
Root: HKCR; SubKey: .mez; ValueName: Content Type; ValueData: application/vnd.rn-rn_game_info; ValueType: string
Root: HKCR; SubKey: .mez; ValueName: Content Type; ValueData: application/vnd.rn-rn_game_info; ValueType: string
Root: HKCR; SubKey: .rgp; ValueName: Content Type; ValueData: application/vnd.rn-rn_game_package; ValueType: string
Root: HKCR; SubKey: .rgp; ValueName: Content Type; ValueData: application/vnd.rn-rn_game_package; ValueType: string
Root: HKCR; SubKey: .rgp; ValueName: Content Type; ValueData: application/vnd.rn-rn_game_package; ValueType: string

; NEW RGI Entry added to fix empty error dialog box upon initial run
Root: HKCR; SubKey: .rgi; ValueName: @; ValueData: """RealArcade.rgi.1"""; ValueType: string
Root: HKCR; SubKey: .rgi; ValueName: Content Type; ValueData: """application/vnd.rn-rn_game_installer"""; ValueType: string


; RGA Loader
Root: HKCR; SubKey: RealArcade.RGA.1; ValueType: string; ValueName: ; ValueData: RGA Loader Install Package
Root: HKCR; SubKey: RealArcade.RGA.1; ValueType: binary; ValueName: EditFlags; ValueData: 00 00 01 00
Root: HKCR; SubKey: RealArcade.RGA.1\shell\open\command; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER~3\RGAinst.cmd %1
Root: HKCR; SubKey: realarcade\shell\open\command; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER~3\RGAinst.cmd %1
Root: HKCR; SubKey: .RGA; ValueType: string; ValueName: ; ValueData: RealArcade.RGA.1
Root: HKCR; SubKey: .RGA; ValueType: string; ValueName: Content Type; ValueData: application/vnd.rn-rn_secured_installer

; DMG Loader
Root: HKCR; SubKey: RealArcade.DMG.1; ValueType: string; ValueName: ; ValueData: GH Activemark MacOSX DMG Image
Root: HKCR; SubKey: RealArcade.DMG.1; ValueType: binary; ValueName: EditFlags; ValueData: 00 00 01 00
Root: HKCR; SubKey: RealArcade.DMG.1\DefaultIcon; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER~4\DMGinst.ico
Root: HKCR; SubKey: RealArcade.DMG.1\shell\open\command; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER~4\DMGinst.cmd %1
Root: HKCR; SubKey: realarcade\DefaultIcon; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER~4\DMGinst.ico
Root: HKCR; SubKey: realarcade\shell\open\command; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER~4\DMGinst.cmd %1
Root: HKCR; SubKey: .DMG; ValueType: string; ValueName: ; ValueData: RealArcade.DMG.1
Root: HKCR; SubKey: .DMG; ValueType: string; ValueName: Content Type; ValueData: application/x-apple-diskimage

; RFS Loader
Root: HKCR; SubKey: RealArcade.RFS.1; ValueType: string; ValueName: ; ValueData: GH Activemark RFS Package
Root: HKCR; SubKey: RealArcade.RFS.1; ValueType: binary; ValueName: EditFlags; ValueData: 00 00 01 00
Root: HKCR; SubKey: RealArcade.RFS.1\DefaultIcon; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOA6C0~1\RFSinst.ico
Root: HKCR; SubKey: RealArcade.RFS.1\shell\open\command; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOA6C0~1\RFSinst.cmd %1
Root: HKCR; SubKey: realarcade\DefaultIcon; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOA6C0~1\RFSinst.ico
Root: HKCR; SubKey: realarcade\shell\open\command; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOA6C0~1\RFSinst.cmd %1
Root: HKCR; SubKey: .RFS; ValueType: string; ValueName: ; ValueData: RealArcade.RFS.1
Root: HKCR; SubKey: .RFS; ValueType: string; ValueName: Content Type; ValueData: application/amrfspkg
