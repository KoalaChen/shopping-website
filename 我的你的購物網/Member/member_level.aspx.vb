Public Partial Class member_level
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Session("member_RoleLevelId") Is Nothing Then
            nowMemberIdentityLabel.Text = Session("member_roleLabelName")
            Dim sqlStr As String = " SELECT 會員等級.名稱 AS 會員的等級, 會員等級.折價規則 AS 折價的規則" & _
                                   " FROM   會員等級" & _
                                   " WHERE  會員等級.id=" & Session("member_RoleLevelId") & ";"
            Dim nowLevel As DataTable = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteReader, sqlStr)
            nowMemberIdentityLabel.Text = nowLevel.Rows(0).Item("會員的等級")
            nowCostEffectLabel.Text = If(nowLevel.Rows(0).Item("折價的規則") = "*1", "沒有", "打" & nowLevel.Rows(0).Item("折價的規則").ToString.Replace("*0.", String.Empty) & "折")
            sqlStr = " SELECT 會員等級.名稱 AS 會員的等級名稱, 會員等級.達到規則 AS 會員的達到規則, 會員等級.折價規則 AS 折價的規則" & _
                     " FROM 會員等級;"
            Dim nextLevel As DataTable = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteReader, sqlStr)
            Dim output As New StringBuilder
            output.AppendLine("<table border=""1"">")
            output.AppendLine("<tr>")
            output.AppendLine("<td></td>")
            output.AppendLine("<td>達到目標</td>")
            output.AppendLine("<td>價格優惠</td>")
            output.AppendLine("</tr>")
            For Each row As DataRow In nextLevel.Rows
                output.AppendLine("<tr>")
                output.AppendLine("<td>" & row.Item("會員的等級名稱") & "</td>")
                Dim tempStr() As String = row.Item("會員的達到規則").ToString.Split(",")
                output.AppendLine("<td>" & If(tempStr(0) = 0 AndAlso tempStr(1) = 0, _
                                              "沒有", "購買金額 >= " & tempStr(0) & " 元 或 購買次數>=" & tempStr(1) & " 次") & "</td>")
                output.AppendLine("<td>" & If(row.Item("折價的規則") = "*1", "沒有", "打" & row.Item("折價的規則").ToString.Replace("*0.", String.Empty) & " 折") & "</td>")
                output.AppendLine("</tr>")
            Next
            output.AppendLine("</table>")
            CompareTableLabel.Text = output.ToString
        End If

    End Sub

End Class