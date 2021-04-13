<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="BeritaPage.aspx.cs" Inherits="BeritaPage" %>

<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxNewsControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

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
            GetPopupControl().Hide();
        }
        function IsCurrentNews(htmlElement) {
            return (curTailElement == htmlElement) && GetPopupControl().IsVisible();
        }
        function GetPopupControl() {
            return ASPxPopupClientControl;
        }
        function ShowPopup(element, contentText) {
            GetPopupControl().Hide();
            //GetPopupControl().SetContentHTML(contentText);
            GetPopupControl().ShowAtElement(element);
        }
        // ]]> 
    </script>
    <asp:ObjectDataSource ID="BeritaPageObjectDataSource" runat="server" SelectMethod="GetAllData" TypeName="GISPuskesmasLib.VBerita"></asp:ObjectDataSource>
    <dx:ASPxPopupControl PopupAction="None" ClientInstanceName="ASPxPopupClientControl"
        PopupHorizontalAlign="OutsideRight" EnableViewState="False" ID="ASPxPopupControl1"
        runat="server" PopupHorizontalOffset="5" AllowDragging="True" EnableAnimation="False"
        PopupVerticalAlign="TopSides" CloseAction="CloseButton" HeaderText="Comment">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                <dx:ASPxTextBox ID="EmailASPxTextBox" runat="server" NullText="Email" Width="170px">
                    <ValidationSettings>
                        <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorText="Invalid Alamat Email" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
                <br />
                <dx:ASPxMemo ID="KomentarASPxMemo" runat="server" Height="71px" Width="170px"
                    NullText="Tulis Komentar">
                </dx:ASPxMemo>
                <br />
                <dx:ASPxButton ID="PostButton" runat="server" Text="Post" OnClick="PostButton_Click"></dx:ASPxButton>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxNewsControl ID="BeritaPageASPxNewsControl" runat="server" Width="100%" DataSourceID="BeritaPageObjectDataSource"
        NameField="BeritaID" TextField="Isi" EnableViewState="false"
        HeaderTextField="Judul" DateField="PostDate" ImageUrlField="" NavigateUrlField="BeritaID" NavigateUrlFormatString="BeritaPageDetails.aspx?Id={0}">
        <%-- <ClientSideEvents TailClick="function(s, e) { OnTailClick(e.name, e.htmlElement); }"
            BeginCallback="function(s, e) { OnNewsControlBeginCallback(); }" />
        "     
        --%>
    </dx:ASPxNewsControl>
    <dx:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="NewsCallback"
        OnCallback="ASPxCallback1_Callback">
        <ClientSideEvents CallbackComplete="function(s, e) { OnCallbackComplete(e.result); }" />
    </dx:ASPxCallback>
    <hr />
</asp:Content>

