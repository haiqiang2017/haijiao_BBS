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
    public partial class headsite : System.Web.UI.MasterPage
    {
        protected string username;
        protected void Page_Load(object sender, EventArgs e)
        {
            object session = Session["username"];
            if (session != null)
            {
                username = session.ToString();
            }
        }
    }
}
