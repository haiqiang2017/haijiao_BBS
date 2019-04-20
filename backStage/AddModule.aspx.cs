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


namespace BBS.backStage
{
    public partial class Addmodule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            plateEntity plateInfo = new plateEntity();
            plateInfo.PlateName = txtname.Value;
            plateBLL.InsertPlateInfo(plateInfo);
            Response.Write("<script>alert('增加成功！')</script>");
            Response.Redirect("ModuleList.aspx");
        }
    }
}
