Public Partial Class personal_information
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub oldPasswordCustomValidator_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles oldPasswordCustomValidator.ServerValidate
        Dim sqlStr As String = "Select 密碼 From 人員 Where id=" & Session("member_Id") & ";"
        Dim result As String = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteScalar, sqlStr)
        If result = args.Value Then
            args.IsValid = True
        Else
            args.IsValid = False
        End If
    End Sub

    Protected Sub resetPasswordButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles resetPasswordButton.Click
        If Page.IsValid Then
            Dim sqlStr As String = " UPDATE 人員 SET 密碼='" & resetPasswordTextBox.Text.Trim & "' WHERE id=" & Session("member_Id")
            Dim result As Integer = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteNonQuery, sqlStr)
            If result Then
                DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "結果", "重設成功", DNA.UI.JQuery.DialogIcons.Info)
            End If
        End If
    End Sub
End Class