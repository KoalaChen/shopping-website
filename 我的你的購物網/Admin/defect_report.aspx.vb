Public Partial Class defect_report
    Inherits System.Web.UI.Page

    Protected Sub defectDetailDetailsView_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles defectDetailDetailsView.ItemDeleted
        defectGridView.DataBind()
    End Sub

    Protected Sub defectDetailDetailsView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles defectDetailDetailsView.ItemUpdated
        defectGridView.DataBind()
    End Sub
End Class