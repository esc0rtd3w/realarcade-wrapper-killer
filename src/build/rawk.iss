[Setup]
AppName=RealArcade Demo Unwrapper v5.4.4
AppVerName=RealArcade Demo Unwrapper v5.4.4
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
VersionInfoVersion=5.4.4
VersionInfoCompany=cRypTiCwaRe
VersionInfoDescription=Unpack ALL RealArcade/Gamehouse RGS/RGA/RFS Games
VersionInfoProductName=RealArcade Wrapper Killer
VersionInfoProductVersion=5.4.4
;LicenseFile=..\rawk_license.txt
;InfoBeforeFile=..\rawk_info.txt


[Run]
Filename: {app}\RAunWrap.bat; WorkingDir: {app}


[Files]

; Embed the Wrapper Killer itself (this is so it can be launched after game extraction locally)
; This must be built without embed and then place that built file in \embed\ and rebuild with embed on
;Source: ..\_release\embed\rawk.exe; DestDir: {pf}\unRealArcade; Flags: overwritereadonly


; Copy the source EXE to unRealArcade folder (this obsoletes the above EMBED duplication)
; Using batch files to do this (added 20131030)



; Core Wrapper Killer Files
Source: ..\RAunWrap.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_advanced_load_options.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_autolaunch.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_backup.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_check_exit_status.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_check_ini_ver.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_check_local_rawk.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_check_non_rgs.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_clear_cache.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_config_ra_player.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_delete_backups.bat; DestDir: {app}; Attribs: Hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_patch_demo1.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_patch_demo3.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_patch_demo3a.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_patch_demo4.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_patch_demo4a.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_patch_demoGH.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_patch_demoZY.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_demo_type_check.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_demo_type_override.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_disable_old_reg_hacks.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_dlc.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_dupe_check.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_errorhandling.bat; DestDir: {app}; Attribs: Hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_cheats.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_check_exit_status.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_clean_exe.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_clean_gh.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_clean_zy.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_clean_ini.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_clean_main.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_clean_pre.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_debug.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_file_rename.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_game_patch.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_gamehouse_hotkey.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_gamehouse_main.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_gamehouse_override.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_game_unpacked_ok.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_get_demo_type.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_get_stats.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_ghx_install.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_ghx_reset.cmd; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_handler.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_hotkey.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_ini_output.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_invalid_folder.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_invalid_folder_gh.bat; DestDir: {app}; Attribs: Hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_invalid_folder_zylom.bat; DestDir: {app}; Attribs: Hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_licensing_activemark.bat; DestDir: {app}; Attribs: Hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_licensing_gamehouse.bat; DestDir: {app}; Attribs: Hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_licensing_main.bat; DestDir: {app}; Attribs: Hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_licensing_realarcade.bat; DestDir: {app}; Attribs: Hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_licensing_zylom.bat; DestDir: {app}; Attribs: Hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_mods.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_multicmp.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_multiple_exe_check.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_no_game_found.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_no_var_fix.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_override.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_patch_ra_db.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_pdf_fix.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_rawk_cleanup_loader.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_rawk_cleanup_root.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_rawk_unpack.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_reg_check.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_reg_set.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_restore.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_rfs_stub_info.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_rga_download.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_stub_creator.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
;Source: ..\core_rga_stub_creator.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
;Source: ..\core_rga_stub_creator.bat; DestDir: {pf}\unRealArcade\rga\; Flags: overwritereadonly
Source: ..\core_rga_stub_info.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
;Source: ..\core_rga_stub_info.bat; DestDir: {pf}\unRealArcade\rga\; Flags: overwritereadonly

; Mac OSX DMG Support
Source: ..\core_dmg_loader.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly

; Newer 2015/2016 RFS Activemark Support
Source: ..\core_rfs_loader.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly

