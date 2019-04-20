using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class yonghu_deleteMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["ID"];
        string fsf = Request["fsf"].ToString();
        DB db = new DB();
        string sqldel = "delete from B_message where id='"+id+"'and fsf='"+fsf+"'";
        if (db.ExecuteSQL(sqldel))
        {
            Response.Write("<script>alert('恭喜你删除成功！');document.location='show_Message.aspx';</script>");
            //   Response.Redirect("show_Message.aspx");
        }
        else
        {
            Response.Write("<script>alert('删除失败！');document.location='show_Message.aspx';</script>");
        }
    }
}