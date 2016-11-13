<%@ Page Title=""
        Language="vb"
        AutoEventWireup="false" 
        MasterPageFile="~/MainSite.Master" 
        CodeBehind="Default.aspx.vb" 
        Inherits="我的你的購物網.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .imageResize
        {
    	    width:150px;
        }
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 60px;
        }
        .style3
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ui-widget">
        <div style="margin-top: 0px; padding: 0pt 0.7em;" class="ui-state-highlight ui-corner-all">
	        <p>
		        <span style="float: left; margin-right: 0.3em;" class="ui-icon ui-icon-info"></span>
		        公告:
	            <asp:HyperLink ID="noticeHyperLink" runat="server" navigateUrl="~/Public/notice.aspx">目前沒有</asp:HyperLink>
	        </p>
        </div>
    </div>
    <div align="center">
    <asp:ListView ID="allProductListView" runat="server" 
            DataSourceID="allProductAccessDataSource" GroupItemCount="3">
            <EmptyItemTemplate>
                <td runat="server" />
                </EmptyItemTemplate>
                <ItemTemplate>
                    <td runat="server" style="">
                        <table class="style1">
                            <tr>
                                <td class="style2" rowspan="3">
                                    <asp:Image ID="Image1" runat="server" CssClass="imageResize" 
                                        ImageUrl='<%# Eval("主照片", "images/product/{0}") %>' />
                                </td>
                                <td>
                                    (<i>#<asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                    </i>)<asp:HyperLink ID="HyperLink1" runat="server" 
                                        NavigateUrl='<%# Eval("id", "~/public/product.aspx?id={0}") %>' 
                                        Text='<%# Eval("名稱", "{0}") %>'></asp:HyperLink>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="價格之最大值Label" runat="server" 
                                        style="font-weight: 700; color: #FF0000" Text='<%# Eval("價格之最大值") %>'></asp:Label>
                                    <span class="style3">元</span></td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="margin-left:auto;margin-right:auto;width:100%;">
                                        <asp:Button ID="detailButton" runat="server" 
                                            PostBackUrl='<%# Eval("id", "~/Public/product.aspx?id={0}") %>' 
                                            Text="詳細內容" />
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <td runat="server" style="">
                        <table class="style1">
                            <tr>
                                <td class="style2" rowspan="3">
                                    <asp:Image ID="Image1" runat="server" CssClass="imageResize" 
                                        ImageUrl='<%# Eval("主照片", "images/product/{0}") %>' />
                                </td>
                                <td>
                                    (<i>#<asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                    </i>)<asp:Hyperlink ID="HyperLink1" runat="server" 
                                        NavigateUrl='<%# Eval("id", "~/public/product.aspx?id={0}") %>' 
                                        Text='<%# Eval("名稱", "{0}") %>'></asp:Hyperlink>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="價格之最大值Label" runat="server" 
                                        style="font-weight: 700; color: #FF0000" Text='<%# Eval("價格之最大值") %>'></asp:Label>
                                    <span class="style3">元</span></td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="margin-left:auto;margin-right:auto;width:100%;">
                                        <asp:Button ID="detailButton" runat="server" 
                                            PostBackUrl='<%# Eval("id", "~/Public/product.aspx?id={0}") %>' Text="詳細內容" />
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </AlternatingItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>
                                抱歉，我們正在建立商品資料。<br />
                                歡迎您下次來訪。</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <td runat="server" style="">
                        名稱:
                        <asp:TextBox ID="名稱TextBox" runat="server" Text='<%# Bind("名稱") %>' />
                        <br />
                        照片檔名:
                        <asp:TextBox ID="照片檔名TextBox" runat="server" Text='<%# Bind("照片檔名") %>' />
                        <br />
                        價格之最大值:
                        <asp:TextBox ID="價格之最大值TextBox" runat="server" Text='<%# Bind("價格之最大值") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                        <br />
                    </td>
                </InsertItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table ID="groupPlaceholderContainer" runat="server" border="0" style="">
                                    <tr ID="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <EditItemTemplate>
                    <td runat="server" style="">
                        id:
                        <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                        <br />
                        名稱:
                        <asp:TextBox ID="名稱TextBox" runat="server" Text='<%# Bind("名稱") %>' />
                        <br />
                        照片檔名:
                        <asp:TextBox ID="照片檔名TextBox" runat="server" Text='<%# Bind("照片檔名") %>' />
                        <br />
                        價格之最大值:
                        <asp:TextBox ID="價格之最大值TextBox" runat="server" Text='<%# Bind("價格之最大值") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                        <br />
                    </td>
                </EditItemTemplate>
                <GroupTemplate>
                    <tr ID="itemPlaceholderContainer" runat="server">
                        <td ID="itemPlaceholder" runat="server">
                        </td>
                    </tr>
                </GroupTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style=" background-color: Yellow;">
                        <table class="style1">
                            <tr>
                                <td class="style2" rowspan="3">
                                    <asp:Image ID="Image1" runat="server" CssClass="imageResize" 
                                        ImageUrl='<%# Eval("照片檔名", "images/product/{0}") %>' />
                                </td>
                                <td>
                                    (<i>#<asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                    </i>)<asp:LinkButton ID="LinkButton1" runat="server" 
                                        PostBackUrl='<%# Eval("id", "~/public/product.aspx?id={0}") %>' 
                                        Text='<%# Eval("名稱", "{0}") %>'></asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="價格之最大值Label" runat="server" 
                                        style="font-weight: 700; color: #FF0000" Text='<%# Eval("價格之最大值") %>'></asp:Label>
                                    <span class="style3">元</span></td>
                            </tr>
                            <tr>
                                <td>
                                    <div style="margin-left:auto;margin-right:auto;width:100%;">
                                        <asp:Button ID="detailButton" runat="server" 
                                            PostBackUrl='<%# Eval("id", "~/Public/product.aspx?id={0}") %>' Text="詳細內容" />
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </SelectedItemTemplate>
            </asp:ListView>
    </div>
    <p>
        <asp:AccessDataSource ID="allProductAccessDataSource" runat="server" 
            DataFile="~/App_Data/MainDatabase.mdb" 
            SelectCommand=
            "SELECT 產品.id, 產品.名稱, 主照片, 
            (
                SELECT 售價.價格
                FROM 售價
                WHERE 售價.設定起始日期=
                (
                    SELECT Max(售價.設定起始日期) AS 設定起始日期之最大值
                    FROM 售價
                    WHERE 售價.[產品id]=產品.id AND 售價.設定起始日期&lt;=now();
                )AND 產品id=產品.id
            )
             AS 價格之最大值
            FROM  產品 
            WHERE 產品.上架=True;"></asp:AccessDataSource>
    </p>
</asp:Content>
