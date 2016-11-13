<%
    If Session("member_RoleName") Is Nothing Then
        Response.Redirect(ResolveClientUrl("~/Public/login.aspx") & "?url=" & Request.Url.AbsoluteUri)
    ElseIf Not Session("member_RoleName") = "管理人員" Then
        Response.Redirect(ResolveClientUrl("~/Error/") & "?reason=您沒有權限進入管理中心。")
    End If
%>