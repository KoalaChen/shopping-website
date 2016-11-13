<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminSite.Master" CodeBehind="order.aspx.vb" Inherits="我的你的購物網.product_purchase" 
    title="訂單管理" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <!--#INCLUDE FILE="IsAdmin.aspx"-->
    <style type="text/css">
        .style2
        {
            color: #FF0000;
        }
        .style3
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h2>訂單管理</h2>
    訂單
    <asp:GridView ID="orderGridView" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="id" DataSourceID="orderAccessDataSource" 
        ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="訂購日期時間" HeaderText="訂購日期時間" 
                SortExpression="訂購日期時間" DataFormatString="{0:d}" />
            <asp:BoundField DataField="出貨日期時間" HeaderText="出貨日期時間" 
                SortExpression="出貨日期時間" DataFormatString="{0:d}" />
            <asp:BoundField DataField="顧客拿貨時間" HeaderText="顧客拿貨時間" 
                SortExpression="顧客拿貨時間" DataFormatString="{0:d}" />
            <asp:CheckBoxField DataField="成立" HeaderText="成立" SortExpression="成立" />
            <asp:CheckBoxField DataField="完成" HeaderText="完成" SortExpression="完成" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:AccessDataSource ID="orderAccessDataSource" runat="server" 
        DataFile="~/App_Data/MainDatabase.mdb" 
        DeleteCommand="DELETE FROM [訂單] WHERE [id] = ?" 
        InsertCommand="INSERT INTO [訂單] ([id], [訂購日期時間], [出貨日期時間], [顧客拿貨時間], [會員帳號id], [收件人], [手機號碼], [取貨方式id], [付款方式id], [取貨地點], [運費], [折扣], [訂單狀態id], [完成], [成立], [留言]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
        SelectCommand="SELECT [id], [訂購日期時間], [出貨日期時間], [顧客拿貨時間], [會員帳號id], [收件人], [手機號碼], [取貨方式id], [付款方式id], [取貨地點], [運費], [折扣], [訂單狀態id], [完成], [成立], [留言] FROM [訂單]" 
        UpdateCommand="UPDATE [訂單] SET [訂購日期時間] = ?, [出貨日期時間] = ?, [顧客拿貨時間] = ?, [會員帳號id] = ?, [收件人] = ?, [手機號碼] = ?, [取貨方式id] = ?, [付款方式id] = ?, [取貨地點] = ?, [運費] = ?, [折扣] = ?, [訂單狀態id] = ?, [完成] = ?, [成立] = ?, [留言] = ? WHERE [id] = ?">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="訂購日期時間" Type="DateTime" />
            <asp:Parameter Name="出貨日期時間" Type="DateTime" />
            <asp:Parameter Name="顧客拿貨時間" Type="DateTime" />
            <asp:Parameter Name="會員帳號id" Type="Int32" />
            <asp:Parameter Name="收件人" Type="String" />
            <asp:Parameter Name="手機號碼" Type="String" />
            <asp:Parameter Name="取貨方式id" Type="Int32" />
            <asp:Parameter Name="付款方式id" Type="Int32" />
            <asp:Parameter Name="取貨地點" Type="String" />
            <asp:Parameter Name="運費" Type="Int32" />
            <asp:Parameter Name="折扣" Type="Int32" />
            <asp:Parameter Name="訂單狀態id" Type="Int32" />
            <asp:Parameter Name="完成" Type="Boolean" />
            <asp:Parameter Name="成立" Type="Boolean" />
            <asp:Parameter Name="留言" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="訂購日期時間" Type="DateTime" />
            <asp:Parameter Name="出貨日期時間" Type="DateTime" />
            <asp:Parameter Name="顧客拿貨時間" Type="DateTime" />
            <asp:Parameter Name="會員帳號id" Type="Int32" />
            <asp:Parameter Name="收件人" Type="String" />
            <asp:Parameter Name="手機號碼" Type="String" />
            <asp:Parameter Name="取貨方式id" Type="Int32" />
            <asp:Parameter Name="付款方式id" Type="Int32" />
            <asp:Parameter Name="取貨地點" Type="String" />
            <asp:Parameter Name="運費" Type="Int32" />
            <asp:Parameter Name="折扣" Type="Int32" />
            <asp:Parameter Name="訂單狀態id" Type="Int32" />
            <asp:Parameter Name="完成" Type="Boolean" />
            <asp:Parameter Name="成立" Type="Boolean" />
            <asp:Parameter Name="留言" Type="String" />
        </InsertParameters>
    </asp:AccessDataSource>
    <table>
        <tr>
            <td>
                <b>訂單詳細資料</b></td>
            <td>
                <b>訂單細項</b></td>
        </tr>
        <tr>
            <td valign="top">
                <asp:DetailsView ID="orderShowDetailsView" runat="server" 
    AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" 
    DataSourceID="orderShowAllAccessDataSource" ForeColor="#333333" GridLines="None" 
    Height="50px">
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
    <RowStyle BackColor="#EFF3FB" />
    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        請先選取上方訂單。
                    </EmptyDataTemplate>
    <Fields>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
            ReadOnly="True" SortExpression="id" Visible="False" />
        <asp:BoundField DataField="訂購日期時間" DataFormatString="{0:d}" HeaderText="訂購日期時間" 
            ReadOnly="True" SortExpression="訂購日期時間" />
        <asp:TemplateField HeaderText="出貨日期時間" SortExpression="出貨日期時間">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("出貨日期時間", "{0:d}") %>'></asp:TextBox>
                <asp:CalendarExtender ID="TextBox4_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="TextBox4">
                </asp:CalendarExtender>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("出貨日期時間") %>'></asp:TextBox>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("出貨日期時間", "{0:d}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="顧客拿貨時間" SortExpression="顧客拿貨時間">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("顧客拿貨時間", "{0:d}") %>'></asp:TextBox>
                <asp:CalendarExtender ID="TextBox5_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="TextBox5">
                </asp:CalendarExtender>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("顧客拿貨時間") %>'></asp:TextBox>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("顧客拿貨時間", "{0:d}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="會員帳號id" HeaderText="會員帳號id" 
            SortExpression="會員帳號id" ReadOnly="True" />
        <asp:BoundField DataField="收件人" HeaderText="收件人" SortExpression="收件人" />
        <asp:BoundField DataField="手機號碼" HeaderText="手機號碼" SortExpression="手機號碼" />
        <asp:TemplateField HeaderText="取貨方式" SortExpression="取貨方式id">
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="AccessDataSource1" DataTextField="值" DataValueField="id" 
                    Enabled="True" SelectedValue='<%# Bind("取貨方式id") %>'>
                </asp:DropDownList>
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/MainDatabase.mdb" 
                    SelectCommand="SELECT [id], [值] FROM [取貨方式]"></asp:AccessDataSource>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="AccessDataSource1" DataTextField="值" DataValueField="id" 
                    SelectedValue='<%# Bind("取貨方式id") %>'>
                </asp:DropDownList>
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/MainDatabase.mdb" 
                    SelectCommand="SELECT [id], [值] FROM [取貨方式]"></asp:AccessDataSource>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="AccessDataSource1" DataTextField="值" DataValueField="id" 
                    SelectedValue='<%# Bind("取貨方式id") %>'
                    Enabled="False">
                </asp:DropDownList>
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/MainDatabase.mdb" 
                    SelectCommand="SELECT [id], [值] FROM [取貨方式]"></asp:AccessDataSource>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="付款方式" SortExpression="付款方式id">
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="AccessDataSource2" DataTextField="值" DataValueField="id" 
                    Enabled="True" SelectedValue='<%# Bind("付款方式id") %>'>
                </asp:DropDownList>
                <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                    DataFile="~/App_Data/MainDatabase.mdb" 
                    SelectCommand="SELECT [id], [值] FROM [付款方式]"></asp:AccessDataSource>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="AccessDataSource2" DataTextField="值" DataValueField="id" 
                    Enabled="True" SelectedValue='<%# Bind("付款方式id") %>'>
                </asp:DropDownList>
                <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                    DataFile="~/App_Data/MainDatabase.mdb" 
                    SelectCommand="SELECT [id], [值] FROM [付款方式]"></asp:AccessDataSource>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="AccessDataSource2" DataTextField="值" DataValueField="id" 
                    Enabled="False" SelectedValue='<%# Bind("付款方式id") %>'>
                </asp:DropDownList>
                <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                    DataFile="~/App_Data/MainDatabase.mdb" 
                    SelectCommand="SELECT [id], [值] FROM [付款方式]">
                </asp:AccessDataSource>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="取貨地點" HeaderText="取貨地點" SortExpression="取貨地點" />
        <asp:BoundField DataField="折扣" HeaderText="折扣" SortExpression="折扣" />
        <asp:BoundField DataField="運費" HeaderText="運費" SortExpression="運費" />
        <asp:TemplateField HeaderText="訂單狀態" SortExpression="訂單狀態id">
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownList3" runat="server" 
                    DataSourceID="AccessDataSource3" DataTextField="目前狀態" DataValueField="id" 
                    Enabled="True" SelectedValue='<%# Bind("訂單狀態id") %>'>
                </asp:DropDownList>
                <asp:AccessDataSource ID="AccessDataSource3" runat="server" 
                    DataFile="~/App_Data/MainDatabase.mdb" 
                    SelectCommand="SELECT [id], [目前狀態] FROM [訂單狀態]">
                </asp:AccessDataSource>
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:DropDownList ID="DropDownList3" runat="server" 
                    DataSourceID="AccessDataSource3" DataTextField="目前狀態" DataValueField="id" 
                    Enabled="True" SelectedValue='<%# Bind("訂單狀態id") %>'>
                </asp:DropDownList>
                <asp:AccessDataSource ID="AccessDataSource3" runat="server" 
                    DataFile="~/App_Data/MainDatabase.mdb" 
                    SelectCommand="SELECT [id], [目前狀態] FROM [訂單狀態]">
                </asp:AccessDataSource>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:DropDownList ID="DropDownList3" runat="server" 
                    DataSourceID="AccessDataSource3" DataTextField="目前狀態" DataValueField="id" 
                    Enabled="False" SelectedValue='<%# Bind("訂單狀態id") %>'>
                </asp:DropDownList>
                <asp:AccessDataSource ID="AccessDataSource3" runat="server" 
                    DataFile="~/App_Data/MainDatabase.mdb" 
                    SelectCommand="SELECT [id], [目前狀態] FROM [訂單狀態]">
                </asp:AccessDataSource>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:CheckBoxField DataField="完成" HeaderText="完成" SortExpression="完成" />
        <asp:CheckBoxField DataField="成立" HeaderText="成立" SortExpression="成立" />
        <asp:BoundField DataField="留言" HeaderText="留言" SortExpression="留言" 
            NullDisplayText="(顧客沒有留言)" ReadOnly="True" />
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
    </Fields>
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#2461BF" />
    <AlternatingRowStyle BackColor="White" />
