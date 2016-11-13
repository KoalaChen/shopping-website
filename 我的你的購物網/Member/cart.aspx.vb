Public Partial Class cart
    Inherits System.Web.UI.Page

    Function LoadData(Optional ByVal processing As Boolean = False) As String
        '宣告FilterStr存放過濾資料的條件
        Dim FilterStr As String = Nothing
        '宣告TempStrArray字串陣列做為暫停之用
        Dim TempStrArray As String()
        '讀取所有Session 中使用者選擇的產品
        For Each CItem As String In Session
            If CItem.StartsWith("Product_") Then
                TempStrArray = CItem.Split("_")
                If FilterStr = Nothing Then
                    FilterStr = " Where [id]  = " & TempStrArray(1)
                Else
                    FilterStr &= " Or [id]  = " & TempStrArray(1)
                End If
            End If
        Next
        '使用者沒選擇任何產品
        If FilterStr = Nothing Then
            FilterStr = " Where [id] = 0"
            CartMultiView.SetActiveView(NoItemView)
        ElseIf processing = False Then
            CartMultiView.SetActiveView(OrderItemView)
        End If
        '將SQL語法丟給DataSource
        Return FilterStr
    End Function

    Private Sub cart_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        ProductHyperLink.NavigateUrl = Application(SystemSetting.HeadTag & "defaultUrl")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If CBool(Application(HeadTag & "enableTransactions")) Then
            If CartMultiView.ActiveViewIndex <= 1 Then
                OrderItemAccessDataSource.SelectCommand &= LoadData()
            End If
        Else
            StepLabel.Visible = False
            underMainTenanceLabel.Text = Application(HeadTag & "transactionsNotice")
            CartMultiView.SetActiveView(underMaintenanceView)
        End If
    End Sub

    Protected Sub NextStepLinkButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles NextStepLinkButton.Click
        CartMultiView.SetActiveView(personalInfoView)
        Dim sqlStr As String = " SELECT 收件人, 郵遞區號, 地址, 手機號碼, 室內電話, 電子郵件" & _
                               " FROM 電子郵件 INNER JOIN 人員 ON 電子郵件.id = 人員.主要郵件id" & _
                               " WHERE (((人員.id)=" & Session("member_Id") & "));"
        Dim result As DataTable = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteReader, sqlStr)
        Dim a As String = String.Empty
        For i As Integer = 0 To result.Columns.Count - 1
            a &= result(0).Item(i) & vbNewLine
        Next
        If Not result Is Nothing And result.Rows.Count = 1 Then
            NameTextBox.Text = If(result.Rows(0).Item("收件人").Equals(System.DBNull.Value), String.Empty, result.Rows(0).Item("收件人"))
            zipCodeTextBox.Text = If(result.Rows(0).Item("郵遞區號").Equals(System.DBNull.Value), String.Empty, result.Rows(0).Item("郵遞區號"))
            AddressTextBox.Text = If(result.Rows(0).Item("地址").Equals(System.DBNull.Value), String.Empty, result.Rows(0).Item("地址"))
            PhoneTextBox.Text = If(result.Rows(0).Item("手機號碼").Equals(System.DBNull.Value), String.Empty, result.Rows(0).Item("手機號碼"))
            homePhoneTextBox.Text = If(result.Rows(0).Item("室內電話").Equals(System.DBNull.Value), String.Empty, result.Rows(0).Item("室內電話"))
            EMailTextBox.Text = If(result.Rows(0).Item("電子郵件").Equals(System.DBNull.Value), String.Empty, result.Rows(0).Item("電子郵件"))
        End If
    End Sub '下一步：輸入個資

    Protected Sub BackCartLinkButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BackCartLinkButton.Click
        If Page.IsValid Then CartMultiView.SetActiveView(OrderItemView)
    End Sub '下一步：產品細項

    Protected Sub NextView2LinkButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles NextView2LinkButton.Click
        If Page.IsValid Then
            CartMultiView.SetActiveView(confirmInfoView)
            OrderAccessDataSource.SelectCommand &= LoadData(processing:=True)
            Dim sqlStr As String = " SELECT 會員等級.名稱 AS 會員的等級, 會員等級.折價規則 AS 折價的規則" & _
                       " FROM   會員等級" & _
                       " WHERE  會員等級.id=" & Session("member_RoleLevelId") & ";"
            Dim nowLevel As DataTable = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteReader, sqlStr)
            If nowLevel.Rows(0).Item("折價的規則").replace("*", String.Empty) <> "1" Then
                Session("cartDiscount") = Math.Floor(Session("cartTotalCost") * CDbl(1 - nowLevel.Rows(0).Item("折價的規則").replace("*", String.Empty)))
                discountLabel.Text = "折" & Session("cartDiscount") & "元" '折價
            End If
            sqlStr = " SELECT [價格],[多少元以上免運費] FROM [取貨方式] WHERE id=" & getwayDropDownList.SelectedValue & ";"
            Dim result As DataTable = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteReader, sqlStr)
            Dim minCost As Integer = result.Rows(0).Item("多少元以上免運費")
            Dim shippingCost As Integer = result.Rows(0).Item("價格")
            If Session("cartTotalCost") - Session("cartDiscount") >= minCost Then
                Session("cartShippingCost") = 0
            Else
                Session("cartShippingCost") = shippingCost
            End If
            shippingCostLabel.Text = Session("cartShippingCost") & "元" '運費
            totalCostLabel.Text = CInt(Session("cartTotalCost") - Session("cartDiscount") + Session("cartShippingCost"))
            '個人資料部分
            LabelName.Text = NameTextBox.Text
            LabelCellPhone.Text = PhoneTextBox.Text
            LabelHomePhone.Text = homePhoneTextBox.Text
            LabelEmail.Text = EMailTextBox.Text
            LabelGetway.Text = getwayDropDownList.SelectedItem.Text
            LabelPayway.Text = paywayDropDownList.SelectedItem.Text
            LabelAddress.Text = AddressTextBox.Text
            LabelNote.Text = NoteTextBox.Text.Replace(vbCrLf, "<br />")
        End If
    End Sub '下一步：確認資料

    Protected Sub CheckOutLinkButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles CheckOutLinkButton.Click
        If Page.IsValid Then
            CartMultiView.SetActiveView(resultView)
            Dim connection As New OleDb.OleDbConnection(SystemSetting.DbConnStr.ConnectionString)
            connection.Open()
            Dim Transaction As OleDb.OleDbTransaction = connection.BeginTransaction '開始交易程序，不能平行處理(同一次只能進行一次Transaction
            Try
                Dim command As New OleDb.OleDbCommand(" INSERT INTO 訂單 (會員帳號id,收件人,手機號碼,室內電話,取貨方式id,付款方式id,郵遞區號,取貨地點,運費,折扣,留言)" & _
                                                      " VALUES(" & _
                                                      "" & Session("member_Id") & "," & _
                                                      "'" & NameTextBox.Text & "'," & _
                                                      "'" & PhoneTextBox.Text & "'," & _
                                                      "'" & homePhoneTextBox.Text & "'," & _
                                                            getwayDropDownList.SelectedValue & "," & _
                                                            paywayDropDownList.SelectedValue & "," & _
                                                      "'" & zipCodeTextBox.Text.Trim & "'," & _
                                                      "'" & AddressTextBox.Text.Trim & "'," & _
                                                            Session("cartShippingCost") & "," & _
                                                            -Session("cartDiscount") & "," & _
                                                      "'" & NoteTextBox.Text.Replace(vbCrLf, "<br />") & "');", connection) '記得加Connection，不然commnand會不知道
                command.Transaction = Transaction '沒有它會有一個 連線尚未初始化的Exception
                Dim result As Integer = command.ExecuteNonQuery()
                If result <> 1 Then Throw New Exception("無法建立訂單")
                command.CommandText = " SELECT id" & _
                                      " FROM 訂單" & _
                                      " WHERE 會員帳號id=" & Session("member_Id") & _
                                      " AND 訂購日期時間=(" & _
                                      "                     SELECT Max(訂購日期時間)" & _
                                      "                     FROM 訂單" & _
                                      "                     WHERE 會員帳號id=" & Session("member_Id") & _
                                      "                   );"
                Dim newOrderId = command.ExecuteScalar
                If newOrderId Is Nothing Then Throw New Exception("無法查詢訂單id")
                command.CommandText = " UPDATE 人員 SET 收件人='" & NameTextBox.Text & "'," & _
                                                       "郵遞區號='" & zipCodeTextBox.Text & "'," & _
                                                       "地址='" & AddressTextBox.Text & "'," & _
                                                       "手機號碼='" & PhoneTextBox.Text & "'," & _
                                                       "室內電話='" & homePhoneTextBox.Text & "'" & _
                                      " WHERE  id=" & Session("member_Id") & ";"
                result = command.ExecuteNonQuery()
                If result <> 1 Then Throw New Exception("無法更新會員資料")
                For rowIndex As Integer = 0 To CartGridView.Rows.Count - 1
                    command.CommandText = " INSERT INTO 訂單細項(訂單id, 產品id, 訂購量, 金額)" & _
                                          " VALUES(" & newOrderId & "," & _
                                             OrderGridView.Rows(rowIndex).Cells(0).Text & "," & _
                                             OrderGridView.Rows(rowIndex).Cells(3).Text & "," & _
                                             OrderGridView.Rows(rowIndex).Cells(4).Text & ");"
                    result = command.ExecuteNonQuery()
                    If result <> 1 Then Throw New Exception("無法訂購[" & CartGridView.Rows(rowIndex).Cells(1).Text & "]")
                Next
                resultLabel.Text = "訂單已經送出, 訂單編號為" & newOrderId & "<br />" & _
                                   "<br />" & _
                                   "感謝您的訂購!"
                DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "訂購成功", resultLabel.Text, DNA.UI.JQuery.DialogIcons.Info)
                Transaction.Commit()
                For rowIndex As Integer = 0 To CartGridView.Rows.Count - 1
                    Session.Remove("Product_" & OrderGridView.Rows(rowIndex).Cells(0).Text)
                Next
                Session.Remove("cartShippingCost")
                Session.Remove("cartDiscount")
                Session("cartTotalCost") = 0
                Session("cartProdcutCount") = 0
            Catch ex As Exception
                Transaction.Rollback()
                resultLabel.Text = "建立訂購時發生錯誤，原因：" & ex.Message & "，麻煩請告訴網站服務人員處理，感謝您的支持與配合。"
                DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "訂購失敗", resultLabel.Text, DNA.UI.JQuery.DialogIcons.Error)
            End Try
        Else
            DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "必填", "請您確認完資料後，勾選[" & confirmCheckBox.Text & "]選項", DNA.UI.JQuery.DialogIcons.Info)
        End If
    End Sub '下一步：結帳

    Protected Sub PreStepLinkButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles PreStepLinkButton.Click
        If Page.IsValid Then CartMultiView.SetActiveView(personalInfoView)
    End Sub '上一步：個人資料

    Protected Sub CartGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles CartGridView.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim MyQty As TextBox = e.Row.FindControl("QtyTextBox")
            MyQty.Text = Session("Product_" & e.Row.Cells(0).Text)
            e.Row.Cells(4).Text = MyQty.Text * e.Row.Cells(2).Text
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            Dim totalPrice As Double = 0
            Dim totalQty As Integer = 0
            If CartGridView.Rows.Count > 0 Then
                For i As Integer = 0 To CartGridView.Rows.Count - 1
                    Dim MyQty As TextBox = CartGridView.Rows(i).FindControl("QtyTextBox")
                    totalQty += MyQty.Text
                    totalPrice += CartGridView.Rows(i).Cells(4).Text
                Next
            End If
            e.Row.Cells(3).Text = totalQty
            e.Row.Cells(4).Text = totalPrice
            Session("cartTotalCost") = totalPrice
        End If
    End Sub '計算每項金額和加總

    Protected Sub confirmCustomValidator_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles confirmCustomValidator.ServerValidate
        args.IsValid = confirmCheckBox.Checked
    End Sub '檢查：是否選取[確認]

    Protected Sub OrderGridView_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles OrderGridView.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim MyQty As Integer = Session("Product_" & e.Row.Cells(0).Text)
            e.Row.Cells(3).Text = MyQty
            e.Row.Cells(4).Text = MyQty * e.Row.Cells(2).Text
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            Dim totalPrice As Double = 0
            Dim totalQty As Integer = 0
            If OrderGridView.Rows.Count > 0 Then
                For i As Integer = 0 To CartGridView.Rows.Count - 1
                    totalQty += OrderGridView.Rows(i).Cells(3).Text
                    totalPrice += OrderGridView.Rows(i).Cells(4).Text
                Next
            End If
            e.Row.Cells(3).Text = totalQty
            e.Row.Cells(4).Text = totalPrice
        End If

    End Sub

    Protected Sub CartMultiView_ActiveViewChanged(ByVal sender As Object, ByVal e As EventArgs) Handles CartMultiView.ActiveViewChanged
        If CartMultiView.ActiveViewIndex < 5 Then
            StepLabel.Text = webModule.GenerateStepTable(CartMultiView.ActiveViewIndex, _
                                        New String() {"(1)修改訂購明細", "(2)填寫聯絡資料", "(3)確認資料", "(4)完成訂購"}, _
                                        ResolveUrl("~\css\step.css")) '顯示目前步驟進度條
        End If
    End Sub

    Protected Sub UpdateCartButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles UpdateCartButton.Click
        For i As Integer = 0 To CartGridView.Rows.Count - 1
            Dim MyQty As TextBox = CartGridView.Rows.Item(i).FindControl("QtyTextBox")
            Session("Product_" & CartGridView.Rows.Item(i).Cells(0).Text) = MyQty.Text
        Next
        Response.Redirect(Request.Url.AbsoluteUri)
    End Sub

    Protected Sub CartGridView_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles CartGridView.RowCommand
        If e.CommandName = "del" Then
            Session.Remove("product_" & e.CommandArgument)
        End If
        Response.Redirect(Request.Url.AbsoluteUri)
    End Sub
End Class