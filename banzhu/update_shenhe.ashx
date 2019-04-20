<%@ WebHandler Language="C#" Class="update_shenhe" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

public class update_shenhe : BaseHandler {

    public override void AjaxProcess(HttpContext context)
    {
        string json = "";
        string ID = context.Request.QueryString["ID"];
        //string fsf = context.Session["UserName"].ToString();
        string shzt = context.Request.Params["SHZT"];
        string tzlx = context.Request.Params["TZLX"];
        string dbj = "未读！";
        string b = "版主";
        string nr = "您的内容未通过审核！";

        DB db = new DB();
        string sqlupdate = "update b_card set shzt='"+shzt+"',tzlx='"+tzlx+"'where ID='"+ID+"'";
        string sqlinsert = "insert into b_message (fsf,dbj,nr) values('"+b+"','"+dbj+"','"+nr+"')";
        if (shzt == "通过")
        {
            bool result = db.ExecuteSQL(sqlupdate);
            if (db.ExecuteSQL(sqlupdate))
            {
                shenhe shenhe = new shenhe();
                shenhe.shzt = shzt;
                shenhe.tzlx = tzlx;
                shenhe.ID = ID;
                JavaScriptSerializer jss = new JavaScriptSerializer();
                json = jss.Serialize(shenhe);
                context.Response.Write(json);
                context.Response.End();
            }
            else
            {
             context.Response.ContentType = "text/html";
              context.Response.Write("<script>alert('  错误!\\n添加失败！');</script>");
            }
        }
        else
        {
            db.ExecuteSQL(sqlinsert);

        }
    }


    public bool IsReusable {
        get {
            return false;
        }
    }

}