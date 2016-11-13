Module AuthModule
    Public Function IdentificationCheck(ByVal Id As String)
        Dim Eng As String = "ABCDEFGHJKLMNPQRSTUVXYWZIO"
        Dim IntStart As Byte = 10
        Dim EngInt As Byte = IntStart + Eng.IndexOf(Id(0))

        Id = Id.ToUpper
        If Id.Length <> 10 Then
            Return False
        ElseIf Id(1).ToString >= 3 Then
            Return False
        ElseIf ((EngInt \ 10) + _
               (EngInt Mod 10) * 9 + _
               Id(1).ToString * 8 + _
               Id(2).ToString * 7 + _
               Id(3).ToString * 6 + _
               Id(4).ToString * 5 + _
               Id(5).ToString * 4 + _
               Id(6).ToString * 3 + _
               Id(7).ToString * 2 + _
               Id(8).ToString * 1 + _
               Id(9).ToString) Mod 10 = 0 Then
            Return True
        Else
            Return False
        End If
    End Function '檢查身份証字號

    Public Function DataIsRepeat(ByVal Setting As ConnectionStringSettings, ByVal sql As String) As Boolean
        Dim Conn As New OleDb.OleDbConnection(Setting.ConnectionString)
        Dim Cmd As New OleDb.OleDbCommand(sql, Conn)
        Conn.Open() '開啟資料庫連接
        Return CBool(Cmd.ExecuteScalar)
        Conn.Close()
    End Function '檢查資料是否重複

    Public Function GetUserInfo(ByVal Id As String, ByVal Password As String)
        Dim Sql As String = _
        " PARAMETERS id Text ( 255 ), pw Text ( 255 );" & _
        " SELECT 人員.id AS 會員id, 人員.姓名 AS 會員姓名, 角色.id AS 角色id, 角色.名稱 AS 角色名稱, 會員等級.id AS 會員等級id, 會員等級.名稱 AS 會員等級名稱" & vbNewLine & _
        " FROM 會員等級" & _
        " INNER JOIN (角色 INNER JOIN ((人員 INNER JOIN 人員_角色 ON 人員.id = 人員_角色.人員id)" & _
        " INNER JOIN 電子郵件 ON 人員.id = 電子郵件.人員id) ON 角色.id = 人員_角色.角色id) ON 會員等級.id = 人員.會員等級id" & _
        " WHERE (((電子郵件.電子郵件)=[Id]) AND ((人員.密碼)=[pw]));"
        Return dbModule.queryData(SystemSetting.DbConnStr, _
                        dataReadarEnum.ExecuteReader, _
                        Sql, _
                        New String() {"id", "pw"}, _
                        New String() {Id, Password}, _
                        New System.Data.OleDb.OleDbType() {OleDb.OleDbType.VarChar, OleDb.OleDbType.VarChar})
    End Function '讀取使用者資訊

End Module
