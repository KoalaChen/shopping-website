<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Member/MemberSite.Master" CodeBehind="personal_information.aspx.vb" Inherits="我的你的購物網.personal_information" 
    title="個人資料修改" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <!--#INCLUDE FILE="IsMember.aspx"-->
    <style type="text/css">
        .style2
        {
            color: #FF0000;
        }
        .style3
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>個人資料修改</h3>
    <asp:UpdatePanel ID="personalInfoUpdatePanel" runat="server">
        <ContentTemplate>
            <asp:DetailsView ID="personalInfoDetailsView" runat="server" 
                AutoGenerateRows="False" CellPadding="4" DataKeyNames="id" 
                DataSourceID="personalInfoAccessDataSource" ForeColor="#333333" 
                GridLines="None" Height="50px">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <Fields>
                    <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                    <asp:BoundField DataField="性別名稱" HeaderText="性別" ReadOnly="True" 
                        SortExpression="性別名稱" />
                    <asp:BoundField DataField="生日" DataFormatString="{0:d}" HeaderText="生日" 
                        ReadOnly="True" SortExpression="生日" />
                    <asp:BoundField DataField="收件人" HeaderText="收件人" SortExpression="收件人" />
                    <asp:BoundField DataField="郵遞區號" HeaderText="郵遞區號" SortExpression="郵遞區號" />
                    <asp:BoundField DataField="地址" HeaderText="地址" SortExpression="地址" />
                    <asp:BoundField DataField="手機號碼" HeaderText="手機號碼" SortExpression="手機號碼" />
                    <asp:BoundField DataField="室內電話" HeaderText="室內電話" SortExpression="室內電話" />
                    <asp:BoundField DataField="身份證字號" HeaderText="身份證字號" ReadOnly="True" 
                        SortExpression="身份證字號" />
                    <asp:BoundField DataField="會員等級" HeaderText="會員等級" ReadOnly="True" 
                        SortExpression="會員等級" />
                    <asp:CommandField ShowEditButton="True" />
                </Fields>
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:DetailsView>
            <br />
            <asp:AccessDataSource ID="personalInfoAccessDataSource" runat="server" 
                DataFile="~/App_Data/MainDatabase.mdb" 
                DeleteCommand="DELETE FROM [人員] WHERE [id] = ?" 
                
                InsertCommand="INSERT INTO [人員] ([id], [密碼], [姓名], [性別], [生日], [收件人], [郵遞區號], [地址], [手機號碼], [室內電話], [身份證字號], [會員等級id]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" SelectCommand="SELECT 人員.id, 人員.姓名, IIf([性別]=True,'男','女') AS 性別名稱, 人員.生日, 人員.收件人, 人員.郵遞區號, 人員.地址, 人員.手機號碼, 人員.室內電話,  Left([身份證字號],4) &amp; &quot;xxxxxx&quot; AS 身份證字號, 會員等級.名稱 AS 會員等級
