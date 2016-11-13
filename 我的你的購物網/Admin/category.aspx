<%@ Page Title="分類管理" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminSite.Master" CodeBehind="category.aspx.vb" Inherits="我的你的購物網.category1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <!--#INCLUDE FILE="IsAdmin.aspx"-->
    <link href="../css/AjaxControlToolkit.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>
        分類管理</h3>
        <br />
    <asp:UpdatePanel ID="categoryUpdatePanel" runat="server">
        <ContentTemplate>
            <b>目前分類</b><br />
            <asp:GridView ID="categoryGridView" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataKeyNames="id" DataSourceID="categoryAccessDataSource" ForeColor="#333333" 
                GridLines="None">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
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
                                CommandName="Select" Text="選取"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                                CommandName="Delete" onclientclick="return confirm('您確定要刪除嗎？')" Text="刪除"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                        ReadOnly="True" SortExpression="id" />
                    <asp:TemplateField HeaderText="分類名稱" SortExpression="分類名稱">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("分類名稱") %>' 
                                ValidationGroup="update"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="updateCategoryRequiredFieldValidator" 
                                runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;
        padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;
        &lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;
        ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;請輸入新分類名稱&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                ValidationGroup="update"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("分類名稱") %>'></asp:Label>
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
        ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;分類名稱重複&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                ValidationGroup="update"></asp:CustomValidator>
            <asp:CustomValidator ID="delCategoryNameCustomValidator" runat="server" 
                ControlToValidate="newCategoryTextBox" Display="Dynamic" 
                ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;
        padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;
        &lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;
        ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;分類底下有所屬產品，無法刪除。請將產品移至其它分類。&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                ValidationGroup="update"></asp:CustomValidator>
            <asp:CustomValidator ID="delDefaultCategoryNameCustomValidator" runat="server" 
                ControlToValidate="newCategoryTextBox" Display="Dynamic" 
                ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;
        padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;
        &lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;
        ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;系統內定分類，無法刪除。&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                ValidationGroup="update"></asp:CustomValidator>
            <asp:AccessDataSource ID="categoryAccessDataSource" runat="server" 
                DataFile="~/App_Data/MainDatabase.mdb" 
                DeleteCommand="DELETE FROM [分類] WHERE [id] = ?" 
                InsertCommand="INSERT INTO [分類] ([id], [分類名稱]) VALUES (?, ?)" 
                SelectCommand="SELECT [id], [分類名稱] FROM [分類] ORDER BY [分類名稱] DESC" 
                UpdateCommand="UPDATE [分類] SET [分類名稱] = ? WHERE [id] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="分類名稱" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:Parameter Name="分類名稱" Type="String" />
                </InsertParameters>
            </asp:AccessDataSource>
            <br />
            <b>分類下的商品資料</b><br />
            <asp:GridView ID="productGridView" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataSourceID="productAccessDataSource" ForeColor="#333333" GridLines="None">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                        SortExpression="id" />
                    <asp:BoundField DataField="產品名稱" HeaderText="產品名稱" SortExpression="產品名稱" />
                    <asp:BoundField DataField="照片檔名" HeaderText="照片檔名" SortExpression="照片檔名" />
                    <asp:BoundField DataField="價格" HeaderText="價格" SortExpression="價格" />
                    <asp:CheckBoxField DataField="上架" HeaderText="上架" ReadOnly="True" 
                        SortExpression="上架" />
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    未選取分類或是該分類下無商品資料
                </EmptyDataTemplate>
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            <br />
            <br />
            <b>新增作業</b><br />
            新的分類名稱：<asp:TextBox ID="newCategoryTextBox" runat="server" 
                CssClass="unwatermarked" ValidationGroup="addNewCategory"></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="newCategoryTextBox_TextBoxWatermarkExtender" 
                runat="server" Enabled="True" TargetControlID="newCategoryTextBox" 
                WatermarkCssClass="watermarked" WatermarkText="請輸入新分類名稱(10字內)">
            </asp:TextBoxWatermarkExtender>
            <asp:Button ID="addCategoryButton" runat="server" Text="新增" 
                ValidationGroup="addNewCategory" />
            <br />
            <DotNetAge:Dialog ID="insertCategoryResultDialog" runat="server" ShowModal="True" 
        Title="新增分類結果">
        <BodyTemplate>
            <div style="margin:10px">
                <div style="vertical-align: middle; height: 64px; padding-left: 40px; background: transparent url(mvwres://DNA.UI.JQuery, Version=1.1.15.42021, Culture=neutral, PublicKeyToken=40f672d8570a48f9/DNA.UI.JQuery.Dialog.Info.gif) no-repeat;">
                    新增成功 
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
        ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;請輸入新分類名稱&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                ValidationGroup="addNewCategory">
    </asp:RequiredFieldValidator>
            <asp:CustomValidator ID="newCategoryNameIsRepeatCustomValidator" runat="server" 
                ControlToValidate="newCategoryTextBox" Display="Dynamic" 
                ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;
        padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;
        &lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;
        ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;分類名稱重複&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                ValidationGroup="addNewCategory">
    </asp:CustomValidator>
            <asp:RegularExpressionValidator ID="newCategoryRegularExpressionValidator" 
                runat="server" ControlToValidate="newCategoryTextBox" 
                ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;
        padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;
        &lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;
        ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;請輸入10字內&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                ValidationExpression=".{1,10}" ValidationGroup="addNewCategory"></asp:RegularExpressionValidator>
                
        </ContentTemplate>
    </asp:UpdatePanel>
        <br />
        <br />
    <br />
    <asp:AccessDataSource ID="productAccessDataSource" runat="server" 
        DataFile="~/App_Data/MainDatabase.mdb" SelectCommand="SELECT 產品.id, 產品.名稱 AS 產品名稱, 產品照片.照片檔名, Max(售價.價格) AS 價格, 產品.上架
FROM 分類 INNER JOIN ((產品 INNER JOIN 售價 ON 產品.id = 售價.產品id) INNER JOIN 產品照片 ON 產品.id = 產品照片.產品id) ON 分類.id = 產品.分類id
GROUP BY 分類.id, 產品.id, 產品.名稱, 產品照片.照片檔名, 產品.上架
HAVING (((分類.id)=?) AND ((Max(售價.價格))&lt;=Now()));
">
        <SelectParameters>
            <asp:ControlParameter ControlID="categoryGridView" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:AccessDataSource>


</asp:Content>
