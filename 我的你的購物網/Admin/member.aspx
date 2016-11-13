<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminSite.Master" CodeBehind="member.aspx.vb" Inherits="我的你的購物網.member" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <!--#INCLUDE FILE="IsAdmin.aspx"-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>會員管理</h3>
    <asp:GridView ID="memberGridView" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="id" DataSourceID="memberAccessDataSource" ForeColor="#333333" 
        GridLines="None">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                SortExpression="id" />
            <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
            <asp:BoundField DataField="角色" HeaderText="角色" SortExpression="角色" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:AccessDataSource ID="memberAccessDataSource" runat="server" 
        DataFile="~/App_Data/MainDatabase.mdb" 
        
        SelectCommand="SELECT 人員.id, 人員.姓名, iif([性別]=True,'男','女') AS 會員性別 , 人員.生日, 人員.收件人, 人員.郵遞區號, 人員.地址, 人員.手機號碼, 人員.室內電話, 人員.身份證字號, 人員.密碼修改日期, 人員.資料修改日期, 角色.名稱 AS 角色, 會員等級.名稱
FROM 會員等級 
          INNER JOIN (角色 INNER JOIN (人員 INNER JOIN 人員_角色 ON 人員.id = 人員_角色.人員id) ON 角色.id = 人員_角色.角色id) ON 會員等級.id = 人員.會員等級id;"></asp:AccessDataSource>
    <br />
    會員-詳細資料<asp:DetailsView ID="memberDetailsView" runat="server" 
        AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" 
        DataSourceID="memberDetailAccessDataSource" ForeColor="#333333" 
        GridLines="None">
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
        <RowStyle BackColor="#E3EAEB" />
        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <EmptyDataTemplate>
            請先[選取]上方會員資料。
        </EmptyDataTemplate>
        <Fields>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                ReadOnly="True" SortExpression="id"></asp:BoundField>
            <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名">
            </asp:BoundField>
            <asp:TemplateField HeaderText="性別" SortExpression="性別">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList7" runat="server" 
                        SelectedValue='<%# Bind("性別") %>'>
                        <asp:ListItem Value="True">男</asp:ListItem>
                        <asp:ListItem Value="False">女</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("性別") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList6" runat="server" Enabled="False" 
                        SelectedValue='<%# Bind("性別") %>'>
                        <asp:ListItem Value="True">男</asp:ListItem>
                        <asp:ListItem Value="False">女</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="生日" SortExpression="生日">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("生日", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="TextBox1" DaysModeTitleFormat="yyyy年MM月" 
                        DefaultView="Years" Format="yyyy/MM/dd" TodaysDateFormat="yyyy/MM/dd">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("生日", "{0:d}") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("生日", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="收件人" HeaderText="收件人" SortExpression="收件人" />
            <asp:BoundField DataField="郵遞區號" HeaderText="郵遞區號" SortExpression="郵遞區號">
            </asp:BoundField>
            <asp:BoundField DataField="地址" HeaderText="地址" SortExpression="地址">
            </asp:BoundField>
            <asp:BoundField DataField="手機號碼" HeaderText="手機號碼" SortExpression="手機號碼">
            </asp:BoundField>
            <asp:BoundField DataField="室內電話" HeaderText="室內電話" SortExpression="室內電話">
            </asp:BoundField>
            <asp:BoundField DataField="身份證字號" HeaderText="身份證字號" SortExpression="身份證字號">
            </asp:BoundField>
            <asp:BoundField DataField="密碼修改日期" HeaderText="密碼修改日期" 
                NullDisplayText="(密碼未曾修改過)" ReadOnly="True" SortExpression="密碼修改日期">
            </asp:BoundField>
            <asp:BoundField DataField="資料修改日期" HeaderText="資料修改日期" 
                NullDisplayText="(資料未曾修改過)" ReadOnly="True" SortExpression="資料修改日期">
            </asp:BoundField>
            <asp:TemplateField HeaderText="角色id" SortExpression="角色id">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="AccessDataSource1" DataTextField="名稱" DataValueField="id" 
                        SelectedValue='<%# Bind("角色id") %>'>
                    </asp:DropDownList>
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                        DataFile="~/App_Data/MainDatabase.mdb" 
                        SelectCommand="SELECT [id], [名稱] FROM [角色]"></asp:AccessDataSource>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("角色id") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" 
                        DataSourceID="AccessDataSource3" DataTextField="名稱" DataValueField="id" 
                        Enabled="False" SelectedValue='<%# Bind("角色id") %>'>
                    </asp:DropDownList>
                    <asp:AccessDataSource ID="AccessDataSource3" runat="server" 
                        DataFile="~/App_Data/MainDatabase.mdb" 
                        SelectCommand="SELECT [id], [名稱] FROM [角色]"></asp:AccessDataSource>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="會員等級id" SortExpression="會員等級id">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" 
                        DataSourceID="AccessDataSource2" DataTextField="名稱" DataValueField="id" 
                        SelectedValue='<%# Bind("會員等級id") %>'>
                    </asp:DropDownList>
                    <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                        DataFile="~/App_Data/MainDatabase.mdb" 
                        SelectCommand="SELECT [id], [名稱] FROM [會員等級]"></asp:AccessDataSource>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("會員等級id") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList5" runat="server" 
                        DataSourceID="AccessDataSource4" DataTextField="名稱" DataValueField="id" 
                        Enabled="False" SelectedValue='<%# Bind("會員等級id", "{0}") %>'>
                    </asp:DropDownList>
                    <asp:AccessDataSource ID="AccessDataSource4" runat="server" 
                        DataFile="~/App_Data/MainDatabase.mdb" 
                        SelectCommand="SELECT [id], [名稱] FROM [會員等級]"></asp:AccessDataSource>
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
                        CommandName="Delete" onclientclick="return Confirm('確定刪除嗎？')" Text="刪除"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <AlternatingRowStyle BackColor="White" />
    </asp:DetailsView>
    <asp:AccessDataSource ID="memberDetailAccessDataSource" runat="server" 
        DataFile="~/App_Data/MainDatabase.mdb" 
        DeleteCommand="DELETE  FROM  人員 WHERE id=?;" SelectCommand="SELECT 人員.id, 人員.姓名,性別, 人員.生日, 人員.收件人, 人員.郵遞區號, 人員.地址, 人員.手機號碼, 人員.室內電話, 人員.身份證字號, 人員.密碼修改日期, 人員.資料修改日期, 人員_角色.角色id, 人員.會員等級id
FROM 角色 INNER JOIN ((會員等級 INNER JOIN 人員 ON 會員等級.id = 人員.會員等級id) INNER JOIN 人員_角色 ON 人員.id = 人員_角色.人員id) ON 角色.id = 人員_角色.角色id
WHERE 人員.id=?;
" UpdateCommand="UPDATE 人員 SET 姓名=?, 性別=CBool(?),生日=CDATE(?),收件人=?,郵遞區號=?,地址=?,手機號碼=?,室內電話=?,身份證字號=?,資料修改日期=Now(),會員等級id=?
WHERE 人員.id=?;">
        <SelectParameters>
            <asp:ControlParameter ControlID="memberGridView" Name="?" 
                PropertyName="SelectedValue" />
        </SelectParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="memberDetailsView" Name="id" 
                PropertyName="SelectedValue" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="姓名" />
            <asp:Parameter Name="性別" />
            <asp:Parameter Name="生日" />
            <asp:Parameter Name="收件人" />
            <asp:Parameter Name="郵遞區號" />
            <asp:Parameter Name="地址" />
            <asp:Parameter Name="手機號碼" />
            <asp:Parameter Name="室內電話" />
            <asp:Parameter Name="身份證字號" />
            <asp:Parameter Name="會員等級id" />
            <asp:ControlParameter ControlID="memberDetailsView" Name="人員.id" 
                PropertyName="SelectedValue" />
        </UpdateParameters>
    </asp:AccessDataSource>
    <DotNetAge:Dialog ID="Dialog1" runat="server" Title="[DialogTitle]">
    </DotNetAge:Dialog>
</asp:Content>
