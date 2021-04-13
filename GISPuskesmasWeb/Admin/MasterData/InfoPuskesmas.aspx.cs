using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_MasterData_InfoPuskesmas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void InfoASPxGridView_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        var gv = (ASPxGridView)sender;
        var cbKategori = gv.FindEditRowCellTemplateControl((GridViewDataColumn)gv.Columns["IdPuskesmas"], "IdPuskesmas") as ASPxComboBox;
        if (cbKategori != null)
        {
            cbKategori.Value = e.NewValues["IdPuskesmas"];
        }
    }

    protected void InfoASPxGridView_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        var gv = (ASPxGridView)sender;
        var cbKategori = gv.FindEditRowCellTemplateControl((GridViewDataColumn)gv.Columns["IdPuskesmas"], "IdPuskesmas") as ASPxComboBox;
        if (cbKategori != null)
        {
            cbKategori.Value = e.NewValues["IdPuskesmas"];
        }
    }
}