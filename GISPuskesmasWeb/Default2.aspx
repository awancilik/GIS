<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxNewsControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        // <![CDATA[
        var curTailElement = null;
        var loadingDivText = '<div style="vertical-align: middle; text-align: center;">Loading&hellip;</div>';
        function OnTailClick(newsID, htmlElement) {
            if (!NewsCallback.InCallback() && !IsCurrentNews(htmlElement)) {
                curTailElement = htmlElement;
                ShowPopup(htmlElement, loadingDivText);
                NewsCallback.PerformCallback(newsID);
            }
        }
        function OnCallbackComplete(result) {
            if (GetPopupControl().IsVisible())
                ShowPopup(curTailElement, result);
        }
        function OnNewsControlBeginCallback() {
            GetLabelControl().Hide();
        }
        function IsCurrentNews(htmlElement) {
            return (curTailElement == htmlElement) && GetLabelControl().IsVisible();
        }
        function GetLabelControl() {
            return ASPxLabelClientControl;
        }
        function ShowPopup(element, contentText) {
            GetLabelControl().Hide();
            GetLabelControl().SetContentHTML(contentText);
            GetLabelControl().ShowAtElement(element);
        }
        // ]]> 
    </script>
    <div>
        <div style="display: inline-block;">
            <dx:ASPxTextBox ID="SearchASPxTextBox" runat="server" Width="170px"></dx:ASPxTextBox>
        </div>
        <div style="display: inline-block;">
            <dx:ASPxButton ID="SearchASPxButton" runat="server" Text="Search" OnClick="SearchASPxButton_Click"></dx:ASPxButton>
        </div>
        <div style="display: inline-block; padding-left: 10px; vertical-align: top;">
            <img src="images/logo-depkes-bakti-husada.png" width="80px" height="80px" alt="Bakti Husada" />
        </div>
        <div style="display: inline-block; text-align: left; padding-left: 10px; color: #3c763d;font-weight:bold;">
            Dinas Kesehatan Kota Ambon
            <br />
            Jl. Imam Bonjol No.14 Ambon 97127, Telp (0911)
            <br />
            353152, Fax. (0911) 34821
        </div>
    </div>
    <br />
    <div>
        <gmaps:GMap ID="Maps1" enableServerEvents="true" runat="server" Width="100%" Height="300px" OnMarkerClick="Maps1_MarkerClick" serverEventsType="AspNetPostBack" />
    </div>
    <hr />
    <div id="messages1"></div>
    <div>
        <dx:ASPxGridView ID="InfoASPxGridView" ClientInstanceName="grid" runat="server" EnableViewState="false" Width="100%" Visible="false">
            <Columns>
                <dx:GridViewDataTextColumn Caption="Judul" FieldName="InfoJudul">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tanggal Post" FieldName="InfoPostDate" PropertiesTextEdit-DisplayFormatString="dd/MM/yyyy">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Isi" FieldName="InfoIsi">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <div>
        <%-- <dx:ASPxNewsControl ID="InfoPageASPxNewsControl" runat="server" Width="100%" NameField="InfoJudul" TextField="InfoIsi"  EnableViewState="false"
            HeaderTextField="InfoJudul" DateField="InfoPostDate" Visible="false">
            <ItemSettings MaxLength="120" ShowHeaderAsLink="True" TailText="Details" />
            <PagerSettings CurrentPageNumberFormat="{0}" NumericButtonCount="5">
                <NextPageButton Visible="True">
                </NextPageButton>
                <PrevPageButton Visible="True">
                </PrevPageButton>
            </PagerSettings>
            <ClientSideEvents TailClick="function(s, e) { OnTailClick(e.name, e.htmlElement); }"
                BeginCallback="function(s, e) { OnNewsControlBeginCallback(); }" />
        </dx:ASPxNewsControl>--%>
    </div>
    <dx:ASPxLabel ID="CommentLabel" ClientInstanceName="LabelClient" runat="server" Visible="false"></dx:ASPxLabel>
    <dx:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="NewsCallback"
        OnCallback="ASPxCallback1_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) { OnCallbackComplete(e.result); }" />
    </dx:ASPxCallback>
    <asp:ObjectDataSource ID="InfoPageObjectDataSource" runat="server" SelectMethod="GetAllData" TypeName="GISPuskesmasLib.MasterData.Vinfo"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="PuskesmasObjectDataSource" runat="server"></asp:ObjectDataSource>
</asp:Content>
