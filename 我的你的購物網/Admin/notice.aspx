<%@ Page Title="公告管理" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminSite.Master" CodeBehind="notice.aspx.vb" 
Inherits="我的你的購物網.notice" ValidateRequest="false" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <!--#INCLUDE FILE="IsAdmin.aspx"-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        &nbsp;</p>
    <p>
        <b>所有公告</b></p>
    <asp:UpdatePanel ID="noticeUpdatePanel" runat="server">
        <ContentTemplate>
                    <asp:GridView ID="allNoticeGridView" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="id" DataSourceID="allnoticeBriefAccessDataSource" ForeColor="#333333" 
            GridLines="None">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="名稱" HeaderText="名稱" SortExpression="名稱" />
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <EmptyDataTemplate>
                目前沒有任何公告
            </EmptyDataTemplate>
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:AccessDataSource ID="allnoticeBriefAccessDataSource" runat="server" 
            ConflictDetection="CompareAllValues" DataFile="~/App_Data/MainDatabase.mdb" 
            DeleteCommand="DELETE FROM [公告] WHERE [id] = ? AND (([名稱] = ?) OR ([名稱] IS NULL AND ? IS NULL)) AND (([內容] = ?) OR ([內容] IS NULL AND ? IS NULL)) AND [發佈日期時間] = ? AND (([修改日期時間] = ?) OR ([修改日期時間] IS NULL AND ? IS NULL))" 
            InsertCommand="INSERT INTO [公告] ([id], [名稱], [內容]) VALUES (?, ?, ?)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT [id], [名稱], [內容], [發佈日期時間], [修改日期時間] FROM [公告]" 
            
            UpdateCommand="UPDATE [公告] SET [名稱] = ?, [內容] = ?, [修改日期時間] = Now() WHERE [id] = ?">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_名稱" Type="String" />
                <asp:Parameter Name="original_內容" Type="String" />
                <asp:Parameter Name="original_發佈日期時間" Type="DateTime" />
                <asp:Parameter Name="original_修改日期時間" Type="DateTime" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="名稱" Type="String" />
                <asp:Parameter Name="內容" Type="String" />
                <asp:Parameter Name="original_id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="名稱" Type="String" />
                <asp:Parameter Name="內容" Type="String" />
            </InsertParameters>
        </asp:AccessDataSource>
    <p><b>詳細內容</b></p>
        <asp:DetailsView ID="noticeDetailsView" runat="server" AutoGenerateRows="False" 
            CellPadding="4" DataKeyNames="id" DataSourceID="allnoticeAccessDataSource" 
            ForeColor="#333333" GridLines="None" Width="100%">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <RowStyle BackColor="#EFF3FB" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <EmptyDataTemplate>
                選擇上方一項公告
            </EmptyDataTemplate>
            <Fields>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowInsertButton="True" ValidationGroup="notice" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="名稱" HeaderText="名稱" SortExpression="名稱" />
                <asp:TemplateField HeaderText="內容" SortExpression="內容">
                    <EditItemTemplate>
                        <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Height="200px" 
                            Value='<%# Bind("內容", "{0}") %>' Width="100%" BasePath="~\fckeditor\">
                        </FCKeditorV2:FCKeditor>
                        <p style="color:Red;"><b>注意：輸入完請先按[儲存]按鈕，然後再按更新連結，才算更新完成。</b></p>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <FCKeditorV2:FCKeditor ID="FCKeditor2" runat="server" Height="200px" 
                            Value='<%# Bind("內容", "{0}") %>' Width="100%" BasePath="~\fckeditor\">
                        </FCKeditorV2:FCKeditor>
                        <p style="color:Red;"><b>注意：輸入完請先按[儲存]按鈕，然後再按更新連結，才算更新完成。</b></p>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("內容") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="發佈日期時間" SortExpression="發佈日期時間">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("發佈日期時間") %>'></asp:Label>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <% =Now()%>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("發佈日期時間") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="修改日期時間" SortExpression="修改日期時間">
                    <EditItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("修改日期時間") %>'></asp:Label>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        (公告修改後才會有修改時間)
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("修改日期時間") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowInsertButton="True" ValidationGroup="notice" />
            </Fields>
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:DetailsView>
        <asp:AccessDataSource ID="allnoticeAccessDataSource" runat="server" 
            ConflictDetection="CompareAllValues" DataFile="~/App_Data/MainDatabase.mdb" 
            DeleteCommand="DELETE FROM [公告] WHERE [id] = ?" 
            InsertCommand="INSERT INTO [公告] ([名稱], [內容]) VALUES (?, ?)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT [id], [名稱], [內容], [發佈日期時間], [修改日期時間] FROM [公告]
Where [id]=?" 
            
            UpdateCommand="UPDATE [公告] SET [名稱] = ?, [內容] = ?, [修改日期時間] = Now()
WHERE [id] = ?">
            <SelectParameters>
                <asp:ControlParameter ControlID="allNoticeGridView" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_名稱" Type="String" />
                <asp:Parameter Name="original_內容" Type="String" />
                <asp:Parameter Name="original_發佈日期時間" Type="DateTime" />
                <asp:Parameter Name="original_修改日期時間" Type="DateTime" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="名稱" Type="String" />
                <asp:Parameter Name="內容" Type="String" />
                <asp:Parameter Name="original_id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="名稱" Type="String" />
                <asp:Parameter Name="內容" Type="String" />
            </InsertParameters>
        </asp:AccessDataSource>&nbsp;

        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="noticeUpdateProgress" runat="server" AssociatedUpdatePanelID="noticeUpdatePanel">
        <ProgressTemplate>
                <p style="color:Red"><b>讀取中...</b></p>
        </ProgressTemplate>
    </asp:UpdateProgress>&nbsp;
</asp:Content>
