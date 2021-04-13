using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxEditors;

public partial class Admin_MasterData_Puskesmas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] != "admin")
        {
            KecamatanASPxGridView.Visible = false;
        }
    }

    protected void PuskesmasASPxGridView_BeforePerformDataSelect(object sender, EventArgs e)
    {
        var grid = (ASPxGridView)sender;
        Session["IdKecamatan"] = grid.GetMasterRowKeyValue();
    }

    protected void PuskesmasASPxGridView_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        var grid = (ASPxGridView)sender;
        var idkecamatan = Session["IdKecamatan"];
        var comboJenisPuskesmas = grid.FindEditFormTemplateControl("JenisPuskesmasASPxComboBox") as ASPxComboBox;

        if (idkecamatan != null)
        {
            e.NewValues["IdKecamatan"] = idkecamatan;
        }

        e.NewValues["JenisPuskesmas"] = comboJenisPuskesmas.Text;
    }

    protected void PuskesmasASPxGridView_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        var grid = (ASPxGridView)sender;
        var idkecamatan = Session["IdKecamatan"];
        var comboJenisPuskesmas = grid.FindEditFormTemplateControl("JenisPuskesmasASPxComboBox") as ASPxComboBox;

        if (idkecamatan != null)
        {
            e.NewValues["IdKecamatan"] = idkecamatan;
        }

        e.NewValues["JenisPuskesmas"] = comboJenisPuskesmas.Text;
    }
}