<%@ Page Title="本站公告" Language="vb" AutoEventWireup="false" MasterPageFile="~/MainSite.Master" CodeBehind="notice.aspx.vb" Inherits="我的你的購物網.notice1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .width80
        {
        	border-collapse: collapse;
        	border-color:#808080;
        	width:80%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="text-align:center">&nbsp;公告</h2>
    <div align="center" style="width:80%">
        <asp:ListView ID="notiveListView" runat="server" DataKeyNames="id" 
            DataSourceID="totalNoticeDataSource">
            <ItemTemplate>
                <table style="width:100%">
                    <tr>
                        <td style="background-color: #FFCC00">
                            <p style="display:inline; float:left; margin-left:0px; margin-top: 0pt; margin-bottom: 0pt;">
                                &nbsp;</p>
                            <p style="display:inline; float:left; margin-left:0px; margin-top: 0pt; margin-bottom: 0pt;">
                                <asp:Label ID="名稱Label" runat="server" style="text-align: left" 
                                    Text='<%# Bind("名稱") %>' />
                            </p>
                            <p style="display:inline; float:right; margin-left:0px; margin-top: 0pt; margin-bottom: 0pt;">
                            <asp:Label ID="Label1" runat="server" 
                                Text='<%# Bind("發佈日期時間", "{0:g} [發佈]") %>' />
                            <asp:Label ID="Label2" runat="server" 
                                Text='<%# Bind("修改日期時間", "｜{0:g} [修改]") %>' />
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="內容Label" runat="server" Text='<%# Bind("內容") %>' />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <table style="width:100%">
                    <tr>
                        <td style="background-color: #FFCC00">
                            <p style="display:inline; float:left; margin-left:0px; margin-top: 0pt; margin-bottom: 0pt;">
                                &nbsp;</p>
                            <p style="display:inline; float:left; margin-left:0px; margin-top: 0pt; margin-bottom: 0pt;">
                                <asp:Label ID="名稱Label" runat="server" style="text-align: left" 
                                    Text='<%# Bind("名稱") %>' />
                            </p>
                            <p style="display:inline; float:right; margin-left:0px; margin-top: 0pt; margin-bottom: 0pt;">
                            <asp:Label ID="Label1" runat="server" 
                                Text='<%# Bind("發佈日期時間", "{0:g} [發佈]") %>' />
                            <asp:Label ID="Label2" runat="server" 
                                Text='<%# Bind("修改日期時間", "｜{0:g} [修改]") %>' />
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="內容Label" runat="server" Text='<%# Bind("內容") %>' />
                        </td>
                    </tr>
                </table>
            </AlternatingItemTemplate>
            <EmptyDataTemplate>
                目前沒有任何公告。
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <li style="">名稱:
                    <asp:TextBox ID="名稱TextBox" runat="server" Text='<%# Bind("名稱") %>' />
                    <br />
                    內容:
                    <asp:TextBox ID="內容TextBox" runat="server" Text='<%# Bind("內容") %>' />
                    <br />
                    發佈日期時間:
                    <asp:TextBox ID="發佈日期時間TextBox" runat="server" Text='<%# Bind("發佈日期時間") %>' />
                    <br />
                    修改日期時間:
                    <asp:TextBox ID="修改日期時間TextBox" runat="server" Text='<%# Bind("修改日期時間") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                </li>
            </InsertItemTemplate>
            <LayoutTemplate>
                <ul ID="itemPlaceholderContainer" runat="server" 
                    style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <li ID="itemPlaceholder" runat="server" />
                    </ul>
                    <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </LayoutTemplate>
                <EditItemTemplate>
                    <li style="background-color: #FFCC66;color: #000080;">id:
                        <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                        <br />
                        名稱:
                        <asp:TextBox ID="名稱TextBox" runat="server" Text='<%# Bind("名稱") %>' />
                        <br />
                        內容:
                        <asp:TextBox ID="內容TextBox" runat="server" Text='<%# Bind("內容") %>' />
                        <br />
                        發佈日期時間:
                        <asp:TextBox ID="發佈日期時間TextBox" runat="server" Text='<%# Bind("發佈日期時間") %>' />
                        <br />
                        修改日期時間:
                        <asp:TextBox ID="修改日期時間TextBox" runat="server" Text='<%# Bind("修改日期時間") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                    </li>
                </EditItemTemplate>
                <ItemSeparatorTemplate>
                    <br />
                </ItemSeparatorTemplate>
                <SelectedItemTemplate>
                    <li style="background-color: #FFCC66;font-weight: bold;color: #000080;">id:
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        <br />
                        名稱:
                        <asp:Label ID="名稱Label" runat="server" Text='<%# Eval("名稱") %>' />
                        <br />
                        內容:
                        <asp:Label ID="內容Label" runat="server" Text='<%# Eval("內容") %>' />
                        <br />
                        發佈日期時間:
                        <asp:Label ID="發佈日期時間Label" runat="server" Text='<%# Eval("發佈日期時間") %>' />
                        <br />
                        修改日期時間:
                        <asp:Label ID="修改日期時間Label" runat="server" Text='<%# Eval("修改日期時間") %>' />
                        <br />
                    </li>
                </SelectedItemTemplate>
            </asp:ListView>
    </div>
    <asp:AccessDataSource ID="totalNoticeDataSource" runat="server" 
        DataFile="~/App_Data/MainDatabase.mdb" 
        SelectCommand="SELECT * FROM [公告] ORDER BY [發佈日期時間] DESC">
    </asp:AccessDataSource>
</asp:Content>
