Public Partial Class category
    Inherits System.Web.UI.Page

    Private Sub category_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit
        If Request.QueryString("id") Is Nothing Then
            Response.Redirect(ResolveUrl(Application(SystemSetting.HeadTag & "defaultUrl")))
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        noticeLinkButton.Text = Application("recent_notice")
    End Sub
End Class