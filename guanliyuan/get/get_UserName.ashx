<%@ WebHandler Language="C#" Class="get_UserName" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
public class get_UserName : BaseHandler {

    public override void AjaxProcess(HttpContext context)
    {
             DB db = new DB() ;
        string sqlstr = "select distinct name from B_USER b order BY name asc";
        System.Data.DataTable dt = db.GetDataTable(sqlstr);

        String jsonData = ToJsonCombo(dt);
        context.Response.Write(jsonData);
        context.Response.End();
    }
         
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
    public bool IsReusable {
        get {
            return false;
        }
    }

}