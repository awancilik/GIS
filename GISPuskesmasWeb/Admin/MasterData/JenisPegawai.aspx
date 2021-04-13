<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="JenisPegawai.aspx.cs" Inherits="Admin_MasterData_JenisPegawai" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function AddNewLink_Click() {
            jenisPegawaiGrid.AddNewRow();
        }
    </script>
    <asp:ObjectDataSource ID="JenisPegawaiObjectDataSource" runat="server" DataObjectTypeName="GISPuskesmasData.V_Pegawai"
        DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetAllData" TypeName="GISPuskesmasLib.MasterData.VPegawai" UpdateMethod="Update" />
    <fieldset>
        <legend>Jenis Pegawai</legend>
        <dx:ASPxGridView ID="JenisPegawaiASPxGridView" runat="server" AutoGenerateColumns="False" DataSourceID="JenisPegawaiObjectDataSource"
            KeyFieldName="IdPegawai" Width="100%" ClientInstanceName="jenisPegawaiGrid">
            <Templates>
                <EditForm>
                    <div style="padding: 4px 4px 3px 4px">
                        <div>
                            <div>
                                <div style="display: inline-block;">
                                    <dx:ASPxLabel ID="JenisPegawaiASPxLabel" runat="server" Text="Jenis Pegawai"></dx:ASPxLabel>
                                </div>
                                <div style="display: inline-block;">
                                    <dx:ASPxTextBox ID="JenisPegawaiASPxTextBox" runat="server" Width="150px" Text='<%#Bind("JenisPegawai") %>'></dx:ASPxTextBox>
                                </div>
                                <div style="clear: both;">
                                </div>
                            </div>
                            <div>
                                <div style="display: inline-block;">
                                    <dx:ASPxLabel ID="KeteranganASPxLabel" runat="server" Text="Keterangan"></dx:ASPxLabel>
                                </div>
                                <div style="display: inline-block;">
                                    <dx:ASPxTextBox ID="KeteranganASPxTextBox" runat="server" Text='<%#Bind("Keterangan") %>'></dx:ASPxTextBox>
                                </div>
                                <div style="clear: both;">
                                </div>
                            </div>
                            </>
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
                <dx:GridViewDataTextColumn FieldName="IdPegawai" Visible="False" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="JenisPegawai" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Keterangan" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="dibuattanggal" Caption="Dibuat Tanggal" VisibleIndex="3">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="dibuatoleh" Caption="Dibuat Oleh" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="dibaruioleh" Caption="Dibarui Oleh" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="dibaruitanggal" Caption="Dibarui Tanggal" VisibleIndex="6">
                </dx:GridViewDataDateColumn>
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

