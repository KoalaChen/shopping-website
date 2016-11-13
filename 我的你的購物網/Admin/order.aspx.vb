Public Partial Class product_purchase
    Inherits System.Web.UI.Page

    Protected Sub orderDetailGridView_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles orderDetailGridView.RowUpdating
        Dim a As String = e.NewValues("配貨量")
    End Sub

    Protected Sub orderDetailGridView_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles orderDetailGridView.RowDeleting
        If orderDetailGridView.Rows.Count = 1 Then
            DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "錯誤", "只剩一項，不能刪除", DNA.UI.JQuery.DialogIcons.Error)
            e.Cancel = True
        Else
            e.Cancel = False
            DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "成功", "成功刪除一筆", DNA.UI.JQuery.DialogIcons.Info)
        End If
    End Sub

    Protected Sub orderDetailGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles orderDetailGridView.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then
            Dim totalBuy, totalGet, totalCost As Integer
            For rowIndex As Integer = 0 To orderDetailGridView.Rows.Count - 1
                totalBuy += CInt(orderDetailGridView.Rows(rowIndex).Cells(6).Text)
                totalGet += CInt(orderDetailGridView.Rows(rowIndex).Cells(7).Text)
                totalCost += CInt(orderDetailGridView.Rows(rowIndex).Cells(8).Text)
            Next
            Try
                e.Row.Cells(6).Text = totalBuy
                e.Row.Cells(7).Text = totalGet
                e.Row.Cells(8).Text = totalCost

                discountLabel.Text = orderShowDetailsView.Rows(11).Cells(1).Text
                shippingCostLabel.Text = orderShowDetailsView.Rows(12).Cells(1).Text
                If totalCost - discountLabel.Text - shippingCostLabel.Text < 0 Then
                    totalCostLabel.Text = "(錯誤發生，請告訴管理人員)"
                Else
                    totalCostLabel.Text = totalCost + discountLabel.Text + shippingCostLabel.Text
                End If
            Catch ex As Exception

            End Try
        End If
    End Sub

    Protected Sub orderShowDetailsView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles orderShowDetailsView.ItemUpdating
        'Dim r2, r3 As Boolean
        'r2 = (e.NewValues("出貨日期時間").Equals(System.DBNull.Value))
        'r3 = (e.NewValues("顧客拿貨時間").Equals(System.DBNull.Value))
        'If Not e.NewValues("出貨日期時間") < e.NewValues("顧客拿貨時間") Then
        'ElseIf e.NewValues("訂購日期時間") < e.NewValues("出貨日期時間") Then
        'ElseIf e.NewValues("訂購日期時間") < e.NewValues("顧客拿貨時間") Then
        'End If

    End Sub

    Protected Sub orderDetailGridView_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles orderDetailGridView.RowEditing

    End Sub

    Protected Sub orderShowDetailsView_ItemDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) Handles orderShowDetailsView.ItemDeleting
        discountLabel.Text = String.Empty
        shippingCostLabel.Text = String.Empty
        totalCostLabel.Text = String.Empty

    End Sub
End Class