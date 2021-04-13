<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Kecamatan.aspx.cs" Inherits="Admin_MasterData_Kecamatan" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
        function AddNewLink_Click() {
            kecamatanGrid.AddNewRow();
        }
    </script>
    <asp:ObjectDataSource ID="KecamatanObjectDataSource" runat="server" DataObjectTypeName="GISPuskesmasData.V_Kecamatan"
        DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetAllData" TypeName="GISPuskesmasLib.MasterData.VKecamatan" UpdateMethod="Update" />
    <fieldset>
        <legend>Kecamatan</legend>
        <dx:ASPxGridView ID="KecamatanASPxGridView" runat="server" AutoGenerateColumns="False" DataSourceID="KecamatanObjectDataSource"
            KeyFieldName="IdKecamatan" Width="100%" ClientInstanceName="kecamatanGrid">
            <Templates>
                <EditForm>
                    <div style="padding: 4px 4px 3px 4px">
                        <div>
                            <div>
                                <div style="display: inline-block;">
                                    <dx:ASPxLabel ID="NamaKecamatanASPxLabel" runat="server" Text="Jenis Pegawai"></dx:ASPxLabel>
                                </div>
                                <div style="display: inline-block;">
                                    <dx:ASPxTextBox ID="NamaKecamatanASPxTextBox" runat="server" Width="150px" Text='<%#Bind("namakecamatan") %>'></dx:ASPxTextBox>
                                </div>
                                <div style="clear: both;">
                                </div>
                            </div>
                            <div>
                                <div style="display: inline-block;">
                                    <dx:ASPxLabel ID="KeteranganASPxLabel" runat="server" Text="Keterangan"></dx:ASPxLabel>
                                </div>
                                <div style="display: inline-block;">
                                    <dx:ASPxTextBox ID="KeteranganASPxTextBox" runat="server" Text='<%#Bind("keterangan") %>'></dx:ASPxTextBox>
                                </div>
                                <div style="clear: both;">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="text-align: right; padding: 2px 2px 2px 2px">
                        <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                            runat="server"></dx:ASPxGridViewTemplateReplacement>
                        <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                            runat="server"></dx:ASPxGridViewTemplateReplacement>
                    </div>
                </EditForm>
            </Templates>
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
                <dx:GridViewDataTextColumn FieldName="IdKecamatan" Visible="False" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nama Kecamatan" FieldName="namakecamatan" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="keterangan" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Dibuat Tanggal" FieldName="dibuattanggal" VisibleIndex="3">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="Dibuat Oleh" FieldName="dibuatoleh" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Dibarui Tanggal" FieldName="dibaruitanggal" VisibleIndex="5">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="Dibarui Oleh" FieldName="dibaruioleh" VisibleIndex="6">
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
    </fieldset>
</asp:Content>

