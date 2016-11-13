<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminSite.Master" CodeBehind="product_data.aspx.vb" Inherits="我的你的購物網.product_data_management" 
    title="產品資料管理" ValidateRequest="false" %>
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
    
<h3>產品資料</h3>
                [<asp:LinkButton ID="insertLinkButton" runat="server">新增作業</asp:LinkButton>
                ][<asp:LinkButton ID="otherLinkButton" runat="server">修改/刪除/查詢作業</asp:LinkButton>
                ]<br />

                <asp:MultiView ID="mainMultiView" runat="server">
                    <asp:View ID="insertView" runat="server">
                        <h4>&gt;新增作業</h4>
                        <table width="100%">
                            <tr>
                                <td class="style3">
                                    商品名稱</td>
                                <td>
                                    <asp:TextBox ID="nameTextBox" runat="server" Width="100%" 
                                        ValidationGroup="insertProduct"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="insertProductRequiredFieldValidator0" 
                                        runat="server" ControlToValidate="nameTextBox" Display="Dynamic" 
                                        ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;請填寫商品名稱。&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                        ValidationGroup="insertProduct"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    分類</td>
                                <td>
                                    <asp:DropDownList ID="categoryDropDownList" runat="server" 
                                        DataSourceID="categoryAccessDataSource" DataTextField="分類名稱" 
                                        DataValueField="id" Width="100%">
                                    </asp:DropDownList>
                                    <asp:AccessDataSource ID="categoryAccessDataSource" runat="server" 
                                        DataFile="~/App_Data/MainDatabase.mdb" 
                                        SelectCommand="SELECT [id], [分類名稱] FROM [分類] ORDER BY [分類名稱] DESC">
                                    </asp:AccessDataSource>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="insertProductRequiredFieldValidator2" 
                                        runat="server" ControlToValidate="categoryDropDownList" Display="Dynamic" 
                                        ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;請選擇分類名稱。&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                        ValidationGroup="insertProduct"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    內容</td>
                                <td colspan="2">
                                    <FCKeditorV2:FCKeditor ID="productContentFCKeditor" runat="server" 
                                        Height="300px" Width="100%">
                                    </FCKeditorV2:FCKeditor>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    價格</td>
                                <td>
                                    <asp:TextBox ID="priceTextBox" runat="server" ValidationGroup="insertProduct" 
                                        Width="100%"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="insertProductRequiredFieldValidator1" 
                                        runat="server" ControlToValidate="priceTextBox" Display="Dynamic" 
                                        ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;請填寫價格。&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                        ValidationGroup="insertProduct"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="priceCompareValidator" runat="server" 
                                        ControlToValidate="priceTextBox" Display="Dynamic" 
                                        ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;價格至少在1以上。&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                        Operator="GreaterThanEqual" Type="Integer" ValueToCompare="1"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    上架</td>
                                <td>
                                    <asp:RadioButtonList ID="saleRadioButtonList" runat="server">
                                        <asp:ListItem Value="True">上架</asp:ListItem>
                                        <asp:ListItem Value="False">不上架</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="insertProductRequiredFieldValidator" 
                                        runat="server" ControlToValidate="saleRadioButtonList" Display="Dynamic" 
                                        ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;請選擇是否要上架。&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                        ValidationGroup="insertProduct"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3" rowspan="3">
                                    主照片</td>
                                <td>
                                    <asp:RadioButton ID="selectPhotoWay1RadioButton" runat="server" 
                                        GroupName="selectPhoto" Text="方式一：選擇既有照片" />
                                    <br />
                                    <asp:DropDownList ID="showImageFilenamesDropDownList" runat="server">
                                    </asp:DropDownList>
                                </td>
                                <td rowspan="3">
                                    <asp:CustomValidator ID="photoCustomValidator" runat="server" 
                                        
                                        ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;請設定主照片。&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" Display="Dynamic" 
                                        ></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="selectPhotoWay2RadioButton" runat="server" 
                                        GroupName="selectPhoto" Text="方式二：上傳照片(允許*.png,*.jpg,*.jpeg, *.gif)" 
                                        Visible="False" />
                                    <br />
                                    <asp:FileUpload ID="photoFileUpload" runat="server" Visible="False" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="selectPhotoWay3RadioButton" runat="server" 
                                        GroupName="selectPhoto" Text="方式二：不選擇照片，使用系統預設照片" />
                                    <br />
                                    <asp:Image ID="showDefaultImage" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    &nbsp;</td>
                                <td>
                                    <asp:Button ID="insertProductButton" runat="server" style="height: 21px" 
                                        Text="新增商品" ValidationGroup="insertProduct" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    PS.</td>
                                <td>
                                    商品照片待會可透過 [照片管理]來上傳/設定主照片</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <asp:CustomValidator ID="productInsertCustomValidator" runat="server" 
                            
                            ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;產品新增失敗，請檢查以上項目是否設定錯誤。&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                            Display="Dynamic"></asp:CustomValidator>
                    </asp:View>
                    <asp:View ID="updateAndDeleteAndQueryView" runat="server">
                        <h4 class="style7">
                            產品列表</h4>
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
                                            <asp:BoundField DataField="分類名稱" HeaderText="分類名稱" SortExpression="分類名稱" />
                                            <asp:BoundField DataField="名稱" HeaderText="名稱" SortExpression="名稱" />
                                            <asp:BoundField DataField="內容" HeaderText="內容" SortExpression="內容" />
                                            <asp:CheckBoxField DataField="上架" HeaderText="上架" SortExpression="上架" />
                                            <asp:BoundField DataField="更新日期時間" HeaderText="更新日期時間" 
                                                SortExpression="更新日期時間" />
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
                                        DeleteCommand="DELETE FROM 產品 WHERE  產品.id=?;" SelectCommand="SELECT 產品.id, 分類.分類名稱, 產品.名稱, 產品.內容, 產品.上架, 產品.更新日期時間
