#Region "Imports"

Imports System.Net
Imports System.IO

#End Region

#Region "Main Class"

Public Class URADownloaderMain

#Region "Init"

    Private Sub URADownloaderMain_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load

        'btnGoDownloadNow.Enabled = "false"

        GetDownloadPath()

        'Dim server As String = "http://games-dl2.real.com"
        'Dim GameName As String = txtCurrentGameName.Text

        txtServerHostAddress.Text = "http://games-dl2.real.com"

        cboGameName.Items.Clear()

        GetCurrentGameName()

        GetFileType()

        CheckRAWK()



        'For I As Integer = 1 To 4000
        'cboGameName.Items.Add(I)
        'Next

        GetGameNamesFromList()

    End Sub


    Public Sub GetCurrentGameName()

        'If txtGameNameManual.Text = "" Then

        txtGameNameManual.Text = cboGameName.SelectedItem
        'End If

    End Sub


    Public Sub CheckRAWK()

        Dim RAWK As String = "C:\Program Files\unRealArcade\rawk\RAWrapperKiller.exe"

        Dim rawkExists As Boolean
        rawkExists = My.Computer.FileSystem.FileExists(RAWK)

        txtDoesRAWKExist.Text = "0"

        If rawkExists = True Then

            txtDoesRAWKExist.Text = "1"

        Else
            Exit Sub
        End If

    End Sub

#End Region

#Region "Game Preview and Info"


    Public Sub GetGameImagePreview()

        txtGameArtworkPreviewMain.Text = "http://i.realone.com/assets/rn/img/8/6/1/1/45481168-45481176-300x150.jpg"



    End Sub


    Public Sub ShowGameImagePreview()

        Try

            picGameArtworkMain.Image = New System.Drawing.Bitmap(New IO.MemoryStream(New System.Net.WebClient().DownloadData(txtGameArtworkPreviewMain.Text)))

        Catch ex As Exception

        End Try



    End Sub


#End Region

#Region "Multilanguage Buttons"

    Public Sub GetGameNamesFromList()

        Dim GameListRoot As String = "gamelist\"

        If rdoMultiLanguageDE.Checked Then

            ClearGameName()
            DisableAllGameTypesExceptRGS()
            SelectRGS()

            Try
                If IO.File.Exists(GameListRoot + "uralist-DE.txt") Then
                    Using uralist As New IO.StreamReader(GameListRoot + "uralist-DE.txt")
                        While Not uralist.EndOfStream
                            cboGameName.Items.Add(uralist.ReadLine)
                        End While
                    End Using
                Else
                    MsgBox("Only Manual Entry for Game Name is possible. Place uralist-DE.txt in the gamelist folder and restart.", MsgBoxStyle.Exclamation, "uralist-DE.txt not found!")
                End If
            Catch ex As Exception
                'MsgBox(ex.Message)
            End Try

        End If


        If rdoMultiLanguageEN.Checked Then

            ClearGameName()
            EnableAllGameTypes()

            Try
                If IO.File.Exists(GameListRoot + "uralist-EN.txt") Then
                    Using uralist As New IO.StreamReader(GameListRoot + "uralist-EN.txt")
                        While Not uralist.EndOfStream
                            cboGameName.Items.Add(uralist.ReadLine)
                        End While
                    End Using
                Else
                    MsgBox("Only Manual Entry for Game Name is possible. Place uralist-EN.txt in the gamelist folder and restart.", MsgBoxStyle.Exclamation, "uralist-EN.txt not found!")
                End If
            Catch ex As Exception
                'MsgBox(ex.Message)
            End Try

        End If


        If rdoMultiLanguageES.Checked Then

            ClearGameName()
            DisableAllGameTypesExceptRGS()
            SelectRGS()

            Try
                If IO.File.Exists(GameListRoot + "uralist-ES.txt") Then
                    Using uralist As New IO.StreamReader(GameListRoot + "uralist-ES.txt")
                        While Not uralist.EndOfStream
                            cboGameName.Items.Add(uralist.ReadLine)
                        End While
                    End Using
                Else
                    MsgBox("Only Manual Entry for Game Name is possible. Place uralist-ES.txt in the gamelist folder and restart.", MsgBoxStyle.Exclamation, "uralist-ES.txt not found!")
                End If
            Catch ex As Exception
                'MsgBox(ex.Message)
            End Try

        End If


        If rdoMultiLanguageFR.Checked Then

            ClearGameName()
            DisableAllGameTypesExceptRGS()
            SelectRGS()

            Try
                If IO.File.Exists(GameListRoot + "uralist-FR.txt") Then
                    Using uralist As New IO.StreamReader(GameListRoot + "uralist-FR.txt")
                        While Not uralist.EndOfStream
                            cboGameName.Items.Add(uralist.ReadLine)
                        End While
                    End Using
                Else
                    MsgBox("Only Manual Entry for Game Name is possible. Place uralist-FR.txt in the gamelist folder and restart.", MsgBoxStyle.Exclamation, "uralist-FR.txt not found!")
                End If
            Catch ex As Exception
                'MsgBox(ex.Message)
            End Try

        End If


        If rdoMultiLanguageIT.Checked Then

            ClearGameName()
            DisableAllGameTypesExceptRGS()
            SelectRGS()

            Try
                If IO.File.Exists(GameListRoot + "uralist-IT.txt") Then
                    Using uralist As New IO.StreamReader(GameListRoot + "uralist-IT.txt")
                        While Not uralist.EndOfStream
                            cboGameName.Items.Add(uralist.ReadLine)
                        End While
                    End Using
                Else
                    MsgBox("Only Manual Entry for Game Name is possible. Place uralist-IT.txt in the gamelist folder and restart.", MsgBoxStyle.Exclamation, "uralist-IT.txt not found!")
                End If
            Catch ex As Exception
                'MsgBox(ex.Message)
            End Try

        End If


        If rdoMultiLanguageJP.Checked Then

            ClearGameName()
            DisableAllGameTypesExceptRGS()
            SelectRGS()

            Try
                If IO.File.Exists(GameListRoot + "uralist-JP.txt") Then
                    Using uralist As New IO.StreamReader(GameListRoot + "uralist-JP.txt")
                        While Not uralist.EndOfStream
                            cboGameName.Items.Add(uralist.ReadLine)
                        End While
                    End Using
                Else
                    MsgBox("Only Manual Entry for Game Name is possible. Place uralist-JP.txt in the gamelist folder and restart.", MsgBoxStyle.Exclamation, "uralist-JP.txt not found!")
                End If
            Catch ex As Exception
                'MsgBox(ex.Message)
            End Try

        End If


        If rdoMultiLanguageNL.Checked Then

            ClearGameName()
            DisableAllGameTypesExceptRGS()
            SelectRGS()

            Try
                If IO.File.Exists(GameListRoot + "uralist-NL.txt") Then
                    Using uralist As New IO.StreamReader(GameListRoot + "uralist-NL.txt")
                        While Not uralist.EndOfStream
                            cboGameName.Items.Add(uralist.ReadLine)
                        End While
                    End Using
                Else
                    MsgBox("Only Manual Entry for Game Name is possible. Place uralist-NL.txt in the gamelist folder and restart.", MsgBoxStyle.Exclamation, "uralist-NL.txt not found!")
                End If
            Catch ex As Exception
                'MsgBox(ex.Message)
            End Try

        End If

    End Sub


    Private Sub rdoMultiLanguageDE_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoMultiLanguageDE.CheckedChanged

        cboGameName.Items.Clear()
        GetGameNamesFromList()

    End Sub

    Private Sub rdoMultiLanguageEN_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoMultiLanguageEN.CheckedChanged

        cboGameName.Items.Clear()
        GetGameNamesFromList()

    End Sub

    Private Sub rdoMultiLanguageES_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoMultiLanguageES.CheckedChanged

        cboGameName.Items.Clear()
        GetGameNamesFromList()

    End Sub

    Private Sub rdoMultiLanguageFR_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoMultiLanguageFR.CheckedChanged

        cboGameName.Items.Clear()
        GetGameNamesFromList()

    End Sub

    Private Sub rdoMultiLanguageIT_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoMultiLanguageIT.CheckedChanged

        cboGameName.Items.Clear()
        GetGameNamesFromList()

    End Sub

    Private Sub rdoMultiLanguageJP_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoMultiLanguageJP.CheckedChanged

        cboGameName.Items.Clear()
        GetGameNamesFromList()

    End Sub

    Private Sub rdoMultiLanguageNL_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoMultiLanguageNL.CheckedChanged

        cboGameName.Items.Clear()
        GetGameNamesFromList()

    End Sub

