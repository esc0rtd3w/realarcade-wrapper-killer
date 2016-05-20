Imports System.IO
Imports System.Net
Imports System.Runtime.InteropServices

Public Class BrowserMain

    'Public Property UserAgent As String
    Public ReadOnly Property UserAgent As String


    <DllImport("urlmon.dll", CharSet:=CharSet.Ansi)>
    Private Shared Function UrlMkSetSessionOption(ByVal dwOption As Integer, ByVal pBuffer As String, ByVal dwBufferLength As Integer, ByVal dwReserved As Integer) As Integer
    End Function
    Const URLMON_OPTION_USERAGENT As Integer = &H10000001
    Public Function ChangeUserAgent(ByVal Agent As String)
        'UrlMkSetSessionOption(URLMON_OPTION_USERAGENT, Agent, Agent.Length, 0)
        UrlMkSetSessionOption(URLMON_OPTION_USERAGENT, Agent, Agent.Length, 0)
    End Function


    Private Sub BrowserMain_Load(sender As Object, e As EventArgs) Handles MyBase.Load

        Dim server As String = "http://www.gamehouse.com"

        'Dim memberCookie As Cookie

        'memberCookie.Domain = server
        'memberCookie.Name("gamehouseuser=true")

        Dim amiAgent As String = "AmHttpClient v1.0"





        Dim connectionHTTP As HttpWebRequest = CType(WebRequest.Create(server), HttpWebRequest)
        'connectionHTTP.UserAgent = "AmHttpClient v1.0"
        'connectionHTTP.CookieContainer.SetCookies(server, "Cookie: gamehouseuser=true")

        Dim responseHTTP As HttpWebResponse = CType(connectionHTTP.GetResponse(), HttpWebResponse)

        connectionHTTP.UserAgent = amiAgent

        'ChangeUserAgent(amiAgent)

        'BrowserGH.Navigate(server, "_self", Nothing, amiAgent)
        'BrowserGH.Navigate(server)

        ' Some debug output
        Dim streamResponse As Stream = responseHTTP.GetResponseStream()
        Dim streamRead As New StreamReader(streamResponse)
        Dim readBuff(512) As [Char]
        Dim count As Integer = streamRead.Read(readBuff, 0, 512)
        While count > 0
            Dim html As New [String](readBuff, 0, count)
            txtDebugWebBrowser.AppendText(html)
            'MessageBox.Show(outputData.ToString())
            count = streamRead.Read(readBuff, 0, 512)
        End While
        streamRead.Close()
        streamResponse.Close()
        responseHTTP.Close()

        ' Check output stuff
        If (txtDebugWebBrowser.Text.Contains("Please upgrade your browser")) Then

            connectionHTTP.UserAgent = amiAgent
            ChangeUserAgent(amiAgent)
            BrowserGH.Refresh()
            'MessageBox.Show("User Agent Spoof Not Working!")

        End If

    End Sub
End Class
