<%@ WebHandler Language="C#" Class="update_gonggao" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;


public class update_gonggao :  BaseHandler {

    public override void AjaxProcess(HttpContext context)
    {
        string json = "";
        string ID = context.Request.QueryString["ID"];
        string nr = context.Request.Params["NR"];
        string fsr = context.Session["UserName"].ToString();
        string fsrq = System.DateTime.Today.ToString("yyyy-MM-dd");
        DB db = new DB();
        //string sql_id = "select gonggao.nextval from dual";
        //System.Data.DataTable dt = db.GetDataTable(sql_id);
        //if (dt.Rows.Count > 0) ID = dt.Rows[0][0].ToString();
        string sql = "update B_gonggao set fsr='"+T.preHandleSql(fsr)+"',fsrq =to_date('" + fsrq + "','yyyy-mm-dd'),nr='"+nr+"' where ID='"+ID+"'";
        bool result = db.ExecuteSQL(sql);
        if (result)
        {
            gonggao gonggao = new gonggao();
            gonggao.ID = ID;
            gonggao.fsr = fsr;
            gonggao.fsrq = fsrq;
            gonggao.nr = nr;
            JavaScriptSerializer jss = new JavaScriptSerializer();
            json = jss.Serialize(gonggao);
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