#End Region

#Region "Game Type Buttons"

    Public Sub FixManualGameName()

        txtGameNameManual.CharacterCasing = CharacterCasing.Lower
        txtGameNameManual.Text = txtGameNameManual.Text.Replace(" ", "")
        txtGameNameManual.Text = txtGameNameManual.Text.Replace("(", "")
        txtGameNameManual.Text = txtGameNameManual.Text.Replace(")", "")
        txtGameNameManual.Text = txtGameNameManual.Text.Replace("-", "")
        txtGameNameManual.Text = txtGameNameManual.Text.Replace("!", "")
        txtGameNameManual.Text = txtGameNameManual.Text.Replace("'", "")

    End Sub


    Public Sub GetFileType()

        If rdoGameTypeRGS.Checked = True Then
            RGSFile()
            txtFileTypeContainer.Text = "rgs"
        End If

        If rdoGameTypeRGA21.Checked = True Then
            RGA21File()
            txtFileTypeContainer.Text = "rga21"
        End If

        If rdoGameTypeEXE.Checked = True Then
            EXEFile()
            txtFileTypeContainer.Text = "exe"
        End If

        If rdoGameTypeEXEGH.Checked = True Then
            EXEGHFile()
            txtFileTypeContainer.Text = "exegh"
        End If

        If rdoGameTypeRGA26.Checked = True Then
            RGA26File()
            txtFileTypeContainer.Text = "rga26"
        End If

        If rdoGameTypeRG3.Checked = True Then
            RG3File()
            txtFileTypeContainer.Text = "rg3"
        End If

        If rdoGameTypeRGA26AM.Checked = True Then
            RGA26AMFile()
            txtFileTypeContainer.Text = "rga26am"
        End If

        If rdoGameTypeRGA26AMG.Checked = True Then
            RGA26AMGFile()
            txtFileTypeContainer.Text = "rga26amg"
        End If

        If rdoGameTypeDMG.Checked = True Then
            DMGFile()
            txtFileTypeContainer.Text = "dmg"
        End If

        If rdoGameTypeDMGAMAC.Checked = True Then
            DMGAMACFile()
            txtFileTypeContainer.Text = "dmgamac"
        End If

        If rdoGameTypeWebStubInstallerPackages.Checked = True Then
            Stub1()
            txtFileTypeContainer.Text = "stub1"
        End If

        If rdoGameTypeWebStubInstallerRedirect.Checked = True Then
            Stub2()
            txtFileTypeContainer.Text = "stub2"
        End If

        If rdoGameTypeWebStubSwitchboard.Checked = True Then
            Stub3()
            txtFileTypeContainer.Text = "stub3"
        End If

        If rdoGameTypeWebStubActiveMark.Checked = True Then
            Stub4()
            txtFileTypeContainer.Text = "stub4"
        End If

        If rdoGameTypeOpenInWebpageWindows.Checked = True Then
            OpenInWebpageWindows()
            txtFileTypeContainer.Text = "webWindows"
        End If

        If rdoGameTypeOpenInWebpageMac.Checked = True Then
            OpenInWebpageMac()
            txtFileTypeContainer.Text = "webMac"
        End If

        If rdoGameTypeOpenInWebpageAndroid.Checked = True Then
            OpenInWebpageAndroid()
            txtFileTypeContainer.Text = "webAndroid"
        End If

        If rdoGameTypeOpenInWebpageIphoneIpod.Checked = True Then
            OpenInWebpageIphoneIpod()
            txtFileTypeContainer.Text = "webIphoneIpod"
        End If

        If rdoGameTypeOpenInWebpageIpad.Checked = True Then
            OpenInWebpageIpad()
            txtFileTypeContainer.Text = "webIpad"
        End If

    End Sub



    Private Sub cboGameName_SelectedIndexChanged(sender As System.Object, e As System.EventArgs) Handles cboGameName.SelectedIndexChanged

        GetCurrentGameName()

        CloneToCurrentDownloadTarget()

        'GetGameImagePreview()
        'ShowGameImagePreview()

    End Sub




    Private Sub rdoGameTypeRGS_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoGameTypeRGS.CheckedChanged

        FixManualGameName()

        btnGoDownloadNow.Text = "Start Download"
        GetFileType()

        ClearCurrentDownloadTargetLabel()
        CloneToCurrentDownloadTarget()

    End Sub

    Private Sub rdoGameTypeRGA21_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoGameTypeRGA21.CheckedChanged

        FixManualGameName()

        btnGoDownloadNow.Text = "Start Download"
        GetFileType()

        ClearCurrentDownloadTargetLabel()
        CloneToCurrentDownloadTarget()

    End Sub

    Private Sub rdoGameTypeEXE_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoGameTypeEXE.CheckedChanged

        FixManualGameName()

        btnGoDownloadNow.Text = "Start Download"
        GetFileType()

        ClearCurrentDownloadTargetLabel()
        CloneToCurrentDownloadTarget()

    End Sub

    Private Sub rdoGameTypeEXEGH_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoGameTypeEXEGH.CheckedChanged

        FixManualGameName()

        btnGoDownloadNow.Text = "Start Download"
        GetFileType()

        ClearCurrentDownloadTargetLabel()
        CloneToCurrentDownloadTarget()

    End Sub

    Private Sub rdoGameTypeRGA26_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoGameTypeRGA26.CheckedChanged

        FixManualGameName()

        btnGoDownloadNow.Text = "Start Download"
        GetFileType()

        ClearCurrentDownloadTargetLabel()
        CloneToCurrentDownloadTarget()

    End Sub

    Private Sub rdoGameTypeRGA26AM_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoGameTypeRGA26AM.CheckedChanged

        FixManualGameName()

        btnGoDownloadNow.Text = "Start Download"
        GetFileType()

        ClearCurrentDownloadTargetLabel()
        CloneToCurrentDownloadTarget()

    End Sub

    Private Sub rdoRGA26AMG_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoGameTypeRGA26AMG.CheckedChanged

        FixManualGameName()

        btnGoDownloadNow.Text = "Start Download"
        GetFileType()

        ClearCurrentDownloadTargetLabel()
        CloneToCurrentDownloadTarget()

    End Sub

    Private Sub rdoGameTypeRG3_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles rdoGameTypeRG3.CheckedChanged

        FixManualGameName()

        btnGoDownloadNow.Text = "Start Download"
        GetFileType()

        ClearCurrentDownloadTargetLabel()
        CloneToCurrentDownloadTarget()

    End Sub

    Private Sub rdoGameTypeDMG_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoGameTypeDMG.CheckedChanged

        FixManualGameName()

        btnGoDownloadNow.Text = "Start Download"
        GetFileType()

        ClearCurrentDownloadTargetLabel()
        CloneToCurrentDownloadTarget()

    End Sub

    Private Sub rdoGameTypeDMGAMAC_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoGameTypeDMGAMAC.CheckedChanged

        FixManualGameName()

        btnGoDownloadNow.Text = "Start Download"
        GetFileType()

        ClearCurrentDownloadTargetLabel()
        CloneToCurrentDownloadTarget()

    End Sub


    Private Sub rdoGameTypeOpenInWebpageWindows_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoGameTypeOpenInWebpageWindows.CheckedChanged

        FixManualGameName()

        btnGoDownloadNow.Text = "Open In Browser"
        GetFileType()

        ClearCurrentDownloadTargetLabel()

    End Sub

    Private Sub rdoGameTypeOpenInWebpageMac_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoGameTypeOpenInWebpageMac.CheckedChanged

        FixManualGameName()

        btnGoDownloadNow.Text = "Open In Browser"
        GetFileType()

        ClearCurrentDownloadTargetLabel()

    End Sub

    Private Sub rdoGameTypeOpenInWebpageAndroid_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoGameTypeOpenInWebpageAndroid.CheckedChanged

        FixManualGameName()

        btnGoDownloadNow.Text = "Open In Browser"
        GetFileType()

        ClearCurrentDownloadTargetLabel()

    End Sub

    Private Sub rdoGameTypeOpenInWebpageIphoneIpod_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoGameTypeOpenInWebpageIphoneIpod.CheckedChanged

        FixManualGameName()

        btnGoDownloadNow.Text = "Open In Browser"
        GetFileType()

        ClearCurrentDownloadTargetLabel()

    End Sub

    Private Sub rdoGameTypeOpenInWebpageIpad_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoGameTypeOpenInWebpageIpad.CheckedChanged

        FixManualGameName()

        btnGoDownloadNow.Text = "Open In Browser"
        GetFileType()

        ClearCurrentDownloadTargetLabel()

    End Sub

    Private Sub rdoGameTypeWebStubInstallerPackages_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoGameTypeWebStubInstallerPackages.CheckedChanged

        btnGoDownloadNow.Text = "Build and Download Web Game Stub"
        GetFileType()

        ClearCurrentDownloadTargetLabel()

    End Sub

    Private Sub rdoGameTypeWebStubInstallerRedirect_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoGameTypeWebStubInstallerRedirect.CheckedChanged

        btnGoDownloadNow.Text = "Build and Download Web Game Stub"
        GetFileType()

        ClearCurrentDownloadTargetLabel()

    End Sub

    Private Sub rdoGameTypeWebStubSwitchboard_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles rdoGameTypeWebStubSwitchboard.CheckedChanged

        btnGoDownloadNow.Text = "Build and Download Web Game Stub"
        GetFileType()

        ClearCurrentDownloadTargetLabel()

    End Sub

    Private Sub rdoGameTypeWebStubActiveMark_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles rdoGameTypeWebStubActiveMark.CheckedChanged

        btnGoDownloadNow.Text = "Build and Download Web Game Stub"
        GetFileType()

        ClearCurrentDownloadTargetLabel()

        'StubBuilder.Show()

    End Sub


