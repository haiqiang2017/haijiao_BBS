<%@ WebHandler Language="C#" Class="update_bankuai" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

public class update_bankuai : BaseHandler {

    public override void AjaxProcess(HttpContext context)
    {
        string json = "";
        string ID = context.Request.QueryString["ID"];

        string BKM = context.Request.Params["BKM"];
        string BZ = context.Request.Params["BZ"];
        string b = "版主";
        DB db = new DB();
        //DB db = new DB();
        //string sql_id = "select SEQ_REPAIR.nextval from dual";
        //System.Data.DataTable dt = db.GetDataTable(sql_id);
        //if (dt.Rows.Count > 0) ID = dt.Rows[0][0].ToString();
        //string sql_id = "select SEQ_BK.nextval from dual";
        //System.Data.DataTable dt = db.GetDataTable(sql_id);
        //if (dt.Rows.Count > 0) ID = dt.Rows[0][0].ToString();
        string sql = "update B_bk set BKM='"+T.preHandleSql(BKM)+"',BZ='"+T.preHandleSql(BZ)+"'where ID='"+ID+"'";
        string sqlupdate = "update B_user set qx='"+b+"'where name='"+BZ+"'";
        bool result = db.ExecuteSQL(sql);
        if (result&&db.ExecuteSQL(sqlupdate))
        {
            bankuai bankuai = new bankuai();
            bankuai.ID = ID;
            bankuai.BKM = BKM;
            bankuai.BZ = BZ;
            JavaScriptSerializer jss = new JavaScriptSerializer();
            json = jss.Serialize(bankuai);
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