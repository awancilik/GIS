using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GISPuskesmasData;
using GISPuskesmasLib.MasterData;
using GISPuskesmasLib.Utility;
using GISPuskesmasLib;
using DevExpress.Web.ASPxCallback;
using System.ComponentModel;

public partial class BeritaPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //var Id = Int32.Parse(Request.QueryString["1"].ToString());
        //Label.Text = GetIsiBerita(1);
        //Label.Visible = true;

        BeritaPageASPxNewsControl.ItemSettings.TailText = "Komentar...";
    }

    private string GetIsiBerita(int Id)
    {
        var str = string.Empty;
        var ob = new VBerita();
        var query = ob.GetBeritaById(Id);
        if (query != null)
        {
            str = query.Isi;
        }
        return str;
    }

    protected void ASPxCallback1_Callback(object sender, CallbackEventArgs e)
    {
        int newsID = int.Parse(e.Parameter);
        Session["newsId"] = newsID;
        //var news = GetIsiBerita(newsID);        
        //IHierarchicalDataSource dataSource = BeritaPageObjectDataSource as IHierarchicalDataSource;
        //HierarchicalDataSourceView view = dataSource.GetHierarchicalView("");
        //IHierarchicalEnumerable enumerable = view.Select();
        //int index = 1;
        //string text = "";

        //foreach (object obj in enumerable)
        //{
        //    if (newsID == index)
        //    {
        //        IHierarchyData data = enumerable.GetHierarchyData(obj);
        //        PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(data);
        //        PropertyDescriptor descriptor = properties.Find("Text", true);
        //        text = descriptor.GetValue(obj).ToString();
        //        break;
        //    }
        //    index++;
        //}
        //e.Result = news;
    }

    protected void PostButton_Click(object sender, EventArgs e)
    {
        var ob = new VKomentar();
        var ent = new V_Komentar();
        var email = EmailASPxTextBox.Text;
        var posting = KomentarASPxMemo.Text;
        ent.BeritaID = (int)Session["newsId"];
        ent.IsiKomentar = posting;
        //ent.Email = 
        //ob.Insert(
    }
}