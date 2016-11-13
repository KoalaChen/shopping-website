Public Partial Class AdminSite
    Inherits System.Web.UI.MasterPage

    Private Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        backToDefaultPageHyperlink.Text = Application(SystemSetting.HeadTag & "hostname")
        backToDefaultPageHyperlink.NavigateUrl = Application(SystemSetting.HeadTag & "defaultUrl")
    End Sub

End Class