<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class BrowserMain
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
        Me.BrowserGH = New System.Windows.Forms.WebBrowser()
        Me.txtDebugWebBrowser = New System.Windows.Forms.TextBox()
        Me.SuspendLayout()
        '
        'BrowserGH
        '
        Me.BrowserGH.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.BrowserGH.Location = New System.Drawing.Point(12, 38)
        Me.BrowserGH.MinimumSize = New System.Drawing.Size(20, 20)
        Me.BrowserGH.Name = "BrowserGH"
        Me.BrowserGH.ScriptErrorsSuppressed = True
        Me.BrowserGH.Size = New System.Drawing.Size(957, 573)
        Me.BrowserGH.TabIndex = 0
        Me.BrowserGH.Url = New System.Uri("http://www.gamehouse.com", System.UriKind.Absolute)
        '
        'txtDebugWebBrowser
        '
        Me.txtDebugWebBrowser.Location = New System.Drawing.Point(975, 79)
        Me.txtDebugWebBrowser.Multiline = True
        Me.txtDebugWebBrowser.Name = "txtDebugWebBrowser"
        Me.txtDebugWebBrowser.ScrollBars = System.Windows.Forms.ScrollBars.Vertical
        Me.txtDebugWebBrowser.Size = New System.Drawing.Size(282, 532)
        Me.txtDebugWebBrowser.TabIndex = 1
        '
        'BrowserMain
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1269, 647)
        Me.Controls.Add(Me.txtDebugWebBrowser)
        Me.Controls.Add(Me.BrowserGH)
        Me.Name = "BrowserMain"
        Me.Text = "unRealArcade Web Browser"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents BrowserGH As WebBrowser
    Friend WithEvents txtDebugWebBrowser As TextBox
End Class
