<%@ Page Title="���~" Language="vb" AutoEventWireup="false" MasterPageFile="~/MainSite.Master" CodeBehind="product.aspx.vb" Inherits="�ڪ��A���ʪ���.product" %>

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
                            ImageUrl='<%# Eval("�D�Ӥ�", "../images/product/{0}") %>' />
                            </td>
                            <td>
                                <b>�ӫ~���</b></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="�W��Label" runat="server" 
                                    style="color: #CC9900; font-weight: 700;" Text='<%# Bind("�W��") %>' />
                                <span>#</span><asp:Label ID="idLabel" runat="server" style="color: #FF9933" 
                                    Text='<%# Eval("id") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>
                                �����G<asp:Label ID="�����W��Label" runat="server" 
                            style="text-align: left; " Text='<%# Eval("�����W��") %>' />
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ����G<asp:Label ID="priceLabel" runat="server" style="color: #FF0000" 
                            Text='<%# Bind("���椧�̤j��") %>' />
                                ��</td>
                        </tr>
                        <tr>
                            <td>
                                <input id="addToMyCartButton" type="button" value="����ʪ���" onclick="addToCart();" /></td>
                        </tr>
                    </table>
                    <b>
                    <br />
                    </b><br />
                    <table align="center" style="width:70%">
                        <tr>
                            <td>
                                <b>���~����</b></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="���eLabel" runat="server" Text='<%# Bind("���e") %>' />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table align="center" style="width:70%">
                        <tr>
                            <td>
                                <b>���A��</b></td>
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
                    ��p�A�䤣��Ӱӫ~�A�Э��աC
                </EmptyDataTemplate>
            </asp:FormView>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:AccessDataSource ID="productAccessDataSource" runat="server" 
        DataFile="~/App_Data/MainDatabase.mdb" SelectCommand="
        SELECT ���~.id, ����.�����W��, ���~.�W��, ���~.���e, �D�Ӥ�, ���~.�W�[,
        (
	        SELECT ���.����
	        FROM ���
	        WHERE ���.�]�w�_�l���=
	        (
		        SELECT Max(���.�]�w�_�l���) AS �]�w�_�l������̤j��
		        FROM ���
                WHERE ���.[���~id]=���~.id AND ���.�]�w�_�l���&lt;=now();
	        )
	        AND ���~id=���~.id;
        )
        AS ���椧�̤j��
        FROM 
        (
            ���~ INNER JOIN ���� ON ���~.����id = ����.id
        )
        WHERE ���~.id=?;">
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
            message: '<h3></br>��J�ʪ�����...</h3>'
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
