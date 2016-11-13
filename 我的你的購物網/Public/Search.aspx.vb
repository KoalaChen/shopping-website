Public Partial Class Search
    Inherits System.Web.UI.Page

    Private Sub Search_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not Request.QueryString("keyword") Is Nothing Then
            Dim key() As String = Request.QueryString("keyword").Trim.Replace("  ", " ").Replace(" ", ",").Split(",")
            Dim sqlStr As New StringBuilder
            sqlStr.Append(" SELECT 產品.id, 產品.名稱, 主照片," & vbNewLine & _
                            "(" & vbNewLine & _
                            " Select 售價.價格" & vbNewLine & _
                            "	FROM 售價" & vbNewLine & _
                            "	WHERE 售價.設定起始日期=" & vbNewLine & _
                            "	(" & vbNewLine & _
                            "		SELECT Max(售價.設定起始日期) AS 設定起始日期之最大值" & vbNewLine & _
                            "       FROM(售價)" & vbNewLine & _
                            "		WHERE 售價.[產品id]=產品.id AND 售價.設定起始日期<=now();" & vbNewLine & _
                            "	)" & vbNewLine & _
                            "	AND 產品id=產品.id;" & vbNewLine & _
                            ")" & vbNewLine & _
                            " AS 價格之最大值" & vbNewLine & _
                            "            FROM" & vbNewLine & _
                            "產品")

            sqlStr.Append(" WHERE ")
            keywordLabel.Text = String.Empty
            For i As Int16 = 0 To key.Count - 1
                sqlStr.Append(" 產品.名稱 Like '%" & key(i) & "%' AND ")
                keywordLabel.Text &= key(i) & "<br />"
            Next
            '很奇怪，Access裡查要用* 在ASP.NET是用一般的％
            sqlStr.Append(" 產品.上架 = True;")
            SearchAccessDataSource.SelectCommand = sqlStr.ToString
            allProductListView.DataBind()
            productCountLabel.Text = allProductListView.Items.Count
        End If
    End Sub

    Private Sub Search_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit
        If Request.QueryString("keyword") Is Nothing Then
            Dim url As String = Application(HeadTag & "defaultUrl")
            Response.Redirect(ResolveUrl(Application(HeadTag & "defaultUrl")))
        End If
    End Sub
End Class