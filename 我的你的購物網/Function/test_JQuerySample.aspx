<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/MainSite.Master" CodeBehind="test_JQuerySample.aspx.vb" Inherits="我的你的購物網.WebForm3" 
    title="jQuerySample" %>
<%@ Register assembly="DNA.UI.JQuery" namespace="DNA.UI.JQuery" tagprefix="DotNetAge" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    1</p>
    <p>
        FCKeditor</p>
    <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" 
        BasePath="~/Function/FCKeditor.NET_2.6.3/">
    </FCKeditorV2:FCKeditor>
    <p>
        <b>Accordion+View(s)</b></p>

    <DotNetAge:Accordion ID="Accordion2" runat="server" 
        AllowCollapseAllSections="False" AutoPostBack="False" AutoSizeMode="None" 
        CollapseAnimation="BounceSlide" ContentCssClass="" ContentStyle="" 
        CssClass="ui-accordion ui-widget ui-helper-reset" HeaderCssClass="" 
        HeaderStyle="" IsClearStyle="False" Navigation="False" OpenSectionEvent="Click" 
        SelectedIndex="0">
        <Views>
            <DotNetAge:View runat="server" ShowHeader="True" Text="View" 
                CssClass="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active" 
                ID="View1">
                Test1
                測試1
            </DotNetAge:View>
            <DotNetAge:View ID="View2" runat="server" 
                CssClass="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active" 
                ShowHeader="True" Text="View2">
                Test2
                測試2
            </DotNetAge:View>
            <DotNetAge:View ID="View3" runat="server" 
                CssClass="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active" 
                ShowHeader="True" Text="View3">
                Test3
                測試3
            </DotNetAge:View>
            <DotNetAge:View ID="View4" runat="server" 
                CssClass="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active" 
                ShowHeader="True" Text="View4">
                Test4
                測試4
            </DotNetAge:View>
            <DotNetAge:View ID="View5" runat="server" 
                CssClass="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active" 
                ShowHeader="True" Text="View5">
                Test5
                測試5
            </DotNetAge:View>
        </Views>
    </DotNetAge:Accordion>
    <p>
        Animation</p>
        
<p>
    DatePicker</p>
    <DotNetAge:DatePicker ID="DatePicker1" runat="server">
    </DotNetAge:DatePicker>
    <br />
    <br />
    Dialog(還在試要怎麼跑出來)<br />
    <asp:Button ID="Button1" runat="server" Text="Button" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:LinkButton ID="LinkButton12" runat="server">LinkButton</asp:LinkButton>
            <DotNetAge:Dialog ID="Dialog1" runat="server" AutoOpen="False" ShowModal="True" 
                Title="測試">
                <BodyTemplate>
                    <div style="margin:10px">
                        <div style="vertical-align: middle; height: 64px; padding-left: 40px; background: transparent url() no-repeat;">
                            這個是測試</div>
                    </div>
                </BodyTemplate>
                <Trigger Selector="" />
                <Buttons>
                    <DotNetAge:DialogButton CommandArgument="" CommandName="" OnClientClick="" 
                        Text="我確定" />
                </Buttons>
            </DotNetAge:Dialog>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <p><b>Draggable</b></p>
    <DotNetAge:Tabs ID="Tabs1" runat="server" ActiveTabEvent="Click" 
        AsyncLoad="False" AutoPostBack="False" Collapsible="False" ContentCssClass="" 
        ContentStyle="" CssClass="ui-tabs ui-widget ui-widget-content ui-corner-all" 
        Deselectable="False" EnabledContentCache="False" HeaderCssClass="" 
        HeaderStyle="" SelectedIndex="0" Sortable="False">
        <Views>
            <DotNetAge:View runat="server" ShowHeader="False" Text="View0" CssClass="ui-tabs-panel ui-widget-content ui-corner-bottom" ID="View0">
            </DotNetAge:View>
            <DotNetAge:View ID="View6" runat="server" ShowHeader="True" Text="View1">
            </DotNetAge:View>
        </Views>
    </DotNetAge:Tabs>

    <p>
    </p>
    <br />
</asp:Content>
