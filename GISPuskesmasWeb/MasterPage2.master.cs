using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(Request.QueryString["logoff"]) == false && Request.QueryString["logoff"].ToLowerInvariant() == "true")
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            //ErrorMessage.Text = "You have been signed out";
            //ErrorMessage.Visible = true;
        }

        if (Session["admin"] != null)
        {
            //LoadAdmin();
            LoginHyperLink.Visible = false;
            //CurrentSessLoggHyperLink.Text = Convert.ToString(Session["admin"]).ToUpper();
        }

        else
        {
            Session["user"] = "user";
            LoadUser();
            //CurrentSessLoggHyperLink.Text = Convert.ToString(Session["user"]).ToUpper();
        }
    }

    protected void petaBtn_Click(object sender, EventArgs e)
    {
        var url = ConfigurationManager.AppSettings["UrlPeta"].ToString();
        Response.Redirect(url);
    }

    //private void LoadAdmin()
    //{
    //    KecamatanHyperLink.Visible = true;
    //    JenisPegawaiHyperLink.Visible = true;
    //    PuskesmasHyperLink.Visible = true;
    //    PuskesmasDetHyperLink.Visible = true;
    //    BeritaHyperLink.Visible = true;
    //}

    private void LoadUser()
    {
        KecamatanHyperLink.Visible = false;
        JenisPegawaiHyperLink.Visible = false;
        PuskesmasHyperLink.Visible = false;
        PuskesmasDetHyperLink.Visible = false;
        BeritaHyperLink.Visible = false;
        InfoPuskesmasHyperLink.Visible = false;
        LogOffHyperLink.Visible = false;
        //CurrentSessLoggHyperLink.Visible = false;
        BeritaPageHyperLink.Visible = true;
    }
}
