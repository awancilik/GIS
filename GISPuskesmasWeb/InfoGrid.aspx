<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InfoGrid.aspx.cs" Inherits="InfoGrid" %>

<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxNewsControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h5>
              Nama Puskesmas :  <asp:Label ID="NamaKecamatan" runat="server" /></h5>
        </div>
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
    </form>
</body>
</html>
