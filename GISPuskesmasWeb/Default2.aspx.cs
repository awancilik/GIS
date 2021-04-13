using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Subgurim.Controles;
using GISPuskesmasLib.MasterData;
using GISPuskesmasData;
using System.Text;
using DevExpress.Web.ASPxGridView;
using System.Threading;
using DevExpress.Web.ASPxCallback;
using System.ComponentModel;
using System.Web.Security;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(Request.QueryString["logoff"]) == false && Request.QueryString["logoff"].ToLowerInvariant() == "true")
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            Response.Redirect("Default2.aspx");
        }
        if (IsCallback)
        {
            Thread.Sleep(500);
        }
        if (!Page.IsPostBack)
        {
            LoadPuskesmas();
        }
        var gcon = new GControl(GControl.preBuilt.LargeMapControl);
        var control2 = new GControl(GControl.preBuilt.MenuMapTypeControl, new GControlPosition(GControlPosition.position.Top_Right));
        var options = new GMapUIOptions();
        options.maptypes_hybrid = false;
        options.keyboard = false;
        options.maptypes_physical = false;
        options.zoom_scrollwheel = true;

        var map = new GLatLng(-3.706250, 128.169666);
        var m = new GMapUI(options);



        Maps1.setCenter(map, 11);
        Maps1.Add(gcon);
        Maps1.Add(control2);
        Maps1.Add(new GControl(GControl.preBuilt.GOverviewMapControl, new GControlPosition(GControlPosition.position.Bottom_Left)));
        Maps1.Add(m);
    }

    protected string Maps1_MarkerClick(object s, GAjaxServerEventArgs e)
    {
        var r = string.Empty;
        var obj = new Vinfo();
        

        var info = obj.GetInfoByLatLng(e.point.lat, e.point.lng);
        var lnlg = new GLatLng(e.point.lat, e.point.lng);

        var infoWindow = new GInfoWindow(lnlg, "<iframe src='InfoGrid.aspx' frameborder='0' scrolling='yes' seamless='seamless'></iframe>");
        //InfoPageASPxNewsControl.DataSource = info;
        //InfoPageASPxNewsControl.Visible = true;
        //InfoPageASPxNewsControl.DataBind();

        Maps1.Add(infoWindow);
        Session["info"] = info;
        //InfoASPxGridView.DataSource = info;
        //InfoASPxGridView.AutoGenerateColumns = true;
        //InfoASPxGridView.KeyFieldName = String.Empty;
        //InfoASPxGridView.Visible = true;
        //InfoASPxGridView.DataBind();
        return r;
    }

    protected void SearchASPxButton_Click(object sender, EventArgs e)
    {
        var obj = new VPuskesmas();
        Maps1.resetInfoWindows();
        var kecList = obj.GetKecByName(SearchASPxTextBox.Text.Trim());
        if (kecList != null)
        {
            foreach (var item in kecList)
            {
                GLatLng latlng = new GLatLng((double)item.latitude, (double)item.longitude);
                Maps1.setCenter(latlng, 11, GMapType.GTypes.Normal);
                GMarker marker = new GMarker(latlng);
                GInfoWindowOptions windowOptions = new GInfoWindowOptions();
                GInfoWindow commonInfoWindow = new GInfoWindow(marker, item.NamaPuskesmas, windowOptions);
                Maps1.Add(commonInfoWindow);
            }
        }
    }

    private void LoadPuskesmas()
    {
        var obj = new VPuskesmas();
        Maps1.resetInfoWindows();
        var kecList = obj.GetAllData();
        if (kecList != null)
        {
            foreach (var item in kecList)
            {
                GLatLng latlng = new GLatLng((double)item.latitude, (double)item.longitude);
                Maps1.setCenter(latlng, 8, GMapType.GTypes.Normal);
                GMarker marker = new GMarker(latlng);
                GInfoWindowOptions windowOptions = new GInfoWindowOptions();
                GInfoWindow commonInfoWindow = new GInfoWindow(marker, item.NamaPuskesmas, windowOptions);
                Maps1.Add(commonInfoWindow);
            }
        }
    }

    protected void ASPxCallback1_Callback(object sender, CallbackEventArgs e)
    {
        int newsID = int.Parse(e.Parameter);
        var dataSource = InfoPageObjectDataSource as IHierarchicalDataSource;
        HierarchicalDataSourceView view = dataSource.GetHierarchicalView("");
        IHierarchicalEnumerable enumerable = view.Select();
        int index = 1;
        string text = "";

        foreach (object obj in enumerable)
        {
            if (newsID == index)
            {
                IHierarchyData data = enumerable.GetHierarchyData(obj);
                PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(data);
                PropertyDescriptor descriptor = properties.Find("Text", true);
                text = descriptor.GetValue(obj).ToString();
                break;
            }
            index++;
        }
        e.Result = text;
    }
}