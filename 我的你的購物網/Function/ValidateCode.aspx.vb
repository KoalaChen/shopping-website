Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Drawing
Partial Class ValidateCode
    Inherits System.Web.UI.Page
    '參考別人作法http://chrisbalboa.pixnet.net/blog/post/27631979

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim RandomNumber As New Random(Now.Second)
        Dim str_ValidateCode As String = GetRandomNumberString(4 + RandomNumber.Next(3)) ' 4-6位數字的驗證碼
        Session("ValidateCode") = str_ValidateCode ' 用於驗證的Session
        Me.CreateCheckCodeImage(str_ValidateCode) '製作圖片
        '清除該頁輸出緩存，設置該頁無緩存  
        Response.Buffer = True
        Response.ExpiresAbsolute = Now
        Response.Expires = 0
        Response.CacheControl = "no-cache"
        Response.AppendHeader("Pragma", "No-Cache")
    End Sub

    Public Function GetRandomNumberString(ByVal NumberLength As Integer) As String
        Dim Number As String = Nothing
        Dim RandomNumber As New Random()
        For index As Integer = 0 To NumberLength - 1
            Number += RandomNumber.[Next](10).ToString()
        Next
        Return Number
    End Function ' 隨機產生數字

    Private Sub CreateCheckCodeImage(ByVal checkCode As String)
        If checkCode Is Nothing OrElse checkCode.Trim() = [String].Empty Then
            Exit Sub
        End If '如果傳進來的值為空字串，就停止製作

        Dim image As New System.Drawing.Bitmap(CInt(Math.Ceiling((checkCode.Length * 13.5))), 25) '新增一個 點陣圖(寬,高)
        Dim Graphics As System.Drawing.Graphics = Graphics.FromImage(image) '繪圖

        Try
            '生成隨機生成器
            Dim random As New Random()

            '清空圖片背景色
            Graphics.Clear(Color.White)

            For i As Integer = 0 To 24

                '畫圖片的背景噪音線
                Dim x1 As Integer = random.[Next](image.Width)
                Dim x2 As Integer = random.[Next](image.Width)
                Dim y1 As Integer = random.[Next](image.Height)
                Dim y2 As Integer = random.[Next](image.Height)

                Graphics.DrawLine(New Pen(Color.Silver), x1, y1, x2, y2)
            Next

            Dim font As Font = New System.Drawing.Font("Arial", 14, (System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Italic)) '字型

            Dim brush As New System.Drawing.Drawing2D.LinearGradientBrush(New Rectangle(0, 0, image.Width, image.Height), Color.Blue, Color.DarkRed, 1.2F, True)
            Graphics.DrawString(checkCode, font, brush, 2, 2) '繪圖 字串
            For i As Integer = 0 To 99

                '畫圖片的前景噪音點
                Dim x As Integer = random.Next(image.Width)
                Dim y As Integer = random.Next(image.Height)

                image.SetPixel(x, y, Color.FromArgb(random.Next(256), random.Next(256), random.Next(256)))
            Next

            '畫圖片的邊框線
            Graphics.DrawRectangle(New Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1)

            Dim ms As New System.IO.MemoryStream()
            image.Save(ms, System.Drawing.Imaging.ImageFormat.Png) '存檔
            Response.ClearContent() '清空網頁內容
            Response.ContentType = "image/Png" '網頁型態
            Response.BinaryWrite(ms.ToArray()) '輸出圖形
        Finally
            Graphics.Dispose()
            image.Dispose()
        End Try
    End Sub '產生圖形驗證碼
End Class