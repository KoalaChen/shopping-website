Public Partial Class product_data_management
    Inherits System.Web.UI.Page

    Protected Sub productPriceGridView_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles productPriceGridView.RowDeleting
        If productPriceGridView.Rows.Count = 1 Then
            DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "刪除", "刪除失敗，價格至少要有一個", DNA.UI.JQuery.DialogIcons.Error)
            e.Cancel = True
        Else
            DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "刪除", "刪除價格成功", DNA.UI.JQuery.DialogIcons.Info)
            e.Cancel = False
            priceDetailsView.DataBind()
        End If
    End Sub

    Function uploadPhoto()
        If photoFileUpload.HasFile Then
            Dim fileOK As Boolean = False
            '核准的副檔名
            Dim fileExtension As String = System.IO.Path. _
                GetExtension(photoFileUpload.FileName).ToLower()
            Dim allowedExtensions As String() = {".jpg", ".jpeg", ".png", ".gif"}
            '檢查附檔名
            For i As Integer = 0 To allowedExtensions.Length - 1
                If fileExtension = allowedExtensions(i) Then
                    fileOK = True
                    Exit For
                End If
            Next
            '如果副檔名OK，那存檔
            If fileOK Then
                Dim filename As String = photoFileUpload.FileName
                Dim savePath As String = String.Empty
                Do
                    filename = Guid.NewGuid.ToString & "." & System.IO.Path.GetExtension(filename) '透過Guid類別的NewGuid方法產生唯一字串
                    savePath = MapPath("~/images/product/" & filename)
                    If System.IO.File.Exists(savePath) Then
                        Continue Do '檔名重複則重新產生
                    Else
                        Try
                            photoFileUpload.PostedFile.SaveAs(savePath)
                            DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "新增", "新增照片成功", DNA.UI.JQuery.DialogIcons.Info)
                            Return filename
                        Catch ex As Exception
                            DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "新增", "新增照片失敗", DNA.UI.JQuery.DialogIcons.Error)
                        End Try
                    End If
                Loop While 0
            Else '如果副檔名不OK，那
                DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "新增", "新增照片失敗", DNA.UI.JQuery.DialogIcons.Error)
                productInsertCustomValidator.IsValid = False
            End If
        End If
        '失敗時傳回空字串
        Return String.Empty
    End Function '上傳照片

    Protected Sub priceDetailsView_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles priceDetailsView.ItemInserted
        productPriceGridView.DataBind()
    End Sub

    Protected Sub insertLinkButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles insertLinkButton.Click
        mainMultiView.SetActiveView(insertView)
    End Sub

    Protected Sub otherLinkButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles otherLinkButton.Click
        mainMultiView.SetActiveView(updateAndDeleteAndQueryView)
    End Sub

    Protected Sub CustomValidator1_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs)
        Try
            args.IsValid = Now.CompareTo(args.Value) > 0
        Catch ex As Exception
            args.IsValid = False
        End Try
    End Sub

    Protected Sub insertProductButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles insertProductButton.Click
        '取得主照片檔名
        Dim photoFilename As String = String.Empty
        photoCustomValidator.IsValid = (selectPhotoWay1RadioButton.Checked OrElse selectPhotoWay2RadioButton.Checked OrElse selectPhotoWay3RadioButton.Checked)
        If Page.IsValid Then
            If selectPhotoWay1RadioButton.Checked Then
                photoFilename = showImageFilenamesDropDownList.SelectedValue
            ElseIf selectPhotoWay2RadioButton.Checked Then
                photoFilename = uploadPhoto()
            ElseIf selectPhotoWay3RadioButton.Checked Then
                photoFilename = Application(HeadTag & "NoProductImg")
            End If
            '資料庫修改
            Using connection As New OleDb.OleDbConnection(SystemSetting.DbConnStr.ConnectionString)
                connection.Open()
                Dim Transaction As OleDb.OleDbTransaction = connection.BeginTransaction '開始交易程序，不能平行處理(同一次只能進行一次Transaction
                Try
                    If photoFilename Is Nothing Then Throw New Exception("照片產生錯誤")
                    Dim sqlStr As String = "PARAMETERS " & _
                                                     " Content LongText;" & _
                             " INSERT INTO 產品(分類id, 名稱, 內容, 上架, 主照片)" & vbNewLine & _
                             " VALUES(" & categoryDropDownList.SelectedValue & "," & _
                             " '" & nameTextBox.Text & "'," & _
                             " [Content], Cbool('" & saleRadioButtonList.SelectedValue & "'), '" & photoFilename & "');"
                    Dim command As New OleDb.OleDbCommand(sqlStr, connection)
                    command.Transaction = Transaction '沒有它會有一個 連線尚未初始化的Exception
                    '新增產品
                    command.Parameters.AddWithValue("Content", productContentFCKeditor.Value)

                    Dim result As Integer = command.ExecuteNonQuery
                    command.Parameters.Clear()
                    sqlStr = " SELECT MAX(id) FROM 產品"
                    command.CommandText = sqlStr
                    Dim newProductId As Integer = command.ExecuteScalar
                    sqlStr = " INSERT INTO 售價(產品id,價格) VALUES (" & newProductId & "," & priceTextBox.Text & ");"
                    command.CommandText = sqlStr
                    result = command.ExecuteNonQuery()
                    Transaction.Commit()
                    DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "新增產品", "新增成功", DNA.UI.JQuery.DialogIcons.Info)
                    mainMultiView.ActiveViewIndex = -1
                Catch ex As Exception
                    Transaction.Rollback()
                    DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "新增產品", "新增失敗，原因：" & ex.Message, DNA.UI.JQuery.DialogIcons.Error)
                End Try
            End Using
        End If
    End Sub

    Protected Sub insertView_Init(ByVal sender As Object, ByVal e As EventArgs) Handles insertView.Init
        nameTextBox.Text = String.Empty
        For Each i As System.Web.UI.WebControls.ListItem In saleRadioButtonList.Items
            i.Selected = False
        Next
        selectPhotoWay1RadioButton.Checked = False
        selectPhotoWay2RadioButton.Checked = False
        selectPhotoWay3RadioButton.Checked = False

        Dim photoFilename() As String = System.IO.Directory.GetFiles(Server.MapPath("~/Images/product/"))
        For Each filename As String In photoFilename
            showImageFilenamesDropDownList.Items.Add(filename.Replace(Server.MapPath("~/Images/product/"), String.Empty))
        Next
        showImageFilenamesDropDownList.Items.Remove(Application(HeadTag & "NoProductImg"))
        showDefaultImage.ImageUrl = "~/Images/product/" & Application(HeadTag & "NoProductImg")
    End Sub

