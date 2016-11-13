Public Partial Class WebForm4
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not Session("member_Id") Is Nothing) AndAlso loginMultiView.ActiveViewIndex = 0 Then '已登入
            Response.Redirect(ResolveClientUrl(Application(SystemSetting.HeadTag & "defaultUrl"))) '回首頁
        Else '未登入
            validateImage.ImageUrl = "~/Function/ValidateCode.aspx?" & Now.ToString("hh_MM_ss") '重建驗證碼
        End If '已登入時的處理
        Response.Cache.SetNoStore() '清除該頁輸出緩存，設置該頁無緩存
        '預設關閉 Dialog
        errorCodeDialog.AutoOpen = False
        errorIdAndPasswordDialog.AutoOpen = False
    End Sub

    Protected Sub LoginButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LoginButton.Click
        If Page.IsValid Then
            loginMultiView.ActiveViewIndex = 1
            If Not Request.QueryString("url") Is Nothing Then '網頁轉向
                Response.Redirect(Request.QueryString("url"))
            Else
                Dim url As String = Application(SystemSetting.HeadTag & "defaultUrl")
                Response.Redirect(ResolveClientUrl(Application(SystemSetting.HeadTag & "defaultUrl")))
            End If
        Else
            validateTextBox.Text = String.Empty
        End If
    End Sub

    Protected Sub loginCustomValidator_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles loginCustomValidator.ServerValidate
        Dim UserData As DataTable = GetUserInfo(emailTextBox.Text, passwordTextBox.Text) 'SQL使用參數傳遞，避免SQL injection攻擊
        If Not (Session("ValidateCode") = validateTextBox.Text) Then
            errorCodeDialog.AutoOpen = True '顯示 驗證碼錯誤
            args.IsValid = False
        ElseIf UserData Is Nothing OrElse UserData.Rows.Count = 0 Then
            errorIdAndPasswordDialog.AutoOpen = True '顯示 帳號或密碼錯誤
            args.IsValid = False
        Else
            Session("member_Id") = UserData(0).Item("會員id")
            Session("member_Name") = UserData(0).Item("會員姓名")
            Session("member_Roleid") = UserData(0).Item("角色id")
            Session("member_RoleName") = UserData(0).Item("角色名稱")
            Session("member_RoleLevelId") = UserData(0).Item("會員等級id")
            Session("member_RoleLevelName") = UserData(0).Item("會員等級名稱")
            args.IsValid = True
        End If
    End Sub
End Class