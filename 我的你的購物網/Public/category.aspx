<%@ Page Title="分類" Language="vb" AutoEventWireup="false" MasterPageFile="~/MainSite.Master" CodeBehind="category.aspx.vb" Inherits="我的你的購物網.category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
            .imageResize
            {
            	width:150px;
            }
        
            </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="bulletinPanel" runat="server">
        <div class="ui-widget">
	        <div style="margin-top: 0px; padding: 0pt 0.7em;" class="ui-state-highlight ui-corner-all">
		        <p>
			        <span style="float: left; margin-right: 0.3em;" class="ui-icon ui-icon-info"></span>
			        公告:<asp:LinkButton ID="noticeLinkButton" runat="server" ForeColor="#0066FF" 
                        PostBackUrl="~/Public/notice.aspx">目前沒有</asp:LinkButton>
		        </p>
	        </div>
        </div>
    </asp:Panel>
    <div align="center">
    <asp:ListView ID="allProductListView" runat="server" 
            DataSourceID="allProductAccessDataSource" GroupItemCount="3">
            <EmptyItemTemplate>
                <td id="Td1" runat="server" />
                </EmptyItemTemplate>
                <ItemTemplate>
                    <td id="Td2" runat="server" style="">
                        <table>
                            <tr>
                                <td class="style2" rowspan="3">
                                    <asp:Image ID="Image1" runat="server" CssClass="imageResize" 
                                        ImageUrl='<%# Eval("主照片", "../images/product/{0}") %>' />
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
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <td id="Td3" runat="server" style="">
                        <table>
                            <tr>
                                <td rowspan="3">
                                    <asp:Image ID="Image1" runat="server" CssClass="imageResize" 
                                        ImageUrl='<%# Eval("主照片", "../images/product/{0}") %>' />
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
                                    <span>元</span></td>
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
                    <table id="Table1" runat="server" style="">
                        <tr>
                            <td>
                                抱歉，該目錄下沒有查詢到任何商品。</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <td id="Td4" runat="server" style="">
                        名稱:
                        <asp:TextBox ID="名稱TextBox" runat="server" Text='<%# Bind("名稱") %>' />
                        <br />
                        照片:
                        <asp:TextBox ID="照片檔名TextBox" runat="server" Text='<%# Bind("主照片") %>' />
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
                    <table id="Table2" runat="server">
                        <tr id="Tr1" runat="server">
                            <td id="Td5" runat="server">
                                <table ID="groupPlaceholderContainer" runat="server" border="0" style="">
                                    <tr ID="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr2" runat="server">
                            <td id="Td6" runat="server">
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
                    <td id="Td7" runat="server" style="">
                        id:
                        <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                        <br />
                        名稱:
                        <asp:TextBox ID="名稱TextBox" runat="server" Text='<%# Bind("名稱") %>' />
                        <br />
                        照片:
                        <asp:TextBox ID="照片檔名TextBox" runat="server" Text='<%# Bind("主照片") %>' />
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
                    <td id="Td8" runat="server" style=" background-color: Yellow;">
                        <table>
                            <tr>
                                <td rowspan="3">
                                    <asp:Image ID="Image1" runat="server" CssClass="imageResize" 
                                        ImageUrl='<%# Eval("主照片", "images/product/{0}") %>' />
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
                                    <span>元</span></td>
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
            DataFile="~/App_Data/MainDatabase.mdb" SelectCommand="
            SELECT 產品.id, 分類.分類名稱, 產品.名稱, 產品.內容, 主照片, 產品.上架,
            (
	            SELECT 售價.價格
	            FROM 售價
	            WHERE 售價.設定起始日期=
	            (
		            SELECT Max(售價.設定起始日期) AS 設定起始日期之最大值
		            FROM 售價
                    WHERE 售價.[產品id]=產品.id AND 售價.設定起始日期&lt;=now();
	            )
	            AND 產品id=產品.id;
            )
            AS 價格之最大值
            FROM 
            (
                產品 INNER JOIN 分類 ON 產品.分類id = 分類.id
            )
            Where 產品.分類id=?;
            ">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="?" QueryStringField="id" />
            </SelectParameters>
        </asp:AccessDataSource>
    </p>
</asp:Content>
