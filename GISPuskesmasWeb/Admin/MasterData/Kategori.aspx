<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Kategori.aspx.cs" Inherits="Admin_MasterData_Kategori" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function AddNewLink_Click() {
            gridKategori.AddNewRow();
        }
    </script>
    <asp:ObjectDataSource ID="KatObjectDataSource" runat="server" DataObjectTypeName="GISPuskesmasData.V_Kategori" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetAllData" TypeName="GISPuskesmasLib.VKategori" UpdateMethod="Update"></asp:ObjectDataSource>
    <dx:ASPxGridView ID="KategoriASPxGridView" ClientInstanceName="gridKategori" runat="server"
        KeyFieldName="KategoriID" AutoGenerateColumns="False" DataSourceID="KatObjectDataSource"
        Width="100%">
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
            <dx:GridViewDataTextColumn FieldName="KategoriID" Visible="False" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NamaKategori" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsText ConfirmDelete="Apakah Anda yakin menghapus data ini?" />
        <SettingsBehavior ConfirmDelete="true" />
        <SettingsEditing Mode="PopupEditForm" NewItemRowPosition="Bottom" />
        <SettingsPopup>
            <EditForm HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter" Modal="true" Height="90px"
                Width="440px" />
        </SettingsPopup>
    </dx:ASPxGridView>
</asp:Content>

