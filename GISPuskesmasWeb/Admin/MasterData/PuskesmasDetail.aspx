<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="PuskesmasDetail.aspx.cs" Inherits="Admin_MasterData_PuskesmasDetail" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
        function AddNewLink_Click() {
            PuskesmasDetailGrid.AddNewRow();
        }
    </script>
    <%--Puskesmas Detail--%>
    <asp:ObjectDataSource ID="PuskesmasObjectDataSource" runat="server" DataObjectTypeName="GISPuskesmasData.V_Puskesma"
        DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetAllData" TypeName="GISPuskesmasLib.MasterData.VPuskesmas" UpdateMethod="Update" />
    <asp:ObjectDataSource ID="PuskesmasDetailObjectDataSource" runat="server" DataObjectTypeName="GISPuskesmasData.V_Puskesmas_Detail"
        DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetDataByIdPuskesmas" TypeName="GISPuskesmasLib.MasterData.VPuskesmasDetail" UpdateMethod="Update">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="IdPus" SessionField="IdPuskesmas" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="JenisPegawaiObjectDataSource" runat="server" DataObjectTypeName="GISPuskesmasData.V_Pegawai"
        DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetAllData" TypeName="GISPuskesmasLib.MasterData.VPegawai" UpdateMethod="Update" />
    <fieldset>
        <legend>Data Puskesmas Detail</legend>
        <dx:ASPxGridView ID="PuskesmasASPxGridView" runat="server" AutoGenerateColumns="False" DataSourceID="PuskesmasObjectDataSource"
            KeyFieldName="IdPuskesmas" Width="100%">
            <Templates>
                <DetailRow>
                    <dx:ASPxGridView ID="PuskesmasDetailASPxGridView" runat="server" AutoGenerateColumns="False" DataSourceID="PuskesmasDetailObjectDataSource"
                        OnBeforePerformDataSelect="PuskesmasDetailASPxGridView_BeforePerformDataSelect" Width="100%"
                        ClientInstanceName="PuskesmasDetailGrid" KeyFieldName="IdPuskesmasDetail" OnRowInserting="PuskesmasDetailASPxGridView_RowInserting" OnRowUpdating="PuskesmasDetailASPxGridView_RowUpdating">
                        <Templates>
                            <EditForm>
                                <div style="padding: 4px 4px 3px 4px">
                                    <div>
                                        <div>
                                            <div style="display: inline-block;">
                                                <dx:ASPxLabel ID="JenisPegawaiASPxLabel" runat="server" Text="Jenis Pegawai"></dx:ASPxLabel>
                                            </div>
                                            <div style="display: inline-block;">
                                                <dx:ASPxComboBox ID="JenisPegawaiASPxComboBox" runat="server" DataSourceID="JenisPegawaiObjectDataSource"
                                                    TextField="JenisPegawai" ValueField="IdPegawai" Text='<%#Bind("JenisPegawai") %>'
                                                    Value='<%#Bind("IdPegawai") %>'>
                                                </dx:ASPxComboBox>
                                            </div>
                                            <div style="clear: both;">
                                            </div>
                                        </div>
                                        <div>
                                            <div style="display: inline-block;">
                                                <dx:ASPxLabel ID="JumlahASPxLabel" runat="server" Text="Jumlah"></dx:ASPxLabel>
                                            </div>
                                            <div style="display: inline-block;">
                                                <dx:ASPxTextBox ID="JumlahASPxTextBox1" runat="server" Width="150px" Text='<%#Bind("Jumlah") %>'>
                                                </dx:ASPxTextBox>
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
                            <dx:GridViewDataTextColumn FieldName="IdPuskesmasDetail" Visible="False" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="IdPuskesmas" Visible="False" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="IdPegawai" Visible="False" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="JenisPegawai" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Jumlah" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Keterangan" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="DibuatTanggal" VisibleIndex="6">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="DibuatOleh" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="DibaruiTanggal" VisibleIndex="8">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="DibaruiOleh" VisibleIndex="9">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsText ConfirmDelete="Apakah Anda yakin menghapus data ini?" />
                        <SettingsBehavior ConfirmDelete="true" />
                        <SettingsEditing Mode="PopupEditForm" NewItemRowPosition="Bottom" />
                        <SettingsPopup>
                            <EditForm HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter" Modal="true" Height="200px"
                                Width="440px" />
                        </SettingsPopup>
                    </dx:ASPxGridView>
                </DetailRow>
            </Templates>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="IdPuskesmas" Visible="False" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="IdKecamatan" Visible="False" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NamaKecamatan" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NamaPuskesmas" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="KodePuskesmas" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Alamat" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="JenisPuskesmas" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="latitude" Visible="False" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="longitude" Visible="False" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="keterangan" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="DibuatTanggal" VisibleIndex="10">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="DibuatOleh" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="DibaruiTanggal" VisibleIndex="12">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="DibaruiOleh" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsDetail AllowOnlyOneMasterRowExpanded="true" ShowDetailRow="true" ShowDetailButtons="true" />
        </dx:ASPxGridView>
    </fieldset>
</asp:Content>