Source: ..\core_rgs_loader.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_rgs_pre_release.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_rgs_unlock_license.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_rnarcade_spoofer.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_set_breakpoint.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_set_def_ini.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_set_global.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_shortcut_demo1.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_shortcut_demo1a.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_shortcut_demo2.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_shortcut_demo3.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_shortcut_demo4.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_shortcut_demo5.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_shortcut_demo6.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_shortcut_manual.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_shortcut_demoGH.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_shortcut_demoZY.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_show_stats.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_sonic_multi_fix.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_unsupported.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_update.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_zylom_hotkey.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_zylom_main.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\core_zylom_override.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\demo1.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\demo1a.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\demo2.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\demo3.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\demo3a.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\demo4.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\demo4a.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\demo5.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\demo6.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\demoM.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\demoGH.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\demoZY.bat; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\rawkreset.bat; DestDir: {sys}; Flags: overwritereadonly

; RGS Loader v1.0
Source: ..\loaders\loader.exe; DestDir: {pf}\unRealArcade\temp; Flags: overwritereadonly

; RGS Loader v2.0
Source: ..\loaders\loader2.exe; DestDir: {pf}\unRealArcade\temp; Flags: overwritereadonly

; RGA Loader Files
Source: ..\loaders\loader3.exe; DestDir: {pf}\unRealArcade\temp; Flags: overwritereadonly

; DMG Loader Files
Source: ..\loaders\loader4.exe; DestDir: {pf}\unRealArcade\temp; Flags: overwritereadonly

; RFS Loader Files
Source: ..\loaders\loader5.exe; DestDir: {pf}\unRealArcade\temp; Flags: overwritereadonly

;RealArcade Spoofer
Source: ..\rna\rnaspoof.exe; DestDir: {pf}\unRealArcade\temp; Flags: overwritereadonly

;RealArcade Mods
Source: ..\rna\rnamod.exe; DestDir: {pf}\unRealArcade\temp; Flags: overwritereadonly
Source: ..\rna\rnamod-x64.exe; DestDir: {pf}\unRealArcade\temp; Flags: overwritereadonly

;RealArcade Restore RA Player
Source: ..\rna\rnarestore.exe; DestDir: {pf}\unRealArcade\temp; Flags: overwritereadonly
Source: ..\rna\rnarestore-x64.exe; DestDir: {pf}\unRealArcade\temp; Flags: overwritereadonly

;RealArcade Uninstaller
Source: ..\rna\rnuninst.exe; DestDir: {pf}\unRealArcade\temp; Flags: overwritereadonly

;RealArcade Downloader
Source: ..\gui\uradl.exe; DestDir: {pf}\unRealArcade\temp; Flags: overwritereadonly

;RealArcade Downloader (64-bit)
Source: ..\gui\uradl-x64.exe; DestDir: {pf}\unRealArcade\temp; Flags: overwritereadonly


; External System Files (Local)
;Source: ..\sys32\choice.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\color.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
;Source: ..\sys32\cocolor.exe; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly;
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

; External System Files (System)
Source: ..\sys32\choice.exe; DestDir: {sys}; Flags: onlyifdoesntexist; Attribs: system
Source: ..\sys32\color.exe; DestDir: {sys}; Flags: onlyifdoesntexist; Attribs: system
Source: ..\sys32\cocolor.exe; DestDir: {sys}; Flags: onlyifdoesntexist; Attribs: system
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
Source: ..\sys32\fcmd\getdecimal.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\fcmd\getdir.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\fcmd\getint.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\fcmd\getpassword.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\fcmd\gettext.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\fcmd\fckill.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\fcmd\openfile.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\fcmd\pathc.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly
Source: ..\sys32\fcmd\savefile.exe; DestDir: {sys}; Attribs: System; Flags: overwritereadonly

; QT DLL's (Local)
;Source: ..\sys32\fcmd\QtCore4.dll; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
;Source: ..\sys32\fcmd\QtGui4.dll; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly

; QT DLL's (System)
Source: ..\sys32\fcmd\QtCore4.dll; DestDir: {sys}; Attribs: System; Flags: onlyifdoesntexist
Source: ..\sys32\fcmd\QtGui4.dll; DestDir: {sys}; Attribs: System; Flags: onlyifdoesntexist



