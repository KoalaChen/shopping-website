Module SystemSetting
    Dim AccessDbConnStr As ConnectionStringSettings = ConfigurationManager.ConnectionStrings("AccessDb") '資料庫連接字串
    Dim Preposition As String = "sys"
    Dim SeparatorField As Char = "_"
    Dim HeadTagField As String = Preposition & Separator

    ReadOnly Property HeadTag() As String
        Get
            Return HeadTagField
        End Get
    End Property

    ReadOnly Property Separator() As String
        Get
            Return SeparatorField
        End Get
    End Property

    Public Sub refreshApplication(ByRef application As System.Web.HttpApplicationState, Optional ByVal var As String = Nothing)
        application.Lock()
        Dim sqlStr As String = Nothing
        '更新Application所有的值
        If var.StartsWith("sys_") Then
            var.Replace("sys_", String.Empty)
            sqlStr = _
                " PARAMETERS var Text ( 255 ), [value] Text ( 255 );" & _
                " UPDATE 系統參數 SET 系統參數.值 =[value] " & _
                " WHERE (((系統參數.變數名稱)=var));"
            If var Is Nothing Then
                Dim id As New ArrayList, value As New ArrayList
                Dim sysVar As String() = Array.FindAll(application.AllKeys, AddressOf findSys)
                For Each varStr As String In sysVar
                    Dim Temp() As String = varStr.Split(Separator)
                    id.Add(Temp(1))
                    value.Add(application(varStr))
                Next
                queryMultiData(SystemSetting.DbConnStr, sqlStr, id.ToArray, value.ToArray, sysVar.Count)
            Else
                queryMultiData(SystemSetting.DbConnStr, sqlStr, New String() {var}, New String() {application(HeadTag & var)}, 1)
            End If
        End If
        Select Case var
            '產品統計
            Case "productCount"
                sqlStr = _
                   " SELECT Count([產品]![id]) AS 產品統計" & _
                   " FROM(產品)" & _
                   " WHERE (((產品.上架)=True));"
                application("productCount") = dbModule.queryData(SystemSetting.DbConnStr, _
                                              dataReadarEnum.ExecuteScalar, _
                                              sqlStr)
                '會員統計
            Case "memberCount"
                sqlStr = _
                   " SELECT Count([人員]![id]) AS 人員統計" & _
                   " FROM(人員);"
                application("memberCount") = dbModule.queryData(SystemSetting.DbConnStr, _
                                              dataReadarEnum.ExecuteScalar, _
                                              sqlStr)
                '最近公告
            Case "recent_notice"
                sqlStr = " SELECT 公告.id AS id, 公告.名稱" & _
                         " FROM(公告)" & _
                         " WHERE 公告.id=(" & _
                         "    SELECT Max(公告.id) AS id" & _
                         "    FROM 公告);"
                Dim tempTable As DataTable = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteReader, sqlStr)
                If tempTable Is Nothing Then
                    application("recent_notice") = "目前沒有任何公告"
                Else
                    application("recent_notice") = tempTable(0).Item("名稱")
                End If
        End Select
        application.UnLock()
    End Sub
    Private Function findSys(ByVal s As String) As Boolean
        If s.StartsWith(HeadTag) AndAlso s.Length > HeadTag.Length Then
            Return True
        Else
            Return False
        End If
    End Function '尋找系統參數

    Sub initSystemValue(ByRef application As System.Web.HttpApplicationState)
        '系統參數
        Dim SqlStr As String = _
            " SELECT 系統參數.id, 系統參數.中文名稱, 系統參數.變數名稱, 系統參數.值, 系統參數.限制規則, 系統參數.錯誤訊息" & _
            " FROM 系統參數;"
        Dim result As DataTable = dbModule.queryData(SystemSetting.DbConnStr, _
                                  dataReadarEnum.ExecuteReader, _
                                  SqlStr)
        If result Is Nothing Then
            Throw New NullReferenceException
        Else
            For index As Integer = 0 To result.Rows.Count - 1
                application.Add(HeadTag & result(index).Item("變數名稱"), result(index).Item("值"))
            Next
        End If
        '產品統計
        SqlStr = _
           " SELECT Count([產品]![id]) AS 產品統計" & _
           " FROM(產品)" & _
           " WHERE (((產品.上架)=True));"
        application("productCount") = dbModule.queryData(SystemSetting.DbConnStr, _
                                      dataReadarEnum.ExecuteScalar, _
                                      SqlStr)
        '會員統計
        SqlStr = _
           " SELECT Count([人員]![id]) AS 人員統計" & _
           " FROM(人員);"
        application("memberCount") = dbModule.queryData(SystemSetting.DbConnStr, _
                                      dataReadarEnum.ExecuteScalar, _
                                      SqlStr)
        '最近公告
        SqlStr = " SELECT 公告.id AS id, 公告.名稱" & _
                 " FROM(公告)" & _
                 " WHERE 公告.id=(" & _
                 "    SELECT Max(公告.id) AS id" & _
                 "    FROM 公告);"
        Dim tempTable As DataTable = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteReader, SqlStr)
        If tempTable Is Nothing Then
            application("recent_notice") = "目前沒有任何公告"
        Else
            application("recent_notice") = tempTable(0).Item("名稱")
        End If

    End Sub '初始化系統參數


    ReadOnly Property DbConnStr() As ConnectionStringSettings
        Get
            Return AccessDbConnStr
        End Get
    End Property
End Module
