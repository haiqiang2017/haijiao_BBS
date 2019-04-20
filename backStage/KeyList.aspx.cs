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
    public partial class KeyList : System.Web.UI.Page
    {
        protected string page = "";
        protected DataTable dt = null;
        //当前页码
        public int pageIndex = 1;
        //共多少页
        public int pageCount;
        protected void Page_Load(object sender, EventArgs e)
        {

            string qiyongid = Request.Form["qiyongid"];
            if (qiyongid != null)
            {
                if (KeyListBLL.UpdateinfoStart(int.Parse(qiyongid)))
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


            string tingyongid = Request.Form["tingyongid"];
            if (tingyongid != null)
            {
                if (KeyListBLL.UpdateinfoStop(int.Parse(tingyongid)))
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

            string deleteid = Request.Form["id"];
            if (deleteid != null)
            {
                if (KeyListBLL.DeleteKeyWordsInfo(int.Parse(deleteid)))
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

            string first = Request.Form["first"];
            string second = Request.Form["second"];
            string keyid = Request.Form["keyid"];
            if (first != null && second != null)
            {
                if (BLL.KeyListBLL.updateKeyWordsInfo(Convert.ToInt32(keyid), first, second))
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
                dt = KeyListBLL.GetKeyListAllInf0();
                PagedDataSource pds = new PagedDataSource();
                pds.AllowPaging = true;
                pds.PageSize = 4;
                pds.CurrentPageIndex = pageIndex - 1;
                pds.DataSource = dt.DefaultView;
                pageCount = pds.PageCount;
                reKeylist.DataSource = pds;
                reKeylist.DataBind();
            }
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            string keywords = txtKeywords.Value;
            DataTable dt2 = null;
            dt2 = KeyListBLL.SelectKeyListInfo(keywords);
            reKeylist.DataSource = dt2;
            reKeylist.DataBind();
        }
    }
}
