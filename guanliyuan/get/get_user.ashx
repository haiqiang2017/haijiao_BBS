<%@ WebHandler Language="C#" Class="get_user" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Web.Script.Serialization;
using System.Web.SessionState;

public class get_user : BaseHandler {

    public override void AjaxProcess(HttpContext context)
    {
        int page = Convert.ToInt32(context.Request.Params["page"]);//页索引
        int rows = Convert.ToInt32(context.Request.Params["rows"]);
        //string dm = Convert.ToString(context.Session["dm"]);//获取队名
        //string km = Convert.ToString(context.Session["km"]);//获取矿名
        string userlevel = Convert.ToString(context.Session["userlevel"]);
        string putong = "普通用户";
        DB db = new DB();
        string sqlstr = "select * from(select t.*,rownum rn from(select * from B_user ) t where rownum<=" + page * rows + ") where rn>" + (page - 1) * rows + "";
        ///条件查询 begin
        string NAME = context.Request.Params["NAME"];
        //string MM = context.Request.Params["MM"];
        //string QX = context.Request.Params["QX"];
        string ZCRQ = context.Request.Params["ZCRQ"];
        string ZCRQ1 = context.Request.Params["ZCRQ1"];
        string ZCRQ2 = context.Request.Params["ZCRQ2"];
        string QSentence = " where 1=1 ";  //定义一个查询子句，当有一个或多个条件不为空时，使用该子句



        if (NAME != null && NAME != "")
        {
            QSentence = QSentence + " and NAME like '%" + T.preHandleSql(NAME) + "%'";
        }
        //if (MM!= null && MM!= "")
        //{
        //    QSentence = QSentence + " and BZ like '%" + T.preHandleSql(MM) + "%'";
        //}
        //if (QX!= null && QX!= "")
        //{
        //    QSentence = QSentence + " and qx like '%" + T.preHandleSql(QX) + "%'";
        //}
        if (ZCRQ1 != null && ZCRQ1 != "")
        {
            QSentence = QSentence + " and ZCRQ >= to_date('" + ZCRQ1 + "','yyyy-mm-dd')";
        }
        if (ZCRQ2 != null && ZCRQ2 != "")
        {
            QSentence = QSentence + " and ZCRQ <= to_date('" + ZCRQ2 + "','yyyy-mm-dd')";
        }
        if (userlevel == "管理员")
        {
            QSentence = QSentence + " and qx ='"+putong+"'";
                     sqlstr = "select * from(select t.*,rownum rn from(select * from B_user " + QSentence + ") t where rownum<=" + page * rows + ") where rn>" + (page - 1) * rows + "";
        }
        //对权限进行限定
        if (userlevel == "admin")
        {
            sqlstr = "select * from(select t.*,rownum rn from(select * from B_user " + QSentence + ") t where rownum<=" + page * rows + ") where rn>" + (page - 1) * rows + "";
        }

        ///条件查询 end
        string sql = "select count(*) from B_user" + QSentence;
        int Count = db.GetCount(sql);//获取总条数
        DataTable dt = db.GetDataTable(sqlstr); //数据源             
        String jsonData = ToJson(dt, Count);
        context.Response.Write(jsonData);
        context.Response.End();
    }

    public static string ToJson(DataTable dt, int Count)
    {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.Append("[");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            jsonBuilder.Append("{");
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                jsonBuilder.Append("\"");
                string tempColname = dt.Columns[j].ColumnName;
                jsonBuilder.Append(tempColname);
                jsonBuilder.Append("\":\"");
                string tempValue = dt.Rows[i][j].ToString();
                if (tempColname == "ZCRQ" )
                {
                    if (tempValue != null && !"".Equals(tempValue))
                    {
                        tempValue = Convert.ToDateTime(tempValue).ToShortDateString();//把数据库中取出来的日期转换为标准格式YYYY-MM-DD
                    }
                }
                jsonBuilder.Append(tempValue);
                jsonBuilder.Append("\",");
            }
            jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
            jsonBuilder.Append("},");
        }
        if (dt.Rows.Count > 0) jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
        jsonBuilder.Append("]");
        jsonBuilder.Append("}");
        string Json_data = "";
        Json_data = "{\"total\":" + Count.ToString() + ",\"rows\":" + jsonBuilder.ToString();
        return Json_data;
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}