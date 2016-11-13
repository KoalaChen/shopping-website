<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/MainSite.Master" CodeBehind="login.aspx.vb" Inherits="�ڪ��A���ʪ���.WebForm4" 
    title="�n�J" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .text_center
        {
            text-align: center;
        }
        .hidden
        {
           display:none;
        }
        .header
        {
        	width:25%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="loginUpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:MultiView ID="loginMultiView" runat="server" ActiveViewIndex="0">
                <asp:View ID="userLoginView" runat="server">
                    <br />
                    <br />
                    <table align="center" class="text_center" style="width:50%; border-style:dotted;">
                        <tr>
                            <td style="width:50%;">
                                <b>�|���n�J</b></td>
                        </tr>
                        <tr>
                            <td>
                                <table align="center" style="width:100%; text-align:center;">
                                    <tr>
                                        <td class="header">
                                            �q�l�l��</td>
                                        <td>
                                            <asp:TextBox ID="emailTextBox" runat="server" CssClass="unwatermarked" 
                                                Width="100%" MaxLength="255"></asp:TextBox>
                                            <asp:TextBoxWatermarkExtender ID="emailTextBoxWatermarkExtender" runat="server" 
                                                TargetControlID="emailTextBox" WatermarkCssClass="watermarked" 
                                                WatermarkText="�п�J�q�l�l��">
                                            </asp:TextBoxWatermarkExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="header">
                                            &nbsp;</td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator" 
                                                runat="server" ControlToValidate="emailTextBox" Display="Dynamic" 
                                                ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�ж�g�q�l�l��&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                                ValidationGroup="login"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="header">
                                            ��J�K�X</td>
                                        <td>
                                            <asp:TextBox ID="passwordTextBox" runat="server" 
                                                CssClass="unwatermarked hidden" TextMode="Password" Width="100%"></asp:TextBox>
                                            <asp:TextBox ID="passwordTextBoxDisplay" runat="server" 
                                                CssClass="unwatermarked" ReadOnly="True" Width="100%" MaxLength="20"></asp:TextBox>
                                            <asp:TextBoxWatermarkExtender ID="passwordTextBoxWatermarkExtender" 
                                                runat="server" TargetControlID="passwordTextBoxDisplay" 
                                                WatermarkCssClass="watermarked" WatermarkText="�п�J�K�X">
                                            </asp:TextBoxWatermarkExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="header">
                                            &nbsp;</td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="passwordTextBoxRequiredFieldValidator" 
                                                runat="server" ControlToValidate="passwordTextBox" Display="Dynamic" 
                                                ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�п�J�K�X&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                                ValidationGroup="login"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="header">
                                            �����ҽX</td>
                                        <td>
                                            <table style="text-align:left;" width="100%">
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="validateTextBox" runat="server" CssClass="unwatermarked" 
                                                            Width="100%" MaxLength="20"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:TextBoxWatermarkExtender ID="validateTextBoxWatermarkExtender0" 
                                                            runat="server" TargetControlID="validateTextBox" 
                                                            WatermarkCssClass="watermarked" WatermarkText="�п�J���ҽX">
                                                        </asp:TextBoxWatermarkExtender>
                                                        <asp:Image ID="validateImage" runat="server" ImageAlign="Right" />
                                                        <br />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="header">
                                            &nbsp;</td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="validateRequiredFieldValidator" runat="server" 
                                                ControlToValidate="validateTextBox" Display="Dynamic" 
                                                ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=&quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;float: left; margin-right: 0.3em;&quot; class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;�п�J���ҽX&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                                ValidationGroup="login"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="header">
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="header" colspan="2">
                                            <asp:Button ID="LoginButton" runat="server" Text="�n�J" ValidationGroup="login" 
                                                Width="100px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CustomValidator ID="loginCustomValidator" runat="server" Display="Dynamic" 
                                    ErrorMessage="&lt;div class=&quot;ui-widget&quot;&gt;&lt;div style=
                                    &quot;padding: 0pt 0.7em;&quot; class=&quot;ui-state-error 
                                    ui-corner-all&quot;&gt;&lt;p&gt;&lt;span style=&quot;
                                    float: left; margin-right: 0.3em;&quot; 
                                    class=&quot;ui-icon ui-icon-alert&quot;&gt;&lt;/span&gt;&lt;strong&gt;
                                    ���~:&lt;/strong&gt;�n�J����&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;" 
                                    ValidationGroup="login"></asp:CustomValidator>
                            </td>
                        </tr>
                    </table>
                    <DotNetAge:Dialog ID="errorIdAndPasswordDialog" runat="server" 
                        DialogButtons="OK" DialogIcon="Error" ShowModal="True" Title="���~">
                        <BodyTemplate>
                            <div style="margin:10px">
                                <div style="vertical-align: middle; height: 64px; padding-left: 40px; background: transparent url(mvwres://DNA.UI.JQuery, Version=1.1.15.42021, Culture=neutral, PublicKeyToken=40f672d8570a48f9/DNA.UI.JQuery.Dialog.Error.gif) no-repeat;">
                                    �z��J�F���~���q�l�l��αK�X�C 
                                </div>
                            </div>
                        </BodyTemplate>
                        <Trigger Selector="" />
                        <Buttons>
                            <DotNetAge:DialogButton CommandArgument="" CommandName="" 
                                OnClientClick="$(this).dialog('close');" Text="OK" />
                        </Buttons>
                    </DotNetAge:Dialog>
                    <br />
                    <DotNetAge:Dialog ID="errorCodeDialog" runat="server" ShowModal="True" 
                        Title="���~">
                        <BodyTemplate>
                            <div style="margin:10px">
                                <div style="vertical-align: middle; height: 64px; padding-left: 40px; background: transparent url(mvwres://DNA.UI.JQuery, Version=1.1.15.42021, Culture=neutral, PublicKeyToken=40f672d8570a48f9/DNA.UI.JQuery.Dialog.Error.gif) no-repeat;">
                                    ���ҽX��J���~�C 
                                </div>
                            </div>
                        </BodyTemplate>
                        <Trigger Selector="" />
                        <Buttons>
                            <DotNetAge:DialogButton CommandArgument="" CommandName="" 
                                OnClientClick="$(this).dialog('close');" Text="OK" />
                        </Buttons>
                    </DotNetAge:Dialog>
                </asp:View>

                
                <asp:View ID="loginSuccessView" runat="server">
                    <div>
                        �n�J���\�A�Ы�<asp:LinkButton ID="nevigateLinkButton" runat="server" Text="�o��"></asp:LinkButton>
                        �~��</div>
                </asp:View>
            </asp:MultiView>
            
            <asp:UpdateProgress ID="loginUpdateProgress" runat="server" 
                AssociatedUpdatePanelID="loginUpdatePanel">
                <ProgressTemplate>
                    <p style="color:Red; text-align:center;">�������Ҥ�...</p>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="LoginButton" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    
    <asp:UpdatePanelAnimationExtender ID="loginUpdatePanelAnimationExtender" 
        runat="server" TargetControlID="loginUpdatePanel">
        <Animations>
            <OnUpdating>
                <Sequence>
                    <Parallel duration="0">
                        <EnableAction AnimationTarget="emailTextBox" Enabled="false" />
                        <EnableAction AnimationTarget="passwordTextBox" Enabled="false" />
                        <EnableAction AnimationTarget="validateTextBox" Enabled="false" />
                        <EnableAction AnimationTarget="loginButton" Enabled="false" />
                        <EnableAction AnimationTarget="reTypeButton" Enabled="false" />
                    </Parallel>
                </Sequence>
            </OnUpdating>
            <OnUpdated>
                <Sequence>
                    <Parallel duration="0">
                        <EnableAction AnimationTarget="emailTextBox" Enabled="true" />
                        <EnableAction AnimationTarget="passwordTextBox" Enabled="true" />
                        <EnableAction AnimationTarget="validateTextBox" Enabled="true" />
                        <EnableAction AnimationTarget="loginButton" Enabled="true" />
                        <EnableAction AnimationTarget="reTypeButton" Enabled="true" />
                    </Parallel>                            
                </Sequence>
            </OnUpdated>
            
        </Animations>
    </asp:UpdatePanelAnimationExtender>
   <% If (False) Then%>
    <script src="../Js/jQuery-1.4.1.js" type="text/javascript"></script>
   <% End If%>    
    <script type="text/javascript">
        $("#<%= passwordTextBoxDisplay.ClientID %>").live(
        "keyup",
            function() {
                $("#<%= passwordTextBoxDisplay.ClientID %>").hide();
                $("#<%= passwordTextBox.ClientID %>").removeClass("hidden").focus();
                return true;
            }
        );
            $("#<%= passwordTextBoxDisplay.ClientID %>").live(
        "mouseup",
            function() {
                $("#<%= passwordTextBoxDisplay.ClientID %>").hide();
                $("#<%= passwordTextBox.ClientID %>").removeClass("hidden").focus();
                return true;
            }
        );
    </script>
</asp:Content>
