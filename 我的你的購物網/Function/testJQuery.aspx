<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="testJQuery.aspx.vb" Inherits="我的你的購物網.testJQuery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DropDownList ID="DropDownList1" runat="server" Height="16px" Width="164px">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
        </asp:DropDownList>
    
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    
        <asp:Button ID="Button1" runat="server" Text="Button" />
    
    </div>
    <script type="text/javascript" src="../Js/jquery-1.4.1.js" />
    <script type="text/javascript">
        $("#<%= Button1.ClientID %>").click(
            alert();
        )
    /*
        $('#<%= DropDownList1.ClientID %>  option:selected').live(
        "click dblclick keydown keypress keyup mousedown mousemove mouseout mouseover mouseup focus blur focusin focusout hover mouseenter mouseleave",
        function(event) {
        $('#<%= Label1.ClientID %>').html(event.type)
    })*/
    </script>
    </form>
</body>
</html>
