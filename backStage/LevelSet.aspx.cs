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
    public partial class LevelSet1 : System.Web.UI.Page
    {
        protected string page = "";
        //定义显示等级积分的信息表
        protected DataTable dt = null;
        //当前页码
        public int pageIndex = 1;
        //共多少页
        public int pageCount;
        protected void Page_Load(object sender, EventArgs e)
        {
            string deleteid = Request.Form["id"];
            if (deleteid != null)
            {
                if (LevelListBLL.DeleteLevelInfo(int.Parse(deleteid)))
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
                if (LevelListBLL.UpdateLevelListInfo(editname, int.Parse(myeditid)))
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
                string page = Request.QueryString["page"].ToString();
                pageIndex = int.Parse(page);
                dt = LevelListBLL.GetLevelAllInfo();
                PagedDataSource pds = new PagedDataSource();
                pds.AllowPaging = true;
                pds.PageSize = 10;
                pds.CurrentPageIndex = pageIndex - 1;
                pds.DataSource = dt.DefaultView;
                pageCount = pds.PageCount;
                rpLevelSet.DataSource = pds;
                rpLevelSet.DataBind();

            }

        }
    }
}
