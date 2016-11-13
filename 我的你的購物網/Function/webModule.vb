Module webModule
    Public Function GenerateStepTable(ByVal currentStep As Integer, ByRef StepName() As String, ByRef Style As String)
        'Dim StepName() As String = {"(1)輸入驗證碼", "(2)同意本站規定", "(3)填寫基本資料", "(4)確認註冊資料", "(5)完成註冊"}
        Dim Result As New StringBuilder
        Result.AppendLine("<link type='text/css' href='" & Style & "' rel='stylesheet'/>")


        Result.AppendLine("<table width=""100%"" style='border-collapse: collapse' height='50'>")
        Result.AppendLine("<tr>")
        For i As Integer = 0 To currentStep - 2 '已經完成的Step
            Result.AppendLine("<td>" & _
                              "     <i>" & _
                              "         <div class='step-ui-widget'>" & _
                              "             <div style='margin-top: 20px; padding: 0pt 0.7em;' class='step-ui-state-highlight step-ui-corner-all'>" & _
                              "                 <font color=""#808080"">" & _
                                                    StepName(i) & _
                              "                 </font>" & _
                              "             </div>" & _
                              "         </div>" & _
                              "     </i>" & _
                              "</td>")
        Next
        If currentStep <> 0 Then
            Result.AppendLine("<td>" & _
                              "     <b>" & _
                              "         <div class='step-ui-widget'>" & _
                              "             <div style='padding: 0pt 0.7em;' class='step-ui-state-error step-ui-corner-all'>" & _
                              "                 <font color=""#808080"">" & _
                                                    StepName(currentStep - 1) & _
                              "                 </font>" & _
                              "             </div>" & _
                              "         </div>" & _
                              "     </b>" & _
                              "</td>") '目前的Step
        End If
        For i As Integer = currentStep To StepName.Length - 1 '未進行的Step
            Result.AppendLine("<td>" & _
                              "     " & _
                              "         <div class='step-ui-widget'>" & _
                              "             <div style='margin-top: 20px; padding: 0pt 0.7em;' class='step-ui-state-highlight step-ui-corner-all'>" & _
                              "                 <font color=""#808080"">" & _
                                                    StepName(i) & _
                              "                 </font>" & _
                              "             </div>" & _
                              "         </div>" & _
                              "     " & _
                              "</td>")
        Next
        Result.AppendLine("</tr>")
        Result.AppendLine("</table>")
        Return Result.ToString
    End Function '建立目前步驟[進度條]
    Public Function sendEMail(ByVal email As String, ByVal password As String, ByVal name As String, ByVal websiteName As String) As Boolean
        'Try
        Dim mail As New System.Net.Mail.MailMessage '宣告mail的物件
        Dim smtpClnt As New System.Net.Mail.SmtpClient("smtp.gmail.com") '587 計中 會擋

        smtpClnt.EnableSsl = True
        smtpClnt.Credentials = New System.Net.NetworkCredential("webtestb096", "a12345678") '使用gmail的帳號 密碼

        mail.From = New System.Net.Mail.MailAddress("webtestb096@gmail.com", "ShoppingWebsite", Encoding.GetEncoding("Big5"))
        mail.To.Add(email) '收信者email
        '主旨
        mail.Subject = "RegInformation"
        mail.SubjectEncoding = Encoding.GetEncoding("Big5") '設定編碼
        '信件內容
        Dim msg As String = "您好" & name & "：<br />" & "這是您的註冊資訊" & "<br />帳號：" & email & "<br />" & "密碼 :" & password & "<br /> 感謝您的註冊。" & websiteName & "敬上<br />這封郵件於" & Now.ToString("yyyy/MM/dd hh:MM:ss") & "寄出"
        mail.Body = msg  ' Email 內容
        mail.BodyEncoding = Encoding.GetEncoding("Big5") '設定編碼
        mail.IsBodyHtml = True '內容是否為HTML
        smtpClnt.Send(mail) '寄送E-Mail
        Return True
        'Catch ex As Exception
        Return False
        'End Try
    End Function
End Module
