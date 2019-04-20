<%@ WebHandler Language="C#" Class="insert_user" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Web.SessionState;
public class insert_user : BaseHandler {

    public override void AjaxProcess(HttpContext context) {
        string json = "";        
        string ID = context.Request.QueryString["ID"];
        string name = context.Request.Params["NAME"];
        string MM = context.Request.Params["MM"];
        string QX = context.Request.Params["QX"];
        string ZCRQ = System.DateTime.Today.ToString("yyyy-MM-dd");
        DB db = new DB();
        string sql_id = "select SEQ_BK.nextval from dual";
        System.Data.DataTable dt = db.GetDataTable(sql_id);
        if (dt.Rows.Count > 0) ID =  dt.Rows[0][0].ToString();
        string sql = "insert into B_user(ID,NAME,MM,ZCRQ,QX) values ('" + ID + "','" + T.preHandleSql(name) + "','"+MM+"',to_date('" + ZCRQ + "','yyyy-mm-dd'),'" + QX + "')";
        bool result = db.ExecuteSQL(sql);
        if (result)
        {
            user user = new user();
            user.ID = ID;
            user.name = name;
            user.qx = QX;
            user.zcrq = ZCRQ;
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