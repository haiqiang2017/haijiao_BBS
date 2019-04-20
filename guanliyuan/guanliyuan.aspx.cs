using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class guanliyuan_guanliyuan : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            string username = (string)Session["UserName"].ToString();
            labelname.Text = username;
        }
        else
        {
            Response.Write("<script>alert('对不起，请先登录！');</script>");
        }
    }

}