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
    public partial class SelectBrow : System.Web.UI.Page
    {
        string username = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string filename = Request.Form["filename"];
            if (filename != null)
            {
                if (Session["username"] != null)
                {
                    username = Session["username"].ToString();
                    userInfoBLL.UpdateUserPhoto(filename, username);
                    Response.Write("yes");
                    Response.End();
                    Response.Redirect("UserSpace.aspx");
                }
                else
                {
                    Response.Write("no");
                    Response.End();
                }
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("../photos/");
            string filename = FileUpload1.FileName;
            FileUpload1.PostedFile.SaveAs(path + FileUpload1.FileName);
            if (Session["username"] != null)
            {
                username = Session["username"].ToString();
                userInfoBLL.UpdateUserPhoto(filename, username);
                Response.Write("<script>alert('修改完成')</script>");
                Response.Redirect("UserSpace.aspx");
            }

        }


    }

}
