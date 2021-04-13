using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(Request.QueryString["logoff"]) == false && Request.QueryString["logoff"].ToLowerInvariant() == "true")
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            Response.Redirect("Default2.aspx");
            //ErrorMessage.Text = "You have been signed out";
            //ErrorMessage.Visible = true;
        }
        if (Page.IsPostBack)
        {
             Response.Redirect("Peta.aspx");
        }
    }
}