#End Region

#Region "Text Inputs"

    Public Sub RGSFile()

        txtServerHostAddress.Text = "http://games-dl2.real.com"
        txtPath1.Text = "/gameconsole/games/demorgses"
        txtPath2.Text = "/"
        txtPath3.Text = "_free.rgs"

    End Sub


    Public Sub RGA21File()

        txtServerHostAddress.Text = "http://games-dl2.real.com"
        txtPath1.Text = "/gameconsole/realarcadev21/games/"
        txtPath2.Text = "/"
        txtPath3.Text = ".rga"

    End Sub


    Public Sub EXEFile()

        txtServerHostAddress.Text = "http://downloads.gamehouse.com"
        txtPath1.Text = "/gameconsole/realarcadev21/games/"
        txtPath2.Text = "/pub/"
        txtPath3.Text = ".exe"

    End Sub


    Public Sub EXEGHFile()

        txtServerHostAddress.Text = "http://downloads.gamehouse.com"
        txtPath1.Text = "/gameconsole/realarcadev21/games/"
        txtPath2.Text = "/pub/"
        txtPath3.Text = ".exe"

    End Sub



    Public Sub RGA26File()

        txtServerHostAddress.Text = "http://games-dl2.real.com"
        txtPath1.Text = "/gameconsole/realarcadev21/games/dip/"
        txtPath2.Text = "/"
        txtPath3.Text = ".rga"

    End Sub



    Public Sub RG3File()

        txtServerHostAddress.Text = "http://games-dl.gamehouse.com"
        txtPath1.Text = "/zylom/ghmigration/"
        txtPath2.Text = "/"
        txtPath3.Text = ".rga"

    End Sub


    Public Sub RGA26AMFile()

        txtServerHostAddress.Text = "http://games-dl2.real.com"
        txtPath1.Text = "/gameconsole/realarcadev21/games/am-"
        txtPath2.Text = "/am-"
        txtPath3.Text = ".rga"

    End Sub


    Public Sub RGA26AMGFile()

        txtServerHostAddress.Text = "http://games-dl2.real.com"
        txtPath1.Text = "/gameconsole/realarcadev21/games/amg-"
        txtPath2.Text = "/amg-"
        txtPath3.Text = ".rga"

    End Sub


    Public Sub DMGFile()
        txtServerHostAddress.Text = "http://downloads.gamehouse.com"
        txtPath1.Text = "/pub"
        txtPath2.Text = "/"
        txtPath3.Text = ".dmg"

    End Sub


    Public Sub DMGAMACFile()

        txtServerHostAddress.Text = "http://downloads.gamehouse.com"
        txtPath1.Text = "/pub/"
        txtPath2.Text = "amac-"
        txtPath3.Text = ".dmg"

    End Sub


    Public Sub Stub1()

        txtServerHostAddress.Text = "http://install.real.com"
        txtPath1.Text = "/installerPackages.packages?tps=gamehouse_&gameid=am-"
        txtPath2.Text = "&product_id=&arcadeinstalled=&racversion=&existingtps=&ractype=fullclient&installerversion=&src=&rsrc=&lsrc=&sparam=&isrc=&ilsrc=&irsrc="
        txtPath3.Text = "&guid=1&subscription="

    End Sub


    Public Sub Stub2()

        txtServerHostAddress.Text = "http://install.real.com"
        txtPath1.Text = "/installer/installerRedirect/GameHouse-Installer_am-"
        txtPath2.Text = "_gamehouse_.exe?tps=gamehouse_&gameid=am-"
        txtPath3.Text = "&product_id=&arcadeinstalled=&racversion=&existingtps=&ractype=fullclient&installerversion=&src=&rsrc=&lsrc=&sparam=&isrc=&ilsrc=&irsrc=&guid=1&subscription="

    End Sub


    Public Sub Stub3()

        txtServerHostAddress.Text = "http://switchboard.real.com"
        txtPath1.Text = "/arcade/feeds.html?tps=gamehouse_&lang=en&country=US&client=web&partner=0&src=&rsrc=&lsrc=&sparam=&isrc=&irsrc=&ilsrc=&guid=1&subscription=&ractype=fullclient&action=download&gameid=am-"
        txtPath2.Text = "&gametype=download&"
        txtPath3.Text = "installerversion=&visitid="


    End Sub


    Public Sub Stub4()

        txtServerHostAddress.Text = "http://itm.zylom.com"
        txtPath1.Text = "/itm/installer/installerRedirect/Installer_"
        txtPath2.Text = ".exe?gameid="
        txtPath3.Text = "&channel=z_syn_gh_g12"
        txtPath4.Text = "&otp=&tracking="
        txtPath5.Text = "&currency=1&price=00.0&installerversion=&lang=&extratracking=&publisher=ghmigration"


    End Sub


    Public Sub OpenInWebpageWindows()

        txtServerHostAddress.Text = "http://www.gamehouse.com"
        txtPath1.Text = "/download"
        txtPath2.Text = "-games"
        txtPath3.Text = "/"
    End Sub


    Public Sub OpenInWebpageMac()

        txtServerHostAddress.Text = "http://www.gamehouse.com"
        txtPath1.Text = "/mac"
        txtPath2.Text = "-games"
        'OLD txtPath3.Text = "/"
        txtPath3.Text = "/macintosh-"
    End Sub


    Public Sub OpenInWebpageAndroid()

        txtServerHostAddress.Text = "http://www.gamehouse.com"
        txtPath1.Text = "/android"
        txtPath2.Text = "-games"
        txtPath3.Text = "/"
    End Sub


    Public Sub OpenInWebpageIphoneIpod()

        txtServerHostAddress.Text = "http://www.gamehouse.com"
        txtPath1.Text = "/iphone"
        txtPath2.Text = "-games"
        txtPath3.Text = "/"
    End Sub


    Public Sub OpenInWebpageIpad()

        txtServerHostAddress.Text = "http://www.gamehouse.com"
        txtPath1.Text = "/ipad"
        txtPath2.Text = "-games"
        txtPath3.Text = "/"
    End Sub

