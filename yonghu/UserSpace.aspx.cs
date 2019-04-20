using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class yonghu_UserSpace : System.Web.UI.Page
{
    protected DataTable dt = null;
    string username = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["username"] != null)
        {
            username = Session["username"].ToString();
            string sqlstr = "select name,tx,qm,jj from b_user where name='" + username + "'";
            DB db = new DB();
            dt = new DataTable();
            dt = db.GetDataTable(sqlstr);
        }
        else
        {
            Response.Write("<script>alert('用户名为空，请先登录')</script>");
            Response.Redirect("../login.aspx");
        }
        if (!this.IsPostBack)
        {
        }
    }
    protected void lbtnsy_Click1(object sender, EventArgs e)
    {
        Response.Redirect("../youke.aspx");
    }
}