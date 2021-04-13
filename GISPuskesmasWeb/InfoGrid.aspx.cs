using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GISPuskesmasLib.MasterData;
using GISPuskesmasData;

public partial class InfoGrid : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var v = new VPuskesmas();
        int Id = GetIdPuskesmas();
        var puskesmasName = v.GetDataById(Id);

        if (string.IsNullOrEmpty(puskesmasName.NamaPuskesmas))
            NamaKecamatan.Text = "-";
        else
            NamaKecamatan.Text = Convert.ToString(puskesmasName.NamaPuskesmas);
        
        InfoASPxGridView.DataSource = Session["info"];
        InfoASPxGridView.AutoGenerateColumns = true;
        InfoASPxGridView.KeyFieldName = String.Empty;
        InfoASPxGridView.Visible = true;
        InfoASPxGridView.DataBind();
    }

    private int GetIdPuskesmas()
    {
        int Id = 0;
        var vi = new List<V_Info>();
        vi = Session["info"] as List<V_Info>;
        foreach (var item in vi)
        {
            Id = (int)item.IdPuskesmas;
        }
        return Id;
    }
}