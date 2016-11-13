Imports System.Web.SessionState

Public Class Global_asax
    Inherits System.Web.HttpApplication

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        '在應用程式啟動時引發
        SystemSetting.initSystemValue(Application)
        '初始化各項數值
        Application("Copyright Notices") = "Copyright© " & Now.Year & " " & Application(SystemSetting.HeadTag & "hostname") & " All Rights Reserved."
        Application("onlineUserCount") = 0
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' 在工作階段啟動時引發
        Session.Timeout = Application(SystemSetting.HeadTag & "sessionTimeOut")
        '更新人數
        Dim SqlStr As String = _
            " PARAMETERS [value] Text ( 255 );" & _
            " UPDATE 系統參數 SET 系統參數.值 = [value]" & _
            " WHERE (((系統參數.變數名稱)=""visits""));"
        Application("sys_visits") = CInt(Application(SystemSetting.HeadTag & "visits")) + 1
        Dim result As Integer = dbModule.queryData(SystemSetting.DbConnStr, _
                          dataReadarEnum.ExecuteReader, _
                          SqlStr, _
                          New String() {"value"}, _
                          New String() {Application(SystemSetting.HeadTag & "visits")}, _
                          New System.Data.OleDb.OleDbType() {OleDb.OleDbType.VarChar})
        Application("onlineUserCount") += 1
    End Sub

    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' 在每個要求開頭引發
    End Sub

    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' 在一開始嘗試驗證使用時引發
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' 在錯誤發生時引發
        'Dim ex As Exception = Server.GetLastError '取得Exception錯誤
        Try
            'Response.Redirect("~/Error/?Reason=" & Server.UrlEncode(ex.Message))
            'Server.ClearError()
        Catch ex2 As Exception

        End Try
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' 在工作階段結束時引發
        Application("onlineUserCount") -= 1
        Session.Abandon()
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' 在應用程式結束時引發
    End Sub

End Class