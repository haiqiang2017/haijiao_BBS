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
using System.Web.UI.MobileControls;
using BBS.BLL;
using BBS.Entity;


namespace BBS.backStage
{
    public partial class AddSmalldoule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            plateBLL plate = new plateBLL();
            DataTable dt = plate.GetPlateModelInfo(0);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ListItem l = new ListItem();
                l.Text = dt.Rows[i]["PlateName"].ToString();
                l.Value = dt.Rows[i]["PlateID"].ToString();

                ddl.Items.Add(l);
            }

        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            string txtname = ddl.Text;
            string name = txtplateName.Value;
            string plateremark = txtRemark.Value;
            DataTable dt = new DataTable();
            dt = new plateBLL().GetplateIdInfo(txtname);
            int ParentID = int.Parse(ddl.SelectedValue.ToString());
            string state = "审批";
            plateBLL.InsertSmallInfo(name, state, plateremark, ParentID);
            Response.Write("<script>alert('增加成功！')</script>");
            Response.Redirect("ChannelManage.aspx");
        }
    }
}
