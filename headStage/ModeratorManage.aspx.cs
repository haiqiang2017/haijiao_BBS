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
using System.Collections.Generic;
using BBS.BLL;
using BBS.Entity;

namespace BBS.headStage
{
    public partial class ModeratorManage : System.Web.UI.Page
    {
        int plateID=0;
        public DataTable dt = null;
        public DataTable dt1 = null;
        public DataTable dt2 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            plateID = int.Parse(Session["plate"].ToString());
            //dt = new TopicBLL().GetTopicInfo(int.Parse( topicID));
            dt = BLL.TopicBLL.Get_TopicAllpt("论坛公告", plateID);
            chesi.DataSource = dt;
            chesi.DataBind();
            dt1 = BLL.TopicBLL.Get_TopicAllpt("置顶帖", plateID);
            bnzd.DataSource = dt1;
            bnzd.DataBind();
            dt2 = BLL.TopicBLL.Get_TopicAllpt("普通帖", plateID);
            ptzt.DataSource = dt2;
            ptzt.DataBind();

        }

        protected void deletej(object sender, EventArgs e)
        {

        }
    }
}
