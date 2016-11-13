<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Member/MemberSite.Master" CodeBehind="defect_report.aspx.vb" Inherits="我的你的購物網.comments_to_admin" 
    title="問題回報" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <!--#INCLUDE FILE="IsMember.aspx"-->
    <style type="text/css">
        .reply
        {
            width: 80%;
            border-style: dashed;
            border-width: 2px;
        }
        .style2
        {
            color: #FF3300;
            font-weight: bold;
        }
        .style3
        {
            color: #0066FF;
            font-weight: bold;
        }
        .style4
        {
            color: #FF9900;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>錯誤回報</h3>
    <asp:UpdatePanel id="defectUpdatePanel" runat="server">
        <ContentTemplate>
            <asp:MultiView ID="defectMultiView" runat="server" ActiveViewIndex="0">
                <asp:View ID="defectView" runat="server">
                    <table align="center" style="width:50%">
                        <tr>
                            <td>
                                <span class="style4"><b>留言</b></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="contentTextBox" runat="server" CssClass="reply" Height="100px" 
                                    TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="submitButton" runat="server" Text="送出" />
                            </td>
                        </tr>
                    </table>
                    <br />
        <table align="center" style="width:50%">
        <tr>
            <td>
                <span class="style3">最近的留言</span>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ListView ID="defectListView" runat="server" DataKeyNames="id" 
                    DataSourceID="defectAccessDataSource" style="margin-top: 0px">
                    <ItemTemplate>
                        <asp:Label ID="會員留言Label" runat="server" Text='<%# Eval("會員留言") %>'></asp:Label>
                                    <p style="display:inline; float:right; margin-left:0px; margin-top: 0pt; margin-bottom: 0pt;">
                                        <asp:Label ID="留言日期Label" runat="server" Text='<%# Eval("留言日期","您於 {0:yyyy/MM/dd hh:MM:ss} 留言") %>'></asp:Label>
                                    </p>
                                <table style="width:100%;">
                                    <tr>
                                        <td>
                                            <asp:Label ID="管理者留言Label" runat="server" Text='<%# Eval("管理者留言") %>' 
                                                style="font-weight: 700"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border-bottom-style: dashed; border-bottom-width: 1px">
                                            <p style="display:inline; float:right; margin-left:0px; margin-top: 0pt; margin-bottom: 0pt;">
                                                <asp:Label ID="回覆日期Label" runat="server" 
                                                    Text='<%# Eval("回覆日期", "管理員於 {0:yyyy/MM/dd hh:MM:ss} 回覆") %>' 
                                                    style="color: #CC6600; font-weight: 700"></asp:Label>
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <asp:Label ID="會員留言Label" runat="server" Text='<%# Eval("會員留言") %>'></asp:Label>
                                <p style="display:inline; float:right; margin-left:0px; margin-top: 0pt; margin-bottom: 0pt;">
                                    <asp:Label ID="留言日期Label" runat="server" Text='<%# Eval("留言日期","您於 {0:yyyy/MM/dd hh:MM:ss} 留言") %>'></asp:Label>
                                </p>
                                <table style="width:100%;">
                                    <tr>
                                        <td>
                                            <asp:Label ID="管理者留言Label" runat="server" Text='<%# Eval("管理者留言") %>' 
                                                style="font-weight: 700"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border-bottom-style: dashed; border-bottom-width: 1px">
                                            <p style="display:inline; float:right; margin-left:0px; margin-top: 0pt; margin-bottom: 0pt;">
                                                <asp:Label ID="回覆日期Label" runat="server" 
                                                    Text='<%# Eval("回覆日期", "管理員於 {0:yyyy/MM/dd hh:MM:ss} 回覆") %>' 
                                                    style="color: #CC6600; font-weight: 700"></asp:Label>
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                    </AlternatingItemTemplate>
                    <EmptyDataTemplate>
                        目前，<span>您並沒有寫任何留言。</span>
                    </EmptyDataTemplate>
                    <LayoutTemplate>
                        <div ID="itemPlaceholderContainer" runat="server" style="">
                            <table style="width:100%">
                                <tr>
                                    <td>
                                            <span ID="itemPlaceholder" runat="server"></span>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                        ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:AccessDataSource ID="defectAccessDataSource" runat="server" 
                    DataFile="~/App_Data/MainDatabase.mdb" 
                    SelectCommand="SELECT [id], [會員id], [會員留言], [留言日期], [管理者留言], [回覆日期] FROM [網站留言] WHERE ([會員id] = ?)
ORDER BY [留言日期] DESC">
                    <SelectParameters>
                        <asp:SessionParameter Name="會員id" SessionField="member_Id" Type="Int32" />
                    </SelectParameters>
                </asp:AccessDataSource>
            </td>
        </tr>
    </table>
                </asp:View>
        </asp:MultiView>
                        <DotNetAge:Dialog ID="Dialog1" runat="server" Title="[DialogTitle]">
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
    <asp:UpdateProgress ID="defectUpdateProgress" runat="server" AssociatedUpdatePanelID="defectUpdatePanel">
        <ProgressTemplate>
            <span class="style2">更新中...</span>
        </ProgressTemplate>
    </asp:UpdateProgress>
        <asp:UpdatePanelAnimationExtender ID="defectUpdatePanelAnimationExtender" 
        runat="server" TargetControlID="defectUpdatePanel">
        <Animations>
            <OnUpdating>
                <Sequence>
                    <Parallel duration="0">
                        <EnableAction AnimationTarget="contentTextBox" Enabled="false" />
                        <EnableAction AnimationTarget="submitButton" Enabled="false" />
                    </Parallel>
                </Sequence>
            </OnUpdating>
            <OnUpdated>
                <Sequence>
                    <Parallel duration="0">
                        <EnableAction AnimationTarget="contentTextBox" Enabled="true" />
                        <EnableAction AnimationTarget="submitButton" Enabled="true" />
                    </Parallel>                            
                </Sequence>
            </OnUpdated>
            
        </Animations>
    </asp:UpdatePanelAnimationExtender>

        <br />
</asp:Content>
