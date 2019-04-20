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
using BBS.Entity;
using BBS.BLL;


namespace BBS.headStage
{
    public partial class BBSRegister : System.Web.UI.Page
    {
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
            string yam2 = Code.Value;


            if (yam2 != yzm)
            {
                Response.Write("<script>alert('验证码错误')</script>");
            }
            else if (new BLL.userInfoBLL().IsExist(txtName.Value) == true)
            {
                Response.Write("<script>alert('您输入的用户名已被注册，请重新输入！')</script>");

            }
            else
            {
                //初始化用户对象
                userInfoEntity userInfo = new userInfoEntity();
                //为用户对象赋值
                userInfo.username = txtName.Value;
                userInfo.truename = txtTruename.Value;
                userInfo.password = firstPwd.Value;
                userInfo.userSex = Sex.Value.ToString() == "男" ? 1 : 0;//0为女，1为男
                userInfo.question = question.Value;
                userInfo.answer = answear.Value;
                userInfo.phone = Convert.ToInt32(userphone.Value);
                userInfo.Tel = userTel.Value;
                userInfo.userEmail = email.Value;
                BLL.userInfoBLL.InsertUserInfo(userInfo);
                Response.Write("<script>alert('注册成功！')</script>");
                userInfoBLL.UpdateLevelCount(txtName.Value);
                Response.Redirect("LoginBBS.aspx");
            }
        }
    }
}
