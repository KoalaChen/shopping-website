Public Partial Class product
    Inherits System.Web.UI.Page
    Implements System.Web.UI.ICallbackEventHandler

    Private Sub product_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit
        If Request.QueryString("id") Is Nothing Then
            Dim url As String = Application(SystemSetting.HeadTag & "defaultUrl")
            Response.Redirect(ResolveUrl(Application(SystemSetting.HeadTag & "defaultUrl")))
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cbReference As String    '-- 返回前端（Client端）的結果、回傳值
        cbReference = Page.ClientScript.GetCallbackEventReference(Me, "arg", "ReceiveServerData", "context")

        Dim callbackScript As String = ""    '--前端（Client端）的function
        callbackScript &= "function CallServer(arg, context) { " & cbReference & "} ;"
        Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "CallServer", callbackScript, True)

    End Sub

    Protected Sub productFormView_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles productFormView.ItemCommand
        If e.CommandName = "addToCart" Then
            If Session("Product_" & e.CommandArgument) Is Nothing Then
                Session("Product_" & e.CommandArgument) = 1
            Else
                Session("Product_" & e.CommandArgument) = CInt(Session("Product_" & e.CommandArgument)) + 1
            End If
        End If
    End Sub

    Protected tempPrice As Int32 = Nothing

    Public Function GetCallbackResult() As String Implements System.Web.UI.ICallbackEventHandler.GetCallbackResult

        Return tempPrice
    End Function

    Public Sub RaiseCallbackEvent(ByVal eventArgument As String) Implements System.Web.UI.ICallbackEventHandler.RaiseCallbackEvent
        Dim sqlStr As New StringBuilder
        sqlStr.Append(" SELECT " & vbNewLine & _
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
                        "產品 " & vbNewLine & _
                        " where 產品.id=" & Request.QueryString("id") & ";")

        tempPrice = queryData(SystemSetting.DbConnStr, dataReadarEnum.ExecuteScalar, sqlStr.ToString)
        If Session("Product_" & Request.QueryString("id")) Is Nothing Then
            Session("Product_" & Request.QueryString("id")) = 1
        Else
            Session("Product_" & Request.QueryString("id")) += 1
        End If

        Session("cartProdcutCount") += 1
        Session("cartTotalCost") += tempPrice
    End Sub
End Class