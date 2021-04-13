<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="InfoPuskesmas.aspx.cs" Inherits="Admin_MasterData_InfoPuskesmas" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v12.1, Version=12.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function AddNewLink_Click() {
            gridInfo.AddNewRow();
        }
    </script>
    <asp:ObjectDataSource ID="PuskesmasObjectDataSource" runat="server" DataObjectTypeName="GISPuskesmasData.V_Puskesma"
        DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetAllData" TypeName="GISPuskesmasLib.MasterData.VPuskesmas" UpdateMethod="Update"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="InfoObjectDataSource" runat="server" DataObjectTypeName="GISPuskesmasData.V_Info" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetAllData" TypeName="GISPuskesmasLib.MasterData.Vinfo" UpdateMethod="Update" />
    <dx:ASPxGridView ID="InfoASPxGridView" ClientInstanceName="gridInfo" runat="server" AutoGenerateColumns="False" DataSourceID="InfoObjectDataSource" Width="100%" OnRowInserting="InfoASPxGridView_RowInserting" OnRowUpdating="InfoASPxGridView_RowUpdating"
        KeyFieldName="InfoID">
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
            <dx:GridViewDataTextColumn FieldName="InfoID" Visible="False" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Nama Puskesmas" FieldName="IdPuskesmas" VisibleIndex="1">
                <PropertiesComboBox DataSourceID="PuskesmasObjectDataSource" TextField="NamaPuskesmas" ValueField="IdPuskesmas">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="Judul Info" FieldName="InfoJudul" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Post Date" FieldName="InfoPostDate" VisibleIndex="3">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Isi Info" FieldName="InfoIsi" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
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

