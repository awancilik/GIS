using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxEditors;

public partial class Admin_MasterData_Berita : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] != "admin")
        {
            BeritaDataASPxGridView.Visible = false;
        }
    }

    protected void BeritaDataASPxGridView_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        var gv = (ASPxGridView)sender;
        var cbKategori = gv.FindEditRowCellTemplateControl((GridViewDataColumn)gv.Columns["Kategori"], "KategoriID") as ASPxComboBox ;
        if (cbKategori != null)
        {
            cbKategori.Value = e.NewValues["KategoriID"];
        }
    }

    protected void BeritaDataASPxGridView_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        var gv = (ASPxGridView)sender;
        var cbKategori = gv.FindEditRowCellTemplateControl((GridViewDataColumn)gv.Columns["Kategori"], "KategoriID") as ASPxComboBox;
        if (cbKategori != null)
        {
            cbKategori.Value = e.NewValues["KategoriID"];
        }
    }
}