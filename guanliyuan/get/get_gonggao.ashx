<%@ WebHandler Language="C#" Class="get_gonggao" %>

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

public class get_gonggao :BaseHandler {

    public override void AjaxProcess(HttpContext context)
    {
        int page = Convert.ToInt32(context.Request.Params["page"]);//页索引
        int rows = Convert.ToInt32(context.Request.Params["rows"]);
        DB db = new DB();
        string sqlstr = "select * from(select t.*,rownum rn from(select * from B_gonggao ) t where rownum<=" + page * rows + ") where rn>" + (page - 1) * rows + "";
        ///条件查询 begin


        ///条件查询 end
        string sql = "select count(*) from B_bk";
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
                if (tempColname == "FSRQ" )
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