</asp:DetailsView>
                <asp:CustomValidator ID="dateErrorCustomValidator" runat="server" 
                    
                    ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=
                        &quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error 
                        ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;
                        float: left; margin-right: 0.3em;&quot; 
                        class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;&lt;strong&gt;
                        錯誤:&lt;/strong&gt;[顧客拿貨時間]需大於[出貨時間]&lt;br&nbsp;br&gt;，[出貨時間]需大於[訂購時間]&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;"></asp:CustomValidator>
<asp:AccessDataSource ID="orderShowAllAccessDataSource" runat="server" 
    DataFile="~/App_Data/MainDatabase.mdb" 
    DeleteCommand="DELETE FROM [訂單] WHERE [id] = ?" 
    InsertCommand="INSERT INTO [訂單] ([id], [訂購日期時間], [出貨日期時間], [顧客拿貨時間], [會員帳號id], [收件人], [手機號碼], [取貨方式id], [付款方式id], [取貨地點], [運費], [折扣], [訂單狀態id], [完成], [成立], [留言]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
    SelectCommand="SELECT [id], [訂購日期時間], [出貨日期時間], [顧客拿貨時間], [會員帳號id], [收件人], [手機號碼], [取貨方式id], [付款方式id], [取貨地點], [運費], [折扣], [訂單狀態id], [完成], [成立], [留言] FROM [訂單] WHERE ([id] = ?)" 
    
    
        
        
                    UpdateCommand="UPDATE [訂單] 
