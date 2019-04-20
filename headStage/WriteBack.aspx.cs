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
using BBS.Entity;


namespace BBS.headStage
{
    public partial class WriteBack : System.Web.UI.Page
    {
        protected DataTable dt = null;
        protected string topicID = "";
        protected DataTable d = null;
        protected DataTable dt4 = null;
        protected void Page_Load(object sender, EventArgs e)
        {

            topicID = Request.QueryString["TopicID"].ToString();
            dt = new AnswerBLL().SelectTopicTiple(topicID);

            string plateID = Session["plate"].ToString();
            dt4 = new plateBLL().GetplateRemark(Convert.ToInt32(plateID));
        }

        protected void btnUpLoad_Click(object sender, EventArgs e)
        {

            if (Session["username"] != null)
            {
                if (hidContent.Value != string.Empty)
                {
                    string username = Session["username"].ToString();
                    d = new AnswerBLL().GetUserID(username);
                    int userID = int.Parse(d.Rows[0][0].ToString());
                    AnswerEntity answerInfo = new AnswerEntity();
                    answerInfo.userID = userID;
                    answerInfo.TopicID = (long)int.Parse(topicID.ToString());
                    answerInfo.AnswerDate = DateTime.Now;
                    answerInfo.AnswerContent = hidContent.Value;
                    BLL.AnswerBLL.InsertAnswerInfo(answerInfo);
                    Response.Write("<script>alert('回复成功！')</script>");
                    userInfoBLL.UpdateUserLevelCount(username);
                }
                Response.Write("<script>('内容不能为空!')</script>");
            }
            else
            {
                Response.Write("<script>alert('请先登录')</script>");
                Response.Redirect("LoginBBS.aspx");
            }
        }
    }
}
