VERSION 5.00
Begin VB.Form RGSPatcherMain 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "RealArcade RGS Game Demo Patcher v0.1 Beta"
   ClientHeight    =   6495
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   6525
   Icon            =   "RGSPatcherMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6495
   ScaleWidth      =   6525
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame boxPatchDataDemoWindow2 
      Caption         =   "Patch Data (Demo Window 2) (Type 3/4 Only)"
      Height          =   735
      Left            =   120
      TabIndex        =   40
      Top             =   5640
      Width           =   4215
      Begin VB.TextBox txtPatchDataDemoWindow2Address 
         Height          =   285
         Left            =   840
         TabIndex        =   42
         Text            =   "6252"
         Top             =   360
         Width           =   855
      End
      Begin VB.TextBox txtPatchDataDemoWindow2Bytes 
         Height          =   285
         Left            =   2280
         TabIndex        =   41
         Text            =   "909090909090"
         Top             =   360
         Width           =   1815
      End
      Begin VB.Label Label12 
         Caption         =   "Address:"
         Height          =   255
         Left            =   120
         TabIndex        =   44
         Top             =   360
         Width           =   735
      End
      Begin VB.Label Label11 
         Caption         =   "Bytes:"
         Height          =   255
         Left            =   1800
         TabIndex        =   43
         Top             =   360
         Width           =   495
      End
   End
   Begin VB.Frame boxPatchDataDemoWindow1 
      Caption         =   "Patch Data (Demo Window 1) (Type 3/4 Only)"
      Height          =   735
      Left            =   120
      TabIndex        =   35
      Top             =   4680
      Width           =   4215
      Begin VB.TextBox txtPatchDataDemoWindow1Bytes 
         Height          =   285
         Left            =   2280
         TabIndex        =   37
         Text            =   "e9b50d000090909090"
         Top             =   360
         Width           =   1815
      End
      Begin VB.TextBox txtPatchDataDemoWindow1Address 
         Height          =   285
         Left            =   840
         TabIndex        =   36
         Text            =   "6694"
         Top             =   360
         Width           =   855
      End
      Begin VB.Label Label10 
         Caption         =   "Bytes:"
         Height          =   255
         Left            =   1800
         TabIndex        =   39
         Top             =   360
         Width           =   495
      End
      Begin VB.Label Label9 
         Caption         =   "Address:"
         Height          =   255
         Left            =   120
         TabIndex        =   38
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Frame boxPatchDataStartWrapper 
      Caption         =   "Patch Data (startWrapper) (Defaults Type 1)"
      Height          =   735
      Left            =   120
      TabIndex        =   30
      Top             =   3720
      Width           =   4215
      Begin VB.TextBox txtPatchDataStartWrapperAddress 
         Height          =   285
         Left            =   840
         TabIndex        =   32
         Text            =   "34020"
         Top             =   360
         Width           =   855
      End
      Begin VB.TextBox txtPatchDataStartWrapperBytes 
         Height          =   285
         Left            =   2280
         TabIndex        =   31
         Text            =   "e99500000090"
         Top             =   360
         Width           =   1815
      End
      Begin VB.Label Label8 
         Caption         =   "Address:"
         Height          =   255
         Left            =   120
         TabIndex        =   34
         Top             =   360
         Width           =   735
      End
      Begin VB.Label Label7 
         Caption         =   "Bytes:"
         Height          =   255
         Left            =   1800
         TabIndex        =   33
         Top             =   360
         Width           =   495
      End
   End
   Begin VB.Frame boxPatchDataPrepareForLaunch 
      Caption         =   "Patch Data (PrepareForLaunch) (Defaults Type 3/4)"
      Height          =   735
      Left            =   120
      TabIndex        =   25
      Top             =   1800
      Width           =   4215
      Begin VB.TextBox txtPatchDataPrepareForLaunchBytes 
         Height          =   285
         Left            =   2280
         TabIndex        =   27
         Text            =   "9090"
         Top             =   360
         Width           =   1815
      End
      Begin VB.TextBox txtPatchDataPrepareForLaunchAddress 
         Height          =   285
         Left            =   840
         TabIndex        =   26
         Text            =   "8166"
         Top             =   360
         Width           =   855
      End
      Begin VB.Label Label6 
         Caption         =   "Bytes:"
         Height          =   255
         Left            =   1800
         TabIndex        =   29
         Top             =   360
         Width           =   495
      End
      Begin VB.Label Label5 
         Caption         =   "Address:"
         Height          =   255
         Left            =   120
         TabIndex        =   28
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Frame boxPatchDataRacNotRunning 
      Caption         =   "Patch Data (RacNotRunning) (Defaults Type 1)"
      Height          =   735
      Left            =   120
      TabIndex        =   20
      Top             =   2760
      Width           =   4215
      Begin VB.TextBox txtPatchDataRacNotRunningAddress 
         Height          =   285
         Left            =   840
         TabIndex        =   22
         Text            =   "33227"
         Top             =   360
         Width           =   855
      End
      Begin VB.TextBox txtPatchDataRacNotRunningBytes 
         Height          =   285
         Left            =   2280
         TabIndex        =   21
         Text            =   "e96001000090"
         Top             =   360
         Width           =   1815
      End
      Begin VB.Label Label4 
         Caption         =   "Address:"
         Height          =   255
         Left            =   120
         TabIndex        =   24
         Top             =   360
         Width           =   735
      End
      Begin VB.Label Label3 
         Caption         =   "Bytes:"
         Height          =   255
         Left            =   1800
         TabIndex        =   23
         Top             =   360
         Width           =   495
      End
   End
   Begin VB.CheckBox chkCreateBackup 
      Caption         =   "Create Backup"
      Height          =   255
      Left            =   4680
      TabIndex        =   15
      Top             =   6120
      Value           =   1  'Checked
      Width           =   1575
   End
   Begin VB.CommandButton btnPatchExecute 
      Caption         =   "Patch Now"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4680
      TabIndex        =   14
      Top             =   5520
      Width           =   1695
   End
   Begin VB.Frame boxPatchDataGameExtract 
      Caption         =   "Patch Data (gameExtract) (Defaults Type 1)"
      Height          =   735
      Left            =   120
      TabIndex        =   5
      Top             =   840
      Width           =   4215
      Begin VB.TextBox txtPatchDataGameExtractBytes 
         Height          =   285
         Left            =   2280
         TabIndex        =   19
         Text            =   "e9f2f7feff90"
         Top             =   360
         Width           =   1815
      End
      Begin VB.TextBox txtPatchDataGameExtractAddress 
         Height          =   285
         Left            =   840
         TabIndex        =   17
         Text            =   "103977"
         Top             =   360
         Width           =   855
      End
      Begin VB.Label Label2 
         Caption         =   "Bytes:"
         Height          =   255
         Left            =   1800
         TabIndex        =   18
         Top             =   360
         Width           =   495
      End
      Begin VB.Label Label1 
         Caption         =   "Address:"
         Height          =   255
         Left            =   120
         TabIndex        =   16
         Top             =   360
         Width           =   735
      End
   End
   Begin VB.Frame boxPatchSettings 
      Caption         =   "Patch Settings"
      Height          =   4215
      Left            =   4560
      TabIndex        =   3
      Top             =   240
      Width           =   1815
      Begin VB.OptionButton optPatchDefaultAll 
         Caption         =   "Load All Defaults"
         Height          =   315
         Left            =   120
         TabIndex        =   45
         Top             =   240
         Value           =   -1  'True
         Width           =   1575
      End
      Begin VB.OptionButton optPatchDefaultType4 
         Caption         =   "Type 4: Default"
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   3360
         Width           =   1455
      End
      Begin VB.OptionButton optPatchDefaultType3 
         Caption         =   "Type 3: Default"
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Top             =   3000
         Width           =   1575
      End
      Begin VB.OptionButton optPatchCustom 
         Caption         =   "Custom Values"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   3840
         Width           =   1455
      End
      Begin VB.OptionButton optPatchDefault6 
         Caption         =   "Type 1: Default 6"
         Height          =   315
         Left            =   120
         TabIndex        =   10
         Top             =   2520
         Width           =   1575
      End
      Begin VB.OptionButton optPatchDefault5 
         Caption         =   "Type 1: Default 5"
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   2160
         Width           =   1575
      End
      Begin VB.OptionButton optPatchDefault4 
         Caption         =   "Type 1: Default 4"
         Height          =   195
         Left            =   120
         TabIndex        =   8
         Top             =   1800
         Width           =   1575
      End
      Begin VB.OptionButton optPatchDefault3 
         Caption         =   "Type 1: Default 3"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   1440
         Width           =   1575
      End
      Begin VB.OptionButton optPatchDefault2 
         Caption         =   "Type 1: Default 2"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   1080
         Width           =   1575
      End
      Begin VB.OptionButton optPatchDefault1 
         Caption         =   "Type 1: Default 1"
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   720
         Width           =   1575
      End
   End
   Begin VB.CommandButton btnGameExePathBrowse 
      Caption         =   "..."
      Height          =   255
      Left            =   3840
      TabIndex        =   2
      Top             =   360
      Width           =   495
   End
   Begin VB.TextBox txtGameExePath 
      Height          =   285
      Left            =   120
      TabIndex        =   1
      Text            =   "C:\My Games\"
      Top             =   360
      Width           =   3615
   End
   Begin VB.Label Label14 
      Caption         =   "*Bytes use hexidecimal"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4560
      TabIndex        =   47
      Top             =   5040
      Width           =   1815
   End
   Begin VB.Label Label13 
      Caption         =   "*Addresses use decimal"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4560
      TabIndex        =   46
      Top             =   4680
      Width           =   1815
   End
   Begin VB.Label lblGameExePath 
      Caption         =   "Select Game Exe File:"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1695
   End
End
Attribute VB_Name = "RGSPatcherMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