; RealArcade Root Folder Overwrite (BLANK DATABASE)
;Source: ..\%RAroot%\db\GAMEFIND.DBF.1; DestDir: {pf}\Real\RealArcade\db; Flags: deleteafterinstall overwritereadonly
;Source: ..\%RAroot%\db\GAMEFIND.DBF.2; DestDir: {pf}\Real\RealArcade\db; Flags: deleteafterinstall overwritereadonly
;Source: ..\%RAroot%\db\GAMEFIND.DBF.3; DestDir: {pf}\Real\RealArcade\db; Flags: deleteafterinstall overwritereadonly

; RealArcade Root Folder Overwrite (CONFIG AND CATALOG GUI)
;Source: ..\%RAroot%\myaccount.ini; DestDir: {pf}\Real\RealArcade; Flags: overwritereadonly
;Source: ..\%RAroot%\myaccount.ini.ORIG; DestDir: {pf}\Real\RealArcade; Flags: onlyifdoesntexist
;Source: ..\%RAroot%\catalog\arcade.cfg; DestDir: {pf}\Real\RealArcade\catalog; Flags: overwritereadonly
;Source: ..\%RAroot%\catalog\arcade.cfg.ORIG; DestDir: {pf}\Real\RealArcade\catalog; Flags: onlyifdoesntexist
;Source: ..\%RAroot%\catalog\coreinfo.cfg; DestDir: {pf}\Real\RealArcade\catalog; Flags: overwritereadonly
;Source: ..\%RAroot%\catalog\coreinfo.cfg.ORIG; DestDir: {pf}\Real\RealArcade\catalog; Flags: onlyifdoesntexist

; RealArcade Root Folder Overwrite (HTML FILES GUI)
;Source: ..\%RAroot%\Html\rawk_ra1_direct_dl.htm; DestDir: {pf}\Real\RealArcade\Html; Attribs: readonly; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawk_unwrapped_games.htm; DestDir: {pf}\Real\RealArcade\Html; Attribs: readonly; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawk_launch.htm; DestDir: {pf}\Real\RealArcade\Html; Attribs: readonly; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\quicklaunch_plus_rawk_ra1_direct_dl.htm; DestDir: {pf}\Real\RealArcade\Html; Attribs: readonly; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\quicklaunch_plus_rawk_unwrapped_games.htm; DestDir: {pf}\Real\RealArcade\Html; Attribs: readonly; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\quicklaunch_plus_rawk_launch.htm; DestDir: {pf}\Real\RealArcade\Html; Attribs: readonly; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawkrgsdl.css; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawkdlgradient.png; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawkextracterror.png; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawkremovedfromservers.png; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawkdlavailable.png; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawkdldiscontinued.png; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawkdlgradient.png; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawkdlraghmerger.png; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawkdlrgaonly.png; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly
;Source: ..\%RAroot%\Html\rawk_launch.js; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly; Attribs: readonly
;Source: ..\%RAroot%\Html\rawk_logo.png; DestDir: {pf}\Real\RealArcade\Html; Flags: overwritereadonly

; RealArcade Root Folder Overwrite (GUI IMAGES)
;Source: ..\%RAroot%\img\137.png; DestDir: {pf}\Real\RealArcade\img; Flags: overwritereadonly
;Source: ..\%RAroot%\img\137.png.ORIG; DestDir: {pf}\Real\RealArcade\img; Flags: onlyifdoesntexist

; Registry Access
Source: ..\registry\rawk_licensekeys.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\registry\rawk_prefs.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\registry\rawk_reset.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\registry\rga_stub_bypass.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\registry\rga_stub_remove.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly
Source: ..\registry\rgs_open_default.reg; DestDir: {app}; Attribs: hidden; Flags: deleteafterinstall overwritereadonly

