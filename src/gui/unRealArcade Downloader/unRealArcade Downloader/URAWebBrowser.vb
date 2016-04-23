Public Class URAWebBrowser

    Private Sub URAWebBrowser_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load



    End Sub


    Private Sub URAWebBrowserView_DocumentCompleted(ByVal sender As System.Object, ByVal e As System.Windows.Forms.WebBrowserDocumentCompletedEventArgs) Handles URAWebBrowserView.DocumentCompleted
        For Each link As HtmlElement In URAWebBrowserView.Document.Links
            If link.Id = "myLink" Then
                URAWebBrowserView.Navigate(link.GetAttribute("href"))
                Exit For
            End If
        Next
    End Sub


End Class