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
    public partial class NewTopicManage : System.Web.UI.Page
    {
        protected string page="";
        //定义获取信息表
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
                if (TopicBLL.DeleteTopicLittleInfo(int.Parse(deleteid)))
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
                string  page = Request.QueryString["page"].ToString();
                pageIndex = int.Parse(page);
                dt = new TopicBLL().GetTopicLitterInfo();
                PagedDataSource pds = new PagedDataSource();
                pds.AllowPaging = true;
                pds.PageSize = 10;
                pds.CurrentPageIndex = pageIndex-1;
                pds.DataSource = dt.DefaultView;
                pageCount = pds.PageCount;
                rpInfo.DataSource = pds;
                rpInfo.DataBind();

            }
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            string keywords = txtkeyword.Value;
            DataTable dt2 = TopicBLL.GetByKeyWordInfo(keywords);
            rpInfo.DataSource = dt2;
            rpInfo.DataBind();
        }
    }
}