; Config Files
Source: ..\config\launch.ini; DestDir: {app}; Flags: deleteafterinstall overwritereadonly
Source: ..\config\rawkdb.ini; DestDir: {pf}\unRealArcade\rawk\temp; Flags: overwritereadonly deleteafterinstall
Source: ..\config\dlc.ini; DestDir: {pf}\unRealArcade\rawk\temp; Flags: overwritereadonly deleteafterinstall
Source: ..\config\patch.ini; DestDir: {pf}\unRealArcade\rawk\temp; Flags: overwritereadonly deleteafterinstall
Source: ..\config\rnarcade.ini; DestDir: {pf}\unRealArcade\rawk\temp; Flags: overwritereadonly deleteafterinstall
Source: ..\config\servers.ini; DestDir: {pf}\unRealArcade\rawk\temp; Flags: overwritereadonly deleteafterinstall
Source: ..\config\stub.ini; DestDir: {pf}\unRealArcade\rawk\temp; Flags: overwritereadonly deleteafterinstall
Source: ..\config\ghdb.ini; DestDir: {pf}\unRealArcade\rawk\temp; Flags: overwritereadonly deleteafterinstall
Source: ..\config\zydb.ini; DestDir: {pf}\unRealArcade\rawk\temp; Flags: overwritereadonly deleteafterinstall

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
Source: ..\ghx\ghx_reset.cmd; DestDir: {pf}\unRealArcade\ghx\; Flags: overwritereadonly
Source: ..\ghx\ghx_reset_dev.cmd; DestDir: {pf}\unRealArcade\ghx\; Flags: overwritereadonly
Source: ..\ghx\ghx_install.cmd; DestDir: {pf}\unRealArcade\ghx\; Flags: overwritereadonly
Source: ..\ghx\WINDOWS\win.ini; DestDir: {win}; Flags: overwritereadonly
Source: ..\ghx\ghx_countdown.txt; DestDir: {pf}\unRealArcade\ghx\; Flags: overwritereadonly
Source: ..\ghx\ghx_countdown_minutes_values.txt; DestDir: {pf}\unRealArcade\ghx\; Flags: overwritereadonly
Source: ..\ghx\ghx_countdown_values_only.txt; DestDir: {pf}\unRealArcade\ghx\; Flags: overwritereadonly

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
Source: ..\ogm\ogmservice.exe; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
Source: ..\core_ogm_service.bat; DestDir: {app}; Flags: deleteafterinstall overwritereadonly; Attribs: hidden
;Source: ..\rga\ogm\ogmservice-run.cmd; DestDir: {app}; Flags: deleteafterinstall overwritereadonly
Source: ..\ogm\rgaQuery.url; DestDir: {app}; Flags: deleteafterinstall overwritereadonly
Source: ..\ogm\rgaQuery.json; DestDir: {app}; Flags: deleteafterinstall overwritereadonly


[Dirs]
Name: {app}\cheats; attribs: hidden; Flags: deleteafterinstall
Name: {app}\patches; attribs: hidden; Flags: deleteafterinstall
Name: {commonappdata}\n7-89-o9-3r-4t-r9
Name: {commonappdata}\92-75-56-55-p5-r9
Name: {pf}\unRealArcade\ghx
;Name: {pf}\unRealArcade\ghx\timer
;Name: {pf}\unRealArcade\rga


[Registry]
; RGA Loader v1.0 (loader1)
; This loader has been superceded by the 2.0 loader.
; The 2.0 loader can load this version from itself if issues arise
;Root: HKCR; SubKey: RealArcade.rgs.1; ValueType: string; ValueName: ; ValueData: RealArcade Secured Installer
;Root: HKCR; SubKey: RealArcade.rgs.1; ValueType: binary; ValueName: EditFlags; ValueData: 00 00 01 00
;Root: HKCR; SubKey: RealArcade.rgs.1\DefaultIcon; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER\RGSinst.exe,0
;Root: HKCR; SubKey: RealArcade.rgs.1\shell\open\command; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER\RGSinst.exe /m application/vnd.rn-rn_secured_installer %1