FROM 會員等級 INNER JOIN 人員 ON 會員等級.id = 人員.會員等級id
WHERE (((人員.id)=?));" 
                
                UpdateCommand="UPDATE [人員] SET [姓名] = ?, [收件人] = ?, [郵遞區號] = ?, [地址] = ?, [手機號碼] = ?, [室內電話] = ?  WHERE [id] = ?">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="?" SessionField="member_Id" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="姓名" Type="String" />
                    <asp:Parameter Name="收件人" Type="String" />
                    <asp:Parameter Name="郵遞區號" Type="String" />
                    <asp:Parameter Name="地址" Type="String" />
                    <asp:Parameter Name="手機號碼" Type="String" />
                    <asp:Parameter Name="室內電話" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:Parameter Name="密碼" Type="String" />
                    <asp:Parameter Name="姓名" Type="String" />
                    <asp:Parameter Name="性別" Type="Boolean" />
                    <asp:Parameter Name="生日" Type="DateTime" />
                    <asp:Parameter Name="收件人" Type="String" />
                    <asp:Parameter Name="郵遞區號" Type="String" />
                    <asp:Parameter Name="地址" Type="String" />
                    <asp:Parameter Name="手機號碼" Type="String" />
                    <asp:Parameter Name="室內電話" Type="String" />
                    <asp:Parameter Name="身份證字號" Type="String" />
                    <asp:Parameter Name="會員等級id" Type="Int32" />
                </InsertParameters>
            </asp:AccessDataSource>
            <h3>密碼修改</h3><table>
                <tr>
                    <td class="style3">
                        舊密碼</td>
                    <td class="style3">
                        <asp:TextBox ID="oldPasswordTextBox" runat="server" TextMode="Password" 
                            ValidationGroup="typeNewPassword"></asp:TextBox>
                    </td>
                    <td class="style3">
                        <asp:CustomValidator ID="oldPasswordCustomValidator" runat="server" 
                            ControlToValidate="oldPasswordTextBox"
                            ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=
                                    &quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error 
                                    ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;
                                    float: left; margin-right: 0.3em;&quot; 
                                    class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;&lt;strong&gt;
                                    &lt;/strong&gt;密碼輸入錯誤&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                            ValidationGroup="typeNewPassword" SetFocusOnError="True"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        新密碼</td>
                    <td>
                        <asp:TextBox ID="resetPasswordTextBox" runat="server" TextMode="Password" 
                            ValidationGroup="typeNewPassword"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="resetPasswordTextBox" Display="Dynamic" 
                            ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=
                                    &quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error 
                                    ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;
                                    float: left; margin-right: 0.3em;&quot; 
                                    class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;&lt;strong&gt;
                                    &lt;/strong&gt;密碼未輸入&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                            ValidationGroup="typeNewPassword" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="resetPasswordTextBox" Display="Dynamic" 
                            ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=
                                    &quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error 
                                    ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;
                                    float: left; margin-right: 0.3em;&quot; 
                                    class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;&lt;strong&gt;
                                    &lt;/strong&gt;密碼格式錯誤&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                            ValidationExpression="^[a-zA-Z]{1}[a-zA-Z0-9]{7,14}" 
                            ValidationGroup="typeNewPassword" SetFocusOnError="True" ToolTip="第一個字為英文"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        再次輸入新密碼</td>
                    <td>
                        <asp:TextBox ID="confirmPasswordTextBox" runat="server" TextMode="Password" 
                            ValidationGroup="typeNewPassword"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="confirmPasswordTextBox" Display="Dynamic" 
                            ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=
                                    &quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error 
                                    ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;
                                    float: left; margin-right: 0.3em;&quot; 
                                    class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;&lt;strong&gt;
                                    &lt;/strong&gt;請再次輸入新密碼&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                            ValidationGroup="typeNewPassword" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToCompare="resetPasswordTextBox" 
                            ControlToValidate="confirmPasswordTextBox" Display="Dynamic" 
                            ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=
                                    &quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error 
                                    ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;
                                    float: left; margin-right: 0.3em;&quot; 
                                    class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;&lt;strong&gt;
                                    &lt;/strong&gt;密碼二次不相同&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                            ValidationGroup="typeNewPassword" SetFocusOnError="True"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="resetPasswordButton" runat="server" Text="修改" Height="21px" 
                            ValidationGroup="typeNewPassword" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            Ps.若要更改E-Mail，請至[<asp:LinkButton ID="emailLinkLinkButton" runat="server" 
                PostBackUrl="~/Member/email_link.aspx">帳號連結</asp:LinkButton>
            ]修改<DotNetAge:Dialog ID="Dialog1" runat="server" Title="[DialogTitle]">
                <BodyTemplate>
                    <div style="margin:10px">
                        <div style="vertical-align: middle; height: 64px; padding-left: 40px; background: transparent url() no-repeat;">
                        </div>
                    </div>
                </BodyTemplate>
                <Trigger Selector="" />
            </DotNetAge:Dialog>
        </ContentTemplate>
    
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="personalInfoUpdateProgress" runat="server" 
        AssociatedUpdatePanelID="personalInfoUpdatePanel">
        <ProgressTemplate>
            <span class="style2">更新中...</span>
        </ProgressTemplate>
    
    </asp:UpdateProgress>
</asp:Content>
