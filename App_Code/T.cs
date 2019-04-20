using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;
using System.Web.Script.Serialization;
/// <summary>
///T 包含系统中常用的静态方法
/// </summary>
public class T
{
	public T()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    #region
    /// <summary> 转半角的函数(DBC case) </summary>
    /// <param name="input">任意字符串</param>
    /// <returns>半角字符串</returns>
    ///<remarks>
    ///全角空格为12288，半角空格为32
    ///其他字符半角(33-126)与全角(65281-65374)的对应关系是：均相差65248
    ///</remarks>
    public static string ToDBC(string input)
    {
        char[] c=input.ToCharArray();
        for (int i = 0; i < c.Length; i++)
        {
            if (c[i]==12288)
            {
                c[i]= (char)32;
                continue;
            }
            if (c[i]>65280 && c[i]<65375)
                c[i]=(char)(c[i]-65248);
        }
        return new string(c);
    }
    #endregion

    public static string replace(string source)
    {
        //char[] c = input.ToCharArray();
        //for (int i = 0; i < c.Length; i++)
        //{
        //    if (c[i] == 12288)
        //    {
        //        c[i] = (char)32;
        //        continue;
        //    }
        //    if (c[i] > 65280 && c[i] < 65375)
        //        c[i] = (char)(c[i] - 65248);
        //}
        DB db = new DB();
        string sql = "select word from B_word";
        DataTable dt = db.GetDataTable(sql);
        string target=  dt.Rows[0].ToString();
        return source.Replace(source,target);
    }

    public static string preHandleSql(string para)
    {
        para = ToDBC(para);
        return para.Replace("'", "''").ToString();
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
                Type tt=dt.Columns[j].DataType;
                string tempColname = dt.Columns[j].ColumnName;
                jsonBuilder.Append(tempColname);
                jsonBuilder.Append("\":\"");
                string tempValue = dt.Rows[i][j].ToString();
                //if (tempColname == "TCRQ" || tempColname == "WXRQ" || tempColname == "BXRQ" || tempColname == "PRODUCTIONDATE" || tempColname == "GDJSSJ" || tempColname == "CKSJ" || tempColname == "CLWCSJ" || tempColname == "BTCRQ" || tempColname == "DJTCRQ" || tempColname == "DESIGNRQ" || tempColname == "RELEASERQ" || tempColname == "INITRQ" || tempColname == "CHANGERQ" || tempColname == "ARCHIVERQ" || tempColname == "BORROWRQ" || tempColname == "RETURNRQ")
                if (tt.Name == "DateTime" && tempColname != "CREATEDATE" && tempColname != "SCRQ")//刘靖修改 2016/3/3 简化日期字段的判断条件
                {
                    if (tempValue != null && !"".Equals(tempValue))
                    {
                        tempValue = Convert.ToDateTime(tempValue).ToShortDateString();//把数据库中取出来的日期转换为标准格式YYYY/MM/DD
                    }
                }
                if (!tempColname.Contains("BZ") && tempColname != "REMARK")
                {
                    jsonBuilder.Append(tempValue.Replace("\r\n", "<br/>").Replace("\"", "\\\"").Replace("\r", "\\r").Replace("\n", "\\n").Replace("\t", "\\t").ToString());
                }
                else
                {
                    jsonBuilder.Append(tempValue.Replace("\"", "\\\"").Replace("\r", "\\r").Replace("\n", "\\n").Replace("\t", "\\t").ToString());
                }
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

    #region dataTable转换成Json格式,不对日期格式做限制,显示yyyy-mm-dd hh24:mi:ss
    /// <summary>      
    /// dataTable转换成Json格式,不对日期格式做限制,显示yyyy-mm-dd hh24:mi:ss      
    /// </summary>      
    /// <param name="dt"></param>      
    /// <returns></returns>      
    public static string ToJson_LongDate(DataTable dt, int Count)
    {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.Append("[");

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            jsonBuilder.Append("{");
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                jsonBuilder.Append("\"");
                Type tt = dt.Columns[j].DataType;
                string tempColname = dt.Columns[j].ColumnName;
                jsonBuilder.Append(tempColname);
                jsonBuilder.Append("\":\"");
                string tempValue = dt.Rows[i][j].ToString();
                if (tempColname == "ARRIVALDATE")//刘靖修改 2016/3/3 简化日期字段的判断条件
                {
                    if (tempValue != null && !"".Equals(tempValue))
                    {
                        tempValue = Convert.ToDateTime(tempValue).ToShortDateString();//把数据库中取出来的日期转换为标准格式YYYY/MM/DD
                    }
                }
                jsonBuilder.Append(tempValue.Replace("\r\n", "<br/>").Replace("\"", "\\\"").Replace("\r", "\\r").Replace("\n", "\\n").Replace("\t", "\\t").ToString());
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

    public static string ToJsonCombo(DataTable dt)
    {
        StringBuilder jsonBuilder = new StringBuilder();

        jsonBuilder.Append("[");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            jsonBuilder.Append("{");
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                jsonBuilder.Append("\"");
                jsonBuilder.Append("text");
                jsonBuilder.Append("\":\"");
                string text = dt.Rows[i][j].ToString();
                jsonBuilder.Append(text);
                jsonBuilder.Append("\"");
            }
            //jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
            jsonBuilder.Append("},");
        }

        jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
        jsonBuilder.Append("]");

        string Json_data = "";
        Json_data = jsonBuilder.ToString();
        return Json_data;

    }

    public static string ChangeDate(string date)
    {
        string newdate = date;
        if (date != "" && !date.Contains("/"))
        {
            string newyear = date.Substring(0, 4);
            string newmonth = "";
            if (date.Substring(5, 1) == "0")
                newmonth = date.Substring(6, 1);
            else
                newmonth = date.Substring(5, 2);
            string newday = "";
            if (date.Substring(8, 1) == "0")
                newday = date.Substring(9, 1);
            else
                newday = date.Substring(8, 2);
            newdate = newyear + "/" + newmonth + "/" + newday;
        }
        return newdate;
    }

    /// <summary>
    /// 取得网站的根目录的URL
    /// </summary>
    /// <returns></returns>
    public static string GetRootURI()
    {
        string AppPath = "";
        HttpContext HttpCurrent = HttpContext.Current;
        HttpRequest Req;
        if (HttpCurrent != null)
        {
            Req = HttpCurrent.Request;

            string UrlAuthority = Req.Url.GetLeftPart(UriPartial.Authority);
            if (Req.ApplicationPath == null || Req.ApplicationPath == "/")
                //直接安装在   Web   站点   
                AppPath = UrlAuthority;
            else
                //安装在虚拟子目录下   
                AppPath = UrlAuthority + Req.ApplicationPath;
        }
        return AppPath;
    }

    #region 
    /// <summary>
    /// 对url解码
    /// </summary>
    public static string UrlDecode(string data)
    {
        if (data != null)
            data.Replace("%25", "%").Replace("%23", "#").Replace("%26", "&").Replace("%20", " ").Replace("%2B", "+").Replace("%2F", "/").Replace("%3F", "?").Replace("%3D", "=");
        else
            data = "";
        return data;
    }
    #endregion
}
