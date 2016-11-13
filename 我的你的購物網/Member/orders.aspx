<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Member/MemberSite.Master" CodeBehind="orders.aspx.vb" Inherits="我的你的購物網.orders" 
    title="訂單查詢" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <!--#INCLUDE FILE="IsMember.aspx"-->
    <style type="text/css">
        .style2
        {
            color: #FF9933;
            font-weight: bold;
        }
        .style3
        {
            color: #0066FF;
            font-weight: bold;
        }
        .style4
        {
            color: #FF0000;
        }
        .style5
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>您的訂單</h3>
    <asp:GridView ID="orderGridView" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="id" DataSourceID="orderAccessDataSource" 
        ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                SortExpression="id" />
            <asp:BoundField DataField="訂購日期時間" HeaderText="訂購日期時間" 
                SortExpression="訂購日期時間" />
            <asp:BoundField DataField="出貨日期時間" HeaderText="出貨日期時間" 
                SortExpression="出貨日期時間" NullDisplayText="(尚未出貨)" />
            <asp:BoundField DataField="顧客拿貨時間" HeaderText="顧客拿貨時間" 
                SortExpression="顧客拿貨時間" NullDisplayText="(尚未拿貨)" />
            <asp:BoundField DataField="目前狀態" HeaderText="目前狀態" SortExpression="目前狀態" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:AccessDataSource ID="orderAccessDataSource" runat="server" 
        DataFile="~/App_Data/MainDatabase.mdb" SelectCommand="SELECT 訂單.id, 訂單.訂購日期時間, 訂單.出貨日期時間, 訂單.顧客拿貨時間, 訂單狀態.目前狀態
FROM 訂單狀態 INNER JOIN 訂單 ON 訂單狀態.id = 訂單.訂單狀態id
WHERE (((訂單.會員帳號id)=?));">
        <SelectParameters>
            <asp:SessionParameter Name="?" SessionField="member_Id" />
        </SelectParameters>
    </asp:AccessDataSource>
    <table>
        <tr>
            <td class="style3">
                訂單詳細資料
            </td>
                    <td class="style2">
                                訂單下的產品</td>
        </tr>
        <tr>
            <td valign="top">
                <asp:DetailsView ID="orderShowAllDetailsView" runat="server" 
                    AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" 
                    DataSourceID="orderShowAllAccessDataSource" ForeColor="#333333" 
                    GridLines="None" Height="50px">
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        請先選擇上方的[訂單]。
                    </EmptyDataTemplate>
                    <Fields>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                            ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="訂購日期時間" HeaderText="訂購日期時間" ReadOnly="True" 
                            SortExpression="訂購日期時間" />
                        <asp:BoundField DataField="出貨日期時間" HeaderText="出貨日期時間" NullDisplayText="(尚未出貨)" 
                            ReadOnly="True" SortExpression="出貨日期時間" />
                        <asp:BoundField DataField="顧客拿貨時間" HeaderText="顧客拿貨時間" NullDisplayText="(尚未拿貨)" 
                            ReadOnly="True" SortExpression="顧客拿貨時間" />
                        <asp:BoundField DataField="收件人" HeaderText="收件人" SortExpression="收件人" />
                        <asp:BoundField DataField="手機號碼" HeaderText="手機號碼" SortExpression="手機號碼" />
                        <asp:BoundField DataField="室內電話" HeaderText="室內電話" SortExpression="室內電話" />
                        <asp:BoundField DataField="取貨方式id" HeaderText="取貨方式id" SortExpression="取貨方式id" 
                            Visible="False" />
                        <asp:TemplateField HeaderText="取貨" SortExpression="取貨">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="AccessDataSource1" DataTextField="值" DataValueField="id" 
                                    SelectedValue='<%# Bind("取貨方式id", "{0}") %>'>
                                </asp:DropDownList>
                                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                                    DataFile="~/App_Data/MainDatabase.mdb" 
                                    SelectCommand="SELECT [id], [值] FROM [取貨方式]"></asp:AccessDataSource>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("取貨") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("取貨") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="付款方式id" HeaderText="付款方式id" SortExpression="付款方式id" 
                            Visible="False" />
                        <asp:TemplateField HeaderText="付款" SortExpression="付款">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" 
                                    DataSourceID="AccessDataSource2" DataTextField="值" DataValueField="id" 
                                    SelectedValue='<%# Bind("付款方式id", "{0}") %>'>
                                </asp:DropDownList>
                                <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                                    DataFile="~/App_Data/MainDatabase.mdb" 
                                    SelectCommand="SELECT [id], [值] FROM [付款方式]"></asp:AccessDataSource>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("付款") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("付款") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="郵遞區號" HeaderText="郵遞區號" SortExpression="郵遞區號" />
                        <asp:BoundField DataField="取貨地點" HeaderText="取貨地點" SortExpression="取貨地點" />
                        <asp:BoundField DataField="運費" HeaderText="運費" ReadOnly="True" 
                            SortExpression="運費" />
                        <asp:BoundField DataField="折扣" HeaderText="折扣" ReadOnly="True" 
                            SortExpression="折扣" />
                        <asp:BoundField DataField="目前狀態" HeaderText="目前狀態" ReadOnly="True" 
                            SortExpression="目前狀態" />
                        <asp:BoundField DataField="完成狀態" HeaderText="訂單已完成？" ReadOnly="True" 
                            SortExpression="完成狀態" />
                        <asp:BoundField DataField="成立狀態" HeaderText="訂單成立？" ReadOnly="True" 
                            SortExpression="成立狀態" />
                        <asp:BoundField DataField="留言" HeaderText="留言" SortExpression="留言" 
                            NullDisplayText="(顧客沒有留言)" />
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="更新"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="取消"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="編輯"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                    CommandName="Delete" onclientclick="return confirm('您確定要刪除嗎？')" Text="刪除"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:DetailsView>
                <asp:AccessDataSource ID="orderShowAllAccessDataSource" runat="server" 
                    DataFile="~/App_Data/MainDatabase.mdb" 
                    DeleteCommand="DELETE FROM 訂單 WHERE id=? And 成立=false" SelectCommand="SELECT 訂單.id, 訂單.訂購日期時間, 訂單.出貨日期時間, 訂單.顧客拿貨時間, 訂單.收件人, 訂單.手機號碼,訂單.室內電話, 訂單.取貨方式id, 取貨方式.值 AS 取貨, 訂單.付款方式id, 付款方式.值 AS 付款, 訂單.郵遞區號,訂單.取貨地點, 訂單.運費, 訂單.折扣, 訂單狀態.目前狀態, iif(訂單.完成=true,'此訂單已經完成，無法更改','此訂單尚未完成') AS 完成狀態 , iif(訂單.成立=true,'此訂單已經成立，無法更改','目前您可以修改此訂單') AS 成立狀態 , 訂單.留言
