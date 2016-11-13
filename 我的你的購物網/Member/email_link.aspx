<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Member/MemberSite.Master" CodeBehind="email_link.aspx.vb" Inherits="我的你的購物網.email_link" 
    title="帳號連結" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <!--#INCLUDE FILE="IsMember.aspx"-->
<style type="text/css">
    .width80percentage
    {
    	width:80%;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <h3 style="text-align:center">帳號連結</h3>
    <div align="center">
        <br />
        <DotNetAge:Tabs ID="emailLinkTabs" runat="server" ActiveTabEvent="Click" 
            AsyncLoad="False" AutoPostBack="False" Collapsible="False" ContentCssClass="" 
            ContentStyle="" CssClass="ui-tabs ui-widget ui-widget-content ui-corner-all" 
            Deselectable="False" EnabledContentCache="False" HeaderCssClass="" 
            HeaderStyle="" SelectedIndex="0" Sortable="False">
            <Views>
                <DotNetAge:View runat="server" ShowHeader="False" Text="設定預設電子郵件帳號" 
                    CssClass="ui-tabs-panel ui-widget-content ui-corner-bottom" ID="View0">
                    目前電子郵件帳號(未包含主要的)<br />
                    <asp:UpdatePanel ID="s1UpdatePanel" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="setDefaultGridView" runat="server" AutoGenerateColumns="False" 
                                            DataSourceID="exceptDefaultIdEmailAccessDataSource" Width="80%" 
                                CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="False">
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                Text="設定成預設" CommandArgument='<%# Eval("電子郵件") %>' CommandName="setDefaultEmail"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="電子郵件" HeaderText="電子郵件" ShowHeader="False" 
                                        SortExpression="電子郵件" />
                                </Columns>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <EmptyDataTemplate>
                                    <b>沒有其他電子郵件可以設成預設</b>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            主要電子郵件
                            <asp:GridView ID="defaultGridView" runat="server" 
                                AutoGenerateColumns="False" DataSourceID="defaultIdEmailAccessDataSource" 
                                ShowHeader="False">
                                <Columns>
                                    <asp:BoundField DataField="電子郵件" HeaderText="電子郵件" SortExpression="電子郵件" />
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                        
                    </asp:UpdatePanel>
                </DotNetAge:View>
                <DotNetAge:View ID="View1" runat="server" 
                    CssClass="ui-tabs-panel ui-widget-content ui-corner-bottom" ShowHeader="False" 
                    Text="新增電子郵件">
                    新增一組電子郵件<br />
                    <asp:UpdatePanel ID="s2UpdatePanel" runat="server">
                        <ContentTemplate>
                            <table width="80%">
                            <tr>
                                <td style="text-align:left; width:30%">
                                    新的電子郵件新的電子郵件</td>
                                <td>
                                    <asp:TextBox ID="newEmailTextBox" runat="server" Width="100%" 
                                        ValidationGroup="new " CssClass="unwatermarked"></asp:TextBox>
                                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server"
                                    TargetControlID="newEmailTextBox" WatermarkCssClass="watermarked" WatermarkText="請輸入電子郵件">
                                    </asp:TextBoxWatermarkExtender>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:left; " colspan="2">
                        <asp:Button ID="addNewEmailButton" runat="server" Text="新增E-Mail" Width="100%" 
                                        ValidationGroup="new" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:left; " colspan="2">
                                    <asp:RegularExpressionValidator ID="newEMailRegularExpressionValidator" runat="server" 
                                        Display="Dynamic" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;電子郵件格式錯誤&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                        ControlToValidate="newEmailTextBox" ValidationGroup="new"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="newEMailRequiredFieldValidator" runat="server" 
                                        Display="Dynamic"
                                        
                                        ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;請輸入電子郵件&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                        ControlToValidate="newEmailTextBox" ValidationGroup="new"></asp:RequiredFieldValidator>
                                    <asp:CustomValidator ID="newEMailCustomValidator" runat="server" Display="Dynamic" 
                                        
                                        ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;該電子郵件已註冊過&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                        ControlToValidate="newEmailTextBox" ValidationGroup="new"></asp:CustomValidator>
                                </td>
                            </tr>
                        </table>
                        <DotNetAge:Dialog ID="successDialog" runat="server" Title="成功" 
                            DialogButtons="OK" DialogIcon="Info" ShowModal="true">
                        
                            <BodyTemplate>
                                <div style='margin:10px'>
                                    <div style='vertical-align:middle;height:64px;padding-left:40px;background:transparent url(mvwres://DNA.UI.JQuery, Version=1.1.15.42021, Culture=neutral, PublicKeyToken=40f672d8570a48f9/DNA.UI.JQuery.Dialog.Info.gif) no-repeat;'>
                                       操作執行成功
                                    </div>
                                </div>
                            </BodyTemplate>
                            <Buttons>
                                <DotNetAge:DialogButton CommandArgument="" CommandName="" 
                                    OnClientClick="$(this).dialog('close');" Text="OK" />
                            </Buttons>

                    <Trigger Selector=""></Trigger>
                        
                        </DotNetAge:Dialog>
                            <br />

                        <DotNetAge:Dialog ID="addFailDialog" runat="server" Title="失敗" 
                            DialogButtons="OK" DialogIcon="Error" ShowModal="true">
                        
                            <BodyTemplate>
                                <div style='margin:10px'>
                                    <div style='vertical-align:middle;height:64px;padding-left:40px;background:transparent url(mvwres://DNA.UI.JQuery, Version=1.1.15.42021, Culture=neutral, PublicKeyToken=40f672d8570a48f9/DNA.UI.JQuery.Dialog.Error.gif) no-repeat;'>
                                       無法新增，請重試
                                    </div>
                                </div>
                            </BodyTemplate>
                            <Buttons>
                                <DotNetAge:DialogButton CommandArgument="" CommandName="" 
                                    OnClientClick="$(this).dialog('close');" Text="OK" />
                            </Buttons>

                    <Trigger Selector=""></Trigger>
                        
                        </DotNetAge:Dialog>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </DotNetAge:View>
                <DotNetAge:View ID="View2" runat="server" 
                    CssClass="ui-tabs-panel ui-widget-content ui-corner-bottom" ShowHeader="False" 
                    Text="刪除電子郵件">
                    刪除一組電子郵件
                    <asp:UpdatePanel ID="s3UpdatePanel" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="deleteEMailGridView" runat="server" AutoGenerateColumns="False" 
                                    DataSourceID="exceptDefaultIdEmailAccessDataSource" Width="80%" 
                                    CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                    Text="刪除" CommandArgument='<%# Eval("電子郵件") %>' CommandName="DelEmail" 
                                                    onclientclick="return confirm('您確定要刪除嗎？')"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="電子郵件" HeaderText="電子郵件" ShowHeader="False" 
                                            SortExpression="電子郵件" />
                                    </Columns>
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <EmptyDataTemplate>
                                    <b>沒有其他電子郵件可以刪除</b>
                                </EmptyDataTemplate>

                                </asp:GridView>
                                ps.主要電子郵件不能刪除
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </DotNetAge:View>
            </Views>
        </DotNetAge:Tabs>
        <br />
        &nbsp;</div>
    <br />&nbsp;<asp:AccessDataSource ID="idEmailAccessDataSource" runat="server" 
        DataFile="~/App_Data/MainDatabase.mdb" 
        DeleteCommand="Delete From 電子郵件 Where 電子郵件=?" InsertCommand="Insert Into 電子郵件(人員id, 電子郵件)
Values(?,?);" SelectCommand="SELECT 電子郵件.人員id, 電子郵件.電子郵件
FROM 人員 INNER JOIN 電子郵件 ON 人員.id = 電子郵件.人員id
WHERE (((電子郵件.人員id)=?));" UpdateCommand="Update 電子郵件 SET 電子郵件=? Where 電子郵件=?">
        <SelectParameters>
            <asp:SessionParameter Name="?" SessionField="member_id" />
        </SelectParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="defaultIdEmailAccessDataSource" runat="server" 
        DataFile="~/App_Data/MainDatabase.mdb" 
        DeleteCommand="Delete From 電子郵件 Where 電子郵件=?" InsertCommand="Insert Into 電子郵件(人員id, 電子郵件)
Values(?,?);" SelectCommand="SELECT 電子郵件.電子郵件
FROM 人員 INNER JOIN 電子郵件 ON 人員.主要郵件id = 電子郵件.id
WHERE (((電子郵件.人員id)=[?]));
" UpdateCommand="Update 電子郵件 SET 電子郵件=? Where 電子郵件=?">
        <SelectParameters>
            <asp:SessionParameter Name="?" SessionField="member_id" />
        </SelectParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="exceptDefaultIdEmailAccessDataSource" runat="server" 
        DataFile="~/App_Data/MainDatabase.mdb" 
        DeleteCommand="Delete From 電子郵件 Where 電子郵件=?" InsertCommand="Insert Into 電子郵件(人員id, 電子郵件)
Values(?,?);" SelectCommand="SELECT 電子郵件.電子郵件
FROM 電子郵件
WHERE 電子郵件.id NOT IN(
    SELECT 人員.主要郵件id
    FROM   人員
    Where   人員.id=?
) AND 電子郵件.人員id=?" UpdateCommand="Update 電子郵件 SET 電子郵件=? Where 電子郵件=?">
        <SelectParameters>
            <asp:SessionParameter Name="?" SessionField="member_id" />
            <asp:SessionParameter Name="?" SessionField="member_id" />
        </SelectParameters>
    </asp:AccessDataSource>
    </asp:Content>