#End Region

#Region "Download Path"

    Public Sub GetDownloadPath()

        Dim DLPath As String
        'DLPath = System.Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments)
        DLPath = "C:\My Download Files"
        txtDownloadPath.Text = DLPath

        Dim CheckDownloadFolder As Boolean
        CheckDownloadFolder = My.Computer.FileSystem.DirectoryExists(DLPath)

        If CheckDownloadFolder.Equals(False) Then
            My.Computer.FileSystem.CreateDirectory(DLPath)
        ElseIf CheckDownloadFolder.Equals(True) Then
            Exit Sub
        End If


    End Sub

    Public Sub GetDownloadFolder()


        Dim dlgDownloadPath As New FolderBrowserDialog

        With dlgDownloadPath
            ' Desktop is the root folder in the dialog.
            .RootFolder = Environment.SpecialFolder.Desktop

            ' Select the C:\ folder on entry.
            .SelectedPath = Environment.SpecialFolder.Desktop

            ' Prompt the user with a custom message.
            .Description = "Select the folder to save file to"

            If .ShowDialog = DialogResult.OK Then
                ' Display the selected folder if the user clicked on the OK button.
                txtDownloadPath.Text = .SelectedPath
            End If
        End With

    End Sub



#End Region

#Region "Download Engine"

    Public Sub StartDownload()


        Dim URA_Downloader As WebClient = New WebClient
        AddHandler URA_Downloader.DownloadProgressChanged, AddressOf URA_Downloader_ProgressChanged
        AddHandler URA_Downloader.DownloadFileCompleted, AddressOf URA_Downloader_DownloadCompleted



        If txtFileTypeContainer.Text = "rgs" Then
            btnGoDownloadNow.Text = "Start Download"
            URA_Downloader.DownloadFileAsync(New Uri(txtFinalLink.Text), txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text)

        ElseIf txtFileTypeContainer.Text = "rga21" Then
            btnGoDownloadNow.Text = "Start Download"
            URA_Downloader.DownloadFileAsync(New Uri(txtFinalLink.Text), txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text)

        ElseIf txtFileTypeContainer.Text = "exe" Then
            btnGoDownloadNow.Text = "Start Download"
            URA_Downloader.DownloadFileAsync(New Uri(txtFinalLink.Text), txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text)

        ElseIf txtFileTypeContainer.Text = "exegh" Then
            btnGoDownloadNow.Text = "Start Download"
            URA_Downloader.DownloadFileAsync(New Uri(txtFinalLink.Text), txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text)

        ElseIf txtFileTypeContainer.Text = "rga26" Then
            btnGoDownloadNow.Text = "Start Download"
            URA_Downloader.DownloadFileAsync(New Uri(txtFinalLink.Text), txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text)
            
        ElseIf txtFileTypeContainer.Text = "rg3" Then
            btnGoDownloadNow.Text = "Start Download"
            URA_Downloader.DownloadFileAsync(New Uri(txtFinalLink.Text), txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text)

        ElseIf txtFileTypeContainer.Text = "rga26am" Then
            btnGoDownloadNow.Text = "Start Download"
            URA_Downloader.DownloadFileAsync(New Uri(txtFinalLink.Text), txtDownloadPath.Text + "\" + "am-" + txtGameNameManual.Text + txtPath3.Text)

        ElseIf txtFileTypeContainer.Text = "rga26amg" Then
            btnGoDownloadNow.Text = "Start Download"
            URA_Downloader.DownloadFileAsync(New Uri(txtFinalLink.Text), txtDownloadPath.Text + "\" + "amg-" + txtGameNameManual.Text + txtPath3.Text)

        ElseIf txtFileTypeContainer.Text = "dmg" Then
            btnGoDownloadNow.Text = "Start Download"
            URA_Downloader.DownloadFileAsync(New Uri(txtFinalLink.Text), txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text)

        ElseIf txtFileTypeContainer.Text = "dmgamac" Then
            btnGoDownloadNow.Text = "Start Download"
            URA_Downloader.DownloadFileAsync(New Uri(txtFinalLink.Text), txtDownloadPath.Text + "\" + "amac-" + txtGameNameManual.Text + txtPath3.Text)

        ElseIf txtFileTypeContainer.Text = "webWindows" Then
            btnGoDownloadNow.Text = "Open In Browser"
            btnGoDownloadNow.Enabled = True
            btnCancelDownload.Enabled = False
            Exit Sub

        ElseIf txtFileTypeContainer.Text = "webMac" Then
            btnGoDownloadNow.Text = "Open In Browser"
            btnGoDownloadNow.Enabled = True
            btnCancelDownload.Enabled = False
            Exit Sub

        ElseIf txtFileTypeContainer.Text = "webAndroid" Then
            btnGoDownloadNow.Text = "Open In Browser"
            btnGoDownloadNow.Enabled = True
            btnCancelDownload.Enabled = False
            Exit Sub

        ElseIf txtFileTypeContainer.Text = "webIphoneIpod" Then
            btnGoDownloadNow.Text = "Open In Browser"
            btnGoDownloadNow.Enabled = True
            btnCancelDownload.Enabled = False
            Exit Sub

        ElseIf txtFileTypeContainer.Text = "webIpad" Then
            btnGoDownloadNow.Text = "Open In Browser"
            btnGoDownloadNow.Enabled = True
            btnCancelDownload.Enabled = False
            Exit Sub


        ElseIf txtFileTypeContainer.Text = "stub1" Then
            btnGoDownloadNow.Text = "Build and Download Web Game Stub"
            btnGoDownloadNow.Enabled = True
            btnCancelDownload.Enabled = False
            Exit Sub

        ElseIf txtFileTypeContainer.Text = "stub2" Then
           btnGoDownloadNow.Text = "Build and Download Web Game Stub"
            btnGoDownloadNow.Enabled = True
            btnCancelDownload.Enabled = False
            Exit Sub

        ElseIf txtFileTypeContainer.Text = "stub3" Then
            btnGoDownloadNow.Text = "Build and Download Web Game Stub"
            btnGoDownloadNow.Enabled = True
            btnCancelDownload.Enabled = False
            Exit Sub

        ElseIf txtFileTypeContainer.Text = "stub4" Then
            btnGoDownloadNow.Text = "Build and Download Web Game Stub"
            btnGoDownloadNow.Enabled = True
            btnCancelDownload.Enabled = False
            Exit Sub

        End If

        'btnGoDownloadNow.Text = "Download in Progress"
        btnGoDownloadNow.Text = "Downloading " + txtGameNameManual.Text + txtPath3.Text + "...."
        btnGoDownloadNow.Enabled = False
        btnCancelDownload.Enabled = True

        pgbDownloading.Style = ProgressBarStyle.Continuous

        Dim FullPathLocal As String = txtDownloadPath.Text + txtGameNameManual.Text + txtPath3.Text

    End Sub


    Private Sub URA_Downloader_ProgressChanged(ByVal sender As Object, ByVal e As DownloadProgressChangedEventArgs)


        Dim bytesIn As Double = Double.Parse(e.BytesReceived.ToString())
        Dim totalBytes As Double = Double.Parse(e.TotalBytesToReceive.ToString())
        Dim percentage As Double = bytesIn / totalBytes * 100

        pgbDownloading.Value = Int32.Parse(Math.Truncate(percentage).ToString())

    End Sub


    Private Sub URA_Downloader_DownloadCompleted(ByVal sender As Object, ByVal e As System.ComponentModel.AsyncCompletedEventArgs)

        'MessageBox.Show("Download Finished!")

        pgbDownloading.Style = ProgressBarStyle.Marquee

        btnGoDownloadNow.Text = "Start Download"
        btnGoDownloadNow.Enabled = True
        btnCancelDownload.Enabled = False

        CheckForZeroByteFile()

    End Sub


    Public Sub DownloadStop()



    End Sub




    Public Sub BuildNewLink()

        If txtFileTypeContainer.Text = "rgs" Then

            txtFinalLink.Text = txtServerHostAddress.Text + txtPath1.Text + txtPath2.Text + txtGameNameManual.Text + txtPath3.Text
            'MsgBox(txtFinalLink.Text, MsgBoxStyle.Information, "Info")

        ElseIf txtFileTypeContainer.Text = "rga21" Then

            txtFinalLink.Text = txtServerHostAddress.Text + txtPath1.Text + txtGameNameManual.Text + txtPath2.Text + txtGameNameManual.Text + txtPath3.Text
            'MsgBox(txtFinalLink.Text, MsgBoxStyle.Information, "Info")

        ElseIf txtFileTypeContainer.Text = "exe" Then

            txtFinalLink.Text = txtServerHostAddress.Text + txtPath1.Text + txtPath2.Text + txtGameNameManual.Text + txtPath3.Text
            'MsgBox(txtFinalLink.Text, MsgBoxStyle.Information, "Info")

        ElseIf txtFileTypeContainer.Text = "exegh" Then

            txtFinalLink.Text = txtServerHostAddress.Text + txtPath1.Text + txtPath2.Text + txtGameNameManual.Text + txtPath3.Text
            'MsgBox(txtFinalLink.Text, MsgBoxStyle.Information, "Info")

        ElseIf txtFileTypeContainer.Text = "rga26" Then

            txtFinalLink.Text = txtServerHostAddress.Text + txtPath1.Text + txtGameNameManual.Text + txtPath2.Text + txtGameNameManual.Text + txtPath3.Text
            'MsgBox(txtFinalLink.Text, MsgBoxStyle.Information, "Info")

        ElseIf txtFileTypeContainer.Text = "rg3" Then

            txtFinalLink.Text = txtServerHostAddress.Text + txtPath1.Text + txtGameNameManual.Text + txtPath2.Text + txtGameNameManual.Text + txtPath3.Text
            'MsgBox(txtFinalLink.Text, MsgBoxStyle.Information, "Info")

        ElseIf txtFileTypeContainer.Text = "rga26am" Then

            txtFinalLink.Text = txtServerHostAddress.Text + txtPath1.Text + txtGameNameManual.Text + txtPath2.Text + txtGameNameManual.Text + txtPath3.Text
            'MsgBox(txtFinalLink.Text, MsgBoxStyle.Information, "Info")

        ElseIf txtFileTypeContainer.Text = "rga26amg" Then

            txtFinalLink.Text = txtServerHostAddress.Text + txtPath1.Text + txtGameNameManual.Text + txtPath2.Text + txtGameNameManual.Text + txtPath3.Text
            'MsgBox(txtFinalLink.Text, MsgBoxStyle.Information, "Info")

        ElseIf txtFileTypeContainer.Text = "dmg" Then

            txtFinalLink.Text = txtServerHostAddress.Text + txtPath1.Text + txtPath2.Text + txtGameNameManual.Text + txtPath3.Text
            'MsgBox(txtFinalLink.Text, MsgBoxStyle.Information, "Info")

        ElseIf txtFileTypeContainer.Text = "dmgamac" Then

            txtFinalLink.Text = txtServerHostAddress.Text + txtPath1.Text + txtPath2.Text + txtGameNameManual.Text + txtPath3.Text
            'MsgBox(txtFinalLink.Text, MsgBoxStyle.Information, "Info")

        ElseIf txtFileTypeContainer.Text = "stub1" Then

            txtFinalLink.Text = txtServerHostAddress.Text + txtPath1.Text + txtGameNameManual.Text + txtPath2.Text + txtPath3.Text
            'MsgBox(txtFinalLink.Text, MsgBoxStyle.Information, "Info")
            'Process.Start("iexplore.exe", txtFinalLink.Text)
            'URAWebBrowser.Show()
            URAWebBrowser.URAWebBrowserView.Navigate(txtFinalLink.Text)
            Exit Sub

        ElseIf txtFileTypeContainer.Text = "stub2" Then

            txtFinalLink.Text = txtServerHostAddress.Text + txtPath1.Text + txtGameNameManual.Text + txtPath2.Text + txtGameNameManual.Text + txtPath3.Text
            'MsgBox(txtFinalLink.Text, MsgBoxStyle.Information, "Info")
            'Process.Start("iexplore.exe", txtFinalLink.Text)
            'URAWebBrowser.Show()
            URAWebBrowser.URAWebBrowserView.Navigate(txtFinalLink.Text)
            Exit Sub

        ElseIf txtFileTypeContainer.Text = "stub3" Then

            txtFinalLink.Text = txtServerHostAddress.Text + txtPath1.Text + txtGameNameManual.Text + txtPath2.Text + txtPath3.Text
            'MsgBox(txtFinalLink.Text, MsgBoxStyle.Information, "Info")
            'Process.Start("iexplore.exe", txtFinalLink.Text)
            'URAWebBrowser.Show()
            URAWebBrowser.URAWebBrowserView.Navigate(txtFinalLink.Text)
            Exit Sub

        ElseIf txtFileTypeContainer.Text = "stub4" Then

            txtFinalLink.Text = txtServerHostAddress.Text + txtPath1.Text + txtGameNameManual.Text + txtPath2.Text + txtPath3.Text + txtPath4.Text + txtPath5.Text
            'MsgBox(txtFinalLink.Text, MsgBoxStyle.Information, "Info")
            'Process.Start("iexplore.exe", txtFinalLink.Text)
            'URAWebBrowser.Show()
            URAWebBrowser.URAWebBrowserView.Navigate(txtFinalLink.Text)
            Exit Sub

        ElseIf txtFileTypeContainer.Text = "webWindows" Then

            txtFinalLink.Text = txtServerHostAddress.Text + txtPath1.Text + txtPath2.Text + txtPath3.Text + txtGameNameManual.Text
            'MsgBox(txtFinalLink.Text, MsgBoxStyle.Information, "Info")
            'Process.Start("iexplore.exe", txtFinalLink.Text)
            URAWebBrowser.Show()
            URAWebBrowser.URAWebBrowserView.ScriptErrorsSuppressed = True
            URAWebBrowser.URAWebBrowserView.Navigate(txtFinalLink.Text)

            'GetWebLinks()

            Exit Sub


        ElseIf txtFileTypeContainer.Text = "webMac" Then

            txtFinalLink.Text = txtServerHostAddress.Text + txtPath1.Text + txtPath2.Text + txtPath3.Text + txtGameNameManual.Text
            'MsgBox(txtFinalLink.Text, MsgBoxStyle.Information, "Info")
            'Process.Start("iexplore.exe", txtFinalLink.Text)
            URAWebBrowser.Show()
            URAWebBrowser.URAWebBrowserView.ScriptErrorsSuppressed = True
            URAWebBrowser.URAWebBrowserView.Navigate(txtFinalLink.Text)
            Exit Sub

        ElseIf txtFileTypeContainer.Text = "webAndroid" Then

            txtFinalLink.Text = txtServerHostAddress.Text + txtPath1.Text + txtPath2.Text + txtPath3.Text + txtGameNameManual.Text
            'MsgBox(txtFinalLink.Text, MsgBoxStyle.Information, "Info")
            'Process.Start("iexplore.exe", txtFinalLink.Text)
            URAWebBrowser.Show()
            URAWebBrowser.URAWebBrowserView.ScriptErrorsSuppressed = True
            URAWebBrowser.URAWebBrowserView.Navigate(txtFinalLink.Text)
            Exit Sub

        ElseIf txtFileTypeContainer.Text = "webIphoneIpod" Then

            txtFinalLink.Text = txtServerHostAddress.Text + txtPath1.Text + txtPath2.Text + txtPath3.Text + txtGameNameManual.Text
            'MsgBox(txtFinalLink.Text, MsgBoxStyle.Information, "Info")
            'Process.Start("iexplore.exe", txtFinalLink.Text)
            URAWebBrowser.Show()
            URAWebBrowser.URAWebBrowserView.ScriptErrorsSuppressed = True
            URAWebBrowser.URAWebBrowserView.Navigate(txtFinalLink.Text)
            Exit Sub

        ElseIf txtFileTypeContainer.Text = "webIpad" Then

            txtFinalLink.Text = txtServerHostAddress.Text + txtPath1.Text + txtPath2.Text + txtPath3.Text + txtGameNameManual.Text
            'MsgBox(txtFinalLink.Text, MsgBoxStyle.Information, "Info")
            'Process.Start("iexplore.exe", txtFinalLink.Text)
            URAWebBrowser.Show()
            URAWebBrowser.URAWebBrowserView.ScriptErrorsSuppressed = True
            URAWebBrowser.URAWebBrowserView.Navigate(txtFinalLink.Text)
            Exit Sub

        ElseIf txtFileTypeContainer.Text = "" Then
            Exit Sub

        End If

    End Sub


#End Region

#Region "Download Other"

    Private Sub btnGoDownloadNow_Click(sender As System.Object, e As System.EventArgs) Handles btnGoDownloadNow.Click

        If txtGameNameManual.Text = "" Then
            MsgBox("You Have Not Selected or Typed a Game Name!", MsgBoxStyle.Information, "Info")
            Exit Sub
        End If

        FixManualGameName()

        btnGoDownloadNow.Text = "Downloading " + txtGameNameManual.Text + txtPath3.Text + "...."
        btnGoDownloadNow.Enabled = False

        BuildNewLink()
        StartDownload()




    End Sub



    Private Sub btnDownloadPathBrowse_Click(sender As System.Object, e As System.EventArgs) Handles btnDownloadPathBrowse.Click

        GetDownloadFolder()

    End Sub

    Private Sub btnCancelDownload_Click(sender As System.Object, e As System.EventArgs) Handles btnCancelDownload.Click

        DownloadStop()

        '.CancelAsync()



    End Sub



    Public Sub GetWebLinks()

        Try

            'If URAWebBrowser.URAWebBrowserView.ReadyState = WebBrowserReadyState.Complete Then
            For Each ClientControl As HtmlElement In URAWebBrowser.URAWebBrowserView.Document.Links
                'Debug.Print(ClientControl.GetAttribute("href"))
                MsgBox(ClientControl.GetAttribute("href"))
            Next
            'End If


        Catch ex As Exception

        End Try



    End Sub

#End Region

#Region "Canvas Manipulation"

    Public Sub CanvasNormal()

        'Normal = 444, 400

        Me.Size = New System.Drawing.Size(444, 400)

        Me.Width = 444
        Me.Height = 400

    End Sub


    Public Sub CanvasExtended()

        'Extended = 756, 400

        Me.Size = New System.Drawing.Size(756, 400)

        Me.Width = 756
        Me.Height = 400

    End Sub



    Private Sub btnCanvasControl_Click(sender As System.Object, e As System.EventArgs) Handles btnCanvasControl.Click

        If Me.Width = "444" Then
            CanvasExtended()

        ElseIf Me.Width = "756" Then
            CanvasNormal()
        End If

        'ReadBytes()

    End Sub

#End Region

#Region "File Check"


    Public Sub CheckForZeroByteFile()



        If txtFileTypeContainer.Text = "rgs" Then

            txtFullPathLocal.Text = txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text

        End If

        If txtFileTypeContainer.Text = "rga21" Then

            txtFullPathLocal.Text = txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text

        End If

        If txtFileTypeContainer.Text = "exe" Then

            txtFullPathLocal.Text = txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text

        End If

        If txtFileTypeContainer.Text = "exegh" Then

            txtFullPathLocal.Text = txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text

        End If

        If txtFileTypeContainer.Text = "rga26" Then

            txtFullPathLocal.Text = txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text

        End If

        If txtFileTypeContainer.Text = "rg3" Then

            txtFullPathLocal.Text = txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text

        End If

        If txtFileTypeContainer.Text = "rga26am" Then

            txtFullPathLocal.Text = txtDownloadPath.Text + "\" + "am-" + txtGameNameManual.Text + txtPath3.Text

        End If

        If txtFileTypeContainer.Text = "rga26amg" Then

            txtFullPathLocal.Text = txtDownloadPath.Text + "\" + "amg-" + txtGameNameManual.Text + txtPath3.Text

        End If

        If txtFileTypeContainer.Text = "dmg" Then

            txtFullPathLocal.Text = txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text

        End If

        If txtFileTypeContainer.Text = "dmgamac" Then

            txtFullPathLocal.Text = txtDownloadPath.Text + "\" + "amac-" + txtGameNameManual.Text + txtPath3.Text

        End If

        If txtFileTypeContainer.Text = "stub1" Then

            'txtFullPathLocal.Text= txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text

        End If

        If txtFileTypeContainer.Text = "stub2" Then

            'txtFullPathLocal.Text = txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text

        End If

        If txtFileTypeContainer.Text = "stub3" Then

            'txtFullPathLocal.Text = txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text

        End If

        If txtFileTypeContainer.Text = "stub4" Then

            'txtFullPathLocal.Text = txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text

        End If

        If txtFileTypeContainer.Text = "webWindows" Then

            'txtFullPathLocal.Text = txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text

        End If

        If txtFileTypeContainer.Text = "webMac" Then

            'txtFullPathLocal.Text = txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text

        End If

        If txtFileTypeContainer.Text = "webAndroid" Then

            'txtFullPathLocal.Text = txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text

        End If

        If txtFileTypeContainer.Text = "webIphoneIpod" Then

            'txtFullPathLocal.Text = txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text

        End If

        If txtFileTypeContainer.Text = "webIpad" Then

            'txtFullPathLocal.Text = txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text

        End If


        Dim CurrentDownloadFileSize As Long
        CurrentDownloadFileSize = My.Computer.FileSystem.GetFileInfo(txtFullPathLocal.Text).Length



        If CurrentDownloadFileSize = 0 Then
            My.Computer.FileSystem.DeleteFile(txtFullPathLocal.Text, FileIO.UIOption.OnlyErrorDialogs, FileIO.RecycleOption.DeletePermanently)
            MsgBox("This Game Is Not Available For Current Archive Type!", MsgBoxStyle.Exclamation, "Incompatible Format")
        Else
            Process.Start("explorer.exe", txtDownloadPath.Text)
        End If

        If txtDoesRAWKExist.Text = "1" Then

            Dim RAWK As String = "C:\Program Files\unRealArcade\rawk\RAWrapperKiller.exe"
            Process.Start(RAWK)

            Dim RGSLaunch As String = txtFullPathLocal.Text
            Process.Start(RGSLaunch)

        Else

            Exit Sub

        End If

    End Sub

#End Region

#Region "Multilanguage Options"

    Public Sub SelectRGS()

        rdoGameTypeRGS.Checked = True

    End Sub

    Public Sub ClearGameName()

        txtGameNameManual.Clear()

    End Sub

    Public Sub DisableAllGameTypesExceptRGS()

        rdoGameTypeDMG.Enabled = False
        rdoGameTypeDMGAMAC.Enabled = False
        rdoGameTypeEXE.Enabled = False
        rdoGameTypeEXEGH.Enabled = False
        rdoGameTypeRGA21.Enabled = False
        rdoGameTypeRGA26.Enabled = False
        rdoGameTypeRGA26AM.Enabled = False
        rdoGameTypeRGA26AMG.Enabled = False

        rdoGameTypeOpenInWebpageAndroid.Enabled = False
        rdoGameTypeOpenInWebpageIpad.Enabled = False
        rdoGameTypeOpenInWebpageIphoneIpod.Enabled = False
        rdoGameTypeOpenInWebpageMac.Enabled = False
        rdoGameTypeOpenInWebpageWindows.Enabled = False

        rdoGameTypeWebStubInstallerPackages.Enabled = False
        rdoGameTypeWebStubInstallerRedirect.Enabled = False

    End Sub

    Public Sub EnableAllGameTypes()

        rdoGameTypeDMG.Enabled = True
        rdoGameTypeDMGAMAC.Enabled = True
        rdoGameTypeEXE.Enabled = True
        rdoGameTypeEXEGH.Enabled = True
        rdoGameTypeRGA21.Enabled = True
        rdoGameTypeRGA26.Enabled = True
        rdoGameTypeRGA26AM.Enabled = True
        rdoGameTypeRGA26AMG.Enabled = True
        rdoGameTypeRGS.Enabled = True

        rdoGameTypeOpenInWebpageAndroid.Enabled = True
        rdoGameTypeOpenInWebpageIpad.Enabled = True
        rdoGameTypeOpenInWebpageIphoneIpod.Enabled = True
        rdoGameTypeOpenInWebpageMac.Enabled = True
        rdoGameTypeOpenInWebpageWindows.Enabled = True

        rdoGameTypeWebStubInstallerPackages.Enabled = True
        rdoGameTypeWebStubInstallerRedirect.Enabled = True

    End Sub

    Public Sub DisableAllGameTypes()

        rdoGameTypeDMG.Enabled = False
        rdoGameTypeDMGAMAC.Enabled = False
        rdoGameTypeEXE.Enabled = False
        rdoGameTypeEXEGH.Enabled = False
        rdoGameTypeRGA21.Enabled = False
        rdoGameTypeRGA26.Enabled = False
        rdoGameTypeRGA26AM.Enabled = False
        rdoGameTypeRGA26AMG.Enabled = False
        rdoGameTypeRGS.Enabled = False

        rdoGameTypeOpenInWebpageAndroid.Enabled = False
        rdoGameTypeOpenInWebpageIpad.Enabled = False
        rdoGameTypeOpenInWebpageIphoneIpod.Enabled = False
        rdoGameTypeOpenInWebpageMac.Enabled = False
        rdoGameTypeOpenInWebpageWindows.Enabled = False

        rdoGameTypeWebStubInstallerPackages.Enabled = False
        rdoGameTypeWebStubInstallerRedirect.Enabled = False

    End Sub

#End Region

#Region "Misc"

    Public Sub CloneToCurrentDownloadTarget()

        'lblCurrentDownloadTarget.Text = txtFinalLink.Text

    End Sub

    Public Sub ClearCurrentDownloadTargetLabel()

        lblCurrentDownloadTarget.Text = ""

    End Sub

#End Region

#Region "Unused Code"

    'UNUSED
    Public Sub webWindowsGetLinks()

        If URAWebBrowser.URAWebBrowserView.ReadyState = WebBrowserReadyState.Loading = True Then
            webWindowsGetLinks()
        End If

        If URAWebBrowser.URAWebBrowserView.ReadyState = WebBrowserReadyState.Interactive = True Then
            GetWebLinks()
        End If



    End Sub

    'Public Function ExtractLinks(ByVal url As String) As DataTable
    '    Dim dt As New DataTable
    '    dt.Columns.Add("LinkText")
    '    dt.Columns.Add("LinkUrl")

    '    Dim wc As New WebClient
    '    Dim html As String = wc.DownloadString(url)

    '    Dim links As MatchCollection = Regex.Matches(html, "<a.*?href=""(.*?)"".*?>(.*?)</a>")

    '    For Each match As Match In links
    '        Dim dr As DataRow = dt.NewRow
    '        Dim matchUrl As String = match.Groups(1).Value
    '        'Ignore all anchor links
    '        If matchUrl.StartsWith("#") Then
    '            Continue For
    '        End If
    '        'Ignore all javascript calls
    '        If matchUrl.ToLower.StartsWith("javascript:") Then
    '            Continue For
    '        End If
    '        'Ignore all email links
    '        If matchUrl.ToLower.StartsWith("mailto:") Then
    '            Continue For
    '        End If
    '        'For internal links, build the url mapped to the base address
    '        If Not matchUrl.StartsWith("http://") And Not matchUrl.StartsWith("https://") Then
    '            matchUrl = MapUrl(url, matchUrl)
    '        End If
    '        'Add the link data to datatable
    '        dr("LinkUrl") = matchUrl
    '        dr("LinkText") = match.Groups(2).Value
    '        dt.Rows.Add(dr)
    '    Next

    '    Return dt
    'End Function

    'Public Function MapUrl(ByVal baseAddress As String, ByVal relativePath As String) As String

    '    Dim u As New System.Uri(baseAddress)

    '    If relativePath = "./" Then
    '        relativePath = "/"
    '    End If

    '    If relativePath.StartsWith("/") Then
    '        Return u.Scheme + Uri.SchemeDelimiter + u.Authority + relativePath
    '    Else
    '        Dim pathAndQuery As String = u.AbsolutePath
    '        ' If the baseAddress contains a file name, like ..../Something.aspx
    '        ' Trim off the file name
    '        pathAndQuery = pathAndQuery.Split("?")(0).TrimEnd("/")
    '        If pathAndQuery.Split("/")(pathAndQuery.Split("/").Count - 1).Contains(".") Then
    '            pathAndQuery = pathAndQuery.Substring(0, pathAndQuery.LastIndexOf("/"))
    '        End If
    '        baseAddress = u.Scheme + Uri.SchemeDelimiter + u.Authority + pathAndQuery

    '        'If the relativePath contains ../ then
    '        ' adjust the baseAddress accordingly

    '        While relativePath.StartsWith("../")
    '            relativePath = relativePath.Substring(3)
    '            If baseAddress.LastIndexOf("/") > baseAddress.IndexOf("//" + 2) Then
    '                baseAddress = baseAddress.Substring(0, baseAddress.LastIndexOf("/")).TrimEnd("/")
    '            End If
    '        End While

    '        Return baseAddress + "/" + relativePath
    '    End If

    'End Function



    Public Sub ReadBytes()



        Dim LocalFile As String = txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text


        Try

            Dim BytePool As Byte()
            BytePool = My.Computer.FileSystem.ReadAllBytes(LocalFile)


        Catch ex As Exception

        End Try



        'Using reader As New BinaryReader(File.Open(LocalFile, FileMode.Open))
        '    ' Loop through length of file.
        '    Dim pos As Integer = 0
        '    Dim length As Integer = reader.BaseStream.Length
        '    While pos < length
        '        ' Read the integer.
        '        Dim value As Integer = reader.ReadInt32()
        '        ' Write to screen.
        '        MsgBox(value)
        '        ' Add length of integer in bytes to position.
        '        pos += 4
        '    End While
        'End Using

    End Sub


    Public Sub WriteBytes()

        Dim LocalFile As String = txtDownloadPath.Text + "\" + txtGameNameManual.Text + txtPath3.Text


        Try

            'Dim BytePool As Byte()
            'BytePool = My.Computer.FileSystem.ReadAllBytes(LocalFile)

            Dim WriteNewBytes() As Byte = {0, 0, 0, 0}
            My.Computer.FileSystem.WriteAllBytes(LocalFile, WriteNewBytes, True)

        Catch ex As Exception

        End Try

    End Sub


    Public Function LoadBinaryFile(strFilename As String) As Byte()
        Using fsSource As FileStream = New FileStream(strFilename, FileMode.Open, FileAccess.Read)
            ' Read the source file into a byte array.
            Dim bytes() As Byte = New Byte((fsSource.Length) - 1) {}
            Dim numBytesToRead As Integer = CType(fsSource.Length, Integer)
            Dim numBytesRead As Integer = 0

            'tsProgressBar.Minimum = 0
            'tsProgressBar.Maximum = numBytesToRead

            While (numBytesToRead > 0)
                ' Read may return anything from 0 to numBytesToRead.
                Dim n As Integer = fsSource.Read(bytes, numBytesRead, _
                    numBytesToRead)
                ' Break when the end of the file is reached.
                If (n = 0) Then
                    Exit While
                End If
                numBytesRead = (numBytesRead + n)
                numBytesToRead = (numBytesToRead - n)

                'tsProgressBar.Value = numBytesRead

            End While
            numBytesToRead = bytes.Length

            Return bytes

        End Using
    End Function


    Public Sub SaveBinaryFile(strFilename As String, bytesToWrite() As Byte)
        Dim position As Integer = 0

        Using fsNew As FileStream = New FileStream(strFilename, FileMode.Create, FileAccess.Write)
            Do
                Dim intToCopy As Integer = Math.Min(4096, bytesToWrite.Length - position)
                Dim buffer(intToCopy - 1) As Byte
                Array.Copy(bytesToWrite, position, buffer, 0, intToCopy)
                fsNew.Write(buffer, 0, buffer.Length)
                pgbDownloading.Value = ((position / bytesToWrite.Length) * 100)
                Application.DoEvents()
                position += intToCopy
            Loop While position < bytesToWrite.Length
        End Using
    End Sub

#End Region


  
 


End Class

#End Region
