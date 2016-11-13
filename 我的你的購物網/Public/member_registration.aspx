<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/MainSite.Master" CodeBehind="member_registration.aspx.vb" Inherits="我的你的購物網.WebForm5" 
    title="會員註冊" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- CSS樣式表 -->
    <style type="text/css">
        .important
        {
            color: red;
        }
        .toUpper
        {
        	text-transform: uppercase;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <br />
    <h2>會員註冊</h2>
    <asp:UpdatePanelAnimationExtender ID="MainUpdatePanelAnimationExtender" runat="server" TargetControlID="MainUpdatePanel">
            <Animations>
                <OnUpdating>
                    <Sequence>
                        <%-- Enable all the controls --%>
                        <Parallel duration="0">
                            <EnableAction AnimationTarget="MainPanel" Enabled="false" />
                            <%-- Step Button --%>
                            <EnableAction AnimationTarget="preStepButton" Enabled="false" />
                            <EnableAction AnimationTarget="nextStepButton" Enabled="false" />
                            <EnableAction AnimationTarget="codeTextBox" Enabled="false" />
                            <EnableAction AnimationTarget="checkCodeButton" Enabled="false" />
                        </Parallel>
                    </Sequence>
                </OnUpdating>
                <OnUpdated>
                    <Sequence>
                        <%-- Disable all the controls --%>
                        <Parallel duration="0">
                            <EnableAction AnimationTarget="MainPanel" Enabled="true" />
                            <%-- Step Button --%>
                            <EnableAction AnimationTarget="preStepButton" Enabled="true" />
                            <EnableAction AnimationTarget="nextStepButton" Enabled="true" />
                            <EnableAction AnimationTarget="codeTextBox" Enabled="true" />
                            <EnableAction AnimationTarget="checkCodeButton" Enabled="true" />
                        </Parallel>
                    </Sequence>
                </OnUpdated>
            </Animations>
    </asp:UpdatePanelAnimationExtender>
    <asp:UpdatePanel ID="MainUpdatePanel" runat="server">
        <ContentTemplate>
            <asp:Label ID="StepTableLabel" runat="server"></asp:Label>
            <asp:Panel ID="MainPanel" runat="server">
                <asp:MultiView ID="MainMultiView" runat="server" ActiveViewIndex="1">
                <asp:View ID="NoAuthView" runat="server">
                    您目前無法註冊，可能原因為<br />
                    1.您已登入<br />
                    2.輸入驗證碼多次沒過，被系統鎖定<br />
                    3.目前不開放註冊
                </asp:View>
                <asp:View ID="Step1View" runat="server">
                    請輸入驗証碼以進行註冊程序：<br />
                    <asp:MultiView ID="CodeMultiView" runat="server" ActiveViewIndex="0">
                        <asp:View ID="CheckView" runat="server">
                            <asp:PlaceHolder ID="CodePlaceHolder" runat="server"></asp:PlaceHolder>
                            <br />
                            <asp:TextBox ID="CodeTextBox" runat="server" 
                        EnableViewState="False" 
                        ValidationGroup="code"
                        CssClass="unwatermarked" />
                            <asp:TextBoxWatermarkExtender ID="CodeTextbox_TextBoxWatermarkExtender" runat="server"
                        TargetControlID="CodeTextbox"
                        WatermarkCssClass="watermarked" 
                        WatermarkText="請輸入驗證碼" />
                            <asp:RequiredFieldValidator ID="CodeRequiredFieldValidator" runat="server" 
                        ControlToValidate="CodeTextBox" Display="None" 
                        ErrorMessage="&lt;b&gt;您有欄位未輸入&lt;/b&gt;&lt;br /&gt;請輸入驗證碼" 
                        ValidationGroup="code" />
                            <asp:ValidatorCalloutExtender ID="CodeRequiredFieldValidator_ValidatorCalloutExtender" runat="server"
                        TargetControlID="CodeRequiredFieldValidator"></asp:ValidatorCalloutExtender>
                            <br />
                            <asp:Button ID="CheckCodeButton" runat="server"
                        Text="驗證，下一步" 
                        ValidationGroup="code"/>
                            <asp:Label ID="tryCodeNoticeLabel" runat="server" ForeColor="Red"></asp:Label>
                            <br />
                            <asp:CustomValidator ID="regFailCustomValidator" runat="server" 
                                    ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=
                                    &quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error 
                                    ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;
                                    float: left; margin-right: 0.3em;&quot; 
                                    class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;&lt;strong&gt;
                                    錯誤:&lt;/strong&gt;輸入錯誤的驗證碼，請重試&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                        Display="Dynamic"></asp:CustomValidator>
                        </asp:View>
                    </asp:MultiView>
                    <br />
                </asp:View>
                <asp:View ID="Step2View" runat="server">
                    請遵守以下事項<br />
                    <asp:TextBox ID="AgreeTextBox" runat="server"
            Height="116px"
            ReadOnly="True" 
            TextMode="MultiLine"
            Width="433px"> 請遵守中華民國法律！請遵守本站各項規定！ 
                    </asp:TextBox>
                    <br />
                    <asp:CheckBox ID="AgreeCheckBox" runat="server" Text="我同意" />
                    <asp:CustomValidator ID="AgreeCustomValidator" runat="server" 
            Display="Dynamic" 
            ErrorMessage="＃您必須同意才能進行下一步"
            ValidationGroup="Reg">
                    </asp:CustomValidator>
                </asp:View>
                <asp:View ID="Step3View" runat="server">
                    <div class="entry-content">
                        <table>
                            <tr>
                                <td class="important">
                                    *</td>
                                <td>
                                    E-Mail：</td>
                                <td>
                                    <asp:TextBox ID="EMailTextBox" runat="server"
                        AutoCompleteType="Email" 
                        CssClass="unwatermarked">
                                    </asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="EMailTextBox_FilteredTextBoxExtender" runat="server"
                        Enabled="True"
                        FilterType="Custom, Numbers, LowercaseLetters" 
                        TargetControlID="EMailTextBox"
                        ValidChars="@."></asp:FilteredTextBoxExtender>
                                    <asp:TextBoxWatermarkExtender ID="EMailTextBox_TextBoxWatermarkExtender" runat="server"
                        TargetControlID="EMailTextBox"
                        WatermarkCssClass="watermarked" 
                        WatermarkText="請輸入E-MAIL位址"></asp:TextBoxWatermarkExtender>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="EMailRequiredFieldValidator" runat="server" 
                        ControlToValidate="EMailTextBox" Display="Dynamic" ErrorMessage="※請填寫" 
                        ValidationGroup="Reg">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="EMailRegularExpressionValidator" 
                        runat="server" ControlToValidate="EMailTextBox" Display="Dynamic" 
                        ErrorMessage="＃請檢查" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="Reg">
                                    </asp:RegularExpressionValidator>
                                    <asp:CustomValidator ID="EMailTextBoxCustomValidator" runat="server" 
                        ControlToValidate="EMailTextBox" Display="Dynamic" ErrorMessage="＃這個E-Mail已註冊" 
                        ValidationGroup="Reg">
                                    </asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="important">
                                    *</td>
                                <td>
                                    密碼：</td>
                                <td>
                                    <asp:TextBox ID="PasswordTextBox" runat="server"
                        TextMode="Password" 
                        MaxLength="15"
                        CssClass="unwatermarked">
                                    </asp:TextBox>
                                    <asp:PasswordStrength ID="PasswordTextBox_PasswordStrength" runat="server" 
                        HelpStatusLabelID="PasswordHelpLabel" MinimumLowerCaseCharacters="1" 
                        MinimumNumericCharacters="1" 
                        PreferredPasswordLength="8" PrefixText="密碼強度: " 
                        TargetControlID="PasswordTextBox" MinimumUpperCaseCharacters="1"></asp:PasswordStrength>
                                    <br />
                                    <asp:Label ID="PasswordHelpLabel" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator" runat="server" 
                        ControlToValidate="PasswordTextBox" Display="Dynamic" ErrorMessage="※請填寫" 
                        ValidationGroup="Reg">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="PasswordTextboxRegularExpressionValidator" 
                        runat="server" ControlToValidate="PasswordTextBox" Display="Dynamic" 
                        ErrorMessage="＃請檢查" ValidationExpression="^[a-zA-Z]{1}[a-zA-Z0-9]{7,14}" 
                        ValidationGroup="Reg">
                                    </asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="important">
                                    *</td>
                                <td>
                                    確認密碼：</td>
                                <td>
                                    <asp:TextBox ID="ConfirmPasswordTextBox" runat="server" TextMode="Password" 
                            MaxLength="15" CssClass="unwatermarked"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequiredFieldValidator" 
                        runat="server" ControlToValidate="ConfirmPasswordTextBox" Display="Dynamic" 
                        ErrorMessage="※請填寫" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="ConfirmPasswordTextobxCompareValidator" 
                        runat="server" ControlToCompare="PasswordTextBox" 
                        ControlToValidate="ConfirmPasswordTextBox" Display="Dynamic" 
                        ErrorMessage="＃密碼不一致" ValidationGroup="Reg"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="important">
                                    *</td>
                                <td>
                                    姓名：</td>
                                <td>
                                    <asp:TextBox ID="NameTextBox" runat="server" MaxLength="16" 
                            CssClass="unwatermarked"></asp:TextBox>
                                    <asp:TextBoxWatermarkExtender ID="NameTextBox_TextBoxWatermarkExtender" runat="server"
                        TargetControlID="NameTextBox" 
                        WatermarkCssClass="watermarked" WatermarkText="請輸入15位字元內"></asp:TextBoxWatermarkExtender>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="NameTextboxRequiredFieldValidator" 
                        runat="server" ControlToValidate="NameTextBox" Display="Dynamic" 
                        ErrorMessage="※請填寫" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="NameRegularExpressionValidator" 
                        runat="server" ControlToValidate="NameTextBox" Display="Dynamic" 
                        ErrorMessage="＃請輸入15字元內" ValidationExpression=".{1,15}" ValidationGroup="Reg">
                                    </asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="important">
                                    *</td>
                                <td>
                                    性別：</td>
                                <td>
                                    <asp:RadioButtonList ID="SexRadioButtonList" runat="server" 
                                    RepeatDirection="Horizontal">
                                        <asp:ListItem Value="True">男</asp:ListItem>
                                        <asp:ListItem Value="False">女</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="SexRadioButtonListRequiredFieldValidator" 
                                    runat="server" ControlToValidate="SexRadioButtonList" Display="Dynamic" 
                                    ErrorMessage="※請選擇" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="important">
                                    *</td>
                                <td>
                                    生日：</td>
                                <td>
                                    <div>
                                        <asp:TextBox ID="BirthdayTextBox" runat="server" 
                                                    CssClass="unwatermarked"></asp:TextBox>
                                                    <asp:MaskedEditExtender ID="BirthdayTextBox_MaskedEditExtender"
                                                        runat="server" AcceptNegative="Left" Mask="9999/99/99" 
                                            MaskType="Date" TargetControlID="BirthdayTextBox" UserDateFormat="YearMonthDay">
                                                    </asp:MaskedEditExtender>
                                        <asp:TextBoxWatermarkExtender ID="BirthdayTextbox_TextBoxWatermarkExtender" runat="server"
                                            TargetControlID="BirthdayTextBox" 
                                            WatermarkCssClass="watermarked" WatermarkText="範例yyyy/mm/dd"></asp:TextBoxWatermarkExtender>
                                        <asp:CalendarExtender ID="BirthdayTextBox_CalendarExtender" runat="server" 
                                            Enabled="True" FirstDayOfWeek="Monday" Format="yyyy/MM/dd" TargetControlID="BirthdayTextBox" 
                                            TodaysDateFormat="yyyy/MM/dd " DefaultView="Years"></asp:CalendarExtender>
                                    </div>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="BirthdayTextBoxRequiredFieldValidator" 
                                    runat="server" ControlToValidate="BirthdayTextBox" Display="Dynamic" 
                                    ErrorMessage="※請填寫" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="BirthdayTextBoxRangeValidator" runat="server" 
                                    ControlToValidate="BirthdayTextBox" ErrorMessage="＃請檢查" MaximumValue="today" 
                                    MinimumValue="1900/1/1" Type="Date" ValidationGroup="Reg"></asp:RangeValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    手機號碼：</td>
                                <td>
                                    <asp:TextBox ID="CellPhoneTextBox" runat="server" CssClass="unwatermarked" 
                                        AutoCompleteType="BusinessPhone"></asp:TextBox>
                                    <asp:TextBoxWatermarkExtender ID="CellPhoneTextBox_TextBoxWatermarkExtender" 
                                runat="server" Enabled="True" TargetControlID="CellPhoneTextBox" 
                                WatermarkCssClass="watermarked" WatermarkText="範例09xx-xxx-xxx"></asp:TextBoxWatermarkExtender>
                                    <asp:MaskedEditExtender ID="CellPhoneTextBox_MaskedEditExtender" runat="server" 
                                Mask="9999-999-999" TargetControlID="CellPhoneTextBox"></asp:MaskedEditExtender>
                                </td>
                                <td>
                                    <asp:RegularExpressionValidator ID="CellPhoneTextBoxRegularExpressionValidator" 
                                    runat="server" ControlToValidate="CellPhoneTextBox" Display="Dynamic" 
                                    ErrorMessage="＃輸入格式錯誤，請檢查" ValidationExpression="^(09)[0-9]{8}" 
                                    ValidationGroup="Reg"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    室內電話：</td>
                                <td>
                                    <asp:TextBox ID="HomePhoneTextBox" runat="server" AutoCompleteType="HomePhone" 
                                        CssClass="unwatermarked"></asp:TextBox>
                                    <asp:TextBoxWatermarkExtender ID="HomePhoneTextbox_TextBoxWatermarkExtender" 
                                runat="server" Enabled="True" TargetControlID="HomePhoneTextBox" 
                                WatermarkCssClass="watermarked" WatermarkText="範例(xx)xxxx-xxxx"></asp:TextBoxWatermarkExtender>
                                    <asp:MaskedEditExtender ID="HomePhoneTextbox_MaskedEditExtender" runat="server" 
                                Mask="\(99\)9999\-9999" TargetControlID="HomePhoneTextbox"></asp:MaskedEditExtender>
                                </td>
                                <td>
                                    <asp:RegularExpressionValidator ID="HomePhoneRegularExpressionValidator" 
                                    runat="server" ControlToValidate="HomePhoneTextBox" Display="Dynamic" 
                                    ErrorMessage="＃輸入格式錯誤，請檢查" ValidationExpression="^(0)[0-9]{9}" 
                                    ValidationGroup="Reg"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="important">
                                    *</td>
                                <td>
                                    身份證字號(首字須大寫)：</td>
                                <td>
                                    <asp:TextBox ID="IdentificationCardNumTextBox" runat="server" 
                                    CssClass="unwatermarked_id toUpper"></asp:TextBox>
                                    <asp:TextBoxWatermarkExtender ID="IdentificationCardNumTextBox_TextBoxWatermarkExtender" 
                                runat="server" Enabled="True" TargetControlID="IdentificationCardNumTextBox" 
                                WatermarkCssClass="watermarked" WatermarkText="範例A123456789"></asp:TextBoxWatermarkExtender>
                                    <asp:MaskedEditExtender ID="IdentificationCardNumTextBox_MaskedEditExtender" runat="server" 
                                Mask="C999999999" TargetControlID="IdentificationCardNumTextBox" 
                                        Filtered="ABCDEFGHIJKLMONPQRSTUVWXYZ"></asp:MaskedEditExtender>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="IdentificationCardNumTextBoxRequiredFieldValidator" 
                                    runat="server" ControlToValidate="IdentificationCardNumTextBox" 
                                    Display="Dynamic" ErrorMessage="※請填寫" ValidationGroup="Reg"></asp:RequiredFieldValidator>
                                    <asp:CustomValidator ID="IdentificationCardNumTextBoxCustomValidator" 
                                    runat="server" ControlToValidate="IdentificationCardNumTextBox" 
                                    Display="Dynamic" ErrorMessage="＃請檢查" ValidationGroup="Reg"></asp:CustomValidator>
                                    <asp:CustomValidator ID="IdentificationCardNumTextBoxCheckRepeatValidator" 
                                    runat="server" ControlToValidate="IdentificationCardNumTextBox" 
                                    Display="Dynamic" ErrorMessage="＃身份證字號已註冊" ValidationGroup="Reg"></asp:CustomValidator>
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:View>
                <asp:View ID="Step4View" runat="server">
                    <br />
                    <div class="entry-content">
                        <table>
                            <tr>
                                <td>
                                    E-Mail： 
                                </td>
                                <td>
                                    <asp:Label ID="EMailLabel" runat="server"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    密碼：</td>
                                <td>
                                    <asp:Label ID="PasswordLabel" runat="server" Text="(已填寫)"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    姓名：</td>
                                <td>
                                    <asp:Label ID="NameLabel" runat="server"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    性別：</td>
                                <td>
                                    <asp:Label ID="SexLabel" runat="server"></asp:Label>
                                </td>
                                <td>
                                    (註冊後不能更改)</td>
                            </tr>
                            <tr>
                                <td>
                                    生日：</td>
                                <td>
                                    <asp:Label ID="BirthdayLabel" runat="server"></asp:Label>
                                </td>
                                <td>
                                    (註冊後不能更改)</td>
                            </tr>
                            <tr>
                                <td>
                                    手機號碼：</td>
                                <td>
                                    <asp:Label ID="CellPhoneLabel" runat="server"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    室內電話：</td>
                                <td>
                                    <asp:Label ID="HomePhoneLabel" runat="server"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    身份證字號：</td>
                                <td>
                                    <asp:Label ID="IdentificationCardNumLabel" runat="server"></asp:Label>
                                </td>
                                <td>
                                    (註冊後不能更改)</td>
                            </tr>
                        </table>
                    </div>
                    請確認以上內容，如正確無誤，請勾選以下選項：<br />
                    <asp:CheckBox ID="ConfirmInformationCheckBox" runat="server" Text="我確認好了" />
                    <asp:CustomValidator ID="ConfirmInfoCustomValidator" runat="server" 
                        ErrorMessage="＃您必須確認才能進行下一步" Display="Dynamic" ValidationGroup="Reg"></asp:CustomValidator>
                </asp:View>
                <asp:View ID="Step5View" runat="server">
                    <asp:Label ID="resultLabel" runat="server"></asp:Label>
                    <br />
                </asp:View>
            </asp:MultiView>
        </asp:Panel>
        <p style="display:inline; float:left; margin-left:0px; margin-top: 0pt; margin-bottom: 0pt;">
            <asp:Button ID="PreStepButton" runat="server" Text="上一步"  />
        </p>
        <p style="display:inline; float:right; margin-right:0px; margin-top: 0pt; margin-bottom: 0pt;">
            <asp:Button ID="NextStepButton" runat="server" style="text-align: right" 
                        Text="下一步" ValidationGroup="Reg" 
                            UseSubmitBehavior="False"/>
        </p>
        </ContentTemplate>
    </asp:UpdatePanel>
    </asp:Content>
