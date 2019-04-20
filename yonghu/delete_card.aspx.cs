using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class yonghu_delete_card : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["ID"];
        string ftr = Request["FTR"].ToString();
        DB db = new DB();
        string sqldel = "delete from B_card where id='" + id + "'and ftr='" + ftr + "'";
        if (db.ExecuteSQL(sqldel))
        {
            Response.Write("<script>alert('恭喜你删除成功！');document.location='show_mycard.aspx';</script>");
            //   Response.Redirect("show_Message.aspx");
        }
        else
        {
            Response.Write("<script>alert('删除失败！');document.location='show_mycard.aspx';</script>");
        }
    }
}