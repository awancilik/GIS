<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Berita.aspx.cs" Inherits="Admin_MasterData_Berita" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ObjectDataSource ID="BeritaObjectDataSource" runat="server" DataObjectTypeName="GISPuskesmasData.V_Berita" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetAllData" TypeName="GISPuskesmasLib.VBerita" UpdateMethod="Update"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="KategoriObjectDataSource" runat="server" SelectMethod="GetAllData" TypeName="GISPuskesmasLib.VKategori"></asp:ObjectDataSource>
    <script type="text/javascript">
        function AddNewLink_Click() {
            gridBerita.AddNewRow();
        }
    </script>
    <dx:ASPxGridView ID="BeritaDataASPxGridView" ClientInstanceName="gridBerita" runat="server" AutoGenerateColumns="False"
        KeyFieldName="BeritaID" DataSourceID="BeritaObjectDataSource" Width="100%" OnRowInserting="BeritaDataASPxGridView_RowInserting" OnRowUpdating="BeritaDataASPxGridView_RowUpdating">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0" Width="10%">
                <DeleteButton Visible="True">
                </DeleteButton>
                <EditButton Visible="True">
                </EditButton>
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
                <HeaderCaptionTemplate>
                    <div id="AddNewLink" style="text-decoration: underline; text-align: center" onclick="AddNewLink_Click()">
                        Add New
                    </div>
                </HeaderCaptionTemplate>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="BeritaID" VisibleIndex="0" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Judul" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="PostDate" VisibleIndex="2">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataMemoColumn FieldName="Isi" VisibleIndex="3">
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataComboBoxColumn FieldName="KategoriID" Caption="Kategori" VisibleIndex="4">
                <PropertiesComboBox DataSourceID="KategoriObjectDataSource" TextField="NamaKategori" ValueField="KategoriID">
                </PropertiesComboBox>
                <%-- <EditItemTemplate>
                    <dx:ASPxComboBox ID="KatASPxComboBox" runat="server" Text='<%#Bind("KategoriID.NamaKategori") %>'
                        Value='<%#Bind("KategoriID") %>' TextField="NamaKategori" ValueField="KategoriID">
                    </dx:ASPxComboBox>
                </EditItemTemplate>--%>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataCheckColumn FieldName="Status" VisibleIndex="5" Visible="false">
            </dx:GridViewDataCheckColumn>
        </Columns>
        <SettingsText ConfirmDelete="Apakah Anda yakin menghapus data ini?" />
        <SettingsBehavior ConfirmDelete="true" />
        <SettingsEditing Mode="PopupEditForm" NewItemRowPosition="Bottom" EditFormColumnCount="2" />
        <SettingsPopup>
            <EditForm HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter" Modal="true" Height="200px"
                Width="550px" />
        </SettingsPopup>
    </dx:ASPxGridView>
</asp:Content>

