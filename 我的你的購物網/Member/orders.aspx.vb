Public Partial Class orders
    Inherits System.Web.UI.Page

    Protected Sub orderGridView_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles orderGridView.SelectedIndexChanged
        If orderGridView.SelectedValue = -1 Then
            orderShowAllDetailsView.Fields(19).Visible = False
            orderDetailPanel.Visible = False
        Else
            Dim sqlStr As String = " SELECT 訂單.id, 訂單.完成, 訂單.成立" & _
                                  " FROM 訂單" & _
                                  " WHERE (((訂單.id)=" & orderGridView.SelectedValue & "));"
            Dim result As DataTable = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteReader, sqlStr)
            If result.Rows(0).Item("完成") OrElse result.Rows(0).Item("成立") Then
                orderShowAllDetailsView.Fields(19).Visible = False
            Else
                orderShowAllDetailsView.Fields(19).Visible = True
            End If
            orderDetailPanel.Visible = True
        End If
    End Sub

    Protected Sub orderDetailGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles orderDetailGridView.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then
            Dim totalBuy, totalGet, totalCost As Integer
            For rowIndex As Integer = 0 To orderDetailGridView.Rows.Count - 1
                totalBuy += CInt(orderDetailGridView.Rows(rowIndex).Cells(3).Text)
                totalGet += CInt(orderDetailGridView.Rows(rowIndex).Cells(4).Text)
                totalCost += CInt(orderDetailGridView.Rows(rowIndex).Cells(5).Text)
            Next
            e.Row.Cells(3).Text = totalBuy
            e.Row.Cells(4).Text = totalGet
            e.Row.Cells(5).Text = totalCost

            discountLabel.Text = orderShowAllDetailsView.Rows(14).Cells(1).Text
            shippingCostLabel.Text = orderShowAllDetailsView.Rows(13).Cells(1).Text
            If totalCost + discountLabel.Text + shippingCostLabel.Text < 0 Then
                totalCostLabel.Text = "(錯誤發生，請告訴管理人員)"
            Else
                totalCostLabel.Text = totalCost + discountLabel.Text + shippingCostLabel.Text
            End If
        End If
    End Sub

    Protected Sub orderShowAllDetailsView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles orderShowAllDetailsView.ItemUpdated
        orderGridView.DataBind()
        orderShowAllDetailsView.DataBind()
    End Sub

    Protected Sub orderShowAllDetailsView_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles orderShowAllDetailsView.ItemDeleted
        orderDetailGridView.DataBind()
        orderGridView.DataBind()
        orderDetailPanel.Visible = False
    End Sub
End Class