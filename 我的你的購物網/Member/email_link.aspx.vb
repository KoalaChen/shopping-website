Public Partial Class email_link
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        successDialog.AutoOpen = False
        addFailDialog.AutoOpen = False
    End Sub

    Protected Sub newEMailCustomValidator_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles newEMailCustomValidator.ServerValidate
        args.IsValid = Not AuthModule.DataIsRepeat(ConfigurationManager.ConnectionStrings("AccessDb"), _
                          " SELECT Count(電子郵件.id) AS id之計數 " & _
                          " FROM(電子郵件) " & _
                          " GROUP BY 電子郵件.電子郵件 " & _
                          " HAVING (((電子郵件.電子郵件)=""" & newEmailTextBox.Text.Trim & """));")
    End Sub

    Protected Sub addNewEmailButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles addNewEmailButton.Click
        If Page.IsValid Then
            Using Connection As New System.Data.OleDb.OleDbConnection(SystemSetting.DbConnStr.ConnectionString)
                Connection.Open()
                Dim sqlStr As String = " INSERT INTO 電子郵件(人員id, 電子郵件)" & _
                                       " VALUES(" & Session("member_Id") & ",'" & newEmailTextBox.Text & "')"
                Dim command As New System.Data.OleDb.OleDbCommand(sqlStr, Connection)
                Dim result As Integer = command.ExecuteNonQuery()
                newEmailTextBox.Text = String.Empty
                If result Then
                    successDialog.AutoOpen = True
                Else
                    addFailDialog.AutoOpen = True
                End If
            End Using
            setDefaultGridView.DataBind()
            defaultGridView.DataBind()
            deleteEMailGridView.DataBind()
        End If
    End Sub

    Protected Sub setDefaultGridView_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles setDefaultGridView.RowCommand
        If e.CommandName = "setDefaultEmail" Then
            Dim sqlStr As String = _
            " SELECT 電子郵件.id" & _
            " FROM(電子郵件)" & _
            " WHERE (((電子郵件.電子郵件)='" & e.CommandArgument & "'));"
            Dim emailId As Integer = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteScalar, sqlStr)
            sqlStr = _
            " UPDATE 人員" & _
            " SET 主要郵件id=" & emailId & _
            " WHERE id=" & Session("member_Id") & ";"
            Dim result As Integer = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteNonQuery, sqlStr)
            setDefaultGridView.DataBind()
            defaultGridView.DataBind()
            deleteEMailGridView.DataBind()
        End If
    End Sub

    Protected Sub deleteEMailGridView_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles deleteEMailGridView.RowCommand
        If e.CommandName = "DelEmail" Then
            Dim sqlStr As String = _
            " DELETE FROM 電子郵件" & _
            " WHERE 電子郵件='" & e.CommandArgument & "';"
            Dim result As Integer = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteNonQuery, sqlStr)
            setDefaultGridView.DataBind()
            defaultGridView.DataBind()
            deleteEMailGridView.DataBind()
        End If
    End Sub
End Class