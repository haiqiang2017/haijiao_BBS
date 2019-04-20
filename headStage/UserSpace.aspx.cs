using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using BBS.BLL;

namespace BBS.headStage
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string username = "";
        protected DataTable dt =null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                username = Session["username"].ToString();
                dt = userInfoBLL.UserInfo(username);
            }
            else
            {
                Response.Write("<script>alert('用户名为空，请先登录')</script>");
                Response.Redirect("LoginBBS.aspx");
            }
        }
    }
}
