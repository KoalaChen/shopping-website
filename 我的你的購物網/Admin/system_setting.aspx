<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminSite.Master" CodeBehind="system_setting.aspx.vb" Inherits="我的你的購物網.system_setting" 
    title="系統設定" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <!--#INCLUDE FILE="IsAdmin.aspx"-->
    <style type="text/css">
        .style2
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style3
        {
            color: #0066FF;
        }
        .style4
        {
            width: 133px;
        }
        .style5
        {
            width: 178px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>系統設定</h3>
    <span class="style3">核心參數設定</span><br class="style3" />
    <asp:Label ID="sysStatusLabel" runat="server" Text="Load" Visible="False"></asp:Label>
&nbsp;<table class="style1">
        <tr>
            <td class="style4">
                <asp:Label ID="hostname" runat="server"></asp:Label>
            </td>
            <td class="style5">
                <asp:TextBox ID="hostnameValueTextBox" runat="server" 
                    ValidationGroup="sysValue" Width="100%"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                    ControlToValidate="hostnameValueTextBox" Display="Dynamic" ErrorMessage="請輸入" 
                    ValidationGroup="sysValue"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="hostnameValueTextBox" ErrorMessage="請輸入15字內" 
                    ValidationExpression=".{1,15}" ValidationGroup="sysValue"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="logoUrl" runat="server"></asp:Label>
            </td>
            <td class="style5">
                <asp:TextBox ID="logoUrlValueTextBox" runat="server" ValidationGroup="sysValue" 
                    Width="100%"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="logoUrlValueTextBox" Display="Dynamic" 
                    ErrorMessage="請輸入" ValidationGroup="sysValue"></asp:RequiredFieldValidator>
&nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="imageFolderUrl" runat="server"></asp:Label>
            </td>
            <td class="style5">
                <asp:TextBox ID="imageFolderUrlValueTextBox" runat="server" 
                    ValidationGroup="sysValue" Width="100%"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="imageFolderUrlValueTextBox" Display="Dynamic" 
                    ErrorMessage="請輸入" ValidationGroup="sysValue"></asp:RequiredFieldValidator>
&nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="enableMaintenance" runat="server"></asp:Label>
            </td>
            <td class="style5">
                <asp:RadioButtonList ID="enableMaintenanceValueRadioButtonList" runat="server" 
                    RepeatDirection="Horizontal" ValidationGroup="sysValue">
                    <asp:ListItem Value="True">開啟功能</asp:ListItem>
                    <asp:ListItem Value="False">關閉功能</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="enableMaintenanceValueRadioButtonList" Display="Dynamic" 
                    ErrorMessage="請選擇" ValidationGroup="sysValue"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="maintenanceNotice" runat="server"></asp:Label>
            </td>
            <td class="style5">
                <asp:TextBox ID="maintenanceNoticeValueTextBox" runat="server" 
                    ValidationGroup="sysValue" Width="100%"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="enableTransactions" runat="server"></asp:Label>
            </td>
            <td class="style5">
                <asp:RadioButtonList ID="enableTransactionsRadioButtonList" runat="server" 
                    RepeatDirection="Horizontal" ValidationGroup="sysValue">
                    <asp:ListItem Value="True">開啟功能</asp:ListItem>
                    <asp:ListItem Value="False">關閉功能</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="enableTransactionsRadioButtonList" Display="Dynamic" 
                    ErrorMessage="請選擇" ValidationGroup="sysValue"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="transactionsNotice" runat="server"></asp:Label>
            </td>
            <td class="style5">
                <asp:TextBox ID="transactionsNoticeValueTextBox" runat="server" 
                    ValidationGroup="sysValue" Width="100%"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="defaultUrl" runat="server"></asp:Label>
            </td>
            <td class="style5">
                <asp:TextBox ID="defaultUrlValueTextBox" runat="server" 
                    ValidationGroup="sysValue" Width="100%"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="defaultUrlValueTextBox" Display="Dynamic" 
                    ErrorMessage="請輸入" ValidationGroup="sysValue"></asp:RequiredFieldValidator>
&nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="regTryTimes" runat="server"></asp:Label>
            </td>
            <td class="style5">
                <asp:TextBox ID="regTryTimesValueTextBox" runat="server" 
                    ValidationGroup="sysValue" Width="100%"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                    ControlToValidate="regTryTimesValueTextBox" Display="Dynamic" 
                    ErrorMessage="請輸入" ValidationGroup="sysValue"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="regTryTimesValueTextBox" Display="Dynamic" 
                    ErrorMessage="請輸入1-9" ValidationExpression="[1-9]{1}" 
                    ValidationGroup="sysValue"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="enableRegTry" runat="server"></asp:Label>
            </td>
            <td class="style5">
                <asp:RadioButtonList ID="enableRegTryValueRadioButtonList" runat="server" 
                    RepeatDirection="Horizontal" ValidationGroup="sysValue">
                    <asp:ListItem Value="True">開啟功能</asp:ListItem>
                    <asp:ListItem Value="False">關閉功能</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="enableRegTryValueRadioButtonList" Display="Dynamic" 
                    ErrorMessage="請選擇" ValidationGroup="sysValue"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="lockFailRegTryTime" runat="server"></asp:Label>
            </td>
            <td class="style5">
                <asp:TextBox ID="lockFailRegTryTimeValueTextBox" runat="server" 
                    ValidationGroup="sysValue" Width="100%"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="lockFailRegTryTimeValueTextBox" Display="Dynamic" 
                    ErrorMessage="請輸入" ValidationGroup="sysValue"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="lockFailRegTryTimeValueTextBox" Display="Dynamic" 
                    ErrorMessage="請輸入1-999" ValidationExpression="[0-9]{1,3}" 
                    ValidationGroup="sysValue"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="loginTryTimes" runat="server"></asp:Label>
            </td>
            <td class="style5">
                <asp:TextBox ID="loginTryTimesValueTextBox" runat="server" 
                    ValidationGroup="sysValue" Width="100%"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="loginTryTimesValueTextBox" Display="Dynamic" 
                    ErrorMessage="請輸入" ValidationGroup="sysValue"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                    ControlToValidate="loginTryTimesValueTextBox" ErrorMessage="請輸入1-999" 
                    ValidationExpression="[0-9]{1,3}" ValidationGroup="sysValue"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="sessionTimeOut" runat="server"></asp:Label>
            </td>
            <td class="style5">
                <asp:TextBox ID="sessionTimeOutValueTextBox" runat="server" 
                    ValidationGroup="sysValue" Width="100%"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="sessionTimeOutValueTextBox" Display="Dynamic" 
                    ErrorMessage="請輸入" ValidationGroup="sysValue"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                    ControlToValidate="sessionTimeOutValueTextBox" ErrorMessage="請輸入1-999" 
                    ValidationExpression="[0-9]{1,3}" ValidationGroup="sysValue"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="visits" runat="server"></asp:Label>
            </td>
            <td class="style5">
                <asp:TextBox ID="visitsValueTextBox" runat="server" ValidationGroup="sysValue" 
                    Width="100%"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="visitsValueTextBox" Display="Dynamic" 
                    ErrorMessage="請輸入" ValidationGroup="sysValue"></asp:RequiredFieldValidator>
&nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="NoProductImg" runat="server"></asp:Label>
            </td>
            <td class="style5">
                <asp:TextBox ID="NoProductImgValueTextBox" runat="server" 
                    ValidationGroup="sysValue" Width="100%"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                    ControlToValidate="NoProductImgValueTextBox" Display="Dynamic" 
                    ErrorMessage="請輸入" ValidationGroup="sysValue"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style5">
                <asp:Button ID="sysValueButton" runat="server" Text="送出" 
                    ValidationGroup="sysValue" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <DotNetAge:Dialog ID="Dialog1" runat="server" Title="[DialogTitle]">
    </DotNetAge:Dialog>
    <br />
    <asp:UpdatePanel ID="mainUpdatePanel" runat="server">
        <ContentTemplate>
            <br />
            <table>
                <tr>
                    <td>
                        <b>付款方式</b></td>
                    <td>
                        <b>取貨方式</b></td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:GridView ID="payGridView" runat="server" AllowPaging="True" 
                    AllowSorting="True" CellPadding="4" DataKeyNames="id" 
                    DataSourceID="payAccessDataSource" ForeColor="#333333" GridLines="None">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                            </Columns>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>
                        <asp:AccessDataSource ID="payAccessDataSource" runat="server" 
                    DataFile="~/App_Data/MainDatabase.mdb" 
                    SelectCommand="SELECT [id], [值] FROM [付款方式]"></asp:AccessDataSource>
                    </td>
                    <td valign="top">
                        <asp:GridView ID="getGridView" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="id" DataSourceID="getAccessDataSource" ForeColor="#333333" 
                    GridLines="None">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                            ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="值" HeaderText="值" SortExpression="值" />
                            </Columns>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>
                        <asp:AccessDataSource ID="getAccessDataSource" runat="server" 
                    DataFile="~/App_Data/MainDatabase.mdb" 
                    SelectCommand="SELECT [id], [值], [價格], [多少元以上免運費] FROM [取貨方式]">
                        </asp:AccessDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        詳細資料</td>
                    <td>
                        詳細資料</td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:DetailsView ID="payDetailsView" runat="server" AutoGenerateRows="False" 
                    CellPadding="4" DataKeyNames="id" DataSourceID="payDetailAccessDataSource" 
                    ForeColor="#333333" GridLines="None" Height="50px">
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <Fields>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                            ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="值" HeaderText="值" SortExpression="值" />
                                <asp:BoundField DataField="相關資訊" HeaderText="相關資訊" SortExpression="相關資訊" />
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                            ShowInsertButton="True" />
                            </Fields>
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:DetailsView>
                        <asp:AccessDataSource ID="payDetailAccessDataSource" runat="server" 
                    DataFile="~/App_Data/MainDatabase.mdb" 
                    DeleteCommand="DELETE FROM [付款方式] WHERE [id] = ?" 
                    InsertCommand="INSERT INTO [付款方式] ([值], [相關資訊]) VALUES (?, ?)" 
                    SelectCommand="SELECT [id], [值], [相關資訊] FROM [付款方式] WHERE ([id] = ?)" 
                    UpdateCommand="UPDATE [付款方式] SET [值] = ?, [相關資訊] = ? WHERE [id] = ?">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="payGridView" Name="id" 
                            PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="id" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="值" Type="String" />
                                <asp:Parameter Name="相關資訊" Type="String" />
                                <asp:Parameter Name="id" Type="Int32" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="值" Type="String" />
                                <asp:Parameter Name="相關資訊" Type="String" />
                            </InsertParameters>
                        </asp:AccessDataSource>
                    </td>
                    <td valign="top">
                        <asp:DetailsView ID="getDetailsView" runat="server" AutoGenerateRows="False" 
                    CellPadding="4" DataKeyNames="id" DataSourceID="getDetailAccessDataSource" 
                    ForeColor="#333333" GridLines="None" Height="50px">
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <Fields>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                            ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="值" HeaderText="值" SortExpression="值" />
                                <asp:BoundField DataField="價格" HeaderText="價格" SortExpression="價格" />
                                <asp:BoundField DataField="多少元以上免運費" HeaderText="多少元以上免運費" 
                            SortExpression="多少元以上免運費" />
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                            ShowInsertButton="True" />
                            </Fields>
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:DetailsView>
                        <asp:AccessDataSource ID="getDetailAccessDataSource" runat="server" 
                    DataFile="~/App_Data/MainDatabase.mdb" 
                    DeleteCommand="DELETE FROM [取貨方式] WHERE [id] = ?" 
                    InsertCommand="INSERT INTO [取貨方式] ([值], [價格], [多少元以上免運費]) VALUES (?, ?, ?)" 
                    SelectCommand="SELECT [id], [值], [價格], [多少元以上免運費] FROM [取貨方式] WHERE ([id] = ?)" 
                    
                    UpdateCommand="UPDATE [取貨方式] SET [值] = ?, [價格] = ?, [多少元以上免運費] = ? WHERE [id] = ?">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="getGridView" Name="id" 
                            PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="id" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="值" Type="String" />
                                <asp:Parameter Name="價格" Type="Int32" />
                                <asp:Parameter Name="多少元以上免運費" Type="Int32" />
                                <asp:Parameter Name="id" Type="Int32" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="值" Type="String" />
                                <asp:Parameter Name="價格" Type="Int32" />
                                <asp:Parameter Name="多少元以上免運費" Type="Int32" />
                            </InsertParameters>
                        </asp:AccessDataSource>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="mainUpdateProgress" runat="server" 
        AssociatedUpdatePanelID="mainUpdatePanel">
        <ProgressTemplate>
            <span class="style2">更新中...</span>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
