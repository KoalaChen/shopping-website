Public Partial Class member
    Inherits System.Web.UI.Page

    Private Sub memberDetailsView_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles memberDetailsView.ItemDeleted
        memberGridView.DataBind()
    End Sub
    Protected Sub memberDetailsView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles memberDetailsView.ItemUpdating
        Dim temp As String = Nothing
        For i As Integer = 0 To e.NewValues.Count - 1
            temp &= e.NewValues.Keys(i) & "|" & e.NewValues.Values(i) & vbNewLine
        Next
        Dim sqlStr As String = "SELECT 人員_角色.人員id" & _
                               " FROM 角色 INNER JOIN 人員_角色 ON 角色.id = 人員_角色.角色id" & _
                               " WHERE (((角色.名稱)='管理人員'));"
        Dim result As DataTable = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteReader, sqlStr)
        If result.Rows.Count = 1 And e.OldValues("角色id") = 1 And e.NewValues("角色id") <> 1 Then
            DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "錯誤", "系統中，至少要有一位管理員。請先指派其它人擔任管理員。", DNA.UI.JQuery.DialogIcons.Error)
            e.Cancel = True
        Else
            sqlStr = "UPDATE 人員_角色 SET 角色id=" & e.NewValues("角色id") & " WHERE 人員id=" & memberDetailsView.SelectedValue & ";"
            Dim result2 As Int16 = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteNonQuery, sqlStr)
            DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "結果", "更新成功。", DNA.UI.JQuery.DialogIcons.Info)
        End If
    End Sub

    Protected Sub memberDetailsView_ItemDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) Handles memberDetailsView.ItemDeleting
        Dim sqlStr As String = " SELECT [人員].[id] AS 管理人員id" & _
                               " FROM 角色 INNER JOIN (人員 INNER JOIN 人員_角色 ON 人員.id = 人員_角色.人員id) ON 角色.id = 人員_角色.角色id" & _
                               " WHERE (((角色.名稱)='管理人員'));"
        Dim result As DataTable = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteReader, sqlStr)
        Dim IsAdmin As Boolean = False
        For Each i As System.Data.DataRow In result.Rows
            If i("管理人員id") = e.Keys("id") Then
                IsAdmin = True
                Exit For
            End If
        Next
        If result.Rows.Count = 1 And IsAdmin Then
            DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "錯誤", "系統中，至少要有一位管理員。請先指派其它人擔任管理員。", DNA.UI.JQuery.DialogIcons.Error)
            e.Cancel = True
        Else
            DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "結果", "刪除成功。", DNA.UI.JQuery.DialogIcons.Info)
            e.Cancel = False
        End If
    End Sub

    Private Sub memberDetailsView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles memberDetailsView.ItemUpdated
        memberGridView.DataBind()
    End Sub
End Class