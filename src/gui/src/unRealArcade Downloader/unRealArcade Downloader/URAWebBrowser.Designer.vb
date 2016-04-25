<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class URAWebBrowser
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
        Me.URAWebBrowserView = New System.Windows.Forms.WebBrowser()
        Me.SuspendLayout()
        '
        'URAWebBrowserView
        '
        Me.URAWebBrowserView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.URAWebBrowserView.Location = New System.Drawing.Point(0, 0)
        Me.URAWebBrowserView.MinimumSize = New System.Drawing.Size(20, 20)
        Me.URAWebBrowserView.Name = "URAWebBrowserView"
        Me.URAWebBrowserView.Size = New System.Drawing.Size(1029, 531)
        Me.URAWebBrowserView.TabIndex = 0
        '
        'URAWebBrowser
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1029, 531)
        Me.Controls.Add(Me.URAWebBrowserView)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow
        Me.MinimizeBox = False
        Me.Name = "URAWebBrowser"
        Me.Text = "unRealArcade Web Browser"
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents URAWebBrowserView As System.Windows.Forms.WebBrowser
End Class
