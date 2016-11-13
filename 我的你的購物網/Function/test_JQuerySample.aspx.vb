Public Partial Class WebForm3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'DialogShow()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        'Dialog1.ShowModal = True
    End Sub

    Public Sub DialogShow()
        Dim Dialog As New DNA.UI.JQuery.Dialog
        Dialog.BodyTemplate = Nothing
        Dialog.AutoOpen = True
        Dialog.EnableViewState = False
        Dialog.CloseOnEscape = True
        Dialog.ShowModal = True
        Dialog.Title = Page.Title
        Dialog.MessageText = "測試"
        Dialog.DialogIcon = DNA.UI.JQuery.DialogIcons.Error
        Dialog.AutoOpen = True
    End Sub

    Protected Sub LinkButton12_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LinkButton12.Click
        Dialog1.AutoOpen = True '關鍵

    End Sub
End Class