Public Partial Class MainSite
    Inherits System.Web.UI.MasterPage

    Private Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Application("sys_" & "enableMaintenance") AndAlso Not Page.Request.Url.AbsolutePath.ToString.StartsWith("/Error/default.aspx") Then
            Response.Redirect(ResolveUrl("~/Error/") & "?reason=網站系統維護中。" & "維護公告：" & Application("sys_" & "maintenanceNotice"))
        End If

        '相關資訊
        Page.Title = If(String.IsNullOrEmpty(Page.Title), String.Empty, Page.Title & "。") & Application(SystemSetting.HeadTag & "hostname")
        logoImageHyperlink.ImageUrl = Application(SystemSetting.HeadTag & "imageFolderUrl") & Application(SystemSetting.HeadTag & "logoUrl")
        CopyrightNoticeLabel.Text = Application("Copyright Notices") '版權宣告
        memberNameLabel.Text = If(Not Session("member_Name") Is Nothing, Session("member_Name"), String.Empty) '會員名稱
        websiteNameLabel.Text = Application(SystemSetting.HeadTag & "hostname") '網站名稱
        roleNameLabel.Text = If(Not Session("member_RoleName") Is Nothing, Session("member_RoleName"), "一般訪客") '角色名稱
        Const LOGIN As Byte = 0, LOGOUT As Byte = 1
        userLoginLogoutMultiView.ActiveViewIndex = If(Not Session("member_id") Is Nothing, LOGOUT, LOGIN) '登入登出功能
        visitLabel.Text = Application(SystemSetting.HeadTag & "visits") '人數統計
        productCountLabel.Text = Application("productCount") '產品統計
        memberCountLabel.Text = Application("memberCount") '會員統計
        onlineUserCountLabel.Text = Application("onlineUserCount") '會員統計
        Const IS_ADMIN As Byte = 0, IS_NONADMIN As Int16 = -1
        adminMultiView.ActiveViewIndex = If(Session("member_RoleName") = "管理人員", IS_ADMIN, IS_NONADMIN) '管理者功能
        cartProductCountLabel.Text = If(Not Session("cartProdcutCount") Is Nothing, Session("cartProdcutCount"), 0) '目前購買總數
        cartTotalCostLabel.Text = If(Not Session("cartTotalCost") Is Nothing, Session("cartTotalCost"), 0) '目前總金額
        roleLevelNameLabel.Text = If(Session("member_RoleLevelName") Is Nothing, String.Empty, "[等級：" & Session("member_RoleLevelName") & "]")
    End Sub

    Protected Sub SearchButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles searchButton.Click
        Response.Redirect(ResolveClientUrl("~/Public/Search.aspx?keyword=" & SearchTextBox.Text.Trim & ""))
    End Sub
End Class