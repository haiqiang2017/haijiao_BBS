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
    public partial class UserList : System.Web.UI.Page
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
                if (userInfoBLL.DeleteUserLittleInfo(int.Parse(deleteid)))
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
                if (userInfoBLL.UpdateUserLittleInfo(editname, int.Parse(myeditid.Replace("edite", ""))))
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
                dt = new userInfoBLL().GetUserLittleInfo();
                PagedDataSource pds = new PagedDataSource();
                pds.AllowPaging = true;
                pds.PageSize = 7;
                pds.CurrentPageIndex = pageIndex - 1;
                pds.DataSource = dt.DefaultView;
                pageCount = pds.PageCount;
                rpDetail.DataSource = pds;
                rpDetail.DataBind();

            }

        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            string keyword = txtname.Value;
            DataTable dt2 = new userInfoBLL().GetByKeyWords(keyword);
            rpDetail.DataSource = dt2;
            rpDetail.DataBind();

        }
    }
}