SET [出貨日期時間] = ?, [顧客拿貨時間] = ?, [收件人] = ?, [手機號碼] = ?, [取貨方式id] = ?, [付款方式id] = ?, [取貨地點] = ?, [運費] = ?, [折扣] = ?, [訂單狀態id] = ?, [完成] = ?, [成立] = ? WHERE [id] = ?">
        <SelectParameters>
            <asp:ControlParameter ControlID="orderGridView" Name="id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="出貨日期時間" Type="DateTime" />
            <asp:Parameter Name="顧客拿貨時間" Type="DateTime" />
            <asp:Parameter Name="收件人" Type="String" />
            <asp:Parameter Name="手機號碼" Type="String" />
            <asp:Parameter Name="取貨方式id" Type="Int32" />
            <asp:Parameter Name="付款方式id" Type="Int32" />
            <asp:Parameter Name="取貨地點" Type="String" />
            <asp:Parameter Name="運費" Type="Int32" />
            <asp:Parameter Name="折扣" Type="Int32" />
            <asp:Parameter Name="訂單狀態id" Type="Int32" />
            <asp:Parameter Name="完成" Type="Boolean" />
            <asp:Parameter Name="成立" Type="Boolean" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="訂購日期時間" Type="DateTime" />
            <asp:Parameter Name="出貨日期時間" Type="DateTime" />
            <asp:Parameter Name="顧客拿貨時間" Type="DateTime" />
            <asp:Parameter Name="會員帳號id" Type="Int32" />
            <asp:Parameter Name="收件人" Type="String" />
            <asp:Parameter Name="手機號碼" Type="String" />
            <asp:Parameter Name="取貨方式id" Type="Int32" />
            <asp:Parameter Name="付款方式id" Type="Int32" />
            <asp:Parameter Name="取貨地點" Type="String" />
            <asp:Parameter Name="運費" Type="Int32" />
            <asp:Parameter Name="折扣" Type="Int32" />
            <asp:Parameter Name="訂單狀態id" Type="Int32" />
            <asp:Parameter Name="完成" Type="Boolean" />
            <asp:Parameter Name="成立" Type="Boolean" />
            <asp:Parameter Name="留言" Type="String" />
        </InsertParameters>
