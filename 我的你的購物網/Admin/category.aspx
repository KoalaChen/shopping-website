<%@ Page Title="�����޲z" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminSite.Master" CodeBehind="category.aspx.vb" Inherits="�ڪ��A���ʪ���.category1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <!--#INCLUDE FILE="IsAdmin.aspx"-->
    <link href="../css/AjaxControlToolkit.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>
        �����޲z</h3>
        <br />
    <asp:UpdatePanel ID="categoryUpdatePanel" runat="server">
        <ContentTemplate>
            <b>�ثe����</b><br />
            <asp:GridView ID="categoryGridView" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataKeyNames="id" DataSourceID="categoryAccessDataSource" ForeColor="#333333" 
                GridLines="None">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="��s"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="����"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="�s��"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Select" Text="���"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                                CommandName="Delete" onclientclick="return confirm('�z�T�w�n�R���ܡH')" Text="�R��"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                        ReadOnly="True" SortExpression="id" />
                    <asp:TemplateField HeaderText="�����W��" SortExpression="�����W��">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("�����W��") %>' 
                                ValidationGroup="update"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="updateCategoryRequiredFieldValidator" 
                                runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;
        padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;
        &lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;
        ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�п�J�s�����W��&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                ValidationGroup="update"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("�����W��") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            <asp:CustomValidator ID="updateCategoryNameIsRepeatCustomValidator" 
                runat="server" ControlToValidate="newCategoryTextBox" Display="Dynamic" 
                ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;
        padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;
        &lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;
        ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�����W�٭���&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                ValidationGroup="update"></asp:CustomValidator>
            <asp:CustomValidator ID="delCategoryNameCustomValidator" runat="server" 
                ControlToValidate="newCategoryTextBox" Display="Dynamic" 
                ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;
        padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;
        &lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;
        ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�������U�����ݲ��~�A�L�k�R���C�бN���~���ܨ䥦�����C&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                ValidationGroup="update"></asp:CustomValidator>
            <asp:CustomValidator ID="delDefaultCategoryNameCustomValidator" runat="server" 
                ControlToValidate="newCategoryTextBox" Display="Dynamic" 
                ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;
        padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;
        &lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;
        ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�t�Τ��w�����A�L�k�R���C&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                ValidationGroup="update"></asp:CustomValidator>
            <asp:AccessDataSource ID="categoryAccessDataSource" runat="server" 
                DataFile="~/App_Data/MainDatabase.mdb" 
                DeleteCommand="DELETE FROM [����] WHERE [id] = ?" 
                InsertCommand="INSERT INTO [����] ([id], [�����W��]) VALUES (?, ?)" 
                SelectCommand="SELECT [id], [�����W��] FROM [����] ORDER BY [�����W��] DESC" 
                UpdateCommand="UPDATE [����] SET [�����W��] = ? WHERE [id] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="�����W��" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:Parameter Name="�����W��" Type="String" />
                </InsertParameters>
            </asp:AccessDataSource>
            <br />
            <b>�����U���ӫ~���</b><br />
            <asp:GridView ID="productGridView" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataSourceID="productAccessDataSource" ForeColor="#333333" GridLines="None">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                        SortExpression="id" />
                    <asp:BoundField DataField="���~�W��" HeaderText="���~�W��" SortExpression="���~�W��" />
                    <asp:BoundField DataField="�Ӥ��ɦW" HeaderText="�Ӥ��ɦW" SortExpression="�Ӥ��ɦW" />
                    <asp:BoundField DataField="����" HeaderText="����" SortExpression="����" />
                    <asp:CheckBoxField DataField="�W�[" HeaderText="�W�[" ReadOnly="True" 
                        SortExpression="�W�[" />
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    ����������άO�Ӥ����U�L�ӫ~���
                </EmptyDataTemplate>
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            <br />
            <br />
            <b>�s�W�@�~</b><br />
            �s�������W�١G<asp:TextBox ID="newCategoryTextBox" runat="server" 
                CssClass="unwatermarked" ValidationGroup="addNewCategory"></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="newCategoryTextBox_TextBoxWatermarkExtender" 
                runat="server" Enabled="True" TargetControlID="newCategoryTextBox" 
                WatermarkCssClass="watermarked" WatermarkText="�п�J�s�����W��(10�r��)">
            </asp:TextBoxWatermarkExtender>
            <asp:Button ID="addCategoryButton" runat="server" Text="�s�W" 
                ValidationGroup="addNewCategory" />
            <br />
            <DotNetAge:Dialog ID="insertCategoryResultDialog" runat="server" ShowModal="True" 
        Title="�s�W�������G">
        <BodyTemplate>
            <div style="margin:10px">
                <div style="vertical-align: middle; height: 64px; padding-left: 40px; background: transparent url(mvwres://DNA.UI.JQuery, Version=1.1.15.42021, Culture=neutral, PublicKeyToken=40f672d8570a48f9/DNA.UI.JQuery.Dialog.Info.gif) no-repeat;">
                    �s�W���\ 
                </div>
            </div>
        </BodyTemplate>
        <Trigger Selector="" />
        <Buttons>
            <DotNetAge:DialogButton CommandArgument="" CommandName="" 
                OnClientClick="$(this).dialog('close');" Text="OK" />
        </Buttons>
    </DotNetAge:Dialog>
            <asp:RequiredFieldValidator ID="newCategoryRequiredFieldValidator" 
                runat="server" ControlToValidate="newCategoryTextBox" Display="Dynamic" 
                ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;
        padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;
        &lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;
        ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�п�J�s�����W��&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                ValidationGroup="addNewCategory">
    </asp:RequiredFieldValidator>
            <asp:CustomValidator ID="newCategoryNameIsRepeatCustomValidator" runat="server" 
                ControlToValidate="newCategoryTextBox" Display="Dynamic" 
                ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;
        padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;
        &lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;
        ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�����W�٭���&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                ValidationGroup="addNewCategory">
    </asp:CustomValidator>
            <asp:RegularExpressionValidator ID="newCategoryRegularExpressionValidator" 
                runat="server" ControlToValidate="newCategoryTextBox" 
                ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;
        padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;
        &lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;
        ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�п�J10�r��&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                ValidationExpression=".{1,10}" ValidationGroup="addNewCategory"></asp:RegularExpressionValidator>
                
        </ContentTemplate>
    </asp:UpdatePanel>
        <br />
        <br />
    <br />
    <asp:AccessDataSource ID="productAccessDataSource" runat="server" 
        DataFile="~/App_Data/MainDatabase.mdb" SelectCommand="SELECT ���~.id, ���~.�W�� AS ���~�W��, ���~�Ӥ�.�Ӥ��ɦW, Max(���.����) AS ����, ���~.�W�[
FROM ���� INNER JOIN ((���~ INNER JOIN ��� ON ���~.id = ���.���~id) INNER JOIN ���~�Ӥ� ON ���~.id = ���~�Ӥ�.���~id) ON ����.id = ���~.����id
GROUP BY ����.id, ���~.id, ���~.�W��, ���~�Ӥ�.�Ӥ��ɦW, ���~.�W�[
HAVING (((����.id)=?) AND ((Max(���.����))&lt;=Now()));
">
        <SelectParameters>
            <asp:ControlParameter ControlID="categoryGridView" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:AccessDataSource>


</asp:Content>
