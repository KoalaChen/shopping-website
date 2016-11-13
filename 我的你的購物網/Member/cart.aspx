<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Member/MemberSite.Master" CodeBehind="cart.aspx.vb" Inherits="�ڪ��A���ʪ���.cart" 
    title="�ʪ���" %>
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
    <h2 style="color:Red;">�ڪ��ʪ�</h2>
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
                <h3>�ثe�S����ܥ���ӫ~�G</h3>
                <br />
                �z���ʪ����S�����󲣫~�A�Ц^<asp:HyperLink ID="ProductHyperLink" runat="server" 
                    NavigateUrl="~/Default.aspx">���~��</asp:HyperLink>
                ��ܲ��~�C
            </asp:View>
            <asp:View ID="OrderItemView" runat="server">
                <h3>�H�U�O�z���q�ʩ��ӡG</h3>
                <asp:GridView ID="CartGridView" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" datasourceid="OrderItemAccessDataSource" 
                    ForeColor="#333333" GridLines="None" ShowFooter="True">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="�s��" ReadOnly="True" 
                            SortExpression="id" />
                        <asp:BoundField DataField="�W��" HeaderText="�W��" SortExpression="�W��" />
                        <asp:BoundField DataField="����" HeaderText="����" SortExpression="����" />
                        <asp:TemplateField HeaderText="�ƶq">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox3" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="QtyTextBox" runat="server" Width="50px" 
                                    ValidationGroup="Qty" />
                                <asp:RequiredFieldValidator ID="QtyRequiredFieldValidator1" runat="server" 
                                    Display="Dynamic" ErrorMessage="�п�J�ƶq" ValidationGroup="Qty" 
                                    ControlToValidate="QtyTextBox"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="qtyRangeValidator" runat="server" 
                                    ControlToValidate="QtyTextBox" Display="Dynamic" ErrorMessage="�п�J1-999����" 
                                    MaximumValue="999" MinimumValue="1" Type="Integer" ValidationGroup="qty"></asp:RangeValidator>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="�p�p"></asp:TemplateField>
                        <asp:TemplateField HeaderText="�R��">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox4" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="delLinkButton" runat="server" CommandArgument='<%# Eval("id") %>' 
                                    CommandName="del">�R��</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        �ثe�S�������ܰӫ~�A�Ц^<asp:HyperLink ID="ProductHyperLink" runat="server" 
                            NavigateUrl="~/Default.aspx">���~��</asp:HyperLink>
                        ��ܰӫ~
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:AccessDataSource ID="OrderItemAccessDataSource" runat="server" 
                    DataFile="~/App_Data/MainDatabase.mdb" 
                    SelectCommand="SELECT ���~.id, ���~.�W��,
            (
                SELECT ���.����
                FROM ���
                WHERE ���.�]�w�_�l���=
                (
                    SELECT Max(���.�]�w�_�l���) AS �]�w�_�l������̤j��
                    FROM ���
                    WHERE ���.[���~id]=���~.id AND ���.�]�w�_�l���&lt;=now();
                )AND ���~id=���~.id
            )
             AS ����
            FROM ���~"></asp:AccessDataSource>
                <br />
                <asp:Button ID="UpdateCartButton" runat="server" Text="�ץ��ƶq��A�Ы����H�����ܧ�" 
                    UseSubmitBehavior="False" ValidationGroup="qty" />
                <br />
                <br />
                <asp:LinkButton ID="NextStepLinkButton" runat="server">�U�@�B�G�}�l���b</asp:LinkButton>
            </asp:View>
            <asp:View ID="personalInfoView" runat="server">
                <h3>�п�J�z���p����ơG</h3>
                <br />
                    [
                    <span class="style5">*</span>
                        ���������]
                    <table>
                    <tr>
                        <td class="style5">
                            *</td>
                        <td>
                            ����H�m�W<b>�G</b></td>
                        <td class="style6">
                            <b>
                            <asp:TextBox ID="NameTextBox" runat="server" Width="100%" Wrap="False"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="NameTextBox_TextBoxWatermarkExtender" 
                                runat="server" Enabled="True" TargetControlID="NameTextBox" 
                                WatermarkCssClass="watermarked" WatermarkText="��J����H�m�W">
                            </asp:TextBoxWatermarkExtender>
                            </b>
                        </td>
                        <td>
                            <b>
                            <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" 
                                ControlToValidate="NameTextBox" Display="Dynamic" ErrorMessage="�п�J�m�W" 
                                ValidationGroup="cart"></asp:RequiredFieldValidator>
                            </b>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            *</td>
                        <td>
                            ����H������X<b>�G</b></td>
                        <td class="style6">
                            <asp:TextBox ID="PhoneTextBox" runat="server" Width="100%"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="PhoneTextBox_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="PhoneTextBox" 
                                    WatermarkCssClass="watermarked" WatermarkText="�d��09xx-xxx-xxx">
                                </asp:TextBoxWatermarkExtender>
                                    <asp:MaskedEditExtender ID="CellPhoneTextBox_MaskedEditExtender" runat="server" 
                                    Mask="9999-999-999" TargetControlID="PhoneTextBox">
                                </asp:MaskedEditExtender>
                        </td>
                        <td>
                            <b>
                            <asp:RequiredFieldValidator ID="PhoneRequiredFieldValidator" runat="server" 
                                ControlToValidate="PhoneTextBox" Display="Dynamic" ErrorMessage="�п�J�q��" 
                                ValidationGroup="cart"></asp:RequiredFieldValidator>
                            </b>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="PhoneTextBox" Display="Dynamic" ErrorMessage="�榡����" 
                                style="font-weight: 700" 
                                
                                ValidationExpression="^(09)[0-9]{8}" 
                                ValidationGroup="cart"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td>
                            ����H�Ǥ��q�ܡG</td>
                        <td class="style6">
                            <asp:TextBox ID="homePhoneTextBox" runat="server" Width="100%"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="homePhoneTextBox_TextBoxWatermarkExtender" 
                                runat="server" Enabled="True" TargetControlID="homePhoneTextBox" 
                                WatermarkCssClass="watermarked" WatermarkText="�d��(0x)xxxx-xxxx">
                            </asp:TextBoxWatermarkExtender>
                        </td>
                        <td>
                            <b>
                                <asp:MaskedEditExtender ID="HomePhoneTextbox_MaskedEditExtender" runat="server" 
                                Mask="\(99\)9999\-9999" TargetControlID="HomePhoneTextbox"></asp:MaskedEditExtender>
                                    <asp:RegularExpressionValidator ID="HomePhoneRegularExpressionValidator" 
                                    runat="server" ControlToValidate="HomePhoneTextBox" Display="Dynamic" 
                                    ErrorMessage="����J�榡���~�A���ˬd" ValidationExpression="^(0)[0-9]{9}" 
                                    ValidationGroup="cart"></asp:RegularExpressionValidator>

                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="PhoneTextBox" Display="Dynamic" ErrorMessage="�榡����" 
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
                            �q�l�l��<b>�G</b></td>
                        <td class="style6">
                            <b>
                            <asp:TextBox ID="EMailTextBox" runat="server" Width="100%"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="EMailTextBox_TextBoxWatermarkExtender" 
                                runat="server" Enabled="True" TargetControlID="EMailTextBox" 
                                WatermarkCssClass="watermarked" WatermarkText="��J�q�l�l��">
                            </asp:TextBoxWatermarkExtender>
                            </b>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="EMailRequiredFieldValidator" runat="server" 
                                ControlToValidate="EMailTextBox" Display="Dynamic" ErrorMessage="�п�J�q�l�l��" 
                                style="font-weight: 700" ValidationGroup="cart"></asp:RequiredFieldValidator>
                            <b>
                            <asp:RegularExpressionValidator ID="EMailRegularExpressionValidator" 
                                runat="server" ControlToValidate="EMailTextBox" Display="Dynamic" 
                                ErrorMessage="�п�J���TEMAIL�榡" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="cart"></asp:RegularExpressionValidator>
                            </b>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            *</td>
                        <td>
                            �I�ڤ覡<b>�G</b></td>
                        <td class="style6">
                            <asp:DropDownList ID="paywayDropDownList" runat="server" 
                                Width="100%" DataSourceID="payWayAccessDataSource" DataTextField="��" 
                                DataValueField="id">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:AccessDataSource ID="payWayAccessDataSource" runat="server" 
                                DataFile="~/App_Data/MainDatabase.mdb" 
                                SelectCommand="SELECT [id], [��] FROM [�I�ڤ覡]"></asp:AccessDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            *</td>
                        <td>
                            ���f�覡�G</td>
                        <td class="style6">
                            <asp:DropDownList ID="getwayDropDownList" runat="server" 
                                DataSourceID="getWayAccessDataSource" DataTextField="�覡" DataValueField="id" 
                                Height="19px" Width="100%">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:AccessDataSource ID="getWayAccessDataSource" runat="server" 
                                DataFile="~/App_Data/MainDatabase.mdb" 
                                SelectCommand="SELECT [id], [��]&amp;iif([�h�֤��H�W�K�B�O]=0,&quot;[�K�B�O]&quot;,&quot;[���O��&quot;&amp;[�h�֤��H�W�K�B�O]&amp;&quot;���H�W�K�B�O]&quot;) As �覡 FROM [���f�覡]">
                            </asp:AccessDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            *</td>
                        <td>
                            �l���ϸ��G</td>
                        <td class="style6">
                            <b>
                            <asp:TextBox ID="zipCodeTextBox" runat="server" Width="100%"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="zipCodeTextBox_TextBoxWatermarkExtender" 
                                runat="server" Enabled="True" TargetControlID="zipCodeTextBox" 
                                WatermarkCssClass="watermarked" WatermarkText="��J�l���ϸ�">
                            </asp:TextBoxWatermarkExtender>
                            </b>
                        </td>
                        <td>
                            <b>
                            <asp:RequiredFieldValidator ID="AddressRequiredFieldValidator0" runat="server" 
                                ControlToValidate="AddressTextBox" Display="Dynamic" ErrorMessage="�п�J�l���ϸ�" 
                                ValidationGroup="cart"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="ZipCodeRegularExpressionValidator" 
                                runat="server" ControlToValidate="zipCodeTextBox" Display="Dynamic" 
                                ErrorMessage="�п�J���T�l���ϸ�(3�X��5�X)" ValidationExpression="^\d{5}$|^\d{3}$" 
                                ValidationGroup="cart"></asp:RegularExpressionValidator>
                            </b></td>
                    </tr>
                    <tr>
                        <td class="style5">
                            *</td>
                        <td>
                            ���f�a�}<b>�G</b></td>
                        <td class="style6">
                            <b>
                            <asp:TextBox ID="AddressTextBox" runat="server" Width="100%"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="AddressTextBox_TextBoxWatermarkExtender" 
                                runat="server" Enabled="True" TargetControlID="AddressTextBox" 
                                WatermarkCssClass="watermarked" WatermarkText="��J���f�a�}">
                            </asp:TextBoxWatermarkExtender>
                            </b>
                        </td>
                        <td>
                            <b>
                            <asp:RequiredFieldValidator ID="AddressRequiredFieldValidator" runat="server" 
                                ControlToValidate="AddressTextBox" Display="Dynamic" ErrorMessage="�п�J�a�}" 
                                ValidationGroup="cart"></asp:RequiredFieldValidator>
                            </b></td>
                    </tr>
                    <tr>
                        <td class="style5">
                            &nbsp;</td>
                        <td>
                            �Ƨѯd��<b>�G</b></td>
                        <td class="style6">
                            <asp:TextBox ID="NoteTextBox" runat="server" Height="55px" TextMode="MultiLine" 
                                Width="100%"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="NoteTextBox_TextBoxWatermarkExtender" 
                                runat="server" Enabled="True" TargetControlID="NoteTextBox" 
                                WatermarkCssClass="watermarked" WatermarkText="��J���޲z�̪��d��">
                            </asp:TextBoxWatermarkExtender>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    </table>
                <br />
                <asp:LinkButton ID="BackCartLinkButton" runat="server" 
                    PostBackUrl="~/Member/Cart.aspx">&lt;��^�ʪ���</asp:LinkButton>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton 
                    ID="NextView2LinkButton" runat="server" ValidationGroup="cart">�U�@�B&gt;</asp:LinkButton>
            </asp:View>
            <asp:View ID="confirmInfoView" runat="server">
            <h3>�ЦA���T�{-�q�ʩ���-�P-�p�����-�G</h3>
            <asp:GridView ID="OrderGridView" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataKeyNames="id" DataSourceID="OrderAccessDataSource" 
                ForeColor="#333333" GridLines="None" ShowFooter="True" Width="339px">
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="�s��" ReadOnly="True" 
                        SortExpression="id" />
                    <asp:BoundField DataField="�W��" HeaderText="�W��" SortExpression="�W��" />
                    <asp:BoundField DataField="����" HeaderText="����" SortExpression="����" />
                    <asp:TemplateField HeaderText="�ƶq"></asp:TemplateField>
                    <asp:TemplateField HeaderText="�p�p"></asp:TemplateField>
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
                                    <b>[�`�p]</b></td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    �馩�G</td>
                                <td>
                                    <asp:Label ID="discountLabel" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    �B�O�G</td>
                                <td>
                                    <asp:Label ID="shippingCostLabel" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr class="style7">
                                <td class="style8">
                                    �`���B�G</td>
                                <td class="style8">
                                    <asp:Label ID="totalCostLabel" runat="server"></asp:Label>
                                </td>
                            </tr>
                </table>
            <asp:AccessDataSource ID="OrderAccessDataSource" runat="server" 
                DataFile="~/App_Data/MainDatabase.mdb" 
                SelectCommand="SELECT ���~.id, ���~.�W��,
            (
                SELECT ���.����
                FROM ���
                WHERE ���.�]�w�_�l���=
                (
                    SELECT Max(���.�]�w�_�l���) AS �]�w�_�l������̤j��
                    FROM ���
                    WHERE ���.[���~id]=���~.id AND ���.�]�w�_�l���&lt;=now();
                )AND ���~id=���~.id
            )
             AS ����
            FROM ���~"></asp:AccessDataSource>
            <b>&nbsp;</b><table>
                <tr>
                    <td>
                        ����H�m�W<b>�G</b></td>
                    <td>
                        <b>
                        <asp:Label ID="LabelName" runat="server"></asp:Label>
                        </b>
                    </td>
                </tr>
                <tr>
                    <td>
                        ����H������X<b>�G</b></td>
                    <td>
                        <b>
                        <asp:Label ID="LabelCellPhone" runat="server"></asp:Label>
                        </b>
                    </td>
                </tr>
                    <tr>
                        <td>
                            ����H�Ǥ��q�ܡG</td>
                        <td>
                            <b>
                            <asp:Label ID="LabelHomePhone" runat="server"></asp:Label>
                            </b>
                        </td>
                    </tr>
                <tr>
                    <td>
                        �q�l�l��<b>�G</b></td>
                    <td>
                        <b>
                        <asp:Label ID="LabelEmail" runat="server"></asp:Label>
                        </b>
                    </td>
                </tr>
                <tr>
                    <td>
                        ���f�覡�G</td>
                    <td>
                        <b>
                        <asp:Label ID="LabelGetway" runat="server"></asp:Label>
                        </b>
                    </td>
                </tr>
                <tr>
                    <td>
                        �I�ڤ覡<b>�G</b></td>
                    <td>
                        <b>
                        <asp:Label ID="LabelPayway" runat="server"></asp:Label>
                        </b>
                    </td>
                </tr>
                <tr>
                    <td>
                        ���f�a�}<b>�G</b></td>
                    <td>
                        <b>
                        <asp:Label ID="LabelAddress" runat="server"></asp:Label>
                        </b>
                    </td>
                </tr>
                            <tr>
                                <td>
                                    �Ƨѯd��<b>�G</b></td>
                                <td>
                                    <b>
                                    <asp:Label ID="LabelNote" runat="server"></asp:Label>
                                    </b>
                                </td>
                            </tr>
            </table>
                        <asp:CheckBox ID="confirmCheckBox" runat="server" Text="�n���A�ڽT�{����" />
                        <asp:CustomValidator ID="confirmCustomValidator" runat="server" 
                            ErrorMessage="#�нT�{�O�_�ˬd����" ValidationGroup="confirm"></asp:CustomValidator>
            <br />
            <br />
            <asp:LinkButton ID="PreStepLinkButton" runat="server">&lt;�W�@�B</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton 
                            ID="CheckOutLinkButton" runat="server" ValidationGroup="confirm">�e�X�q��</asp:LinkButton>
        </asp:View>
            <asp:View ID="resultView" runat="server">
                <asp:Label ID="resultLabel" runat="server"></asp:Label>
                <br />
            <br />
            <asp:LinkButton ID="BackToDefaultLinkButton" runat="server" 
                PostBackUrl='<%=Application(SystemSetting.HeadTag & "defaultUrl") %>'>�^����</asp:LinkButton>
        </asp:View>
                <asp:View ID="underMaintenanceView" runat="server">
                    ��p�A�������Ȱ����<br />
                    <br />
                    ���i�G<asp:Label ID="underMainTenanceLabel" runat="server"></asp:Label>
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
            <span class="style5">Ū����...</span>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
