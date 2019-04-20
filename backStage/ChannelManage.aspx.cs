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


namespace BBS.backStage
{
    public partial class ChannelManage : System.Web.UI.Page
    {
        protected string page = "";
        protected DataTable dt = null;
        public int pageIndex = 1;
        //共多少页
        public int pageCount;
        protected void Page_Load(object sender, EventArgs e)
        {

            string deleteid = Request.Form["id"];
            if (deleteid != null)
            {
                if (plateBLL.DeletePlateInfo(int.Parse(deleteid)))
                {
                    Response.Write("yes");
                    Response.End();
                }

                else
                {
                    Response.Write("no");
                    Response.End();
                }
            }


            string myeditid = Request.Form["myeditid"];
            string editname = Request.Form["editname"];
            if (myeditid != null && editname != null)
            {
                if (plateBLL.UpdatePlateInfo(editname, int.Parse(myeditid)))
                {
                    Response.Write("yes");
                    Response.End();
                }

                else
                {
                    Response.Write("no");
                    Response.End();
                }
            }

            if (!IsPostBack)
            {
                dt = new plateBLL().GetSmallPlateinfo();
                PagedDataSource pds = new PagedDataSource();
                pds.AllowPaging = true;
                pds.PageSize = 9;
                pds.CurrentPageIndex = pageIndex - 1;
                pds.DataSource = dt.DefaultView;
                pageCount = pds.PageCount;
                rpSmallInfo.DataSource = pds;
                rpSmallInfo.DataBind();
            }
        }
    }
}
