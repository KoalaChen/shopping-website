<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminSite.Master" CodeBehind="Default.aspx.vb" Inherits="我的你的購物網._Default" 
    title="管理介面" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <!--#INCLUDE FILE="IsAdmin.aspx"-->
    <style type="text/css">
    .style2
    {
        font-size: xx-large;
        font-weight: bold;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="style2">
                                        歡迎來到管理後台</p>
<p style="margin-left: 40px">
                                        請點選上面的連結進行操作</p>
</asp:Content>
