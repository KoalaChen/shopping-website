Public Partial Class WebForm2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        noticeHyperLink.Text = Application("recent_notice")
    End Sub
End Class