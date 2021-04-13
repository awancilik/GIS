<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Puskesmas.aspx.cs" Inherits="Admin_MasterData_Puskesmas" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
        function AddNewLink_Click() {
            kecamatanGrid.AddNewRow();
        }

        function AddNewLinkDetail_Click() {
            puskesmasGrid.AddNewRow();
        }
    </script>
    <fieldset>
        <legend>Kecamatan-Puskesmas</legend>
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
                <DetailRow>
                    <dx:ASPxGridView ID="PuskesmasASPxGridView" runat="server" AutoGenerateColumns="False" DataSourceID="PuskesmasObjectDataSource"
                        Width="100%" KeyFieldName="IdPuskesmas" ClientInstanceName="puskesmasGrid" OnBeforePerformDataSelect="PuskesmasASPxGridView_BeforePerformDataSelect" OnRowInserting="PuskesmasASPxGridView_RowInserting" OnRowUpdating="PuskesmasASPxGridView_RowUpdating">
                        <Templates>
                            <EditForm>
                                <div style="padding: 4px 4px 3px 4px">
                                    <div style="text-align: left;">
                                        <div>
                                            <div style="display: inline-block;">
                                                <dx:ASPxLabel ID="KodePuskesmasASPxLabel" runat="server" Text="Kode Puskesmas"></dx:ASPxLabel>
                                            </div>
                                            &nbsp;
                                            <div style="display: inline-block;">
                                                <dx:ASPxTextBox ID="KodeASPxTextBox" runat="server" Text='<%#Bind("KodePuskesmas") %>' Width="170px">
                                                </dx:ASPxTextBox>
                                            </div>
                                            <div style="clear: both;">
                                            </div>
                                        </div>
                                        <div>
                                            <div style="display: inline-block;">
                                                <dx:ASPxLabel ID="NamaPuskesmasASPxLabel" runat="server" Text="Nama Puskesmas"></dx:ASPxLabel>
                                            </div>
                                            &nbsp;
                                            <div style="display: inline-block;">
                                                <dx:ASPxTextBox ID="NamaPuskesmasASPxTextBox" runat="server" Text='<%#Bind("NamaPuskesmas") %>' Width="170px">
                                                </dx:ASPxTextBox>
                                            </div>
                                            <div style="clear: both;">
                                            </div>
                                        </div>
                                        <div>
                                            <div style="display: inline-block;">
                                                <dx:ASPxLabel ID="AlamatASPxLabel" runat="server" Text="Alamat"></dx:ASPxLabel>
                                            </div>
                                            &nbsp;
                                            <div style="display: inline-block;">
                                                <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Text='<%#Bind("Alamat") %>' Width="170px">
                                                </dx:ASPxTextBox>
                                            </div>
                                            <div style="clear: both;">
                                            </div>
                                        </div>
                                        <div>
                                            <div style="display: inline-block;">
                                                <dx:ASPxLabel ID="JenisPuskesmasASPxLabel" runat="server" Text="Jenis Puskesmas"></dx:ASPxLabel>
                                            </div>
                                            &nbsp;
                                            <div style="display: inline-block;">
                                                <dx:ASPxComboBox ID="JenisPuskesmasASPxComboBox" runat="server" Width="170px">
                                                    <Items>
                                                        <dx:ListEditItem Text="Rawat Inap" Value="0" />
                                                        <dx:ListEditItem Text="Non Rawat Inap" Value="1" />
                                                    </Items>
                                                </dx:ASPxComboBox>
                                            </div>
                                            <div style="clear: both;">
                                            </div>
                                        </div>
                                        <div>
                                            <div style="display: inline-block;">
                                                <dx:ASPxLabel ID="LatitudeASPxLabel" runat="server" Text="Latitude (Lintang)"></dx:ASPxLabel>
                                            </div>
                                            &nbsp;
                                            <div style="display: inline-block;">
                                                <dx:ASPxTextBox ID="LatitudeASPxTextBox" runat="server" Text='<%#Bind("latitude") %>' Width="170px">
                                                </dx:ASPxTextBox>
                                            </div>
                                            <div style="clear: both;">
                                            </div>
                                        </div>
                                        <div>
                                            <div style="display: inline-block;">
                                                <dx:ASPxLabel ID="LongitudeASPxLabel" runat="server" Text="Longitude (Bujur)"></dx:ASPxLabel>
                                            </div>
                                            &nbsp;
                                            <div style="display: inline-block;">
                                                <dx:ASPxTextBox ID="LongitudeASPxTextBox" runat="server" Text='<%#Bind("longitude") %>' Width="170px">
                                                </dx:ASPxTextBox>
                                            </div>
                                            <div style="clear: both;">
                                            </div>
                                        </div>
                                        <div>
                                            <div style="display: inline-block;">
                                                <dx:ASPxLabel ID="KeteranganASPxLabel" runat="server" Text="Keterangan"></dx:ASPxLabel>
                                            </div>
                                            &nbsp;
                                            <div style="display: inline-block;">
                                                <dx:ASPxTextBox ID="KeteranganASPxTextBox" runat="server" Text='<%#Bind("keterangan") %>' Width="170px"></dx:ASPxTextBox>
                                            </div>
                                            <div style="clear: both;">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div style="text-align: right; padding: 2px 2px 2px 2px;">
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
                                    <div id="AddNewLink" style="text-decoration: underline; text-align: center" onclick="AddNewLinkDetail_Click()">
                                        Add New
                                    </div>
                                </HeaderCaptionTemplate>
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="IdPuskesmas" Visible="False" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="IdKecamatan" Visible="False" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="NamaKecamatan" Visible="false" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="KodePuskesmas" Caption="Kode Puskesmas" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="NamaPuskesmas" Caption="Nama Puskesmas" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Alamat" Caption="Alamat" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="JenisPuskesmas" Caption="Jenis Puskesmas" VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Latitude (Garis Lintang)" FieldName="latitude" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Longitude(Garis Bujur)" FieldName="longitude" VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Keterangan" FieldName="keterangan" VisibleIndex="9">
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
                        <SettingsText ConfirmDelete="Apakah Anda yakin menghapus data ini?" />
                        <SettingsBehavior ConfirmDelete="true" />
                        <SettingsEditing Mode="PopupEditForm" NewItemRowPosition="Bottom" />
                        <SettingsPopup>
                            <EditForm HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter" Modal="true" Height="300px"
                                Width="400px" />
                        </SettingsPopup>
                    </dx:ASPxGridView>
                </DetailRow>
            </Templates>
            <Columns>
                <%-- <dx:GridViewCommandColumn VisibleIndex="0" Width="10%">
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
                </dx:GridViewCommandColumn>--%>
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
            <SettingsDetail ShowDetailRow="true" ShowDetailButtons="true" AllowOnlyOneMasterRowExpanded="true" />
            <SettingsBehavior ConfirmDelete="true" />
            <SettingsText ConfirmDelete="Apakah Anda Yakin menghapus data ini?" />
            <SettingsEditing Mode="PopupEditForm" NewItemRowPosition="Bottom" />
            <SettingsPopup>
                <EditForm HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter" Modal="true" Height="90px"
                    Width="440px" />
            </SettingsPopup>
        </dx:ASPxGridView>
    </fieldset>
    <asp:ObjectDataSource ID="PuskesmasObjectDataSource" runat="server" DataObjectTypeName="GISPuskesmasData.V_Puskesma"
        DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetDataByKecId" TypeName="GISPuskesmasLib.MasterData.VPuskesmas" UpdateMethod="Update">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="kecId" SessionField="IdKecamatan" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="KecamatanObjectDataSource" runat="server" DataObjectTypeName="GISPuskesmasData.V_Kecamatan"
        DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetAllData" TypeName="GISPuskesmasLib.MasterData.VKecamatan" UpdateMethod="Update" />

</asp:Content>

