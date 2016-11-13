<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Member/MemberSite.Master" CodeBehind="cart.aspx.vb" Inherits="我的你的購物網.cart" 
    title="購物車" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <!--#INCLUDE FILE="IsMember.aspx"-->
    <style type="text/css">
        .style5
        {
            color: #FF0000;
        }
        .style6
        {
            width: 300px;
        }
        .style7
        {
            color: #CC0000;
        }
        .style8
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="color:Red;">我的購物</h2>
    <asp:UpdatePanel ID="mainUpdatePanel" runat="server">
        <ContentTemplate>
            <table class="style1">
                <tr>
                    <td>
                        <asp:Label ID="StepLabel" runat="server"></asp:Label>
                        </td>
                </tr>
                <tr>
                    <td>
            <asp:MultiView ID="CartMultiView" runat="server" ActiveViewIndex="0">
            <asp:View ID="NoItemView" runat="server">
                <h3>目前沒有選擇任何商品：</h3>
                <br />
                您的購物車沒有任何產品，請回<asp:HyperLink ID="ProductHyperLink" runat="server" 
                    NavigateUrl="~/Default.aspx">產品頁</asp:HyperLink>
                選擇產品。
            </asp:View>
            <asp:View ID="OrderItemView" runat="server">
                <h3>以下是您的訂購明細：</h3>
                <asp:GridView ID="CartGridView" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" datasourceid="OrderItemAccessDataSource" 
                    ForeColor="#333333" GridLines="None" ShowFooter="True">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="編號" ReadOnly="True" 
                            SortExpression="id" />
                        <asp:BoundField DataField="名稱" HeaderText="名稱" SortExpression="名稱" />
                        <asp:BoundField DataField="價格" HeaderText="價格" SortExpression="價格" />
                        <asp:TemplateField HeaderText="數量">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox3" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="QtyTextBox" runat="server" Width="50px" 
                                    ValidationGroup="Qty" />
                                <asp:RequiredFieldValidator ID="QtyRequiredFieldValidator1" runat="server" 
                                    Display="Dynamic" ErrorMessage="請輸入數量" ValidationGroup="Qty" 
                                    ControlToValidate="QtyTextBox"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="qtyRangeValidator" runat="server" 
                                    ControlToValidate="QtyTextBox" Display="Dynamic" ErrorMessage="請輸入1-999的值" 
                                    MaximumValue="999" MinimumValue="1" Type="Integer" ValidationGroup="qty"></asp:RangeValidator>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="小計"></asp:TemplateField>
                        <asp:TemplateField HeaderText="刪除">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox4" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="delLinkButton" runat="server" CommandArgument='<%# Eval("id") %>' 
                                    CommandName="del">刪除</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        目前沒有任何選擇商品，請回<asp:HyperLink ID="ProductHyperLink" runat="server" 
                            NavigateUrl="~/Default.aspx">產品頁</asp:HyperLink>
                        選擇商品
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:AccessDataSource ID="OrderItemAccessDataSource" runat="server" 
                    DataFile="~/App_Data/MainDatabase.mdb" 
                    SelectCommand="SELECT 產品.id, 產品.名稱,
            (
                SELECT 售價.價格
                FROM 售價
                WHERE 售價.設定起始日期=
                (
                    SELECT Max(售價.設定起始日期) AS 設定起始日期之最大值
                    FROM 售價
                    WHERE 售價.[產品id]=產品.id AND 售價.設定起始日期&lt;=now();
                )AND 產品id=產品.id
            )
             AS 價格
            FROM 產品"></asp:AccessDataSource>
                <br />
                <asp:Button ID="UpdateCartButton" runat="server" Text="修正數量後，請按此以完成變更" 
                    UseSubmitBehavior="False" ValidationGroup="qty" />
                <br />
                <br />
                <asp:LinkButton ID="NextStepLinkButton" runat="server">下一步：開始結帳</asp:LinkButton>
            </asp:View>
            <asp:View ID="personalInfoView" runat="server">
                <h3>請輸入您的聯絡資料：</h3>
                <br />
                    [
                    <span class="style5">*</span>
                        為必填欄位]
                    <table>
                    <tr>
                        <td class="style5">
                            *</td>
                        <td>
                            收件人姓名<b>：</b></td>
                        <td class="style6">
                            <b>
                            <asp:TextBox ID="NameTextBox" runat="server" Width="100%" Wrap="False"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="NameTextBox_TextBoxWatermarkExtender" 
                                runat="server" Enabled="True" TargetControlID="NameTextBox" 
                                WatermarkCssClass="watermarked" WatermarkText="輸入收件人姓名">
                            </asp:TextBoxWatermarkExtender>
                            </b>
                        </td>
                        <td>
                            <b>
                            <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" 
                                ControlToValidate="NameTextBox" Display="Dynamic" ErrorMessage="請輸入姓名" 
                                ValidationGroup="cart"></asp:RequiredFieldValidator>
                            </b>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            *</td>
                        <td>
                            收件人手機號碼<b>：</b></td>
                        <td class="style6">
                            <asp:TextBox ID="PhoneTextBox" runat="server" Width="100%"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="PhoneTextBox_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="PhoneTextBox" 
                                    WatermarkCssClass="watermarked" WatermarkText="範例09xx-xxx-xxx">
                                </asp:TextBoxWatermarkExtender>
                                    <asp:MaskedEditExtender ID="CellPhoneTextBox_MaskedEditExtender" runat="server" 
                                    Mask="9999-999-999" TargetControlID="PhoneTextBox">
                                </asp:MaskedEditExtender>
                        </td>
                        <td>
                            <b>
                            <asp:RequiredFieldValidator ID="PhoneRequiredFieldValidator" runat="server" 
                                ControlToValidate="PhoneTextBox" Display="Dynamic" ErrorMessage="請輸入電話" 
                                ValidationGroup="cart"></asp:RequiredFieldValidator>
                            </b>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="PhoneTextBox" Display="Dynamic" ErrorMessage="格式不符" 
                                style="font-weight: 700" 
                                
                                ValidationExpression="^(09)[0-9]{8}" 
                                ValidationGroup="cart"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td>
                            收件人室內電話：</td>
                        <td class="style6">
                            <asp:TextBox ID="homePhoneTextBox" runat="server" Width="100%"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="homePhoneTextBox_TextBoxWatermarkExtender" 
                                runat="server" Enabled="True" TargetControlID="homePhoneTextBox" 
                                WatermarkCssClass="watermarked" WatermarkText="範例(0x)xxxx-xxxx">
                            </asp:TextBoxWatermarkExtender>
                        </td>
                        <td>
                            <b>
                                <asp:MaskedEditExtender ID="HomePhoneTextbox_MaskedEditExtender" runat="server" 
                                Mask="\(99\)9999\-9999" TargetControlID="HomePhoneTextbox"></asp:MaskedEditExtender>
                                    <asp:RegularExpressionValidator ID="HomePhoneRegularExpressionValidator" 
                                    runat="server" ControlToValidate="HomePhoneTextBox" Display="Dynamic" 
                                    ErrorMessage="＃輸入格式錯誤，請檢查" ValidationExpression="^(0)[0-9]{9}" 
                                    ValidationGroup="cart"></asp:RegularExpressionValidator>

                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="PhoneTextBox" Display="Dynamic" ErrorMessage="格式不符" 
                                style="font-weight: 700" 
                                ValidationExpression="((\d{10})|(((\(\d{2}\))|(\d{2}-))?\d{4}(-)?\d{3}(\d)?))" 
                                ValidationGroup="Cart"></asp:RegularExpressionValidator>
                            </b>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            *</td>
                        <td>
                            電子郵件<b>：</b></td>
                        <td class="style6">
                            <b>
                            <asp:TextBox ID="EMailTextBox" runat="server" Width="100%"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="EMailTextBox_TextBoxWatermarkExtender" 
                                runat="server" Enabled="True" TargetControlID="EMailTextBox" 
                                WatermarkCssClass="watermarked" WatermarkText="輸入電子郵件">
                            </asp:TextBoxWatermarkExtender>
                            </b>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="EMailRequiredFieldValidator" runat="server" 
                                ControlToValidate="EMailTextBox" Display="Dynamic" ErrorMessage="請輸入電子郵件" 
                                style="font-weight: 700" ValidationGroup="cart"></asp:RequiredFieldValidator>
                            <b>
                            <asp:RegularExpressionValidator ID="EMailRegularExpressionValidator" 
                                runat="server" ControlToValidate="EMailTextBox" Display="Dynamic" 
                                ErrorMessage="請輸入正確EMAIL格式" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="cart"></asp:RegularExpressionValidator>
                            </b>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            *</td>
                        <td>
                            付款方式<b>：</b></td>
                        <td class="style6">
                            <asp:DropDownList ID="paywayDropDownList" runat="server" 
                                Width="100%" DataSourceID="payWayAccessDataSource" DataTextField="值" 
                                DataValueField="id">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:AccessDataSource ID="payWayAccessDataSource" runat="server" 
                                DataFile="~/App_Data/MainDatabase.mdb" 
                                SelectCommand="SELECT [id], [值] FROM [付款方式]"></asp:AccessDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            *</td>
                        <td>
                            取貨方式：</td>
                        <td class="style6">
                            <asp:DropDownList ID="getwayDropDownList" runat="server" 
                                DataSourceID="getWayAccessDataSource" DataTextField="方式" DataValueField="id" 
                                Height="19px" Width="100%">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:AccessDataSource ID="getWayAccessDataSource" runat="server" 
                                DataFile="~/App_Data/MainDatabase.mdb" 
                                SelectCommand="SELECT [id], [值]&amp;iif([多少元以上免運費]=0,&quot;[免運費]&quot;,&quot;[消費滿&quot;&amp;[多少元以上免運費]&amp;&quot;元以上免運費]&quot;) As 方式 FROM [取貨方式]">
                            </asp:AccessDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            *</td>
                        <td>
                            郵遞區號：</td>
                        <td class="style6">
                            <b>
                            <asp:TextBox ID="zipCodeTextBox" runat="server" Width="100%"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="zipCodeTextBox_TextBoxWatermarkExtender" 
                                runat="server" Enabled="True" TargetControlID="zipCodeTextBox" 
                                WatermarkCssClass="watermarked" WatermarkText="輸入郵遞區號">
                            </asp:TextBoxWatermarkExtender>
                            </b>
                        </td>
                        <td>
                            <b>
                            <asp:RequiredFieldValidator ID="AddressRequiredFieldValidator0" runat="server" 
                                ControlToValidate="AddressTextBox" Display="Dynamic" ErrorMessage="請輸入郵遞區號" 
                                ValidationGroup="cart"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="ZipCodeRegularExpressionValidator" 
                                runat="server" ControlToValidate="zipCodeTextBox" Display="Dynamic" 
                                ErrorMessage="請輸入正確郵遞區號(3碼或5碼)" ValidationExpression="^\d{5}$|^\d{3}$" 
                                ValidationGroup="cart"></asp:RegularExpressionValidator>
                            </b></td>
                    </tr>
                    <tr>
                        <td class="style5">
                            *</td>
                        <td>
                            取貨地址<b>：</b></td>
                        <td class="style6">
                            <b>
                            <asp:TextBox ID="AddressTextBox" runat="server" Width="100%"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="AddressTextBox_TextBoxWatermarkExtender" 
                                runat="server" Enabled="True" TargetControlID="AddressTextBox" 
                                WatermarkCssClass="watermarked" WatermarkText="輸入取貨地址">
                            </asp:TextBoxWatermarkExtender>
                            </b>
                        </td>
                        <td>
                            <b>
                            <asp:RequiredFieldValidator ID="AddressRequiredFieldValidator" runat="server" 
                                ControlToValidate="AddressTextBox" Display="Dynamic" ErrorMessage="請輸入地址" 
                                ValidationGroup="cart"></asp:RequiredFieldValidator>
                            </b></td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td>
                            備忘留言<b>：</b></td>
                        <td class="style6">
                            <asp:TextBox ID="NoteTextBox" runat="server" Height="55px" TextMode="MultiLine" 
                                Width="100%"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="NoteTextBox_TextBoxWatermarkExtender" 
                                runat="server" Enabled="True" TargetControlID="NoteTextBox" 
                                WatermarkCssClass="watermarked" WatermarkText="輸入給管理者的留言">
                            </asp:TextBoxWatermarkExtender>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    </table>
                <br />
                <asp:LinkButton ID="BackCartLinkButton" runat="server" 
                    PostBackUrl="~/Member/Cart.aspx">&lt;返回購物車</asp:LinkButton>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton 
                    ID="NextView2LinkButton" runat="server" ValidationGroup="cart">下一步&gt;</asp:LinkButton>
            </asp:View>
            <asp:View ID="confirmInfoView" runat="server">
            <h3>請再次確認-訂購明細-與-聯絡資料-：</h3>
            <asp:GridView ID="OrderGridView" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataKeyNames="id" DataSourceID="OrderAccessDataSource" 
                ForeColor="#333333" GridLines="None" ShowFooter="True" Width="339px">
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="編號" ReadOnly="True" 
                        SortExpression="id" />
                    <asp:BoundField DataField="名稱" HeaderText="名稱" SortExpression="名稱" />
                    <asp:BoundField DataField="價格" HeaderText="價格" SortExpression="價格" />
                    <asp:TemplateField HeaderText="數量"></asp:TemplateField>
                    <asp:TemplateField HeaderText="小計"></asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
                        <br />
                        <table>
                            <tr>
                                <td>
                                    <b>[總計]</b></td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    折扣：</td>
                                <td>
                                    <asp:Label ID="discountLabel" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    運費：</td>
                                <td>
                                    <asp:Label ID="shippingCostLabel" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr class="style7">
                                <td class="style8">
                                    總金額：</td>
                                <td class="style8">
                                    <asp:Label ID="totalCostLabel" runat="server"></asp:Label>
                                </td>
                            </tr>
                </table>
            <asp:AccessDataSource ID="OrderAccessDataSource" runat="server" 
                DataFile="~/App_Data/MainDatabase.mdb" 
                SelectCommand="SELECT 產品.id, 產品.名稱,
            (
                SELECT 售價.價格
                FROM 售價
                WHERE 售價.設定起始日期=
                (
                    SELECT Max(售價.設定起始日期) AS 設定起始日期之最大值
                    FROM 售價
                    WHERE 售價.[產品id]=產品.id AND 售價.設定起始日期&lt;=now();
                )AND 產品id=產品.id
            )
             AS 價格
            FROM 產品"></asp:AccessDataSource>
            <b>&nbsp;</b><table>
                <tr>
                    <td>
                        收件人姓名<b>：</b></td>
                    <td>
                        <b>
                        <asp:Label ID="LabelName" runat="server"></asp:Label>
                        </b>
                    </td>
                </tr>
                <tr>
                    <td>
                        收件人手機號碼<b>：</b></td>
                    <td>
                        <b>
                        <asp:Label ID="LabelCellPhone" runat="server"></asp:Label>
                        </b>
                    </td>
                </tr>
                    <tr>
                        <td>
                            收件人室內電話：</td>
                        <td>
                            <b>
                            <asp:Label ID="LabelHomePhone" runat="server"></asp:Label>
                            </b>
                        </td>
                    </tr>
                <tr>
                    <td>
                        電子郵件<b>：</b></td>
                    <td>
                        <b>
                        <asp:Label ID="LabelEmail" runat="server"></asp:Label>
                        </b>
                    </td>
                </tr>
                <tr>
                    <td>
                        取貨方式：</td>
                    <td>
                        <b>
                        <asp:Label ID="LabelGetway" runat="server"></asp:Label>
                        </b>
                    </td>
                </tr>
                <tr>
                    <td>
                        付款方式<b>：</b></td>
                    <td>
                        <b>
                        <asp:Label ID="LabelPayway" runat="server"></asp:Label>
                        </b>
                    </td>
                </tr>
                <tr>
                    <td>
                        取貨地址<b>：</b></td>
                    <td>
                        <b>
                        <asp:Label ID="LabelAddress" runat="server"></asp:Label>
                        </b>
                    </td>
                </tr>
                            <tr>
                                <td>
                                    備忘留言<b>：</b></td>
                                <td>
                                    <b>
                                    <asp:Label ID="LabelNote" runat="server"></asp:Label>
                                    </b>
                                </td>
                            </tr>
            </table>
                        <asp:CheckBox ID="confirmCheckBox" runat="server" Text="好的，我確認完畢" />
                        <asp:CustomValidator ID="confirmCustomValidator" runat="server" 
                            ErrorMessage="#請確認是否檢查完畢" ValidationGroup="confirm"></asp:CustomValidator>
            <br />
            <br />
            <asp:LinkButton ID="PreStepLinkButton" runat="server">&lt;上一步</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton 
                            ID="CheckOutLinkButton" runat="server" ValidationGroup="confirm">送出訂單</asp:LinkButton>
        </asp:View>
            <asp:View ID="resultView" runat="server">
                <asp:Label ID="resultLabel" runat="server"></asp:Label>
                <br />
            <br />
            <asp:LinkButton ID="BackToDefaultLinkButton" runat="server" 
                PostBackUrl='<%=Application(SystemSetting.HeadTag & "defaultUrl") %>'>回首頁</asp:LinkButton>
        </asp:View>
                <asp:View ID="underMaintenanceView" runat="server">
                    抱歉，此網站暫停交易<br />
                    <br />
                    公告：<asp:Label ID="underMainTenanceLabel" runat="server"></asp:Label>
                </asp:View>
        </asp:MultiView>
                    </td>
                </tr>
                <tr>
                    <td>
                        <DotNetAge:Dialog ID="Dialog1" runat="server" Title="[DialogTitle]">
                        </DotNetAge:Dialog>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress" runat="server" 
        AssociatedUpdatePanelID="mainUpdatePanel">
        <ProgressTemplate>
            <span class="style5">讀取中...</span>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
