Module dbModule

    Public Function queryData(ByRef ConnStr As ConnectionStringSettings, _
                             ByVal Mode As dataReadarEnum, _
                             ByRef Sql As String, _
                             Optional ByVal ParametersId() As String = Nothing, _
                             Optional ByVal ParametersValue() As String = Nothing, _
                             Optional ByVal type() As System.Data.OleDb.OleDbType = Nothing)
        Using Conn As New OleDb.OleDbConnection(ConnStr.ConnectionString)
            Dim Cmd As New OleDb.OleDbCommand(Sql, Conn)
            Conn.Open()
            If Not ParametersId Is Nothing Then
                For i As Int16 = 0 To ParametersId.Count - 1
                    Dim parameter As OleDb.OleDbParameter = Cmd.Parameters.Add( _
                    ParametersId(i), _
                    type(i))
                    parameter.Value = ParametersValue(i)
                Next
            End If
            If Mode = dataReadarEnum.ExecuteScalar Then
                Return Cmd.ExecuteScalar '傳回一個值
            ElseIf Mode = dataReadarEnum.ExecuteReader Then
                Dim Reader As OleDb.OleDbDataReader
                Reader = Cmd.ExecuteReader
                If Reader.HasRows Then
                    '讀資料
                    Return oledbDataReaderToDataTable(Reader)
                End If
                Conn.Close() '關閉連接
            ElseIf Mode = dataReadarEnum.ExecuteNonQuery Then
                Return Cmd.ExecuteNonQuery
            End If
        End Using
        Return Nothing
    End Function '讀資料

    Public Function queryMultiData(ByRef ConnStr As ConnectionStringSettings, _
                             ByRef Sql As String, _
                             ByVal ParametersId() As String, _
                             ByVal ParametersValue() As String, _
                             ByVal sqlExecTimes As Int16) As Int32
        Using connection As New OleDb.OleDbConnection(ConnStr.ConnectionString)
            connection.Open()
            Dim Transaction As OleDb.OleDbTransaction = connection.BeginTransaction '開始交易程序，不能平行處理(同一次只能進行一次Transaction
            Using command As New OleDb.OleDbCommand(Sql, connection)
                Dim result As Int32 = Nothing
                command.Transaction = Transaction '必要，這次的Transaction由OleDb.OleDbTransaction提供
                For times As Int32 = 0 To sqlExecTimes - 1
                    For index As Int16 = 0 To (ParametersId.Count / sqlExecTimes) - 1
                        command.Parameters.AddWithValue(ParametersId(2 * times + index), ParametersValue(2 * times + index))
                    Next
                    result += command.ExecuteNonQuery()
                    command.Parameters.Clear()
                Next
                Return result
            End Using
            connection.Close() '關閉連接
        End Using
        Return Nothing
    End Function '讀資料

    Function oledbDataReaderToDataTable(ByRef reader As OleDb.OleDbDataReader) As DataTable
        Dim a As New DataSet
        '讀資料
        Dim newTable As New DataTable() '資料表
        Dim col As DataColumn '直欄
        Dim row As DataRow '橫列
        For columnIndex As Integer = 0 To reader.FieldCount - 1
            col = New DataColumn()
            col.ColumnName = reader.GetName(columnIndex)
            col.DataType = reader.GetFieldType(columnIndex)
            newTable.Columns.Add(col)
        Next '建立 直欄

        While reader.Read
            row = newTable.NewRow()
            For i = 0 To reader.FieldCount - 1
                row(i) = reader.Item(i)
            Next
            newTable.Rows.Add(row)
        End While '依序讀取資料列
        Return newTable
    End Function
End Module
