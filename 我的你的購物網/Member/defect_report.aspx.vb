Public Partial Class comments_to_admin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub submitButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles submitButton.Click
        contentTextBox.Text = contentTextBox.Text.Replace(" ", "&nbsp;")
        contentTextBox.Text = contentTextBox.Text.Replace(System.Environment.NewLine, "<br />")
        If Not String.IsNullOrEmpty(contentTextBox.Text.Trim) Then
            Dim sqlStr As String = "INSERT INTO 網站留言(會員id, 會員留言, 留言日期) VALUES ('" & Session("member_Id") & "', '" & contentTextBox.Text & "', now())"
            Dim result As Integer = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteNonQuery, sqlStr)
            If result Then
                DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "成功", "訊息已成功送出", DNA.UI.JQuery.DialogIcons.Info)
                contentTextBox.Text = String.Empty
            Else
                DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "失敗", "訊息送出失敗，請重試", DNA.UI.JQuery.DialogIcons.Error)
            End If
        Else
            DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "注意", "請輸入留言", DNA.UI.JQuery.DialogIcons.Error)
        End If
        defectAccessDataSource.DataBind()
        defectListView.DataBind()
    End Sub
End Class