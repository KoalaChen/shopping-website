Public Partial Class notice
    Inherits System.Web.UI.Page

    Protected Sub noticeDetailsView_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles noticeDetailsView.ItemInserted
        allNoticeGridView.DataBind()
        SystemSetting.refreshApplication(Application, "recent_notice")

    End Sub

    Protected Sub noticeDetailsView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles noticeDetailsView.ItemUpdated
        allNoticeGridView.DataBind()
        SystemSetting.refreshApplication(Application, "recent_notice")

    End Sub

    Protected Sub noticeDetailsView_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles noticeDetailsView.ItemDeleted
        allNoticeGridView.DataBind()
        SystemSetting.refreshApplication(Application, "recent_notice")

    End Sub
End Class