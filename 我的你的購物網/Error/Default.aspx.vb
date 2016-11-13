Public Partial Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("reason") Is Nothing Then
            Response.Redirect("~\") '移至首頁
        Else
            ReasonLabel.Text = Request.QueryString("reason").Replace("|", "<br />")
        End If
    End Sub

End Class