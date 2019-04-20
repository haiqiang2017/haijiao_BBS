<%@ WebHandler Language="C#" Class="update_user" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

public class update_user : BaseHandler {

    public override void AjaxProcess(HttpContext context)
    {
        string json = "";
        string ID = context.Request.QueryString["ID"];
        string name = context.Request.Params["NAME"];
        string MM = context.Request.Params["MM"];
        string QX = context.Request.Params["QX"];
        string zcrq = System.DateTime.Today.ToString("yyyy-MM-dd");

        DB db = new DB();
        //string sql_id = "select SEQ_USER.nextval from dual";
        //System.Data.DataTable dt = db.GetDataTable(sql_id);
        //if (dt.Rows.Count > 0) ID = dt.Rows[0][0].ToString();
        string sqlupdate ="update B_user set name='"+T.preHandleSql(name)+"',MM='"+T.preHandleSql(MM)+"',qx='"+QX+"'where ID='"+ID+"'";
        bool result = db.ExecuteSQL(sqlupdate);
        if (result)
        {
            user user = new user();
            user.ID = ID;
            user.name = name;
            user.qx = QX;
            user.zcrq = zcrq;
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