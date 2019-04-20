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


namespace BBS.headStage
{
    public partial class LoginBBS : System.Web.UI.Page
    {
        protected string username;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            string yzm = "";
            if (Session["yzm"] != null)
            {
                yzm = Session["yzm"].ToString();
            }
            username = txtName.Value;
            string password = txtPwd.Value;
            string code = txtCode.Value;


            if (username != null && password != null && code != null)
            {
                if (yzm != code)
                {
                    Response.Write("<script>alert('验证码错误')</script>");
                }
                else if (new BLL.userInfoBLL().GetUserInfo(username, password).Rows.Count > 0)
                {
                    Session["username"] = username;
                    if (Application["userCount"] != null)
                    {
                        Application.Lock();
                        int count = (int)Application["userCount"];
                        Application["userCount"] = count + 1;
                        Application.UnLock();
                    }
                    else
                    {
                        Application["userCount"] = 1;
                    }

                    Response.Redirect("BBSIndex.aspx");
                }
                else
                {
                    Response.Write("<script>alert('用户名或者密码输入有误！')</script>");
                }
            }

        }
    }
}