</asp:AccessDataSource>
            </td>
            <td valign="top">
    <asp:GridView ID="orderDetailGridView" runat="server" 
        DataSourceID="orderDetailAccessDataSource" AutoGenerateColumns="False" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" DataKeyNames="訂單id,產品id" 
                    ShowFooter="True">
        <RowStyle BackColor="#E3EAEB" />
        <Columns>
            <asp:BoundField DataField="訂單id" HeaderText="訂單id" ReadOnly="True" 
                SortExpression="訂單id" Visible="False" />
            <asp:BoundField DataField="產品id" HeaderText="產品id" ReadOnly="True" 
                SortExpression="產品id" Visible="False" />
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="更新"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
            </asp:TemplateField>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                SortExpression="id" Visible="False" />
            <asp:BoundField DataField="名稱" HeaderText="名稱" SortExpression="名稱" 
                ReadOnly="True" />
            <asp:BoundField DataField="訂購量" HeaderText="訂購量" SortExpression="訂購量" />
            <asp:BoundField DataField="配貨量" HeaderText="配貨量" SortExpression="配貨量" />
            <asp:BoundField DataField="金額" HeaderText="金額" SortExpression="金額" />
            <asp:BoundField DataField="其它" HeaderText="其它" SortExpression="其它" />
        </Columns>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <EmptyDataTemplate>
            請先選取上方訂單。
        </EmptyDataTemplate>
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
                <br />
                運費：<asp:Label ID="shippingCostLabel" runat="server"></asp:Label>
                <br />
                折扣：<asp:Label ID="discountLabel" runat="server"></asp:Label>
                <br />
                <br />
                <span class="style3">總共金額：</span><b><asp:Label ID="totalCostLabel" 
                    runat="server" CssClass="style2"></asp:Label>
                </b>
    <asp:AccessDataSource ID="orderDetailAccessDataSource" runat="server" 
        DataFile="~/App_Data/MainDatabase.mdb" 
                    DeleteCommand="DELETE FROM 訂單細項 WHERE 訂單細項.產品id=? AND 訂單細項.訂單id=?" SelectCommand="SELECT 訂單細項.訂單id, 訂單細項.產品id, 產品.名稱, 訂單細項.訂購量, 訂單細項.配貨量, 訂單細項.金額, 訂單細項.其它 FROM (訂單細項 INNER JOIN 產品 ON 訂單細項.產品id = 產品.id)
WHERE 訂單細項.訂單id=?" 
                    
                    UpdateCommand="UPDATE 訂單細項 SET 訂單細項.訂購量=?, 訂單細項.配貨量=? ,訂單細項.金額=? , 訂單細項.其它=?  WHERE 訂單細項.訂單id=? AND 訂單細項.產品id=?">
        <SelectParameters>
            <asp:ControlParameter ControlID="orderGridView" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="產品id" />
            <asp:Parameter Name="訂單id" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="訂購量" />
            <asp:Parameter Name="配貨量" />
            <asp:Parameter Name="金額" />
            <asp:Parameter Name="其它" />
            <asp:Parameter Name="訂單id" />
            <asp:Parameter Name="產品id" />
        </UpdateParameters>
                </asp:AccessDataSource>
            </td>
        </tr>
    </table>
    <br />
    <DotNetAge:Dialog ID="Dialog1" runat="server" Title="[DialogTitle]">
    </DotNetAge:Dialog>
    </asp:Content>
