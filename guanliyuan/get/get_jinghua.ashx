<%@ WebHandler Language="C#" Class="get_jinghua" %>

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

public class get_jinghua : BaseHandler {

    public override void AjaxProcess(HttpContext context)
    {
        int page = Convert.ToInt32(context.Request.Params["page"]);//页索引
        int rows = Convert.ToInt32(context.Request.Params["rows"]);
        DB db = new DB();
        string sqlstr = "select * from(select t.*,rownum rn from(select * from B_CARD ) t where rownum<=" + page * rows + ") where rn>" + (page - 1) * rows + "";
        string BKM = context.Request.Params["BKM"];
        string BT = context.Request.Params["BT"];
        string FTR = context.Request.Params["FTR"];
        string FTRQ1 = context.Request.Params["FTRQ1"];
        string FTRQ2 = context.Request.Params["FTRQ2"];
        string tzlx = "申请精华";
        string QSentence = " where 1=1 ";  //定义一个查询子句，当有一个或多个条件不为空时，使用该子句
        ///查询者等级的确定 
                if (tzlx != "" && tzlx!=null)
        {
            QSentence = QSentence + "and tzlx ='" + tzlx + "'";
        }
        if (BKM != "" && BKM!=null)
        {
            QSentence = QSentence + "and BKM='" + BKM + "'";
        }
        if (BT != "" && BT!=null)
        {
            QSentence = QSentence + "and BT='" + BT + "'";
        }
        if (FTR != "" && FTR!=null)
        {
            QSentence = QSentence + "and FTR='" + FTR + "'";
        }
        if (FTRQ1 != null && FTRQ1 != "")
        {
            QSentence = QSentence + " and FTRQ >= to_date('" + FTRQ1 + "','yyyy-mm-dd')";
        }
        if (FTRQ2 != null && FTRQ2 != "")
        {
            QSentence = QSentence + " and FTRQ <= to_date('" + FTRQ2 + "','yyyy-mm-dd')";
        }
        sqlstr = "select * from(select t.*,rownum rn from(select * from B_CARD " + QSentence + ") t where rownum<=" + page * rows + ") where rn>" + (page - 1) * rows + "";

        ///条件查询 end
        string sql = "select count(*) from B_CARD" + QSentence;
        int Count = db.GetCount(sql);//获取总条数
        DataTable dt = db.GetDataTable(sqlstr); //数据源             
        String jsonData = ToJson(dt, Count);
        context.Response.Write(jsonData);
        context.Response.End();
    }
    #region dataTable转换成Json格式
    /// <summary>      
    /// dataTable转换成Json格式      
    /// </summary>      
    /// <param name="dt"></param>      
    /// <returns></returns>      
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
                if (tempColname == "FTRQ"||tempColname=="JDRQ" )
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
    #endregion dataTable转换成Json格式

    public bool IsReusable {
        get {
            return false;
        }
    }

}