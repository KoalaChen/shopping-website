<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Member/MemberSite.Master" CodeBehind="member_level.aspx.vb" Inherits="我的你的購物網.member_level" 
    title="我的等級" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <!--#INCLUDE FILE="IsMember.aspx"-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>會員等級</h3>
    <asp:Panel ID="nowMemberIdentityPanel" runat="server">
        您目前的等級為<asp:Label ID="nowMemberIdentityLabel" runat="server" Text=""></asp:Label><br />
        效果：<asp:Label ID="nowCostEffectLabel" runat="server" Text=""></asp:Label><br />
        <br />
        會員等級比較表<br />
        <asp:Label ID="CompareTableLabel" runat="server"></asp:Label>
        <br />
        <br />
        <br />
    </asp:Panel>
    
</asp:Content>
