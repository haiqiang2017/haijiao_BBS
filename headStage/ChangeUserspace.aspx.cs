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
    public partial class ChangeUserspace : System.Web.UI.Page
    {
        string username = "";
        protected DataTable dt = null;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    username = Session["username"].ToString();
                    dt = userInfoBLL.AllUserInfo(username);


                }
                else
                {
                    Response.Write("<script>alert('用户名为空，请先登录')</script>");
                    Response.Redirect("LoginBBS.aspx");
                }

            }


        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                string name = Request.Form["truename"];
                string pwd = Request.Form["passwords"];
                string question = Request.Form["question"];
                string answer = Request.Form["answer"];
                username = Session["username"].ToString();
                userInfoBLL.UpdateInfo(name, question, answer, pwd, username);
                Response.Write("<script>alert('修改成功！')</script>");
                Response.Redirect("BBSIndex.aspx");
            }
        }

    }
}
