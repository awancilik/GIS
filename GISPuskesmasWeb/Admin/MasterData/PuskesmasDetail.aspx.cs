using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;

public partial class Admin_MasterData_PuskesmasDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] != "admin")
        {
            PuskesmasASPxGridView.Visible = false;
        }
    }

    protected void PuskesmasDetailASPxGridView_BeforePerformDataSelect(object sender, EventArgs e)
    {
        var grid = (ASPxGridView)sender;
        Session["IdPuskesmas"] = grid.GetMasterRowKeyValue();
    }

    protected void PuskesmasDetailASPxGridView_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        var grid = (ASPxGridView)sender;
        var idPus = Session["IdPuskesmas"];
        var cbIdPegawai = grid.FindEditFormTemplateControl("JenisPegawaiASPxComboBox") as ASPxComboBox;
        if (idPus != null)
        {
            e.NewValues["IdPuskesmas"] = idPus;
        }
        e.NewValues["IdPegawai"] = cbIdPegawai.Value;
    }

    protected void PuskesmasDetailASPxGridView_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        var grid = (ASPxGridView)sender;
        var idPus = Session["IdPuskesmas"];
        var cbIdPegawai = grid.FindEditFormTemplateControl("JenisPegawaiASPxComboBox") as ASPxComboBox;
        if (idPus != null)
        {
            e.NewValues["IdPuskesmas"] = idPus;
        }
        e.NewValues["IdPegawai"] = cbIdPegawai.Value;
    }
}