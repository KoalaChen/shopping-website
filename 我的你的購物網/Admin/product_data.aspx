<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminSite.Master" CodeBehind="product_data.aspx.vb" Inherits="�ڪ��A���ʪ���.product_data_management" 
    title="���~��ƺ޲z" ValidateRequest="false" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<%@ Register assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.DynamicData" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <!--#INCLUDE FILE="IsAdmin.aspx"-->
    <style type="text/css">
        .style3
        {
            width: 100px;
            text-align: center;
            font-weight: bold;
        }
        .style7
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<h3>���~���</h3>
                [<asp:LinkButton ID="insertLinkButton" runat="server">�s�W�@�~</asp:LinkButton>
                ][<asp:LinkButton ID="otherLinkButton" runat="server">�ק�/�R��/�d�ߧ@�~</asp:LinkButton>
                ]<br />

                <asp:MultiView ID="mainMultiView" runat="server">
                    <asp:View ID="insertView" runat="server">
                        <h4>&gt;�s�W�@�~</h4>
                        <table width="100%">
                            <tr>
                                <td class="style3">
                                    �ӫ~�W��</td>
                                <td>
                                    <asp:TextBox ID="nameTextBox" runat="server" Width="100%" 
                                        ValidationGroup="insertProduct"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="insertProductRequiredFieldValidator0" 
                                        runat="server" ControlToValidate="nameTextBox" Display="Dynamic" 
                                        ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�ж�g�ӫ~�W�١C&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                        ValidationGroup="insertProduct"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    ����</td>
                                <td>
                                    <asp:DropDownList ID="categoryDropDownList" runat="server" 
                                        DataSourceID="categoryAccessDataSource" DataTextField="�����W��" 
                                        DataValueField="id" Width="100%">
                                    </asp:DropDownList>
                                    <asp:AccessDataSource ID="categoryAccessDataSource" runat="server" 
                                        DataFile="~/App_Data/MainDatabase.mdb" 
                                        SelectCommand="SELECT [id], [�����W��] FROM [����] ORDER BY [�����W��] DESC">
                                    </asp:AccessDataSource>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="insertProductRequiredFieldValidator2" 
                                        runat="server" ControlToValidate="categoryDropDownList" Display="Dynamic" 
                                        ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�п�ܤ����W�١C&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                        ValidationGroup="insertProduct"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    ���e</td>
                                <td colspan="2">
                                    <FCKeditorV2:FCKeditor ID="productContentFCKeditor" runat="server" 
                                        Height="300px" Width="100%">
                                    </FCKeditorV2:FCKeditor>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    ����</td>
                                <td>
                                    <asp:TextBox ID="priceTextBox" runat="server" ValidationGroup="insertProduct" 
                                        Width="100%"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="insertProductRequiredFieldValidator1" 
                                        runat="server" ControlToValidate="priceTextBox" Display="Dynamic" 
                                        ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�ж�g����C&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                        ValidationGroup="insertProduct"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="priceCompareValidator" runat="server" 
                                        ControlToValidate="priceTextBox" Display="Dynamic" 
                                        ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;����ܤ֦b1�H�W�C&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                        Operator="GreaterThanEqual" Type="Integer" ValueToCompare="1"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    �W�[</td>
                                <td>
                                    <asp:RadioButtonList ID="saleRadioButtonList" runat="server">
                                        <asp:ListItem Value="True">�W�[</asp:ListItem>
                                        <asp:ListItem Value="False">���W�[</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="insertProductRequiredFieldValidator" 
                                        runat="server" ControlToValidate="saleRadioButtonList" Display="Dynamic" 
                                        ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�п�ܬO�_�n�W�[�C&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                        ValidationGroup="insertProduct"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3" rowspan="3">
                                    �D�Ӥ�</td>
                                <td>
                                    <asp:RadioButton ID="selectPhotoWay1RadioButton" runat="server" 
                                        GroupName="selectPhoto" Text="�覡�@�G��ܬJ���Ӥ�" />
                                    <br />
                                    <asp:DropDownList ID="showImageFilenamesDropDownList" runat="server">
                                    </asp:DropDownList>
                                </td>
                                <td rowspan="3">
                                    <asp:CustomValidator ID="photoCustomValidator" runat="server" 
                                        
                                        ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�г]�w�D�Ӥ��C&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" Display="Dynamic" 
                                        ></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="selectPhotoWay2RadioButton" runat="server" 
                                        GroupName="selectPhoto" Text="�覡�G�G�W�ǷӤ�(���\*.png,*.jpg,*.jpeg, *.gif)" 
                                        Visible="False" />
                                    <br />
                                    <asp:FileUpload ID="photoFileUpload" runat="server" Visible="False" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="selectPhotoWay3RadioButton" runat="server" 
                                        GroupName="selectPhoto" Text="�覡�G�G����ܷӤ��A�ϥΨt�ιw�]�Ӥ�" />
                                    <br />
                                    <asp:Image ID="showDefaultImage" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    &nbsp;</td>
                                <td>
                                    <asp:Button ID="insertProductButton" runat="server" style="height: 21px" 
                                        Text="�s�W�ӫ~" ValidationGroup="insertProduct" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    PS.</td>
                                <td>
                                    �ӫ~�Ӥ��ݷ|�i�z�L [�Ӥ��޲z]�ӤW��/�]�w�D�Ӥ�</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <asp:CustomValidator ID="productInsertCustomValidator" runat="server" 
                            
                            ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;���~�s�W���ѡA���ˬd�H�W���جO�_�]�w���~�C&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                            Display="Dynamic"></asp:CustomValidator>
                    </asp:View>
                    <asp:View ID="updateAndDeleteAndQueryView" runat="server">
                        <h4 class="style7">
                            ���~�C��</h4>
                        <br />
                        <table class="style1">
                            <tr>
                                <td style="text-align: center">
                                    <asp:GridView ID="allProductGridView" runat="server" AllowPaging="True" 
                                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                                        DataKeyNames="id" DataSourceID="productAccessDataSource" ForeColor="#333333" 
                                        GridLines="None" style="text-align: center">
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" />
                                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                                                SortExpression="id" />
                                            <asp:BoundField DataField="�����W��" HeaderText="�����W��" SortExpression="�����W��" />
                                            <asp:BoundField DataField="�W��" HeaderText="�W��" SortExpression="�W��" />
                                            <asp:BoundField DataField="���e" HeaderText="���e" SortExpression="���e" />
                                            <asp:CheckBoxField DataField="�W�[" HeaderText="�W�[" SortExpression="�W�[" />
                                            <asp:BoundField DataField="��s����ɶ�" HeaderText="��s����ɶ�" 
                                                SortExpression="��s����ɶ�" />
                                        </Columns>
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#999999" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    </asp:GridView>
                                    <asp:AccessDataSource ID="productAccessDataSource" runat="server" 
                                        DataFile="~/App_Data/MainDatabase.mdb" 
                                        DeleteCommand="DELETE FROM ���~ WHERE  ���~.id=?;" SelectCommand="SELECT ���~.id, ����.�����W��, ���~.�W��, ���~.���e, ���~.�W�[, ���~.��s����ɶ�
FROM (���� INNER JOIN ���~ ON ����.id = ���~.����id);
" UpdateCommand="UPDATE ���~ SET ����id=?, ���~.�W��=? ,���e=?, ���~.�W�[=CBool(?),  �D�Ӥ�=? ���~.��s����ɶ�=now() WHERE  ���~.id=?;">
                                    </asp:AccessDataSource>
                                    <asp:DetailsView ID="editProductDetailsView" runat="server" AutoGenerateRows="False" 
                                        CellPadding="2" DataSourceID="productUpdateDeleteAccessDataSource" 
                                        ForeColor="Black" GridLines="None" HeaderText="�s��/�R�� �@�~" Height="50px" 
                                        style="text-align: center" BackColor="LightGoldenrodYellow" 
                                        BorderColor="Tan" BorderWidth="1px" Width="100%" DataKeyNames="id">
                                        <FooterStyle BackColor="Tan" />
                                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                                            HorizontalAlign="Center" />
                                        <EmptyDataTemplate>
                                            [�п���W�貣�~]
                                        </EmptyDataTemplate>
                                        <Fields>
                                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                                                ReadOnly="True" SortExpression="id" />
                                            <asp:TemplateField HeaderText="�����W��" SortExpression="�����W��">
                                                <AlternatingItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("�����W��") %>'></asp:Label>
                                                </AlternatingItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                                        DataSourceID="categoryAccessDataSource" DataTextField="�����W��" 
                                                        DataValueField="id" SelectedValue='<%# Bind("����id", "{0}") %>'>
                                                    </asp:DropDownList>
                                                    <asp:AccessDataSource ID="categoryAccessDataSource" runat="server" 
                                                        DataFile="~/App_Data/MainDatabase.mdb" 
                                                        SelectCommand="SELECT [id], [�����W��] FROM [����]"></asp:AccessDataSource>
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                                        DataSourceID="categoryAccessDataSource" DataTextField="�����W��" 
                                                        DataValueField="id" SelectedValue='<%# Bind("����id") %>'>
                                                    </asp:DropDownList>
                                                    <asp:AccessDataSource ID="categoryAccessDataSource" runat="server" 
                                                        DataFile="~/App_Data/MainDatabase.mdb" 
                                                        SelectCommand="SELECT [id], [�����W��] FROM [����]"></asp:AccessDataSource>
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("�����W��") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="�W��" HeaderText="�W��" SortExpression="�W��" />
                                            <asp:TemplateField HeaderText="���e" SortExpression="���e">
                                                <EditItemTemplate>
                                                    <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Height="200px" 
                                                        Value='<%# Eval("���e", "{0}") %>' Width="500px">
                                                    </FCKeditorV2:FCKeditor>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("���e") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CheckBoxField DataField="�W�[" HeaderText="�W�[" SortExpression="�W�[" />
                                            <asp:TemplateField HeaderText="�D�Ӥ�" SortExpression="�D�Ӥ�">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("�D�Ӥ�", "{0}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("�D�Ӥ�") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" 
                                                        ImageUrl='<%# Eval("�D�Ӥ�", "../images/Product/{0}") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="��s����ɶ�" SortExpression="��s����ɶ�">
                                                <EditItemTemplate>
                                                    (��s���|��s���t�ήɶ�)
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    (��s���|��s���t�ήɶ�)
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("��s����ɶ�") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
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
                                                        CommandName="Delete" onclientclick="return confirm('�z�T�w�n�R���ܡH')" Text="�R��"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Fields>
                                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                        <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                    </asp:DetailsView>
                                    <asp:AccessDataSource ID="productUpdateDeleteAccessDataSource" runat="server" 
                                        DataFile="~/App_Data/MainDatabase.mdb" 
                                        DeleteCommand="DELETE FROM ���~ WHERE  ���~.id=?;" SelectCommand="SELECT ���~.id, ���~.����id, ����.�����W��, ���~.�W��, ���~.���e, ���~.�W�[, ���~.�D�Ӥ�, ���~.��s����ɶ�
FROM (���� INNER JOIN ���~ ON ����.id = ���~.����id)
WHERE ���~.id=?;
" UpdateCommand="UPDATE ���~ SET ����id=?, �W��=? ,���e=?, �W�[=?,  �D�Ӥ�=?, ��s����ɶ�=now() WHERE  id=?;" 
                                        ConflictDetection="CompareAllValues">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="allProductGridView" Name="?" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="����id" />
                                            <asp:Parameter Name="�W��" />
                                            <asp:Parameter Name="���e" />
                                            <asp:Parameter Name="�W�[" />
                                            <asp:Parameter Name="�D�Ӥ�" />
                                            <asp:Parameter Name="id" />
                                        </UpdateParameters>
                                    </asp:AccessDataSource>
                                </td>
                                <td valign="top">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                        CellPadding="4" DataSourceID="productMainPhotoAccessDataSource" 
                                        ForeColor="#333333" GridLines="None" ShowHeader="False" 
                                        style="text-align: center">
                                        <RowStyle BackColor="#EFF3FB" />
                                        <Columns>
                                            <asp:ImageField DataAlternateTextField="�D�Ӥ�" DataImageUrlField="�D�Ӥ�" 
                                                DataImageUrlFormatString="../images/Product/{0}">
                                            </asp:ImageField>
                                        </Columns>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:AccessDataSource ID="productMainPhotoAccessDataSource" runat="server" 
                            DataFile="~/App_Data/MainDatabase.mdb" 
                            SelectCommand="SELECT [�D�Ӥ�] FROM [���~] WHERE ([id] = ?)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="allProductGridView" Name="id" 
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:AccessDataSource>
                        <br />
                        <asp:Panel ID="priceManagerPanel" runat="server">
                            <b>����޲z</b><table>
                                <tr>
                                    <td valign="top">
                                        <asp:GridView ID="productPriceGridView" runat="server" 
                                            AutoGenerateColumns="False" Caption="&lt;b&gt;�Ӳ��~���ݪ�����&lt;/b&gt;" 
                                            CellPadding="4" DataKeyNames="���~id,�]�w�_�l���" DataSourceID="priceAccessDataSource" 
                                            ForeColor="#333333" GridLines="None">
                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                            <Columns>
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                            CommandName="Delete" onclientclick="return confirm('�z�T�w�n�R���ܡH')" Text="�R��"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="�]�w�_�l���" HeaderText="�]�w�_�l���" ReadOnly="True" 
                                                    SortExpression="�]�w�_�l���" DataFormatString="{0:yyyy/MM/dd}" />
                                                <asp:BoundField DataField="����" HeaderText="����" SortExpression="����" />
                                            </Columns>
                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                            <EmptyDataTemplate>
                                                �п�ܤW�貣�~�C��C
                                            </EmptyDataTemplate>
                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <EditRowStyle BackColor="#999999" />
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        </asp:GridView>
                                        <asp:AccessDataSource ID="priceAccessDataSource" runat="server" 
                                            DataFile="~/App_Data/MainDatabase.mdb" 
                                            DeleteCommand="DELETE FROM [���] WHERE [���~id] = ? AND [�]�w�_�l���] = ?" 
                                            InsertCommand="INSERT INTO [���] ([���~id], [�]�w�_�l���], [����]) VALUES (?, CDate(?), ?)" 
                                            SelectCommand="SELECT [���~id], [�]�w�_�l���], [����] FROM [���] WHERE ([���~id] = ?) ORDER BY [�]�w�_�l���] DESC" 
                                            UpdateCommand="UPDATE [���] SET [����] = ? WHERE [���~id] = ?">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="allProductGridView" Name="���~id" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                            <DeleteParameters>
                                                <asp:Parameter Name="���~id" Type="Int32" />
                                                <asp:Parameter Name="�]�w�_�l���" Type="DateTime" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="����" Type="Int32" />
                                                <asp:Parameter Name="���~id" Type="Int32" />
                                                <asp:Parameter Name="�]�w�_�l���" Type="DateTime" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:ControlParameter ControlID="allProductGridView" Name="���~id" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:Parameter Name="�]�w�_�l���" Type="DateTime" />
                                                <asp:Parameter Name="����" Type="Int32" />
                                            </InsertParameters>
                                        </asp:AccessDataSource>
                                    </td>
                                    <td valign="top">
                                        <br />
                                        <asp:DetailsView ID="priceDetailsView" runat="server" AutoGenerateRows="False" 
                                            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                                            CellPadding="2" DataKeyNames="���~id,�]�w�_�l���" DataSourceID="priceUpdateAccessDataSource" 
                                            ForeColor="Black" GridLines="None" HeaderText="����s�W�@�~" Height="50px">
                                            <FooterStyle BackColor="Tan" />
                                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                                                HorizontalAlign="Center" />
                                            <EmptyDataTemplate>
                                                �п�ܥ������
                                            </EmptyDataTemplate>
                                            <Fields>
                                                <asp:TemplateField HeaderText="�]�w�_�l���">
                                                    <InsertItemTemplate>
                                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("�]�w�_�l���") %>' 
                                                            ValidationGroup="typePrice"></asp:TextBox>
                                                        <asp:CalendarExtender ID="TextBox4_CalendarExtender" runat="server" 
                                                            Enabled="True" TargetControlID="TextBox4">
                                                        </asp:CalendarExtender>
                                                        <asp:TextBoxWatermarkExtender ID="TextBox4_TextBoxWatermarkExtender" 
                                                            runat="server" Enabled="True" TargetControlID="TextBox4" 
                                                            WatermarkCssClass="watermarked" WatermarkText="�п�J�ɶ�">
                                                        </asp:TextBoxWatermarkExtender>
                                                        <asp:RequiredFieldValidator ID="priceRequiredFieldValidator0" runat="server" 
                                                            ControlToValidate="TextBox4" Display="Dynamic" 
                                                            ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�п�J����C&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                                            ValidationGroup="typePrice"></asp:RequiredFieldValidator>
                                                        <asp:CustomValidator ID="CustomValidator1" runat="server" 
                                                            ControlToValidate="TextBox4" Display="Dynamic" 
                                                            ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�п�J���T�����&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                                            onservervalidate="CustomValidator1_ServerValidate" ValidationGroup="typePrice"></asp:CustomValidator>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" 
                                                            Text='<%# Eval("�]�w�_�l���", "{0:yyyy/MM/dd}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="����" SortExpression="����">
                                                    <InsertItemTemplate>
                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("����") %>' 
                                                            ValidationGroup="typePrice"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="validateRequiredFieldValidator" runat="server" 
                                                            ControlToValidate="TextBox3" Display="Dynamic" 
                                                            ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�п�J����&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                                            ValidationGroup="typePrice"></asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                                            ControlToValidate="TextBox3" Display="Dynamic" 
                                                            ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�п�J���T������&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                                            Operator="GreaterThan" Type="Integer" ValidationGroup="typePrice" 
                                                            ValueToCompare="0"></asp:CompareValidator>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("����") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ShowHeader="False">
                                                    <EditItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                                            CommandName="Update" Text="��s"></asp:LinkButton>
                                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                            CommandName="Cancel" Text="����"></asp:LinkButton>
                                                    </EditItemTemplate>
                                                    <InsertItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                                            CommandName="Insert" Text="���J"></asp:LinkButton>
                                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                            CommandName="Cancel" Text="����"></asp:LinkButton>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                            CommandName="New" Text="�s�W"></asp:LinkButton>
                                                        &nbsp;
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Fields>
                                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                            <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                        </asp:DetailsView>
                                        <asp:AccessDataSource ID="priceUpdateAccessDataSource" runat="server" 
                                            DataFile="~/App_Data/MainDatabase.mdb" 
                                            DeleteCommand="DELETE FROM [���] WHERE [���~id] = ? And [�]�w�_�l���] = Cdate(?)" 
                                            InsertCommand="INSERT INTO [���] ([���~id], [�]�w�_�l���], [����]) VALUES (?, CDate(?), ?)" 
                                            SelectCommand="SELECT [���~id], [�]�w�_�l���], [����] FROM [���] where [���~id] = ? ORDER BY [�]�w�_�l���] DESC" 
                                            UpdateCommand="UPDATE [���] SET [����] = ? WHERE [���~id] = ?">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="allProductGridView" Name="���~id" 
                                                    PropertyName="SelectedValue" />
                                            </SelectParameters>
                                            <DeleteParameters>
                                                <asp:Parameter Name="���~id" Type="Int32" />
                                                <asp:Parameter Name="�]�w�_�l���" Type="DateTime" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="����" Type="Int32" />
                                                <asp:Parameter Name="���~id" Type="Int32" />
                                                <asp:Parameter Name="�]�w�_�l���" Type="DateTime" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:ControlParameter ControlID="allProductGridView" Name="���~id" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:Parameter Name="�]�w�_�l���" Type="DateTime" />
                                                <asp:Parameter Name="����" Type="Int32" />
                                            </InsertParameters>
                                        </asp:AccessDataSource>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        &nbsp;</td>
                                    <td valign="top">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </asp:View>
                </asp:MultiView>

    <br />
        <br />
    <DotNetAge:Dialog ID="Dialog1" runat="server" Title="[DialogTitle]">
        <BodyTemplate>
<div style='margin:10px'><div style='vertical-align:middle;height:64px;padding-left:40px;background:transparent url() no-repeat;'></div></div>
</BodyTemplate>

<Trigger Selector=""></Trigger>
    </DotNetAge:Dialog>
&nbsp;
    </asp:Content>
