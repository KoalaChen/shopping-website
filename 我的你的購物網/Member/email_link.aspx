<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Member/MemberSite.Master" CodeBehind="email_link.aspx.vb" Inherits="�ڪ��A���ʪ���.email_link" 
    title="�b���s��" %>
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
    
    <h3 style="text-align:center">�b���s��</h3>
    <div align="center">
        <br />
        <DotNetAge:Tabs ID="emailLinkTabs" runat="server" ActiveTabEvent="Click" 
            AsyncLoad="False" AutoPostBack="False" Collapsible="False" ContentCssClass="" 
            ContentStyle="" CssClass="ui-tabs ui-widget ui-widget-content ui-corner-all" 
            Deselectable="False" EnabledContentCache="False" HeaderCssClass="" 
            HeaderStyle="" SelectedIndex="0" Sortable="False">
            <Views>
                <DotNetAge:View runat="server" ShowHeader="False" Text="�]�w�w�]�q�l�l��b��" 
                    CssClass="ui-tabs-panel ui-widget-content ui-corner-bottom" ID="View0">
                    �ثe�q�l�l��b��(���]�t�D�n��)<br />
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
                                                Text="�]�w���w�]" CommandArgument='<%# Eval("�q�l�l��") %>' CommandName="setDefaultEmail"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="�q�l�l��" HeaderText="�q�l�l��" ShowHeader="False" 
                                        SortExpression="�q�l�l��" />
                                </Columns>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <EmptyDataTemplate>
                                    <b>�S����L�q�l�l��i�H�]���w�]</b>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            �D�n�q�l�l��
                            <asp:GridView ID="defaultGridView" runat="server" 
                                AutoGenerateColumns="False" DataSourceID="defaultIdEmailAccessDataSource" 
                                ShowHeader="False">
                                <Columns>
                                    <asp:BoundField DataField="�q�l�l��" HeaderText="�q�l�l��" SortExpression="�q�l�l��" />
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                        
                    </asp:UpdatePanel>
                </DotNetAge:View>
                <DotNetAge:View ID="View1" runat="server" 
                    CssClass="ui-tabs-panel ui-widget-content ui-corner-bottom" ShowHeader="False" 
                    Text="�s�W�q�l�l��">
                    �s�W�@�չq�l�l��<br />
                    <asp:UpdatePanel ID="s2UpdatePanel" runat="server">
                        <ContentTemplate>
                            <table width="80%">
                            <tr>
                                <td style="text-align:left; width:30%">
                                    �s���q�l�l��s���q�l�l��</td>
                                <td>
                                    <asp:TextBox ID="newEmailTextBox" runat="server" Width="100%" 
                                        ValidationGroup="new " CssClass="unwatermarked"></asp:TextBox>
                                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server"
                                    TargetControlID="newEmailTextBox" WatermarkCssClass="watermarked" WatermarkText="�п�J�q�l�l��">
                                    </asp:TextBoxWatermarkExtender>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:left; " colspan="2">
                        <asp:Button ID="addNewEmailButton" runat="server" Text="�s�WE-Mail" Width="100%" 
                                        ValidationGroup="new" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:left; " colspan="2">
                                    <asp:RegularExpressionValidator ID="newEMailRegularExpressionValidator" runat="server" 
                                        Display="Dynamic" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�q�l�l��榡���~&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                        ControlToValidate="newEmailTextBox" ValidationGroup="new"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="newEMailRequiredFieldValidator" runat="server" 
                                        Display="Dynamic"
                                        
                                        ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�п�J�q�l�l��&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                        ControlToValidate="newEmailTextBox" ValidationGroup="new"></asp:RequiredFieldValidator>
                                    <asp:CustomValidator ID="newEMailCustomValidator" runat="server" Display="Dynamic" 
                                        
                                        ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�ӹq�l�l��w���U�L&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                        ControlToValidate="newEmailTextBox" ValidationGroup="new"></asp:CustomValidator>
                                </td>
                            </tr>
                        </table>
                        <DotNetAge:Dialog ID="successDialog" runat="server" Title="���\" 
                            DialogButtons="OK" DialogIcon="Info" ShowModal="true">
                        
                            <BodyTemplate>
                                <div style='margin:10px'>
                                    <div style='vertical-align:middle;height:64px;padding-left:40px;background:transparent url(mvwres://DNA.UI.JQuery, Version=1.1.15.42021, Culture=neutral, PublicKeyToken=40f672d8570a48f9/DNA.UI.JQuery.Dialog.Info.gif) no-repeat;'>
                                       �ާ@���榨�\
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

                        <DotNetAge:Dialog ID="addFailDialog" runat="server" Title="����" 
                            DialogButtons="OK" DialogIcon="Error" ShowModal="true">
                        
                            <BodyTemplate>
                                <div style='margin:10px'>
                                    <div style='vertical-align:middle;height:64px;padding-left:40px;background:transparent url(mvwres://DNA.UI.JQuery, Version=1.1.15.42021, Culture=neutral, PublicKeyToken=40f672d8570a48f9/DNA.UI.JQuery.Dialog.Error.gif) no-repeat;'>
                                       �L�k�s�W�A�Э���
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
                    Text="�R���q�l�l��">
                    �R���@�չq�l�l��
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
                                                    Text="�R��" CommandArgument='<%# Eval("�q�l�l��") %>' CommandName="DelEmail" 
                                                    onclientclick="return confirm('�z�T�w�n�R���ܡH')"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="�q�l�l��" HeaderText="�q�l�l��" ShowHeader="False" 
                                            SortExpression="�q�l�l��" />
                                    </Columns>
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <EmptyDataTemplate>
                                    <b>�S����L�q�l�l��i�H�R��</b>
                                </EmptyDataTemplate>

                                </asp:GridView>
                                ps.�D�n�q�l�l�󤣯�R��
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </DotNetAge:View>
            </Views>
        </DotNetAge:Tabs>
        <br />
        &nbsp;</div>
    <br />&nbsp;<asp:AccessDataSource ID="idEmailAccessDataSource" runat="server" 
        DataFile="~/App_Data/MainDatabase.mdb" 
        DeleteCommand="Delete From �q�l�l�� Where �q�l�l��=?" InsertCommand="Insert Into �q�l�l��(�H��id, �q�l�l��)
