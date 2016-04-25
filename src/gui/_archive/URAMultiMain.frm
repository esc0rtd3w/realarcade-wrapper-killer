VERSION 5.00
Begin VB.Form URAMultiDLMain 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "RealArcade/Gamehouse Multi Downloader v0.1 Beta"
   ClientHeight    =   4650
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   12360
   Icon            =   "URAMultiMain.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4650
   ScaleWidth      =   12360
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame boxAlternateEditions 
      Caption         =   "Alternate Editions"
      Height          =   855
      Left            =   120
      TabIndex        =   43
      Top             =   2880
      Width           =   4455
      Begin VB.OptionButton optStandard 
         Caption         =   "Standard"
         Height          =   255
         Left            =   120
         TabIndex        =   47
         ToolTipText     =   "Standard Edition"
         Top             =   360
         Value           =   -1  'True
         Width           =   975
      End
      Begin VB.OptionButton optMulti 
         Caption         =   "Multi"
         Height          =   255
         Left            =   3600
         TabIndex        =   46
         ToolTipText     =   "Double Pack or Multi Edition"
         Top             =   360
         Width           =   735
      End
      Begin VB.OptionButton optPremium 
         Caption         =   "Premium"
         Height          =   255
         Left            =   2520
         TabIndex        =   45
         ToolTipText     =   "Premium Edition"
         Top             =   360
         Width           =   975
      End
      Begin VB.OptionButton optPlatinum 
         Caption         =   "Platinum"
         Height          =   255
         Left            =   1440
         TabIndex        =   44
         ToolTipText     =   "Platinum Edition"
         Top             =   360
         Width           =   975
      End
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Save Log"
      Height          =   255
      Left            =   11160
      TabIndex        =   40
      Top             =   2640
      Width           =   1095
   End
   Begin VB.TextBox txtOutputLog 
      Height          =   1575
      Left            =   6120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   38
      Top             =   2880
      Width           =   6135
   End
   Begin VB.CommandButton btnUpdateGameList 
      Caption         =   "Update Game List"
      Height          =   375
      Left            =   240
      TabIndex        =   23
      ToolTipText     =   "Update the current game base name list"
      Top             =   4080
      Width           =   2175
   End
   Begin VB.Frame boxLanguage 
      Caption         =   "Language"
      Height          =   1095
      Left            =   120
      TabIndex        =   12
      Top             =   1560
      Width           =   4455
      Begin VB.CheckBox chkLanguageDefault 
         Caption         =   "Default (EN-US)"
         Height          =   255
         Left            =   120
         TabIndex        =   24
         ToolTipText     =   "Default language is US English. This option does not use a suffix"
         Top             =   720
         Value           =   1  'Checked
         Width           =   1575
      End
      Begin VB.CheckBox chkLanguageAltName 
         Caption         =   "Use alternate naming suffix"
         Height          =   255
         Left            =   1920
         TabIndex        =   19
         ToolTipText     =   "Alternate filename suffix. Example: Japanese (jp) or (nihongoban) is attached to the end of the filename."
         Top             =   720
         Width           =   2295
      End
      Begin VB.OptionButton optLanguageJP 
         Caption         =   "JP"
         Height          =   255
         Left            =   2880
         TabIndex        =   18
         ToolTipText     =   "Japanese"
         Top             =   360
         Width           =   495
      End
      Begin VB.OptionButton optLanguageES 
         Caption         =   "ES"
         Height          =   255
         Left            =   840
         TabIndex        =   17
         ToolTipText     =   "Spanish"
         Top             =   360
         Width           =   615
      End
      Begin VB.OptionButton optLanguageNL 
         Caption         =   "NL"
         Height          =   255
         Left            =   3600
         TabIndex        =   16
         ToolTipText     =   "Netherlands"
         Top             =   360
         Width           =   615
      End
      Begin VB.OptionButton optLanguageIT 
         Caption         =   "IT"
         Height          =   255
         Left            =   2280
         TabIndex        =   15
         ToolTipText     =   "Italian"
         Top             =   360
         Width           =   615
      End
      Begin VB.OptionButton optLanguageFR 
         Caption         =   "FR"
         Height          =   255
         Left            =   1560
         TabIndex        =   14
         ToolTipText     =   "French"
         Top             =   360
         Width           =   735
      End
      Begin VB.OptionButton optLanguageDE 
         Caption         =   "DE"
         Height          =   255
         Left            =   120
         TabIndex        =   13
         ToolTipText     =   "Dutch"
         Top             =   360
         Width           =   615
      End
   End
   Begin VB.CommandButton btnStartDownload 
      Caption         =   "Start Download"
      Height          =   375
      Left            =   2760
      TabIndex        =   11
      ToolTipText     =   "Start downloading file built from current configuration"
      Top             =   4080
      Width           =   1695
   End
   Begin VB.CommandButton btnSaveLocation 
      Caption         =   "..."
      Height          =   255
      Left            =   4200
      TabIndex        =   9
      Top             =   1080
      Width           =   375
   End
   Begin VB.TextBox txtSaveLocation 
      Height          =   285
      Left            =   120
      TabIndex        =   8
      Text            =   "C:\My Download Files\"
      ToolTipText     =   "Default save path for all downloaded files. The standard RealArcade download path is default."
      Top             =   1080
      Width           =   3975
   End
   Begin VB.Frame boxInfo 
      Caption         =   "Additional Info"
      Height          =   2415
      Left            =   6120
      TabIndex        =   4
      Top             =   120
      Width           =   6135
      Begin VB.Label Label16 
         Caption         =   "0000000"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1200
         TabIndex        =   37
         Top             =   1440
         Width           =   975
      End
      Begin VB.Label Label15 
         Caption         =   "Tracking ID:"
         Height          =   255
         Left            =   120
         TabIndex        =   36
         Top             =   1440
         Width           =   975
      End
      Begin VB.Label Label14 
         Caption         =   "N/A"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   5400
         TabIndex        =   35
         Top             =   1440
         Width           =   615
      End
      Begin VB.Label Label13 
         Caption         =   "Year:"
         Height          =   255
         Left            =   4800
         TabIndex        =   34
         Top             =   1440
         Width           =   495
      End
      Begin VB.Label Label12 
         Caption         =   "00000000000000000000000000000000"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1080
         TabIndex        =   33
         Top             =   1080
         Width           =   3615
      End
      Begin VB.Label Label11 
         Caption         =   "Content ID:"
         Height          =   255
         Left            =   120
         TabIndex        =   32
         Top             =   1080
         Width           =   855
      End
      Begin VB.Label Label10 
         Caption         =   "N/A"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   2760
         TabIndex        =   31
         Top             =   1440
         Width           =   1815
      End
      Begin VB.Label Label9 
         Caption         =   "Genre:"
         Height          =   255
         Left            =   2160
         TabIndex        =   30
         Top             =   1440
         Width           =   615
      End
      Begin VB.Label Label8 
         Caption         =   "00000000-0000-0000-0000-000000000000"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   720
         TabIndex        =   29
         Top             =   720
         Width           =   4095
      End
      Begin VB.Label Label7 
         Caption         =   "GUID:"
         Height          =   255
         Left            =   120
         TabIndex        =   28
         Top             =   720
         Width           =   615
      End
      Begin VB.Label lblInfoFolderNameData 
         Caption         =   "No Available Data"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   1200
         TabIndex        =   27
         Top             =   360
         Width           =   4695
      End
      Begin VB.Label lblInfoFolderName 
         Caption         =   "Folder Name:"
         Height          =   255
         Left            =   120
         TabIndex        =   26
         Top             =   360
         Width           =   975
      End
   End
   Begin VB.Frame boxFileType 
      Caption         =   "File Type"
      Height          =   4455
      Left            =   4680
      TabIndex        =   2
      Top             =   120
      Width           =   1335
      Begin VB.OptionButton optGHExe 
         Caption         =   "GH Exe"
         Height          =   255
         Left            =   120
         TabIndex        =   48
         ToolTipText     =   "Early GameHouse Exe Installers that used (Install) as a suffix to filenames. These games are 60 minute demos."
         Top             =   2160
         Width           =   855
      End
      Begin VB.OptionButton optDMG 
         Caption         =   "DMG"
         Height          =   255
         Left            =   120
         TabIndex        =   42
         ToolTipText     =   "MAC OSX Demo Trial Installer"
         Top             =   1800
         Width           =   735
      End
      Begin VB.OptionButton optRGP 
         Caption         =   "RGP"
         Height          =   255
         Left            =   120
         TabIndex        =   41
         ToolTipText     =   "RGS XML structured install info"
         Top             =   720
         Width           =   855
      End
      Begin VB.CheckBox chkFileTypeAM 
         Caption         =   "AM Prefix"
         Height          =   255
         Left            =   120
         TabIndex        =   25
         ToolTipText     =   "RGA 2.1 and Platinum Edition Demo Trial Stub/Installer Prefix"
         Top             =   3600
         Width           =   975
      End
      Begin VB.CheckBox chkFileTypeAMG 
         Caption         =   "Unlimited Ad-Based"
         Height          =   495
         Left            =   120
         TabIndex        =   22
         ToolTipText     =   "RGA 2.1/2.6 Demo Unlimited Stub/Installer Prefix"
         Top             =   3840
         Width           =   1095
      End
      Begin VB.OptionButton optStub26 
         Caption         =   "Stub (2.6)"
         Height          =   255
         Left            =   120
         TabIndex        =   21
         ToolTipText     =   "RGA 2.6 Demo Trial Installer"
         Top             =   3240
         Width           =   1095
      End
      Begin VB.OptionButton optStub21 
         Caption         =   "Stub (2.1)"
         Height          =   255
         Left            =   120
         TabIndex        =   20
         ToolTipText     =   "RGA 2.1 Demo Trial Installer"
         Top             =   2880
         Width           =   1095
      End
      Begin VB.OptionButton optRGI 
         Caption         =   "RGI"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         ToolTipText     =   "RGS XML game info"
         Top             =   1080
         Width           =   615
      End
      Begin VB.OptionButton optMEZ 
         Caption         =   "MEZ"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         ToolTipText     =   "RGS XZip 2.0 header stub??"
         Top             =   1440
         Width           =   735
      End
      Begin VB.OptionButton optRGA 
         Caption         =   "RGA"
         Height          =   255
         Left            =   120
         TabIndex        =   5
         ToolTipText     =   "RGA 2.1/2.6 Demo Trial Installer"
         Top             =   2520
         Width           =   735
      End
      Begin VB.OptionButton optRGS 
         Caption         =   "RGS"
         Height          =   255
         Left            =   120
         TabIndex        =   3
         ToolTipText     =   "RGS 1.2/1.4 Demo Installer"
         Top             =   360
         Value           =   -1  'True
         Width           =   735
      End
   End
   Begin VB.ComboBox cboSelectGame 
      Height          =   315
      ItemData        =   "URAMultiMain.frx":628A
      Left            =   120
      List            =   "URAMultiMain.frx":628C
      Sorted          =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   0
      ToolTipText     =   $"URAMultiMain.frx":628E
      Top             =   360
      Width           =   4455
   End
   Begin VB.Label Label2 
      Caption         =   "Output Log:"
      Height          =   255
      Left            =   6120
      TabIndex        =   39
      Top             =   2640
      Width           =   975
   End
   Begin VB.Label Label1 
      Caption         =   "Downloaded files save path:"
      Height          =   255
      Left            =   120
      TabIndex        =   10
      Top             =   840
      Width           =   2175
   End
   Begin VB.Label lblSelectGame 
      Caption         =   "Select Game:"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   1095
   End
End
Attribute VB_Name = "URAMultiDLMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Open "gamelist.txt" For Input As #1
While Not EOF(1)
    Line Input #1, temp
    cboSelectGame.AddItem temp
    Wend
    Close #1
End Sub
