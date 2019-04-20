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
    public partial class ListBBSnew : System.Web.UI.Page
    {
        //获取普通帖的信息
        protected DataTable dt = null;
        protected string plateID = "";
        //获取置顶帖的信息
        protected DataTable dt2 = null;
        //获取论坛公告贴
        protected DataTable dt3 = null;
        //获取版块的备注
        protected DataTable dt4 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                plateID = Request.QueryString["plateID"].ToString();
                dt4 = new plateBLL().GetplateRemark(Convert.ToInt32(plateID));
                dt = new TopicBLL().GetAllInfo(Convert.ToInt32(plateID));
                dt2 = new TopicBLL().GetTopic(Convert.ToInt32(plateID));
                dt3 = new TopicBLL().GetGonggaoTopic(Convert.ToInt32(plateID));
                rpGonggao.DataSource = dt3;
                rpGonggao.DataBind();
                rpzhiding.DataSource = dt2;
                rpzhiding.DataBind();
                reputong.DataSource = dt;
                reputong.DataBind();
                Application.Lock();
                Session["plate"] = plateID;
                Application.UnLock();
                string TopicID = dt.Rows[0]["topicID"].ToString();
                //更新帖子的阅读数
                new TopicBLL().updateReadCount(Convert.ToInt32(TopicID));

            }

        }
    }
}
