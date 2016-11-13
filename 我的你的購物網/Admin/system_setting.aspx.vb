Public Partial Class system_setting
    Inherits System.Web.UI.Page

    Protected Sub payDetailsView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles payDetailsView.ItemUpdated
        payGridView.DataBind()
    End Sub

    Protected Sub payDetailsView_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles payDetailsView.ItemInserted
        payGridView.DataBind()
    End Sub

    Protected Sub payDetailsView_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles payDetailsView.ItemDeleted
        payGridView.DataBind()
    End Sub

    Protected Sub getDetailsView_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles getDetailsView.ItemDeleted
        getGridView.DataBind()
    End Sub

    Protected Sub getDetailsView_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles getDetailsView.ItemInserted
        getGridView.DataBind()
    End Sub

    Protected Sub getDetailsView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles getDetailsView.ItemUpdated
        getGridView.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
    End Sub

    Private Sub system_setting_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        Dim sqlStr As String = " SELECT 中文名稱, 變數名稱, 值 FROM 系統參數"
        Dim sysValue As DataTable = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteReader, sqlStr)
        '文字
        hostname.Text = sysValue(0).Item("中文名稱")
        logoUrl.Text = sysValue(1).Item("中文名稱")
        imageFolderUrl.Text = sysValue(2).Item("中文名稱")
        enableMaintenance.Text = sysValue(3).Item("中文名稱")
        maintenanceNotice.Text = sysValue(4).Item("中文名稱")
        enableTransactions.Text = sysValue(5).Item("中文名稱")
        transactionsNotice.Text = sysValue(6).Item("中文名稱")
        defaultUrl.Text = sysValue(7).Item("中文名稱")
        regTryTimes.Text = sysValue(8).Item("中文名稱")
        enableRegTry.Text = sysValue(9).Item("中文名稱")
        lockFailRegTryTime.Text = sysValue(10).Item("中文名稱")
        loginTryTimes.Text = sysValue(11).Item("中文名稱")
        sessionTimeOut.Text = sysValue(12).Item("中文名稱")
        visits.Text = sysValue(13).Item("中文名稱")
        NoProductImg.Text = sysValue(14).Item("中文名稱")
        '值
        hostnameValueTextBox.Text = sysValue(0).Item("值")
        logoUrlValueTextBox.Text = sysValue(1).Item("值")
        imageFolderUrlValueTextBox.Text = sysValue(2).Item("值")
        enableMaintenanceValueRadioButtonList.Items(If(CBool(sysValue(3).Item("值")), 0, 1)).Selected = True
        Try
            maintenanceNoticeValueTextBox.Text = sysValue(4).Item("值")
        Catch ex As Exception

        End Try
        enableTransactionsRadioButtonList.Items(If(CBool(sysValue(5).Item("值")), 0, 1)).Selected = True
        Try
            transactionsNoticeValueTextBox.Text = sysValue(6).Item("值")
        Catch ex As Exception

        End Try
        defaultUrlValueTextBox.Text = sysValue(7).Item("值")
        regTryTimesValueTextBox.Text = sysValue(8).Item("值")
        enableRegTryValueRadioButtonList.Items(If(CBool(sysValue(9).Item("值")), 0, 1)).Selected = True
        lockFailRegTryTimeValueTextBox.Text = sysValue(10).Item("值")
        loginTryTimesValueTextBox.Text = sysValue(11).Item("值")
        sessionTimeOutValueTextBox.Text = sysValue(12).Item("值")
        visitsValueTextBox.Text = sysValue(13).Item("值")
        NoProductImgValueTextBox.Text = sysValue(14).Item("值")
        'For rowIndex As Integer = 0 To sysValue.Rows.Count - 1
        '    Dim [label] As Label = CType(Page.FindControl(sysValue(rowIndex).Item("變數名稱")), Label)
        '    [label].Text = sysValue(rowIndex).Item("中文名稱")
        '    If sysValue(rowIndex).Item("變數名稱").ToString.ToLower.StartsWith("enable") Then
        '     CType(Page.FindControl(sysValue(rowIndex).Item("變數名稱") & "Value" & "RadioButtonList"), RadioButtonList).Items(If(CBool(sysValue(rowIndex).Item("值")), 0, 1)).Selected = True
        '     Else
        '    CType(Page.FindControl(sysValue(rowIndex).Item("變數名稱") & "Value" & "TextBox"), TextBox).Text = sysValue(rowIndex).Item("值")
        '    End If
        'Next
    End Sub

    Protected Sub sysValueButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles sysValueButton.Click
        Dim sqlStr As String = " PARAMETERS var Text ( 255 ), [value] Text ( 255 );" & vbNewLine & _
                               " UPDATE 系統參數" & _
                               " SET 值=[value]" & _
                               " WHERE 變數名稱=var;"
        '1
        queryData(SystemSetting.DbConnStr, _
                  dataReadarEnum.ExecuteNonQuery, sqlStr, _
                  New String() {"var", "value"}, New String() {"hostname", hostnameValueTextBox.Text}, _
                  New System.Data.OleDb.OleDbType() {OleDb.OleDbType.VarChar, OleDb.OleDbType.VarChar})
        '2
        queryData(SystemSetting.DbConnStr, _
                  dataReadarEnum.ExecuteNonQuery, sqlStr, _
                  New String() {"var", "value"}, New String() {"logoUrl", logoUrlValueTextBox.Text}, _
                  New System.Data.OleDb.OleDbType() {OleDb.OleDbType.VarChar, OleDb.OleDbType.VarChar})
        '3
        queryData(SystemSetting.DbConnStr, _
                  dataReadarEnum.ExecuteNonQuery, sqlStr, _
                  New String() {"var", "value"}, New String() {"imageFolderUrl", imageFolderUrlValueTextBox.Text}, _
                  New System.Data.OleDb.OleDbType() {OleDb.OleDbType.VarChar, OleDb.OleDbType.VarChar})
        '4
        queryData(SystemSetting.DbConnStr, _
                  dataReadarEnum.ExecuteNonQuery, sqlStr, _
                  New String() {"var", "value"}, New String() {"enableMaintenance", enableMaintenanceValueRadioButtonList.SelectedValue}, _
                  New System.Data.OleDb.OleDbType() {OleDb.OleDbType.VarChar, OleDb.OleDbType.VarChar})
        '5
        queryData(SystemSetting.DbConnStr, _
                  dataReadarEnum.ExecuteNonQuery, sqlStr, _
                  New String() {"var", "value"}, New String() {"maintenanceNotice", maintenanceNoticeValueTextBox.Text}, _
                  New System.Data.OleDb.OleDbType() {OleDb.OleDbType.VarChar, OleDb.OleDbType.VarChar})
        '6
        queryData(SystemSetting.DbConnStr, _
                  dataReadarEnum.ExecuteNonQuery, sqlStr, _
                  New String() {"var", "value"}, New String() {"enableTransactions", enableMaintenanceValueRadioButtonList.SelectedValue}, _
                  New System.Data.OleDb.OleDbType() {OleDb.OleDbType.VarChar, OleDb.OleDbType.VarChar})
        '7
        queryData(SystemSetting.DbConnStr, _
                  dataReadarEnum.ExecuteNonQuery, sqlStr, _
                  New String() {"var", "value"}, New String() {"transactionsNotice", transactionsNoticeValueTextBox.Text}, _
                  New System.Data.OleDb.OleDbType() {OleDb.OleDbType.VarChar, OleDb.OleDbType.VarChar})
        '8
        queryData(SystemSetting.DbConnStr, _
                  dataReadarEnum.ExecuteNonQuery, sqlStr, _
                  New String() {"var", "value"}, New String() {"defaultUrl", defaultUrlValueTextBox.Text}, _
                  New System.Data.OleDb.OleDbType() {OleDb.OleDbType.VarChar, OleDb.OleDbType.VarChar})
        '9
        queryData(SystemSetting.DbConnStr, _
                  dataReadarEnum.ExecuteNonQuery, sqlStr, _
                  New String() {"var", "value"}, New String() {"regTryTimes", regTryTimesValueTextBox.Text}, _
                  New System.Data.OleDb.OleDbType() {OleDb.OleDbType.VarChar, OleDb.OleDbType.VarChar})
        '10
        queryData(SystemSetting.DbConnStr, _
                  dataReadarEnum.ExecuteNonQuery, sqlStr, _
                  New String() {"var", "value"}, New String() {"enableRegTry", enableRegTryValueRadioButtonList.SelectedValue}, _
                  New System.Data.OleDb.OleDbType() {OleDb.OleDbType.VarChar, OleDb.OleDbType.VarChar})
        '11
        queryData(SystemSetting.DbConnStr, _
                  dataReadarEnum.ExecuteNonQuery, sqlStr, _
                  New String() {"var", "value"}, New String() {"lockFailRegTryTime", lockFailRegTryTimeValueTextBox.Text}, _
                  New System.Data.OleDb.OleDbType() {OleDb.OleDbType.VarChar, OleDb.OleDbType.VarChar})
        '12
        queryData(SystemSetting.DbConnStr, _
                  dataReadarEnum.ExecuteNonQuery, sqlStr, _
                  New String() {"var", "value"}, New String() {"loginTryTimes", loginTryTimesValueTextBox.Text}, _
                  New System.Data.OleDb.OleDbType() {OleDb.OleDbType.VarChar, OleDb.OleDbType.VarChar})
        '13
        queryData(SystemSetting.DbConnStr, _
                  dataReadarEnum.ExecuteNonQuery, sqlStr, _
                  New String() {"var", "value"}, New String() {"sessionTimeOut", sessionTimeOutValueTextBox.Text}, _
                  New System.Data.OleDb.OleDbType() {OleDb.OleDbType.VarChar, OleDb.OleDbType.VarChar})
        '14
        queryData(SystemSetting.DbConnStr, _
                  dataReadarEnum.ExecuteNonQuery, sqlStr, _
                  New String() {"var", "value"}, New String() {"visits", visitsValueTextBox.Text}, _
                  New System.Data.OleDb.OleDbType() {OleDb.OleDbType.VarChar, OleDb.OleDbType.VarChar})
        '14
        queryData(SystemSetting.DbConnStr, _
                  dataReadarEnum.ExecuteNonQuery, sqlStr, _
                  New String() {"var", "value"}, New String() {"NoProductImg", NoProductImgValueTextBox.Text}, _
                  New System.Data.OleDb.OleDbType() {OleDb.OleDbType.VarChar, OleDb.OleDbType.VarChar})
        DNA.UI.JQuery.Dialog.ShowModalDialog(Dialog1, "系統參數", "更新完成", DNA.UI.JQuery.DialogIcons.Info)
        initSystemValue(Application)
    End Sub
End Class