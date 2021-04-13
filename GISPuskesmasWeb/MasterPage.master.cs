using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Reimers.Google.Map;
using GISPuskesmasLib.MasterData;
using GISPuskesmasData;
using Reimers.Google.Map.Maps;
using System.IO;
using System.Text;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GoKey();
    }

    protected void Map1_OverlayClick(object sender, OverlayEventArgs e)
    {
        Map1.ClearOverlays();
        var obj = new VPuskesmas();
        int Id = Convert.ToInt32(SearchDropDownList.SelectedValue);
        var list = obj.GetDataById(Id);

        var list2 = obj.GetPusekesmasDetailByPusId(list.IdPuskesmas);

        LatLng p = new LatLng();
        p.Latitude = Convert.ToDouble(list.latitude);
        p.Longitude = Convert.ToDouble(list.longitude);

        string html = string.Empty;
        html = ReadHTML(list.NamaPuskesmas);

        foreach (var i in list2)
        {
            html += ReadHTML(i.JenisPegawai, i.Jumlah.ToString());
        }

        var info = new InfoWindow
        {
            Position = p, //e.Overlay.Bounds.Center.ToLatLng(),
            Content = html,
            MaxWidth = 1024,
        };

        var marker = new Marker
        {
            Clickable = true,
            Point = e.Overlay.Bounds.Center.ToLatLng()
        };

        e.MapCommand = e.Map.AddOverlay(info);
    }

    protected void Map1_Click(object sender, CoordinatesEventArgs e)
    {
        Map1.ClearOverlays();
        AddPoint(e);
    }

    private void AddPoint(CoordinatesEventArgs e)
    {
        var obj = new VPuskesmas();
        int Id = Convert.ToInt32(SearchDropDownList.SelectedValue);
        var list = obj.GetDataById(Id);

        if (list != null)
        {
            LatLng p = new LatLng();
            p.Latitude = Convert.ToDouble(list.latitude);
            p.Longitude = Convert.ToDouble(list.longitude);

            var marker = new Marker
            {
                Clickable = true,
                Point = p
            };
            e.MapCommand = e.Map.AddOverlay(marker);
        }
    }

    private string ReadHTML(string puskesmas)
    {

        var html = string.Format("<h1>Data Puskesmas</h1>" +
                                    "<div>" +
                                    "<p>" +
                                    "Nama Puskesmas : {0}" +
                                   "</p>" +
                                "</div>", puskesmas);

        return html;
    }

    private string ReadHTML(string jenisPegawai, string jumlah)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<table border='1' cellspacing='1' cellpadding='5'>");
        sb.Append("<thead>");
        sb.Append("<tr>");
        sb.Append("<th>");
        sb.Append("Jenis Pegawai");
        sb.Append("</th>");
        sb.Append("<th>");
        sb.Append("Jumlah");
        sb.Append("</th>");
        sb.Append("</tr>");
        sb.Append("</thead>");
        sb.Append("<tr>");
        sb.Append(string.Format("<td> {0} </td>", jenisPegawai));
        sb.Append(string.Format("<td> {0} </td>", jumlah));
        sb.Append("</tr>");
        sb.Append("</table>");

        return sb.ToString();
    }

    private string GoKey()
    {
        return Map1.ApiKey = ConfigurationManager.AppSettings["GoogleMapKey"].ToString();
    }

    private void ClearOverlay()
    {
        if (Map1.Overlays != null)
        {
            Map1.ClearOverlays();
        }
    }

    protected void AdminLink_Click(object sender, EventArgs e)
    {
        string url = ConfigurationManager.AppSettings["AdminUrl"].ToString();
        Response.Redirect(url);
    }
}
