<%@ Page Title="產品" Language="vb" AutoEventWireup="false" MasterPageFile="~/MainSite.Master" CodeBehind="product.aspx.vb" Inherits="我的你的購物網.product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .mainProduct
        {
            width: 90%;
        }
        .product_image
        {
            float: left;
            margin-left: 20px;
            margin-right: 40px;
            padding-bottom: 30px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="productUpdatePanel" runat="server">
        <ContentTemplate>
            <asp:FormView ID="productFormView" runat="server" 
        DataSourceID="productAccessDataSource" CssClass="mainProduct">
                <ItemTemplate>
                    <br />
                    &nbsp;<table align="center" style="width:70%">
                        <tr>
                            <td rowspan="6">
                                <asp:Image ID="Image1" runat="server" 
                            ImageUrl='<%# Eval("主照片", "../images/product/{0}") %>' />
                            </td>
                            <td>
                                <b>商品資料</b></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="名稱Label" runat="server" 
                                    style="color: #CC9900; font-weight: 700;" Text='<%# Bind("名稱") %>' />
                                <span>#</span><asp:Label ID="idLabel" runat="server" style="color: #FF9933" 
                                    Text='<%# Eval("id") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>
                                分類：<asp:Label ID="分類名稱Label" runat="server" 
                            style="text-align: left; " Text='<%# Eval("分類名稱") %>' />
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                價格：<asp:Label ID="priceLabel" runat="server" style="color: #FF0000" 
                            Text='<%# Bind("價格之最大值") %>' />
                                元</td>
                        </tr>
                        <tr>
                            <td>
                                <input id="addToMyCartButton" type="button" value="放到購物車" onclick="addToCart();" /></td>
                        </tr>
                    </table>
                    <b>
                    <br />
                    </b><br />
                    <table align="center" style="width:70%">
                        <tr>
                            <td>
                                <b>產品介紹</b></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="內容Label" runat="server" Text='<%# Bind("內容") %>' />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table align="center" style="width:70%">
                        <tr>
                            <td>
                                <b>售後服務</b></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="Image2" runat="server" 
                                    ImageUrl="~/Images/product/after_sales_service.jpg" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    &nbsp;
                    <br />
                </ItemTemplate>
                <EmptyDataTemplate>
                    抱歉，找不到該商品，請重試。
                </EmptyDataTemplate>
            </asp:FormView>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:AccessDataSource ID="productAccessDataSource" runat="server" 
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
        WHERE 產品.id=?;">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="?" QueryStringField="id" />
        </SelectParameters>
    </asp:AccessDataSource>
    <p>
        &nbsp;</p>
    <script src="../Js/jQuery-1.4.1.js" type="text/javascript"></script>
    <script src="../Js/jquery.blockUI.js" type="text/javascript"></script>
    <% Try %>
    <script type="text/javascript">
        function addToCart() {
            $.blockUI({
            message: '<h3></br>放入購物車中...</h3>'
            });
            setTimeout($.unblockUI, 1000);


            var product_id = $('#<%=productFormView.findControl("idLabel").ClientID %>').text();
            CallServer(product_id, "");
        }
        function ReceiveServerData(rValue) {
            $('#<%=Page.Master.FindControl("cartProductCountLabel").ClientID %>').text(
                Number($('#<%=Page.Master.FindControl("cartProductCountLabel").ClientID %>').text()) + 1);
            $('#<%=Page.Master.FindControl("cartTotalCostLabel").ClientID %>').text(
                Number($('#<%=Page.Master.FindControl("cartTotalCostLabel").ClientID %>').text() ) + Number(rValue));
        }
    </script>
    <%  Catch ex As Exception%>

    <% End Try %> 
</asp:Content>
