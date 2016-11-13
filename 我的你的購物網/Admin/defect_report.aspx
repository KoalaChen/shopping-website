<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminSite.Master" CodeBehind="defect_report.aspx.vb" Inherits="我的你的購物網.defect_report" 
    title="問題回報管理" ValidateRequest="false" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <!--#INCLUDE FILE="IsAdmin.aspx"-->
    <style type="text/css">
        .style2
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h2>問題回報</h2>
    <p><b>請選擇留言</b></p>
    <asp:UpdatePanel ID="defectUpdatePanel" runat="server">
        <ContentTemplate>
            <asp:GridView id="defectGridView" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataSourceID="defectAccessDataSource" ForeColor="#333333" GridLines="None" 
                DataKeyNames="id">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                        SortExpression="id" />
                    <asp:BoundField DataField="會員id" HeaderText="會員id" SortExpression="會員id" />
                    <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                    <asp:BoundField DataField="會員留言" HeaderText="會員留言" SortExpression="會員留言" />
                    <asp:BoundField DataField="留言日期" HeaderText="留言日期" SortExpression="留言日期" />
                    <asp:BoundField DataField="管理者留言" HeaderText="管理者留言" SortExpression="管理者留言" />
                    <asp:BoundField DataField="回覆日期" HeaderText="回覆日期" SortExpression="回覆日期" />
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    目前沒有使用者回報。
                </EmptyDataTemplate>
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
        <asp:AccessDataSource ID="defectAccessDataSource" runat="server" 
                DataFile="~/App_Data/MainDatabase.mdb" 
                DeleteCommand="DELETE FROM 網站留言 WHERE id=?" SelectCommand="SELECT 網站留言.id, 網站留言.會員id, 人員.姓名, 網站留言.會員留言, 網站留言.留言日期, 網站留言.管理者留言, 網站留言.回覆日期
FROM 人員 INNER JOIN 網站留言 ON 人員.id = 網站留言.會員id
ORDER BY 留言日期 DESC;
" UpdateCommand="UPDATE 網站留言
SET 回覆日期=now() , 管理者留言=?
WHERE 網站留言.id=?">
            <UpdateParameters>
                <asp:Parameter Name="管理者留言" />
                <asp:Parameter Name="id" />
            </UpdateParameters>
            </asp:AccessDataSource>
            <br />
            <p><b>輸入管理者留言／刪除此筆記錄</b></p>
            <asp:DetailsView ID="defectDetailDetailsView" runat="server" 
                AutoGenerateRows="False" CellPadding="4" DataSourceID="updateDefectAccessDataSource" 
                ForeColor="#333333" GridLines="None" DataKeyNames="id" Width="80%">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    請選擇一項記錄。
                </EmptyDataTemplate>
                <Fields>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                        SortExpression="id" ReadOnly="True" />
                    <asp:BoundField DataField="姓名" HeaderText="姓名" ReadOnly="True" 
                        SortExpression="姓名" />
                    <asp:BoundField DataField="會員留言" HeaderText="會員留言" ReadOnly="True" 
                        SortExpression="會員留言" />
                    <asp:BoundField DataField="留言日期" HeaderText="留言日期" ReadOnly="True" 
                        SortExpression="留言日期" />
                    <asp:BoundField DataField="管理者留言" HeaderText="管理者留言" SortExpression="管理者留言" />
                    <asp:TemplateField HeaderText="回覆日期" SortExpression="回覆日期">
                        <EditItemTemplate>
                            現在時間
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            現在時間
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("回覆日期") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Fields>
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:DetailsView>
            <br />
            <asp:AccessDataSource ID="updateDefectAccessDataSource" runat="server" 
                DataFile="~/App_Data/MainDatabase.mdb" 
                DeleteCommand="DELETE FROM 網站留言 WHERE id=?" SelectCommand="SELECT 網站留言.id, 網站留言.會員id, 人員.姓名, 網站留言.會員留言, 網站留言.留言日期, 網站留言.管理者留言, 網站留言.回覆日期
FROM 人員 INNER JOIN 網站留言 ON 人員.id = 網站留言.會員id
WHERE 網站留言.id=?
ORDER BY 留言日期 DESC;
" UpdateCommand="UPDATE 網站留言
SET 回覆日期=now() , 管理者留言=?
WHERE 網站留言.id=?" ConflictDetection="CompareAllValues">
                <SelectParameters>
                    <asp:ControlParameter ControlID="defectGridView" Name="?" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="管理者留言" />
                    <asp:Parameter Name="id" />
                </UpdateParameters>
            </asp:AccessDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="defectUpdateProgress" runat="server" AssociatedUpdatePanelID="defectUpdatePanel">
        <ProgressTemplate>
            <span class="style2">執行中...</span>
        </ProgressTemplate>
    </asp:UpdateProgress>
    &nbsp;
</asp:Content>
