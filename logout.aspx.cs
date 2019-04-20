using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string user = Session["UserName"].ToString();
        string zxzt = "离线";
        string sql_exit = "update B_user set zxzt='" + zxzt + "' where name='" + user + "'";
        DB db = new DB();
        if (db.ExecuteSQL(sql_exit))
        { Response.Redirect("login.aspx"); }
        else
        {
            Response.Write("<script>alert('注销失败!');</script>");
           // Response.Write("<script>alert('删除失败！');document.location='show_mycard.aspx';</script>");
        }
    }
}