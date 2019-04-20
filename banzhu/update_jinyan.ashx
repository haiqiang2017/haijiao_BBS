<%@ WebHandler Language="C#" Class="update_jinyan" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

public class update_jinyan :  BaseHandler {

    public override void AjaxProcess(HttpContext context)
    {
        string json = "";
        string ID = context.Request.QueryString["ID"];
        string name = context.Request.Params["NAME"];
        string bkm = context.Session["bkm"].ToString();
        string jyzt = context.Request.Params["JYZT"];
        string sqlinsert = "insert into B_jinyan (id,name,bkm)values('"+ID+"','"+name+"','"+bkm+"')";
        string sqlupdate = "update b_user set jyzt='" + jyzt + "'where ID='" + ID + "'";
        string sqldelete = "delete from b_jinyan where id='"+ID+"'";
        DB db = new DB();
        if (jyzt == "禁言"&&db.ExecuteSQL(sqlinsert))
        {
            jinyan jinyan = new jinyan();
            jinyan.ID = ID;
            jinyan.name = name;
            jinyan.bkm = bkm;
            JavaScriptSerializer jss = new JavaScriptSerializer();
            json = jss.Serialize(jinyan);
            context.Response.Write(json);
            context.Response.End();
        }
        if (jyzt=="解除禁言"&&db.ExecuteSQL(sqlupdate)&&db.ExecuteSQL(sqldelete))
        {
            user user = new user();
            user.ID = ID;
            user.name = name;
            user.jyzt = jyzt;
            JavaScriptSerializer jss = new JavaScriptSerializer();
            json = jss.Serialize(user);
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