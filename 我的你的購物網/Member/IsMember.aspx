<%'@ Page Language="vb" AutoEventWireup="false" CodeBehind="IsMember.aspx.vb" Inherits="我的你的購物網.IsMember" %>

<% 
    If Session("member_RoleName") Is Nothing Then
        Response.Redirect(ResolveUrl("~/Public/login.aspx") & "?url=" & Request.Url.AbsoluteUri)
    ElseIf Session("member_RoleName") = "帳號鎖定" Then
        Response.Redirect(ResolveUrl("~/Error/") & "?reason=帳號被系統管理員鎖定，如有疑問，請寄信洽詢。")
    End If
%>
