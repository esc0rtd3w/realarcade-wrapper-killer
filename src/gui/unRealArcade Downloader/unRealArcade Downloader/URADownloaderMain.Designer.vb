<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class URADownloaderMain
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(URADownloaderMain))
        Me.rdoGameTypeRGS = New System.Windows.Forms.RadioButton()
        Me.rdoGameTypeRGA21 = New System.Windows.Forms.RadioButton()
        Me.rdoGameTypeRGA26 = New System.Windows.Forms.RadioButton()
        Me.rdoGameTypeRGA26AM = New System.Windows.Forms.RadioButton()
        Me.txtGameNameManual = New System.Windows.Forms.TextBox()
        Me.lblGameName = New System.Windows.Forms.Label()
        Me.cboGameName = New System.Windows.Forms.ComboBox()
        Me.btnGoDownloadNow = New System.Windows.Forms.Button()
        Me.lblDownloadPath = New System.Windows.Forms.Label()
        Me.txtDownloadPath = New System.Windows.Forms.TextBox()
        Me.btnDownloadPathBrowse = New System.Windows.Forms.Button()
        Me.lblGameNameManual = New System.Windows.Forms.Label()
        Me.txtCurrentGameName = New System.Windows.Forms.TextBox()
        Me.txtServerHostAddress = New System.Windows.Forms.TextBox()
        Me.txtPath1 = New System.Windows.Forms.TextBox()
        Me.txtPath2 = New System.Windows.Forms.TextBox()
        Me.txtPath3 = New System.Windows.Forms.TextBox()
        Me.txtFileTypeContainer = New System.Windows.Forms.TextBox()
        Me.pgbDownloading = New System.Windows.Forms.ProgressBar()
        Me.txtFinalLink = New System.Windows.Forms.TextBox()
        Me.dlgDownloadPath = New System.Windows.Forms.FolderBrowserDialog()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.btnCancelDownload = New System.Windows.Forms.Button()
        Me.rdoGameTypeDMG = New System.Windows.Forms.RadioButton()
        Me.rdoGameTypeDMGAMAC = New System.Windows.Forms.RadioButton()
        Me.rdoGameTypeRGA26AMG = New System.Windows.Forms.RadioButton()
        Me.lblGameTypeCurrent = New System.Windows.Forms.Label()
        Me.lblGameTypeLegacy = New System.Windows.Forms.Label()
        Me.lblGameTypeWebStub = New System.Windows.Forms.Label()
        Me.rdoGameTypeWebStubInstallerRedirect = New System.Windows.Forms.RadioButton()
        Me.rdoGameTypeWebStubInstallerPackages = New System.Windows.Forms.RadioButton()
        Me.txtFullPathLocal = New System.Windows.Forms.TextBox()
        Me.lblGameTypeOpenInWebpage = New System.Windows.Forms.Label()
        Me.rdoGameTypeOpenInWebpageWindows = New System.Windows.Forms.RadioButton()
        Me.rdoGameTypeOpenInWebpageMac = New System.Windows.Forms.RadioButton()
        Me.rdoGameTypeOpenInWebpageIpad = New System.Windows.Forms.RadioButton()
        Me.rdoGameTypeOpenInWebpageIphoneIpod = New System.Windows.Forms.RadioButton()
        Me.rdoGameTypeOpenInWebpageAndroid = New System.Windows.Forms.RadioButton()
        Me.rdoGameTypeEXE = New System.Windows.Forms.RadioButton()
        Me.rdoGameTypeEXEGH = New System.Windows.Forms.RadioButton()
        Me.picGameArtworkMain = New System.Windows.Forms.PictureBox()
        Me.txtGameArtworkPreviewMain = New System.Windows.Forms.TextBox()
        Me.grpGameInfo = New System.Windows.Forms.GroupBox()
        Me.btnCanvasControl = New System.Windows.Forms.Button()
        Me.rdoMultiLanguageIT = New System.Windows.Forms.RadioButton()
        Me.rdoMultiLanguageFR = New System.Windows.Forms.RadioButton()
        Me.lblMultiLanguageSelect = New System.Windows.Forms.Label()
        Me.rdoMultiLanguageJP = New System.Windows.Forms.RadioButton()
        Me.rdoMultiLanguageDE = New System.Windows.Forms.RadioButton()
        Me.rdoMultiLanguageEN = New System.Windows.Forms.RadioButton()
        Me.rdoMultiLanguageNL = New System.Windows.Forms.RadioButton()
        Me.rdoMultiLanguageES = New System.Windows.Forms.RadioButton()
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.lblCurrentDownloadTarget = New System.Windows.Forms.Label()
        Me.rdoGameTypeWebStubSwitchboard = New System.Windows.Forms.RadioButton()
        Me.rdoGameTypeWebStubActiveMark = New System.Windows.Forms.RadioButton()
        Me.txtPath5 = New System.Windows.Forms.TextBox()
        Me.txtPath4 = New System.Windows.Forms.TextBox()
        Me.rdoGameTypeRG3 = New System.Windows.Forms.RadioButton()
        Me.txtDoesRAWKExist = New System.Windows.Forms.TextBox()
        CType(Me.picGameArtworkMain, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Panel1.SuspendLayout()
        Me.SuspendLayout()
        '
        'rdoGameTypeRGS
        '
        Me.rdoGameTypeRGS.AutoSize = True
        Me.rdoGameTypeRGS.Checked = True
        Me.rdoGameTypeRGS.Location = New System.Drawing.Point(108, 142)
        Me.rdoGameTypeRGS.Name = "rdoGameTypeRGS"
        Me.rdoGameTypeRGS.Size = New System.Drawing.Size(48, 17)
        Me.rdoGameTypeRGS.TabIndex = 0
        Me.rdoGameTypeRGS.TabStop = True
        Me.rdoGameTypeRGS.Text = "RGS"
        Me.rdoGameTypeRGS.UseVisualStyleBackColor = True
        '
        'rdoGameTypeRGA21
        '
        Me.rdoGameTypeRGA21.AutoSize = True
        Me.rdoGameTypeRGA21.Location = New System.Drawing.Point(162, 142)
        Me.rdoGameTypeRGA21.Name = "rdoGameTypeRGA21"
        Me.rdoGameTypeRGA21.Size = New System.Drawing.Size(72, 17)
        Me.rdoGameTypeRGA21.TabIndex = 1
        Me.rdoGameTypeRGA21.Text = "RGA v2.1"
        Me.rdoGameTypeRGA21.UseVisualStyleBackColor = True
        '
        'rdoGameTypeRGA26
        '
        Me.rdoGameTypeRGA26.AutoSize = True
        Me.rdoGameTypeRGA26.Location = New System.Drawing.Point(112, 171)
        Me.rdoGameTypeRGA26.Name = "rdoGameTypeRGA26"
        Me.rdoGameTypeRGA26.Size = New System.Drawing.Size(48, 17)
        Me.rdoGameTypeRGA26.TabIndex = 2
        Me.rdoGameTypeRGA26.Text = "RGA"
        Me.rdoGameTypeRGA26.UseVisualStyleBackColor = True
        '
        'rdoGameTypeRGA26AM
        '
        Me.rdoGameTypeRGA26AM.AutoSize = True
        Me.rdoGameTypeRGA26AM.Location = New System.Drawing.Point(166, 171)
        Me.rdoGameTypeRGA26AM.Name = "rdoGameTypeRGA26AM"
        Me.rdoGameTypeRGA26AM.Size = New System.Drawing.Size(73, 17)
        Me.rdoGameTypeRGA26AM.TabIndex = 3
        Me.rdoGameTypeRGA26AM.Text = "RGA (AM)"
        Me.rdoGameTypeRGA26AM.UseVisualStyleBackColor = True
        '
        'txtGameNameManual
        '
        Me.txtGameNameManual.Location = New System.Drawing.Point(88, 61)
        Me.txtGameNameManual.Name = "txtGameNameManual"
        Me.txtGameNameManual.Size = New System.Drawing.Size(331, 20)
        Me.txtGameNameManual.TabIndex = 4
        '
        'lblGameName
        '
        Me.lblGameName.AutoSize = True
        Me.lblGameName.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblGameName.Location = New System.Drawing.Point(3, 37)
        Me.lblGameName.Name = "lblGameName"
        Me.lblGameName.Size = New System.Drawing.Size(79, 13)
        Me.lblGameName.TabIndex = 5
        Me.lblGameName.Text = "Game Name:"
        '
        'cboGameName
        '
        Me.cboGameName.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cboGameName.FormattingEnabled = True
        Me.cboGameName.Location = New System.Drawing.Point(88, 34)
        Me.cboGameName.Name = "cboGameName"
        Me.cboGameName.Size = New System.Drawing.Size(331, 21)
        Me.cboGameName.Sorted = True
        Me.cboGameName.TabIndex = 6
        '
        'btnGoDownloadNow
        '
        Me.btnGoDownloadNow.Location = New System.Drawing.Point(5, 321)
        Me.btnGoDownloadNow.Name = "btnGoDownloadNow"
        Me.btnGoDownloadNow.Size = New System.Drawing.Size(414, 23)
        Me.btnGoDownloadNow.TabIndex = 7
        Me.btnGoDownloadNow.Text = "Start Download"
        Me.btnGoDownloadNow.UseVisualStyleBackColor = True
        '
        'lblDownloadPath
        '
        Me.lblDownloadPath.AutoSize = True
        Me.lblDownloadPath.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblDownloadPath.Location = New System.Drawing.Point(2, 287)
        Me.lblDownloadPath.Name = "lblDownloadPath"
        Me.lblDownloadPath.Size = New System.Drawing.Size(97, 13)
        Me.lblDownloadPath.TabIndex = 9
        Me.lblDownloadPath.Text = "Download Path:"
        '
        'txtDownloadPath
        '
        Me.txtDownloadPath.Location = New System.Drawing.Point(105, 284)
        Me.txtDownloadPath.Name = "txtDownloadPath"
        Me.txtDownloadPath.Size = New System.Drawing.Size(276, 20)
        Me.txtDownloadPath.TabIndex = 8
        '
        'btnDownloadPathBrowse
        '
        Me.btnDownloadPathBrowse.Location = New System.Drawing.Point(387, 282)
        Me.btnDownloadPathBrowse.Name = "btnDownloadPathBrowse"
        Me.btnDownloadPathBrowse.Size = New System.Drawing.Size(31, 23)
        Me.btnDownloadPathBrowse.TabIndex = 10
        Me.btnDownloadPathBrowse.Text = "..."
        Me.btnDownloadPathBrowse.UseVisualStyleBackColor = True
        '
        'lblGameNameManual
        '
        Me.lblGameNameManual.AutoSize = True
        Me.lblGameNameManual.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblGameNameManual.Location = New System.Drawing.Point(3, 64)
        Me.lblGameNameManual.Name = "lblGameNameManual"
        Me.lblGameNameManual.Size = New System.Drawing.Size(85, 13)
        Me.lblGameNameManual.TabIndex = 11
        Me.lblGameNameManual.Text = "Manual Entry:"
        '
        'txtCurrentGameName
        '
        Me.txtCurrentGameName.Location = New System.Drawing.Point(302, 258)
        Me.txtCurrentGameName.Name = "txtCurrentGameName"
        Me.txtCurrentGameName.Size = New System.Drawing.Size(10, 20)
        Me.txtCurrentGameName.TabIndex = 12
        Me.txtCurrentGameName.Visible = False
        '
        'txtServerHostAddress
        '
        Me.txtServerHostAddress.Location = New System.Drawing.Point(292, 258)
        Me.txtServerHostAddress.Name = "txtServerHostAddress"
        Me.txtServerHostAddress.Size = New System.Drawing.Size(10, 20)
        Me.txtServerHostAddress.TabIndex = 13
        Me.txtServerHostAddress.Visible = False
        '
        'txtPath1
        '
        Me.txtPath1.Location = New System.Drawing.Point(322, 258)
        Me.txtPath1.Name = "txtPath1"
        Me.txtPath1.Size = New System.Drawing.Size(10, 20)
        Me.txtPath1.TabIndex = 14
        Me.txtPath1.Visible = False
        '
        'txtPath2
        '
        Me.txtPath2.Location = New System.Drawing.Point(332, 258)
        Me.txtPath2.Name = "txtPath2"
        Me.txtPath2.Size = New System.Drawing.Size(10, 20)
        Me.txtPath2.TabIndex = 15
        Me.txtPath2.Visible = False
        '
        'txtPath3
        '
        Me.txtPath3.Location = New System.Drawing.Point(352, 258)
        Me.txtPath3.Name = "txtPath3"
        Me.txtPath3.Size = New System.Drawing.Size(10, 20)
        Me.txtPath3.TabIndex = 16
        Me.txtPath3.Visible = False
        '
        'txtFileTypeContainer
        '
        Me.txtFileTypeContainer.Location = New System.Drawing.Point(312, 258)
        Me.txtFileTypeContainer.Name = "txtFileTypeContainer"
        Me.txtFileTypeContainer.Size = New System.Drawing.Size(10, 20)
        Me.txtFileTypeContainer.TabIndex = 17
        Me.txtFileTypeContainer.Visible = False
        '
        'pgbDownloading
        '
        Me.pgbDownloading.ForeColor = System.Drawing.Color.Blue
        Me.pgbDownloading.Location = New System.Drawing.Point(6, 98)
        Me.pgbDownloading.Name = "pgbDownloading"
        Me.pgbDownloading.Size = New System.Drawing.Size(413, 23)
        Me.pgbDownloading.Style = System.Windows.Forms.ProgressBarStyle.Marquee
        Me.pgbDownloading.TabIndex = 18
        '
        'txtFinalLink
        '
        Me.txtFinalLink.Location = New System.Drawing.Point(342, 258)
        Me.txtFinalLink.Name = "txtFinalLink"
        Me.txtFinalLink.Size = New System.Drawing.Size(10, 20)
        Me.txtFinalLink.TabIndex = 19
        Me.txtFinalLink.Visible = False
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 6.75!, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(85, 82)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(102, 12)
        Me.Label1.TabIndex = 20
        Me.Label1.Text = "Example: supertapajam"
        '
        'btnCancelDownload
        '
        Me.btnCancelDownload.Enabled = False
        Me.btnCancelDownload.Location = New System.Drawing.Point(5, 350)
        Me.btnCancelDownload.Name = "btnCancelDownload"
        Me.btnCancelDownload.Size = New System.Drawing.Size(414, 23)
        Me.btnCancelDownload.TabIndex = 21
        Me.btnCancelDownload.Text = "Cancel Download"
        Me.btnCancelDownload.UseVisualStyleBackColor = True
        '
        'rdoGameTypeDMG
        '
        Me.rdoGameTypeDMG.AutoSize = True
        Me.rdoGameTypeDMG.Location = New System.Drawing.Point(369, 142)
        Me.rdoGameTypeDMG.Name = "rdoGameTypeDMG"
        Me.rdoGameTypeDMG.Size = New System.Drawing.Size(50, 17)
        Me.rdoGameTypeDMG.TabIndex = 22
        Me.rdoGameTypeDMG.Text = "DMG"
        Me.rdoGameTypeDMG.UseVisualStyleBackColor = True
        '
        'rdoGameTypeDMGAMAC
        '
        Me.rdoGameTypeDMGAMAC.AutoSize = True
        Me.rdoGameTypeDMGAMAC.Location = New System.Drawing.Point(332, 171)
        Me.rdoGameTypeDMGAMAC.Name = "rdoGameTypeDMGAMAC"
        Me.rdoGameTypeDMGAMAC.Size = New System.Drawing.Size(89, 17)
        Me.rdoGameTypeDMGAMAC.TabIndex = 23
        Me.rdoGameTypeDMGAMAC.Text = "DMG (AMAC)"
        Me.rdoGameTypeDMGAMAC.UseVisualStyleBackColor = True
        '
        'rdoGameTypeRGA26AMG
        '
        Me.rdoGameTypeRGA26AMG.AutoSize = True
        Me.rdoGameTypeRGA26AMG.Location = New System.Drawing.Point(245, 171)
        Me.rdoGameTypeRGA26AMG.Name = "rdoGameTypeRGA26AMG"
        Me.rdoGameTypeRGA26AMG.Size = New System.Drawing.Size(81, 17)
        Me.rdoGameTypeRGA26AMG.TabIndex = 24
        Me.rdoGameTypeRGA26AMG.Text = "RGA (AMG)"
        Me.rdoGameTypeRGA26AMG.UseVisualStyleBackColor = True
        '
        'lblGameTypeCurrent
        '
        Me.lblGameTypeCurrent.AutoSize = True
        Me.lblGameTypeCurrent.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblGameTypeCurrent.Location = New System.Drawing.Point(3, 173)
        Me.lblGameTypeCurrent.Name = "lblGameTypeCurrent"
        Me.lblGameTypeCurrent.Size = New System.Drawing.Size(54, 13)
        Me.lblGameTypeCurrent.TabIndex = 25
        Me.lblGameTypeCurrent.Text = "Archive:"
        '
        'lblGameTypeLegacy
        '
        Me.lblGameTypeLegacy.AutoSize = True
        Me.lblGameTypeLegacy.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblGameTypeLegacy.Location = New System.Drawing.Point(3, 145)
        Me.lblGameTypeLegacy.Name = "lblGameTypeLegacy"
        Me.lblGameTypeLegacy.Size = New System.Drawing.Size(99, 13)
        Me.lblGameTypeLegacy.TabIndex = 26
        Me.lblGameTypeLegacy.Text = "Legacy Archive:"
        '
        'lblGameTypeWebStub
        '
        Me.lblGameTypeWebStub.AutoSize = True
        Me.lblGameTypeWebStub.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblGameTypeWebStub.Location = New System.Drawing.Point(3, 208)
        Me.lblGameTypeWebStub.Name = "lblGameTypeWebStub"
        Me.lblGameTypeWebStub.Size = New System.Drawing.Size(115, 13)
        Me.lblGameTypeWebStub.TabIndex = 29
        Me.lblGameTypeWebStub.Text = "Build Stub Method:"
        '
        'rdoGameTypeWebStubInstallerRedirect
        '
        Me.rdoGameTypeWebStubInstallerRedirect.AutoSize = True
        Me.rdoGameTypeWebStubInstallerRedirect.Location = New System.Drawing.Point(171, 206)
        Me.rdoGameTypeWebStubInstallerRedirect.Name = "rdoGameTypeWebStubInstallerRedirect"
        Me.rdoGameTypeWebStubInstallerRedirect.Size = New System.Drawing.Size(65, 17)
        Me.rdoGameTypeWebStubInstallerRedirect.TabIndex = 28
        Me.rdoGameTypeWebStubInstallerRedirect.Text = "Redirect"
        Me.rdoGameTypeWebStubInstallerRedirect.UseVisualStyleBackColor = True
        '
        'rdoGameTypeWebStubInstallerPackages
        '
        Me.rdoGameTypeWebStubInstallerPackages.AutoSize = True
        Me.rdoGameTypeWebStubInstallerPackages.Location = New System.Drawing.Point(242, 206)
        Me.rdoGameTypeWebStubInstallerPackages.Name = "rdoGameTypeWebStubInstallerPackages"
        Me.rdoGameTypeWebStubInstallerPackages.Size = New System.Drawing.Size(73, 17)
        Me.rdoGameTypeWebStubInstallerPackages.TabIndex = 27
        Me.rdoGameTypeWebStubInstallerPackages.Text = "Packages"
        Me.rdoGameTypeWebStubInstallerPackages.UseVisualStyleBackColor = True
        '
        'txtFullPathLocal
        '
        Me.txtFullPathLocal.Location = New System.Drawing.Point(282, 258)
        Me.txtFullPathLocal.Name = "txtFullPathLocal"
        Me.txtFullPathLocal.Size = New System.Drawing.Size(10, 20)
        Me.txtFullPathLocal.TabIndex = 30
        Me.txtFullPathLocal.Visible = False
        '
        'lblGameTypeOpenInWebpage
        '
        Me.lblGameTypeOpenInWebpage.AutoSize = True
        Me.lblGameTypeOpenInWebpage.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblGameTypeOpenInWebpage.Location = New System.Drawing.Point(3, 241)
        Me.lblGameTypeOpenInWebpage.Name = "lblGameTypeOpenInWebpage"
        Me.lblGameTypeOpenInWebpage.Size = New System.Drawing.Size(65, 13)
        Me.lblGameTypeOpenInWebpage.TabIndex = 33
        Me.lblGameTypeOpenInWebpage.Text = "Webpage:"
        '
        'rdoGameTypeOpenInWebpageWindows
        '
        Me.rdoGameTypeOpenInWebpageWindows.AutoSize = True
        Me.rdoGameTypeOpenInWebpageWindows.Location = New System.Drawing.Point(74, 239)
        Me.rdoGameTypeOpenInWebpageWindows.Name = "rdoGameTypeOpenInWebpageWindows"
        Me.rdoGameTypeOpenInWebpageWindows.Size = New System.Drawing.Size(69, 17)
        Me.rdoGameTypeOpenInWebpageWindows.TabIndex = 31
        Me.rdoGameTypeOpenInWebpageWindows.Text = "Windows"
        Me.rdoGameTypeOpenInWebpageWindows.UseVisualStyleBackColor = True
        '
        'rdoGameTypeOpenInWebpageMac
        '
        Me.rdoGameTypeOpenInWebpageMac.AutoSize = True
        Me.rdoGameTypeOpenInWebpageMac.Location = New System.Drawing.Point(149, 239)
        Me.rdoGameTypeOpenInWebpageMac.Name = "rdoGameTypeOpenInWebpageMac"
        Me.rdoGameTypeOpenInWebpageMac.Size = New System.Drawing.Size(46, 17)
        Me.rdoGameTypeOpenInWebpageMac.TabIndex = 34
        Me.rdoGameTypeOpenInWebpageMac.Text = "Mac"
        Me.rdoGameTypeOpenInWebpageMac.UseVisualStyleBackColor = True
        '
        'rdoGameTypeOpenInWebpageIpad
        '
        Me.rdoGameTypeOpenInWebpageIpad.AutoSize = True
        Me.rdoGameTypeOpenInWebpageIpad.Location = New System.Drawing.Point(358, 239)
        Me.rdoGameTypeOpenInWebpageIpad.Name = "rdoGameTypeOpenInWebpageIpad"
        Me.rdoGameTypeOpenInWebpageIpad.Size = New System.Drawing.Size(46, 17)
        Me.rdoGameTypeOpenInWebpageIpad.TabIndex = 35
        Me.rdoGameTypeOpenInWebpageIpad.Text = "iPad"
        Me.rdoGameTypeOpenInWebpageIpad.UseVisualStyleBackColor = True
        '
        'rdoGameTypeOpenInWebpageIphoneIpod
        '
        Me.rdoGameTypeOpenInWebpageIphoneIpod.AutoSize = True
        Me.rdoGameTypeOpenInWebpageIphoneIpod.Location = New System.Drawing.Point(268, 239)
        Me.rdoGameTypeOpenInWebpageIphoneIpod.Name = "rdoGameTypeOpenInWebpageIphoneIpod"
        Me.rdoGameTypeOpenInWebpageIphoneIpod.Size = New System.Drawing.Size(84, 17)
        Me.rdoGameTypeOpenInWebpageIphoneIpod.TabIndex = 36
        Me.rdoGameTypeOpenInWebpageIphoneIpod.Text = "iPhone/iPod"
        Me.rdoGameTypeOpenInWebpageIphoneIpod.UseVisualStyleBackColor = True
        '
        'rdoGameTypeOpenInWebpageAndroid
        '
        Me.rdoGameTypeOpenInWebpageAndroid.AutoSize = True
        Me.rdoGameTypeOpenInWebpageAndroid.Location = New System.Drawing.Point(201, 239)
        Me.rdoGameTypeOpenInWebpageAndroid.Name = "rdoGameTypeOpenInWebpageAndroid"
        Me.rdoGameTypeOpenInWebpageAndroid.Size = New System.Drawing.Size(61, 17)
        Me.rdoGameTypeOpenInWebpageAndroid.TabIndex = 37
        Me.rdoGameTypeOpenInWebpageAndroid.Text = "Android"
        Me.rdoGameTypeOpenInWebpageAndroid.UseVisualStyleBackColor = True
        '
        'rdoGameTypeEXE
        '
        Me.rdoGameTypeEXE.AutoSize = True
        Me.rdoGameTypeEXE.Location = New System.Drawing.Point(240, 142)
        Me.rdoGameTypeEXE.Name = "rdoGameTypeEXE"
        Me.rdoGameTypeEXE.Size = New System.Drawing.Size(46, 17)
        Me.rdoGameTypeEXE.TabIndex = 38
        Me.rdoGameTypeEXE.Text = "EXE"
        Me.rdoGameTypeEXE.UseVisualStyleBackColor = True
        '
        'rdoGameTypeEXEGH
        '
        Me.rdoGameTypeEXEGH.AutoSize = True
        Me.rdoGameTypeEXEGH.Location = New System.Drawing.Point(292, 142)
        Me.rdoGameTypeEXEGH.Name = "rdoGameTypeEXEGH"
        Me.rdoGameTypeEXEGH.Size = New System.Drawing.Size(71, 17)
        Me.rdoGameTypeEXEGH.TabIndex = 39
        Me.rdoGameTypeEXEGH.Text = "EXE (GH)"
        Me.rdoGameTypeEXEGH.UseVisualStyleBackColor = True
        '
        'picGameArtworkMain
        '
        Me.picGameArtworkMain.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.picGameArtworkMain.ErrorImage = Global.unRealArcade_Downloader.My.Resources.Resources.ura_downloader_no_preview
        Me.picGameArtworkMain.Image = Global.unRealArcade_Downloader.My.Resources.Resources.ura_downloader_no_preview
        Me.picGameArtworkMain.InitialImage = Global.unRealArcade_Downloader.My.Resources.Resources.ura_downloader_no_preview
        Me.picGameArtworkMain.Location = New System.Drawing.Point(441, 6)
        Me.picGameArtworkMain.Name = "picGameArtworkMain"
        Me.picGameArtworkMain.Size = New System.Drawing.Size(300, 150)
        Me.picGameArtworkMain.TabIndex = 40
        Me.picGameArtworkMain.TabStop = False
        '
        'txtGameArtworkPreviewMain
        '
        Me.txtGameArtworkPreviewMain.Location = New System.Drawing.Point(407, 258)
        Me.txtGameArtworkPreviewMain.Name = "txtGameArtworkPreviewMain"
        Me.txtGameArtworkPreviewMain.Size = New System.Drawing.Size(10, 20)
        Me.txtGameArtworkPreviewMain.TabIndex = 41
        Me.txtGameArtworkPreviewMain.Visible = False
        '
        'grpGameInfo
        '
        Me.grpGameInfo.Location = New System.Drawing.Point(441, 169)
        Me.grpGameInfo.Name = "grpGameInfo"
        Me.grpGameInfo.Size = New System.Drawing.Size(300, 204)
        Me.grpGameInfo.TabIndex = 42
        Me.grpGameInfo.TabStop = False
        Me.grpGameInfo.Text = "Additional Info"
        '
        'btnCanvasControl
        '
        Me.btnCanvasControl.Location = New System.Drawing.Point(423, 6)
        Me.btnCanvasControl.Name = "btnCanvasControl"
        Me.btnCanvasControl.Size = New System.Drawing.Size(12, 367)
        Me.btnCanvasControl.TabIndex = 43
        Me.btnCanvasControl.UseVisualStyleBackColor = True
        '
        'rdoMultiLanguageIT
        '
        Me.rdoMultiLanguageIT.AutoSize = True
        Me.rdoMultiLanguageIT.Location = New System.Drawing.Point(274, 2)
        Me.rdoMultiLanguageIT.Name = "rdoMultiLanguageIT"
        Me.rdoMultiLanguageIT.Size = New System.Drawing.Size(35, 17)
        Me.rdoMultiLanguageIT.TabIndex = 49
        Me.rdoMultiLanguageIT.Text = "IT"
        Me.rdoMultiLanguageIT.UseVisualStyleBackColor = True
        '
        'rdoMultiLanguageFR
        '
        Me.rdoMultiLanguageFR.AutoSize = True
        Me.rdoMultiLanguageFR.Location = New System.Drawing.Point(229, 2)
        Me.rdoMultiLanguageFR.Name = "rdoMultiLanguageFR"
        Me.rdoMultiLanguageFR.Size = New System.Drawing.Size(39, 17)
        Me.rdoMultiLanguageFR.TabIndex = 48
        Me.rdoMultiLanguageFR.Text = "FR"
        Me.rdoMultiLanguageFR.UseVisualStyleBackColor = True
        '
        'lblMultiLanguageSelect
        '
        Me.lblMultiLanguageSelect.AutoSize = True
        Me.lblMultiLanguageSelect.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblMultiLanguageSelect.Location = New System.Drawing.Point(7, 4)
        Me.lblMultiLanguageSelect.Name = "lblMultiLanguageSelect"
        Me.lblMultiLanguageSelect.Size = New System.Drawing.Size(67, 13)
        Me.lblMultiLanguageSelect.TabIndex = 47
        Me.lblMultiLanguageSelect.Text = "Language:"
        '
        'rdoMultiLanguageJP
        '
        Me.rdoMultiLanguageJP.AutoSize = True
        Me.rdoMultiLanguageJP.Location = New System.Drawing.Point(315, 2)
        Me.rdoMultiLanguageJP.Name = "rdoMultiLanguageJP"
        Me.rdoMultiLanguageJP.Size = New System.Drawing.Size(37, 17)
        Me.rdoMultiLanguageJP.TabIndex = 46
        Me.rdoMultiLanguageJP.Text = "JP"
        Me.rdoMultiLanguageJP.UseVisualStyleBackColor = True
        '
        'rdoMultiLanguageDE
        '
        Me.rdoMultiLanguageDE.AutoSize = True
        Me.rdoMultiLanguageDE.Location = New System.Drawing.Point(92, 2)
        Me.rdoMultiLanguageDE.Name = "rdoMultiLanguageDE"
        Me.rdoMultiLanguageDE.Size = New System.Drawing.Size(40, 17)
        Me.rdoMultiLanguageDE.TabIndex = 45
        Me.rdoMultiLanguageDE.Text = "DE"
        Me.rdoMultiLanguageDE.UseVisualStyleBackColor = True
        '
        'rdoMultiLanguageEN
        '
        Me.rdoMultiLanguageEN.AutoSize = True
        Me.rdoMultiLanguageEN.Checked = True
        Me.rdoMultiLanguageEN.Location = New System.Drawing.Point(138, 2)
        Me.rdoMultiLanguageEN.Name = "rdoMultiLanguageEN"
        Me.rdoMultiLanguageEN.Size = New System.Drawing.Size(40, 17)
        Me.rdoMultiLanguageEN.TabIndex = 44
        Me.rdoMultiLanguageEN.TabStop = True
        Me.rdoMultiLanguageEN.Text = "EN"
        Me.rdoMultiLanguageEN.UseVisualStyleBackColor = True
        '
        'rdoMultiLanguageNL
        '
        Me.rdoMultiLanguageNL.AutoSize = True
        Me.rdoMultiLanguageNL.Location = New System.Drawing.Point(358, 2)
        Me.rdoMultiLanguageNL.Name = "rdoMultiLanguageNL"
        Me.rdoMultiLanguageNL.Size = New System.Drawing.Size(39, 17)
        Me.rdoMultiLanguageNL.TabIndex = 50
        Me.rdoMultiLanguageNL.Text = "NL"
        Me.rdoMultiLanguageNL.UseVisualStyleBackColor = True
        '
        'rdoMultiLanguageES
        '
        Me.rdoMultiLanguageES.AutoSize = True
        Me.rdoMultiLanguageES.Location = New System.Drawing.Point(184, 2)
        Me.rdoMultiLanguageES.Name = "rdoMultiLanguageES"
        Me.rdoMultiLanguageES.Size = New System.Drawing.Size(39, 17)
        Me.rdoMultiLanguageES.TabIndex = 51
        Me.rdoMultiLanguageES.Text = "ES"
        Me.rdoMultiLanguageES.UseVisualStyleBackColor = True
        '
        'Panel1
        '
        Me.Panel1.Controls.Add(Me.lblMultiLanguageSelect)
        Me.Panel1.Controls.Add(Me.rdoMultiLanguageES)
        Me.Panel1.Controls.Add(Me.rdoMultiLanguageEN)
        Me.Panel1.Controls.Add(Me.rdoMultiLanguageNL)
        Me.Panel1.Controls.Add(Me.rdoMultiLanguageDE)
        Me.Panel1.Controls.Add(Me.rdoMultiLanguageIT)
        Me.Panel1.Controls.Add(Me.rdoMultiLanguageJP)
        Me.Panel1.Controls.Add(Me.rdoMultiLanguageFR)
        Me.Panel1.Location = New System.Drawing.Point(-4, 6)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(405, 22)
        Me.Panel1.TabIndex = 52
        '
        'lblCurrentDownloadTarget
        '
        Me.lblCurrentDownloadTarget.Font = New System.Drawing.Font("Microsoft Sans Serif", 6.75!, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblCurrentDownloadTarget.Location = New System.Drawing.Point(5, 122)
        Me.lblCurrentDownloadTarget.Name = "lblCurrentDownloadTarget"
        Me.lblCurrentDownloadTarget.Size = New System.Drawing.Size(414, 14)
        Me.lblCurrentDownloadTarget.TabIndex = 53
        Me.lblCurrentDownloadTarget.Text = "          "
        '
        'rdoGameTypeWebStubSwitchboard
        '
        Me.rdoGameTypeWebStubSwitchboard.AutoSize = True
        Me.rdoGameTypeWebStubSwitchboard.Location = New System.Drawing.Point(321, 206)
        Me.rdoGameTypeWebStubSwitchboard.Name = "rdoGameTypeWebStubSwitchboard"
        Me.rdoGameTypeWebStubSwitchboard.Size = New System.Drawing.Size(84, 17)
        Me.rdoGameTypeWebStubSwitchboard.TabIndex = 54
        Me.rdoGameTypeWebStubSwitchboard.Text = "Switchboard"
        Me.rdoGameTypeWebStubSwitchboard.UseVisualStyleBackColor = True
        '
        'rdoGameTypeWebStubActiveMark
        '
        Me.rdoGameTypeWebStubActiveMark.AutoSize = True
        Me.rdoGameTypeWebStubActiveMark.Location = New System.Drawing.Point(124, 206)
        Me.rdoGameTypeWebStubActiveMark.Name = "rdoGameTypeWebStubActiveMark"
        Me.rdoGameTypeWebStubActiveMark.Size = New System.Drawing.Size(41, 17)
        Me.rdoGameTypeWebStubActiveMark.TabIndex = 55
        Me.rdoGameTypeWebStubActiveMark.Text = "AM"
        Me.rdoGameTypeWebStubActiveMark.UseVisualStyleBackColor = True
        '
        'txtPath5
        '
        Me.txtPath5.Location = New System.Drawing.Point(371, 258)
        Me.txtPath5.Name = "txtPath5"
        Me.txtPath5.Size = New System.Drawing.Size(10, 20)
        Me.txtPath5.TabIndex = 56
        Me.txtPath5.Visible = False
        '
        'txtPath4
        '
        Me.txtPath4.Location = New System.Drawing.Point(362, 258)
        Me.txtPath4.Name = "txtPath4"
        Me.txtPath4.Size = New System.Drawing.Size(10, 20)
        Me.txtPath4.TabIndex = 57
        Me.txtPath4.Visible = False
        '
        'rdoGameTypeRG3
        '
        Me.rdoGameTypeRG3.AutoSize = True
        Me.rdoGameTypeRG3.Location = New System.Drawing.Point(59, 171)
        Me.rdoGameTypeRG3.Name = "rdoGameTypeRG3"
        Me.rdoGameTypeRG3.Size = New System.Drawing.Size(47, 17)
        Me.rdoGameTypeRG3.TabIndex = 58
        Me.rdoGameTypeRG3.Text = "RG3"
        Me.rdoGameTypeRG3.UseVisualStyleBackColor = True
        '
        'txtDoesRAWKExist
        '
        Me.txtDoesRAWKExist.Location = New System.Drawing.Point(387, 258)
        Me.txtDoesRAWKExist.Name = "txtDoesRAWKExist"
        Me.txtDoesRAWKExist.Size = New System.Drawing.Size(10, 20)
        Me.txtDoesRAWKExist.TabIndex = 59
        Me.txtDoesRAWKExist.Visible = False
        '
        'URADownloaderMain
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(438, 376)
        Me.Controls.Add(Me.txtDoesRAWKExist)
        Me.Controls.Add(Me.rdoGameTypeRG3)
        Me.Controls.Add(Me.txtPath4)
        Me.Controls.Add(Me.txtPath5)
        Me.Controls.Add(Me.rdoGameTypeWebStubActiveMark)
        Me.Controls.Add(Me.rdoGameTypeWebStubSwitchboard)
        Me.Controls.Add(Me.lblCurrentDownloadTarget)
        Me.Controls.Add(Me.Panel1)
        Me.Controls.Add(Me.btnCanvasControl)
        Me.Controls.Add(Me.grpGameInfo)
        Me.Controls.Add(Me.txtGameArtworkPreviewMain)
        Me.Controls.Add(Me.picGameArtworkMain)
        Me.Controls.Add(Me.rdoGameTypeEXEGH)
        Me.Controls.Add(Me.rdoGameTypeEXE)
        Me.Controls.Add(Me.rdoGameTypeOpenInWebpageAndroid)
        Me.Controls.Add(Me.rdoGameTypeOpenInWebpageIphoneIpod)
        Me.Controls.Add(Me.rdoGameTypeOpenInWebpageIpad)
        Me.Controls.Add(Me.rdoGameTypeOpenInWebpageMac)
        Me.Controls.Add(Me.lblGameTypeOpenInWebpage)
        Me.Controls.Add(Me.rdoGameTypeOpenInWebpageWindows)
        Me.Controls.Add(Me.txtFullPathLocal)
        Me.Controls.Add(Me.lblGameTypeWebStub)
        Me.Controls.Add(Me.rdoGameTypeWebStubInstallerRedirect)
        Me.Controls.Add(Me.rdoGameTypeWebStubInstallerPackages)
        Me.Controls.Add(Me.lblGameTypeLegacy)
        Me.Controls.Add(Me.lblGameTypeCurrent)
        Me.Controls.Add(Me.rdoGameTypeRGA26AMG)
        Me.Controls.Add(Me.rdoGameTypeDMGAMAC)
        Me.Controls.Add(Me.rdoGameTypeDMG)
        Me.Controls.Add(Me.btnCancelDownload)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.txtFinalLink)
        Me.Controls.Add(Me.pgbDownloading)
        Me.Controls.Add(Me.txtFileTypeContainer)
        Me.Controls.Add(Me.txtPath3)
        Me.Controls.Add(Me.txtPath2)
        Me.Controls.Add(Me.txtPath1)
        Me.Controls.Add(Me.txtServerHostAddress)
        Me.Controls.Add(Me.txtCurrentGameName)
        Me.Controls.Add(Me.lblGameNameManual)
        Me.Controls.Add(Me.btnDownloadPathBrowse)
        Me.Controls.Add(Me.lblDownloadPath)
        Me.Controls.Add(Me.txtDownloadPath)
        Me.Controls.Add(Me.btnGoDownloadNow)
        Me.Controls.Add(Me.cboGameName)
        Me.Controls.Add(Me.lblGameName)
        Me.Controls.Add(Me.txtGameNameManual)
        Me.Controls.Add(Me.rdoGameTypeRGA26AM)
        Me.Controls.Add(Me.rdoGameTypeRGA26)
        Me.Controls.Add(Me.rdoGameTypeRGA21)
        Me.Controls.Add(Me.rdoGameTypeRGS)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.Name = "URADownloaderMain"
        Me.Text = "unRealArcade Downloader v0.3                             cRypTiCwaRe 2013"
        CType(Me.picGameArtworkMain, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Panel1.ResumeLayout(False)
        Me.Panel1.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents rdoGameTypeRGS As System.Windows.Forms.RadioButton
    Friend WithEvents rdoGameTypeRGA21 As System.Windows.Forms.RadioButton
    Friend WithEvents rdoGameTypeRGA26 As System.Windows.Forms.RadioButton
    Friend WithEvents rdoGameTypeRGA26AM As System.Windows.Forms.RadioButton
    Friend WithEvents txtGameNameManual As System.Windows.Forms.TextBox
    Friend WithEvents lblGameName As System.Windows.Forms.Label
    Friend WithEvents cboGameName As System.Windows.Forms.ComboBox
    Friend WithEvents btnGoDownloadNow As System.Windows.Forms.Button
    Friend WithEvents lblDownloadPath As System.Windows.Forms.Label
    Friend WithEvents txtDownloadPath As System.Windows.Forms.TextBox
    Friend WithEvents btnDownloadPathBrowse As System.Windows.Forms.Button
    Friend WithEvents lblGameNameManual As System.Windows.Forms.Label
    Friend WithEvents txtCurrentGameName As System.Windows.Forms.TextBox
    Friend WithEvents txtServerHostAddress As System.Windows.Forms.TextBox
    Friend WithEvents txtPath1 As System.Windows.Forms.TextBox
    Friend WithEvents txtPath2 As System.Windows.Forms.TextBox
    Friend WithEvents txtPath3 As System.Windows.Forms.TextBox
    Friend WithEvents txtFileTypeContainer As System.Windows.Forms.TextBox
    Friend WithEvents pgbDownloading As System.Windows.Forms.ProgressBar
    Friend WithEvents txtFinalLink As System.Windows.Forms.TextBox
    Friend WithEvents dlgDownloadPath As System.Windows.Forms.FolderBrowserDialog
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents btnCancelDownload As System.Windows.Forms.Button
    Friend WithEvents rdoGameTypeDMG As System.Windows.Forms.RadioButton
    Friend WithEvents rdoGameTypeDMGAMAC As System.Windows.Forms.RadioButton
    Friend WithEvents rdoGameTypeRGA26AMG As System.Windows.Forms.RadioButton
    Friend WithEvents lblGameTypeCurrent As System.Windows.Forms.Label
    Friend WithEvents lblGameTypeLegacy As System.Windows.Forms.Label
    Friend WithEvents lblGameTypeWebStub As System.Windows.Forms.Label
    Friend WithEvents rdoGameTypeWebStubInstallerRedirect As System.Windows.Forms.RadioButton
    Friend WithEvents rdoGameTypeWebStubInstallerPackages As System.Windows.Forms.RadioButton
    Friend WithEvents txtFullPathLocal As System.Windows.Forms.TextBox
    Friend WithEvents lblGameTypeOpenInWebpage As System.Windows.Forms.Label
    Friend WithEvents rdoGameTypeOpenInWebpageWindows As System.Windows.Forms.RadioButton
    Friend WithEvents rdoGameTypeOpenInWebpageMac As System.Windows.Forms.RadioButton
    Friend WithEvents rdoGameTypeOpenInWebpageIpad As System.Windows.Forms.RadioButton
    Friend WithEvents rdoGameTypeOpenInWebpageIphoneIpod As System.Windows.Forms.RadioButton
    Friend WithEvents rdoGameTypeOpenInWebpageAndroid As System.Windows.Forms.RadioButton
    Friend WithEvents rdoGameTypeEXE As System.Windows.Forms.RadioButton
    Friend WithEvents rdoGameTypeEXEGH As System.Windows.Forms.RadioButton
    Friend WithEvents picGameArtworkMain As System.Windows.Forms.PictureBox
    Friend WithEvents txtGameArtworkPreviewMain As System.Windows.Forms.TextBox
    Friend WithEvents grpGameInfo As System.Windows.Forms.GroupBox
    Friend WithEvents btnCanvasControl As System.Windows.Forms.Button
    Friend WithEvents rdoMultiLanguageIT As System.Windows.Forms.RadioButton
    Friend WithEvents rdoMultiLanguageFR As System.Windows.Forms.RadioButton
    Friend WithEvents lblMultiLanguageSelect As System.Windows.Forms.Label
    Friend WithEvents rdoMultiLanguageJP As System.Windows.Forms.RadioButton
    Friend WithEvents rdoMultiLanguageDE As System.Windows.Forms.RadioButton
    Friend WithEvents rdoMultiLanguageEN As System.Windows.Forms.RadioButton
    Friend WithEvents rdoMultiLanguageNL As System.Windows.Forms.RadioButton
    Friend WithEvents rdoMultiLanguageES As System.Windows.Forms.RadioButton
    Friend WithEvents Panel1 As System.Windows.Forms.Panel
    Friend WithEvents lblCurrentDownloadTarget As System.Windows.Forms.Label
    Friend WithEvents rdoGameTypeWebStubSwitchboard As System.Windows.Forms.RadioButton
    Friend WithEvents rdoGameTypeWebStubActiveMark As System.Windows.Forms.RadioButton
    Friend WithEvents txtPath5 As System.Windows.Forms.TextBox
    Friend WithEvents txtPath4 As System.Windows.Forms.TextBox
    Friend WithEvents rdoGameTypeRG3 As System.Windows.Forms.RadioButton
    Friend WithEvents txtDoesRAWKExist As System.Windows.Forms.TextBox

End Class