FROM 付款方式 INNER JOIN (取貨方式 INNER JOIN (訂單狀態 INNER JOIN 訂單 ON 訂單狀態.id = 訂單.訂單狀態id) ON 取貨方式.id = 訂單.取貨方式id) ON 付款方式.id = 訂單.付款方式id
WHERE (((訂單.id)=?));" UpdateCommand="UPDATE 訂單 SET 
收件人=?,手機號碼=?,室內電話=?,取貨方式id=?,付款方式id=?,郵遞區號=?,取貨地點=?, 留言=?
WHERE 訂單.id=?">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="orderGridView" DefaultValue="" Name="?" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="收件人" />
                        <asp:Parameter Name="手機號碼" />
                        <asp:Parameter Name="室內電話" />
                        <asp:Parameter Name="取貨方式id" />
                        <asp:Parameter Name="付款方式id" />
                        <asp:Parameter Name="郵遞區號" />
                        <asp:Parameter Name="取貨地點" />
                        <asp:Parameter Name="留言" />
                        <asp:ControlParameter ControlID="orderGridView" Name="訂單.id" 
                            PropertyName="SelectedValue" />
                    </UpdateParameters>
                </asp:AccessDataSource>
                <br />
            </td>
            <td valign="top">
                已訂購的產品：<asp:GridView ID="orderDetailGridView" runat="server" 
                    AutoGenerateColumns="False" CellPadding="2" 
                    DataSourceID="orderDetailAccessDataSource" ForeColor="Black" GridLines="None" 
                    ShowFooter="True" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
                    BorderWidth="1px">
                    <Columns>
                        <asp:BoundField DataField="訂單id" HeaderText="訂單id" SortExpression="訂單id" 
                            Visible="False" />
                        <asp:BoundField DataField="產品id" HeaderText="產品id" SortExpression="產品id" 
                            Visible="False" />
                        <asp:BoundField DataField="名稱" HeaderText="產品名稱" SortExpression="名稱" />
                        <asp:BoundField DataField="訂購量" HeaderText="訂購量" SortExpression="訂購量" />
                        <asp:BoundField DataField="配貨量" HeaderText="配貨量" SortExpression="配貨量" />
                        <asp:BoundField DataField="金額" HeaderText="金額" SortExpression="金額" />
                        <asp:BoundField DataField="其它" HeaderText="其它" SortExpression="其它" />
                    </Columns>
                    <FooterStyle BackColor="Tan" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                        HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                </asp:GridView>
                <asp:Panel ID="orderDetailPanel" runat="server" Visible="False">
                    運費：<asp:Label ID="shippingCostLabel" runat="server"></asp:Label>
                    <br />
                    折扣：<asp:Label ID="discountLabel" runat="server"></asp:Label>
                    <br />
                    <br />
                    <span class="style5">總共金額：</span><b><asp:Label ID="totalCostLabel" 
                    runat="server" CssClass="style4"></asp:Label>
                    </b>
                </asp:Panel>
    <asp:AccessDataSource ID="orderDetailAccessDataSource" runat="server" 
                    DataFile="~/App_Data/MainDatabase.mdb" SelectCommand="SELECT 訂單細項.訂單id, 訂單細項.產品id, 產品.名稱, 訂單細項.訂購量, 訂單細項.配貨量, 訂單細項.金額, 訂單細項.其它
FROM 產品 INNER JOIN 訂單細項 ON 產品.id = 訂單細項.產品id
WHERE 訂單細項.訂單id=?;">
        <SelectParameters>
            <asp:ControlParameter ControlID="orderGridView" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
                </asp:AccessDataSource>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
