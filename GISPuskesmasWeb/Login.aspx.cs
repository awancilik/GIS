using GISPuskesmasLib;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["out"] != null)
        {
            Session["admin"] = null;
        }
    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        if (Login1.UserName == "admin" && Login1.Password == "admin")
        {
            e.Authenticated = true;
            Session["admin"] = "admin";
            Response.Redirect("Default2.aspx");
        }
        else if (Login1.UserName == "user" && Login1.Password == "user")
        {
            e.Authenticated = true;
            Session["user"] = "user";
            Response.Redirect("Default2.aspx");
        }
        else
        {
            e.Authenticated = false;
        }
    }
}