Values(?,?);" SelectCommand="SELECT �q�l�l��.�H��id, �q�l�l��.�q�l�l��
FROM �H�� INNER JOIN �q�l�l�� ON �H��.id = �q�l�l��.�H��id
WHERE (((�q�l�l��.�H��id)=?));" UpdateCommand="Update �q�l�l�� SET �q�l�l��=? Where �q�l�l��=?">
        <SelectParameters>
            <asp:SessionParameter Name="?" SessionField="member_id" />
        </SelectParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="defaultIdEmailAccessDataSource" runat="server" 
        DataFile="~/App_Data/MainDatabase.mdb" 
        DeleteCommand="Delete From �q�l�l�� Where �q�l�l��=?" InsertCommand="Insert Into �q�l�l��(�H��id, �q�l�l��)
Values(?,?);" SelectCommand="SELECT �q�l�l��.�q�l�l��
FROM �H�� INNER JOIN �q�l�l�� ON �H��.�D�n�l��id = �q�l�l��.id
WHERE (((�q�l�l��.�H��id)=[?]));
" UpdateCommand="Update �q�l�l�� SET �q�l�l��=? Where �q�l�l��=?">
        <SelectParameters>
            <asp:SessionParameter Name="?" SessionField="member_id" />
        </SelectParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="exceptDefaultIdEmailAccessDataSource" runat="server" 
        DataFile="~/App_Data/MainDatabase.mdb" 
        DeleteCommand="Delete From �q�l�l�� Where �q�l�l��=?" InsertCommand="Insert Into �q�l�l��(�H��id, �q�l�l��)
Values(?,?);" SelectCommand="SELECT �q�l�l��.�q�l�l��
FROM �q�l�l��
WHERE �q�l�l��.id NOT IN(
    SELECT �H��.�D�n�l��id
    FROM   �H��
    Where   �H��.id=?
) AND �q�l�l��.�H��id=?" UpdateCommand="Update �q�l�l�� SET �q�l�l��=? Where �q�l�l��=?">
        <SelectParameters>
            <asp:SessionParameter Name="?" SessionField="member_id" />
            <asp:SessionParameter Name="?" SessionField="member_id" />
        </SelectParameters>
    </asp:AccessDataSource>
    </asp:Content>
