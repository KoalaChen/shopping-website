Public Partial Class MemberMasterPage
    Inherits System.Web.UI.MasterPage

    Private Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Page.Title = "會員專區：" & If(String.IsNullOrEmpty(Page.Title), String.Empty, Page.Title & "。") & Application(SystemSetting.HeadTag & "hostname")
    End Sub
End Class