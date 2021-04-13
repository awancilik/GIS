<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="BeritaPageDetails.aspx.cs" Inherits="BeritaPageDetails" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxNewsControl" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ObjectDataSource ID="CommentObjectDataSource" runat="server" SelectMethod="GetKomentarByNewsId" TypeName="GISPuskesmasLib.VKomentar">
        <SelectParameters>
            <asp:QueryStringParameter Name="newsId" QueryStringField="Id" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <dx:ASPxNewsControl ID="BeritaPageASPxNewsControl" runat="server" Width="100%"
        NameField="BeritaID" TextField="Isi" EnableViewState="false"
        HeaderTextField="Judul" DateField="PostDate" ImageUrlField="">
    </dx:ASPxNewsControl>
    <br />

    <fieldset>
        <legend>Komentar :</legend>
        <dx:ASPxNewsControl ID="KomentarASPxNewsControl" runat="server" Width="100%"
            NameField="BeritaID" TextField="IsiKomentar" EnableViewState="False"
            HeaderTextField="Email" DateField="PostDate" DataSourceID="CommentObjectDataSource">
        </dx:ASPxNewsControl>
    </fieldset>
    <br />
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
</asp:Content>

