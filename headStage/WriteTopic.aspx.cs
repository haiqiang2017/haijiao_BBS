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
    public partial class WriteTopic : System.Web.UI.Page
    {
        protected DataTable dt = null;
        protected DataTable dt4 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            string plateID = Session["plate"].ToString();
            dt4 = new plateBLL().GetplateRemark(Convert.ToInt32(plateID));
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            string username = "";
            string plateID = Request.QueryString["plateID"];
            if (Session["username"] != null)
            {
                
                
                if (txtTitle.Value != "" && hidContent.Value != string.Empty)
                {
                    username = Session["username"].ToString();
                    dt = new AnswerBLL().GetUserID(username);
                    int userID = Convert.ToInt32(dt.Rows[0][0]);
                    TopicEntity topicInfo = new TopicEntity();
                    topicInfo.userID = userID;
                    topicInfo.writeDate = DateTime.Now;
                    topicInfo.TopicTitle = txtTitle.Value;
                    topicInfo.plateID = Convert.ToInt32(plateID);
                    topicInfo.TopicContent = hidContent.Value;
                    topicInfo.lastTime = DateTime.Now;
                    BLL.TopicBLL.InsertTopicInformation(topicInfo);
                    Response.Write("<script>alert('发帖成功！')</script>");
                    userInfoBLL.UpdateUserInfoAllcount(username);
                }
                else
                {
                    Response.Write("<script>alert('标题或内容不能为空')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('请先登录')</script>");
                Response.Redirect("LoginBBS.aspx");
            }

        }
    }
}
