Public Partial Class category1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        insertCategoryResultDialog.AutoOpen = False
    End Sub

    Protected Sub newCategoryNameIsRepeatCustomValidator_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles newCategoryNameIsRepeatCustomValidator.ServerValidate
        Dim sqlStr As String = " SELECT 分類名稱" & _
                               " FROM 分類" & _
                               " WHERE 分類.分類名稱='" & args.Value.Trim & "';"
        Dim result As DataTable = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteReader, sqlStr)
        If Not result Is Nothing Then
            args.IsValid = False
        Else
            args.IsValid = True
        End If
    End Sub

    Protected Sub categoryGridView_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles categoryGridView.RowUpdating
        If e.OldValues("分類名稱") = e.OldValues("分類名稱") Then
            e.Cancel = False
            Exit Sub
        End If '更新名稱一樣，沒變
        Dim sqlStr As String = " SELECT 分類名稱" & _
                               " FROM 分類" & _
                               " WHERE 分類.分類名稱='" & e.NewValues("分類名稱") & "';"
        Dim result As DataTable = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteReader, sqlStr)
        If Not result Is Nothing Then
            e.Cancel = True
            updateCategoryNameIsRepeatCustomValidator.IsValid = False
        Else
            updateCategoryNameIsRepeatCustomValidator.IsValid = True
        End If
    End Sub

    Protected Sub addCategoryButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles addCategoryButton.Click
        Dim sqlStr As String = " INSERT INTO 分類(分類名稱)" & _
                       " VALUES ('" & newCategoryTextBox.Text & "');"
        Dim result As Integer = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteNonQuery, sqlStr)
        If result Then
            insertCategoryResultDialog.AutoOpen = True
            categoryGridView.DataBind()
        End If
        newCategoryTextBox.Text = String.Empty
    End Sub

    Protected Sub categoryGridView_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles categoryGridView.RowDeleting
        If e.Keys("id") = 1 Then
            delDefaultCategoryNameCustomValidator.IsValid = False
            e.Cancel = True
            Exit Sub
        Else
            delDefaultCategoryNameCustomValidator.IsValid = True
            e.Cancel = False
        End If
        Dim sqlStr As String = " SELECT Count(產品.id) AS 統計" & _
                       " FROM(產品)" & _
                       " GROUP BY 產品.分類id" & _
                       " HAVING 產品.分類id=" & e.Keys("id") & ";"
        Dim result As DataTable = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteReader, sqlStr)
        If Not result Is Nothing Then
            delCategoryNameCustomValidator.IsValid = False
            categoryGridView.SelectedIndex = e.RowIndex
            productGridView.DataBind()
            e.Cancel = True
        Else
            delCategoryNameCustomValidator.IsValid = True
            e.Cancel = False
        End If
    End Sub
End Class