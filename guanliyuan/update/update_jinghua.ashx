<%@ WebHandler Language="C#" Class="update_jinghua" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
public class update_jinghua :  BaseHandler {

    public override void AjaxProcess(HttpContext context)
    {
        string json = "";
        string ID = context.Request.QueryString["ID"];
        //string fsf = context.Session["UserName"].ToString();
        //string shzt = context.Request.Params["SHZT"];
        string tzlx = context.Request.Params["TZLX"];


        DB db = new DB();
        string sqlupdate = "update b_card set tzlx='" + tzlx + "'where ID='" + ID + "'";
        bool result = db.ExecuteSQL(sqlupdate);
        if (db.ExecuteSQL(sqlupdate))
        {
            jinghua jinghua = new jinghua();
            jinghua.tzlx = tzlx;
            jinghua.ID = ID;
            JavaScriptSerializer jss = new JavaScriptSerializer();
            json = jss.Serialize(jinghua);
            context.Response.Write(json);
            context.Response.End();
        }
        else
        {
            context.Response.ContentType = "text/html";
            context.Response.Write("<script>alert('  错误!\\n添加失败！');</script>");
        }
    }


    public bool IsReusable {
    get {
        return false;
    }
}

}