; RGS Loader v2.0 (loader2)
Root: HKCR; SubKey: RealArcade.rgs.1; ValueName: @; ValueData: """RGS Loader Install Package"""; ValueType: string
Root: HKCR; SubKey: RealArcade.rgs.1; ValueName: EditFlags; ValueData: 00 00 01 00; ValueType: binary
Root: HKCR; SubKey: RealArcade.rgs.1\DefaultIcon; ValueName: @; ValueData: C:\\PROGRA~1\\UNREAL~1\\LOADER2\\RGSinst.exe,0; ValueType: string
Root: HKCR; SubKey: RealArcade.rgs.1\shell\open\command; ValueName: @; ValueData: """C:\\PROGRA~1\\UNREAL~1\\LOADER2\\RGSinst.cmd %1"""; ValueType: string
Root: HKCR; SubKey: realarcade\DefaultIcon; ValueName: @; ValueData: C:\\PROGRA~1\\UNREAL~1\\LOADER2\\RGSinst.exe,0; ValueType: string
Root: HKCR; SubKey: realarcade\shell\open\command; ValueName: @; ValueData: """C:\\PROGRA~1\\UNREAL~1\\LOADER2\\RGSinst.cmd %1"""; ValueType: string
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


; RGA Loader (loader3)
Root: HKCR; SubKey: RealArcade.RGA.1; ValueType: string; ValueName: ; ValueData: RGA Loader Install Package
Root: HKCR; SubKey: RealArcade.RGA.1; ValueType: binary; ValueName: EditFlags; ValueData: 00 00 01 00
Root: HKCR; SubKey: RealArcade.RGA.1\shell\open\command; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER3\RGAinst.cmd %1
Root: HKCR; SubKey: realarcade\shell\open\command; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER3\RGAinst.cmd %1
Root: HKCR; SubKey: .RGA; ValueType: string; ValueName: ; ValueData: RealArcade.RGA.1
Root: HKCR; SubKey: .RGA; ValueType: string; ValueName: Content Type; ValueData: application/vnd.rn-rn_secured_installer

; DMG Loader (loader4)
Root: HKCR; SubKey: RealArcade.DMG.1; ValueType: string; ValueName: ; ValueData: GH Activemark MacOSX DMG Image
Root: HKCR; SubKey: RealArcade.DMG.1; ValueType: binary; ValueName: EditFlags; ValueData: 00 00 01 00
Root: HKCR; SubKey: RealArcade.DMG.1\DefaultIcon; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER4\DMGinst.ico
Root: HKCR; SubKey: RealArcade.DMG.1\shell\open\command; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER4\DMGinst.cmd %1
Root: HKCR; SubKey: realarcade\DefaultIcon; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER4\DMGinst.ico
Root: HKCR; SubKey: realarcade\shell\open\command; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER4\DMGinst.cmd %1
Root: HKCR; SubKey: .DMG; ValueType: string; ValueName: ; ValueData: RealArcade.DMG.1
Root: HKCR; SubKey: .DMG; ValueType: string; ValueName: Content Type; ValueData: application/x-apple-diskimage

; RFS Loader (loader5)
Root: HKCR; SubKey: RealArcade.RFS.1; ValueType: string; ValueName: ; ValueData: GH Activemark RFS Package
Root: HKCR; SubKey: RealArcade.RFS.1; ValueType: binary; ValueName: EditFlags; ValueData: 00 00 01 00
Root: HKCR; SubKey: RealArcade.RFS.1\DefaultIcon; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER5\RFSinst.ico
Root: HKCR; SubKey: RealArcade.RFS.1\shell\open\command; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER5\RFSinst.cmd %1
Root: HKCR; SubKey: realarcade\DefaultIcon; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER5\RFSinst.ico
Root: HKCR; SubKey: realarcade\shell\open\command; ValueType: string; ValueName: ; ValueData: C:\PROGRA~1\UNREAL~1\LOADER5\RFSinst.cmd %1
Root: HKCR; SubKey: .RFS; ValueType: string; ValueName: ; ValueData: RealArcade.RFS.1
Root: HKCR; SubKey: .RFS; ValueType: string; ValueName: Content Type; ValueData: application/amrfspkg
