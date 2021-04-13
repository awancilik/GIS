using GISPuskesmasData;
using GISPuskesmasLib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BeritaPageDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Id"] != null)
        {
            var id = Convert.ToInt32(Request.QueryString["Id"]);
            Session["newsId"] = id;
            BeritaPageASPxNewsControl.DataSource = GetBeritaById(id);
            BeritaPageASPxNewsControl.DataBind();
        }
    }

    protected void PostButton_Click(object sender, EventArgs e)
    {
        var ob = new VKomentar();
        var ent = new V_Komentar();
        var email = EmailASPxTextBox.Text;
        var posting = KomentarASPxMemo.Text;
        ent.BeritaID = (int)Session["newsId"];
        ent.Email = email;
        ent.IsiKomentar = posting;
        ent.PostDate = DateTime.Today;
        ent.Nama = "USER";
        ob.Insert(ent);

        KomentarASPxNewsControl.DataBind();
        ClearInput();
    }

    private List<V_Berita> GetBeritaById(int Id)
    {
        var obj = new List<V_Berita>();
        var ob = new VBerita();
        var query = ob.GetBeritaByIdReturnList(Id);
        if (query != null)
        {
            obj = query;
        }
        return obj;
    }

    private void ClearInput()
    {
        EmailASPxTextBox.Text = string.Empty;
        KomentarASPxMemo.Text = string.Empty;
    }

}