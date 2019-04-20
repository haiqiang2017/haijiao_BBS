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
using System.Web.SessionState;
using Intertid.Framework.Logging;


namespace BBS.headStage
{
    public partial class BBSIndex : System.Web.UI.Page
    {
        int parentID = 0;
        public DataTable dt = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //dt = new TopicBLL().GetTopicInfo(int.Parse( topicID));
                dt = new BLL.plateBLL().GetModuleInfo(parentID);

                zhuye.DataSource = dt;
                zhuye.DataBind();
            }
        }
        public string inputHtml(Object userName)
        {
            string str = "";
            string moduleUserName = userName.ToString();

            str += "分区版主:";
            if (moduleUserName != null && moduleUserName != "")
            {
                str += moduleUserName;
            }
            else
                str += "暂无";
            return str;
        }

        public string inputHtml2(Object plateID)
        {
            int parentID = (int)plateID;
            string str = "";
            DataTable dtform = new BLL.plateBLL().GetModuleInfo(parentID);

            for (int i = 0; i < dtform.Rows.Count; i++)
            {

                str += "  <div class=\"bbsi_content_2_2\" style=\"height:60px;\">";
                str += "    <div style=\"float: left; width: 5%; padding-left:5px;\">";
                str += "             <img src=\"../pics/forum_new.gif\" />";
                str += "     </div>";
                str += "       <div style=\"float: left; width: 50%; border:\">";
                str += "          <strong style=\"color:Black;\">";
                str += "<a href=\"ListBBSnew.aspx?plateID=" + dtform.Rows[i]["plateID"] + "\">";
                str += dtform.Rows[i]["PlateName"] + "</a>";
                str += "</strong> &nbsp &nbsp (今天: <strong><span style=\" color:Red;\">0</span></strong>)";
                str += "                          <p style=\"margin-top: 3px;font-size :13px\">";
                str += "                            " + dtform.Rows[i]["PlateRemarks"] + "</p>";
                str += "     </div>";
                str += "     <div style=\"float: left; width:7%; padding-top: 5px;;height:45px;\">";
                str += "                      0/2</div>";
                str += "     <div style=\"float: left; width: 30%; height:30px;\">";
                str += "                  " + dtform.Rows[i]["TopicTitle"] + "</div>";
                str += "<br/>";
                str += "  </div>";
            }
            return str;
        }


    }
}
