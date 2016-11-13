Imports System.Collections.Specialized
Partial Public Class logout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim productId As New NameValueCollection
        'Dim cartTotalCost, cartProdcutCount As Double
        '讀取所有Session(中使用者選擇的產品)
        'For Each CItem As String In Session
        ' If CItem.StartsWith("Product_") Then
        'Dim TempStrArray() As String = CItem.Split("_")
        'productId.Add("Product_" & TempStrArray(1), Session("Product_" & TempStrArray(1)))
        'End If
        'Next
        'cartTotalCost = Session("cartTotalCost")
        'cartProdcutCount = Session("cartProdcutCount")
        'Session.Clear() '取消該工作階段
        'Session("cartTotalCost") = 0
        'Session("cartProdcutCount") = 0
        'For Each key As String In productId.AllKeys
        'Session(key) = productId.GetValues(key)(0)
        'Next
        Session.Abandon()
        Response.Redirect(ResolveClientUrl(Application(SystemSetting.HeadTag & "defaultUrl")))
    End Sub

End Class