#Region "刪除前的檢查動作"
    Protected Sub priceDetailsView_ItemDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeleteEventArgs) Handles priceDetailsView.ItemDeleting
        Dim sqlStr As String = "SELECT Count(*) FROM 售價 WHERE 產品id=" & e.Keys("產品id")
        Dim result As Integer = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteScalar, sqlStr)
        e.Cancel = If(result <= 1, True, False)
        If e.Cancel Then
            DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "修改產品", "刪除價格失敗，每項產品至少要有一個價錢", DNA.UI.JQuery.DialogIcons.Error)
        Else
            DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "修改產品", "刪除價格成功", DNA.UI.JQuery.DialogIcons.Info)
            productPriceGridView.DataBind()
        End If
    End Sub
#End Region

#Region "下SQL後更新GridView"
    Protected Sub priceDetailsView_ItemDeleted(ByVal sender As Object, _
                                               ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) _
                                               Handles priceDetailsView.ItemDeleted
        productPriceGridView.DataBind()
    End Sub '價格刪除後->更新GridView

    Protected Sub priceDetailsView_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles priceDetailsView.ItemInserting
        If CDate(e.Values("設定起始日期")) < Today Then
            DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "修改產品", "新增價格失敗，輸入的日期要>=今天日期", DNA.UI.JQuery.DialogIcons.Error)
            e.Cancel = True
            Exit Sub
        End If
        Dim sqlStr As String = " SELECT Count(*) AS RowCount" & _
                               " FROM(售價)" & _
                               " WHERE (((Year([設定起始日期]))=" & CDate(e.Values("設定起始日期")).Year & ")" & _
                               " AND ((Month([設定起始日期]))=" & CDate(e.Values("設定起始日期")).Month & ")" & _
                               " AND ((Day([設定起始日期]))=" & CDate(e.Values("設定起始日期")).Day & "))" & _
                               " AND [產品id]=" & allProductGridView.SelectedValue & "; "
        Dim result As Integer = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteScalar, sqlStr)
        e.Cancel = If(result > 0, True, False)
        If e.Cancel Then
            DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "修改產品", "新增價格失敗，日期重複導致無法新增", DNA.UI.JQuery.DialogIcons.Error)
        Else
            DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "修改產品", "新增價格成功", DNA.UI.JQuery.DialogIcons.Info)
            productPriceGridView.DataBind()
        End If
    End Sub

#End Region

End Class