FROM (分類 INNER JOIN 產品 ON 分類.id = 產品.分類id);
" UpdateCommand="UPDATE 產品 SET 分類id=?, 產品.名稱=? ,內容=?, 產品.上架=CBool(?),  主照片=? 產品.更新日期時間=now() WHERE  產品.id=?;">
                                    </asp:AccessDataSource>
                                    <asp:DetailsView ID="editProductDetailsView" runat="server" AutoGenerateRows="False" 
                                        CellPadding="2" DataSourceID="productUpdateDeleteAccessDataSource" 
                                        ForeColor="Black" GridLines="None" HeaderText="編輯/刪除 作業" Height="50px" 
                                        style="text-align: center" BackColor="LightGoldenrodYellow" 
                                        BorderColor="Tan" BorderWidth="1px" Width="100%" DataKeyNames="id">
                                        <FooterStyle BackColor="Tan" />
                                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                                            HorizontalAlign="Center" />
                                        <EmptyDataTemplate>
                                            [請選取上方產品]
                                        </EmptyDataTemplate>
                                        <Fields>
                                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                                                ReadOnly="True" SortExpression="id" />
                                            <asp:TemplateField HeaderText="分類名稱" SortExpression="分類名稱">
                                                <AlternatingItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("分類名稱") %>'></asp:Label>
                                                </AlternatingItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                                        DataSourceID="categoryAccessDataSource" DataTextField="分類名稱" 
                                                        DataValueField="id" SelectedValue='<%# Bind("分類id", "{0}") %>'>
                                                    </asp:DropDownList>
                                                    <asp:AccessDataSource ID="categoryAccessDataSource" runat="server" 
                                                        DataFile="~/App_Data/MainDatabase.mdb" 
                                                        SelectCommand="SELECT [id], [分類名稱] FROM [分類]"></asp:AccessDataSource>
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                                        DataSourceID="categoryAccessDataSource" DataTextField="分類名稱" 
                                                        DataValueField="id" SelectedValue='<%# Bind("分類id") %>'>
                                                    </asp:DropDownList>
                                                    <asp:AccessDataSource ID="categoryAccessDataSource" runat="server" 
                                                        DataFile="~/App_Data/MainDatabase.mdb" 
                                                        SelectCommand="SELECT [id], [分類名稱] FROM [分類]"></asp:AccessDataSource>
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("分類名稱") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="名稱" HeaderText="名稱" SortExpression="名稱" />
                                            <asp:TemplateField HeaderText="內容" SortExpression="內容">
                                                <EditItemTemplate>
                                                    <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Height="200px" 
                                                        Value='<%# Eval("內容", "{0}") %>' Width="500px">
                                                    </FCKeditorV2:FCKeditor>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("內容") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CheckBoxField DataField="上架" HeaderText="上架" SortExpression="上架" />
                                            <asp:TemplateField HeaderText="主照片" SortExpression="主照片">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("主照片", "{0}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("主照片") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" 
                                                        ImageUrl='<%# Eval("主照片", "../images/Product/{0}") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="更新日期時間" SortExpression="更新日期時間">
                                                <EditItemTemplate>
                                                    (更新完會更新成系統時間)
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    (更新完會更新成系統時間)
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("更新日期時間") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
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
                                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                        <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                    </asp:DetailsView>
                                    <asp:AccessDataSource ID="productUpdateDeleteAccessDataSource" runat="server" 
                                        DataFile="~/App_Data/MainDatabase.mdb" 
                                        DeleteCommand="DELETE FROM 產品 WHERE  產品.id=?;" SelectCommand="SELECT 產品.id, 產品.分類id, 分類.分類名稱, 產品.名稱, 產品.內容, 產品.上架, 產品.主照片, 產品.更新日期時間
FROM (分類 INNER JOIN 產品 ON 分類.id = 產品.分類id)
WHERE 產品.id=?;
" UpdateCommand="UPDATE 產品 SET 分類id=?, 名稱=? ,內容=?, 上架=?,  主照片=?, 更新日期時間=now() WHERE  id=?;" 
                                        ConflictDetection="CompareAllValues">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="allProductGridView" Name="?" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="分類id" />
                                            <asp:Parameter Name="名稱" />
                                            <asp:Parameter Name="內容" />
                                            <asp:Parameter Name="上架" />
                                            <asp:Parameter Name="主照片" />
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
                                            <asp:ImageField DataAlternateTextField="主照片" DataImageUrlField="主照片" 
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
                            SelectCommand="SELECT [主照片] FROM [產品] WHERE ([id] = ?)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="allProductGridView" Name="id" 
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:AccessDataSource>
                        <br />
                        <asp:Panel ID="priceManagerPanel" runat="server">
                            <b>價格管理</b><table>
                                <tr>
                                    <td valign="top">
                                        <asp:GridView ID="productPriceGridView" runat="server" 
                                            AutoGenerateColumns="False" Caption="&lt;b&gt;該產品所屬的價格&lt;/b&gt;" 
                                            CellPadding="4" DataKeyNames="產品id,設定起始日期" DataSourceID="priceAccessDataSource" 
                                            ForeColor="#333333" GridLines="None">
                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                            <Columns>
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                            CommandName="Delete" onclientclick="return confirm('您確定要刪除嗎？')" Text="刪除"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="設定起始日期" HeaderText="設定起始日期" ReadOnly="True" 
                                                    SortExpression="設定起始日期" DataFormatString="{0:yyyy/MM/dd}" />
                                                <asp:BoundField DataField="價格" HeaderText="價格" SortExpression="價格" />
                                            </Columns>
                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                            <EmptyDataTemplate>
                                                請選擇上方產品列表。
                                            </EmptyDataTemplate>
                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <EditRowStyle BackColor="#999999" />
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        </asp:GridView>
                                        <asp:AccessDataSource ID="priceAccessDataSource" runat="server" 
                                            DataFile="~/App_Data/MainDatabase.mdb" 
                                            DeleteCommand="DELETE FROM [售價] WHERE [產品id] = ? AND [設定起始日期] = ?" 
                                            InsertCommand="INSERT INTO [售價] ([產品id], [設定起始日期], [價格]) VALUES (?, CDate(?), ?)" 
                                            SelectCommand="SELECT [產品id], [設定起始日期], [價格] FROM [售價] WHERE ([產品id] = ?) ORDER BY [設定起始日期] DESC" 
                                            UpdateCommand="UPDATE [售價] SET [價格] = ? WHERE [產品id] = ?">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="allProductGridView" Name="產品id" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                            <DeleteParameters>
                                                <asp:Parameter Name="產品id" Type="Int32" />
                                                <asp:Parameter Name="設定起始日期" Type="DateTime" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="價格" Type="Int32" />
                                                <asp:Parameter Name="產品id" Type="Int32" />
                                                <asp:Parameter Name="設定起始日期" Type="DateTime" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:ControlParameter ControlID="allProductGridView" Name="產品id" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:Parameter Name="設定起始日期" Type="DateTime" />
                                                <asp:Parameter Name="價格" Type="Int32" />
                                            </InsertParameters>
                                        </asp:AccessDataSource>
                                    </td>
                                    <td valign="top">
                                        <br />
                                        <asp:DetailsView ID="priceDetailsView" runat="server" AutoGenerateRows="False" 
                                            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                                            CellPadding="2" DataKeyNames="產品id,設定起始日期" DataSourceID="priceUpdateAccessDataSource" 
                                            ForeColor="Black" GridLines="None" HeaderText="價格新增作業" Height="50px">
                                            <FooterStyle BackColor="Tan" />
                                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                                                HorizontalAlign="Center" />
                                            <EmptyDataTemplate>
                                                請選擇左方價格
                                            </EmptyDataTemplate>
                                            <Fields>
                                                <asp:TemplateField HeaderText="設定起始日期">
                                                    <InsertItemTemplate>
                                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("設定起始日期") %>' 
                                                            ValidationGroup="typePrice"></asp:TextBox>
                                                        <asp:CalendarExtender ID="TextBox4_CalendarExtender" runat="server" 
                                                            Enabled="True" TargetControlID="TextBox4">
                                                        </asp:CalendarExtender>
                                                        <asp:TextBoxWatermarkExtender ID="TextBox4_TextBoxWatermarkExtender" 
                                                            runat="server" Enabled="True" TargetControlID="TextBox4" 
                                                            WatermarkCssClass="watermarked" WatermarkText="請輸入時間">
                                                        </asp:TextBoxWatermarkExtender>
                                                        <asp:RequiredFieldValidator ID="priceRequiredFieldValidator0" runat="server" 
                                                            ControlToValidate="TextBox4" Display="Dynamic" 
                                                            ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;請輸入日期。&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                                            ValidationGroup="typePrice"></asp:RequiredFieldValidator>
                                                        <asp:CustomValidator ID="CustomValidator1" runat="server" 
                                                            ControlToValidate="TextBox4" Display="Dynamic" 
                                                            ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;請輸入正確的日期&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                                            onservervalidate="CustomValidator1_ServerValidate" ValidationGroup="typePrice"></asp:CustomValidator>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" 
                                                            Text='<%# Eval("設定起始日期", "{0:yyyy/MM/dd}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="價格" SortExpression="價格">
                                                    <InsertItemTemplate>
                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("價格") %>' 
                                                            ValidationGroup="typePrice"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="validateRequiredFieldValidator" runat="server" 
                                                            ControlToValidate="TextBox3" Display="Dynamic" 
                                                            ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;請輸入價格&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                                            ValidationGroup="typePrice"></asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                                            ControlToValidate="TextBox3" Display="Dynamic" 
                                                            ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;請輸入正確的價格&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                                            Operator="GreaterThan" Type="Integer" ValidationGroup="typePrice" 
                                                            ValueToCompare="0"></asp:CompareValidator>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("價格") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ShowHeader="False">
                                                    <EditItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                                            CommandName="Update" Text="更新"></asp:LinkButton>
                                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                            CommandName="Cancel" Text="取消"></asp:LinkButton>
                                                    </EditItemTemplate>
                                                    <InsertItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                                            CommandName="Insert" Text="插入"></asp:LinkButton>
                                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                            CommandName="Cancel" Text="取消"></asp:LinkButton>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                            CommandName="New" Text="新增"></asp:LinkButton>
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
                                            DeleteCommand="DELETE FROM [售價] WHERE [產品id] = ? And [設定起始日期] = Cdate(?)" 
                                            InsertCommand="INSERT INTO [售價] ([產品id], [設定起始日期], [價格]) VALUES (?, CDate(?), ?)" 
                                            SelectCommand="SELECT [產品id], [設定起始日期], [價格] FROM [售價] where [產品id] = ? ORDER BY [設定起始日期] DESC" 
                                            UpdateCommand="UPDATE [售價] SET [價格] = ? WHERE [產品id] = ?">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="allProductGridView" Name="產品id" 
                                                    PropertyName="SelectedValue" />
                                            </SelectParameters>
                                            <DeleteParameters>
                                                <asp:Parameter Name="產品id" Type="Int32" />
                                                <asp:Parameter Name="設定起始日期" Type="DateTime" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="價格" Type="Int32" />
                                                <asp:Parameter Name="產品id" Type="Int32" />
                                                <asp:Parameter Name="設定起始日期" Type="DateTime" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:ControlParameter ControlID="allProductGridView" Name="產品id" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                                <asp:Parameter Name="設定起始日期" Type="DateTime" />
                                                <asp:Parameter Name="價格" Type="Int32" />
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
