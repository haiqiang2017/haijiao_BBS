using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Script.Serialization;
using System.Web.SessionState;
public partial class youke : System.Web.UI.Page
{
    static string cmd = "id";
        static string strsort = "ASC";
        static string B_card = "B_card";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (Session["username"] != null && Session["userpwd"] != null)
            {
                ZhuCe.Visible = false;
                userLogin.Visible = false;
                Label1.Visible = true;
                user.Visible = true;
                number.Visible = true;
                user.Text = Session["username"].ToString();
                string dbj = "未读";
                string sqlstr = "select * from b_message where jsf='" + Session["username"].ToString() + "'and dbj='"+dbj+"'";
                DB db = new DB();
                DataTable dt = new DataTable();
                dt = db.GetDataTable(sqlstr);
                number.Text = dt.Rows.Count.ToString();//判断是否已经存在数据如果已经存在执行语句,并将结果回number

            }
            else
            {
                tuichu.Visible = false;
                ToMessage.Visible = false;
                userLogin.Visible = true;
                Label1.Visible = true;
                user.Visible = false;
                number.Visible = false;
            }           
        }
        //DB db1 = new DB();
        //string sql_getGonggao = "select nr from (select rownum rn, t.* from B_gonggao t order by fsrq desc) t1 where t1.rn=1";
        //System.Data.DataTable dt1 = db1.GetDataTable(sql_getGonggao);
        bind();   
    }

    protected void bind()
    {
        string sql = "";
        string tg = "通过";
       // string name = Request.QueryString["name"];
        DB db = new DB();
        //"
         sql = "select * from B_card where shzt='"+tg+"'";
       //int count= db.GetCount(sql);
       //if(count>=0)
        DataSet ds = db.GetDataSet(sql, B_card);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ds.Tables[0].DefaultView.Sort = cmd + " " + strsort;
            gvlt.DataSource = ds.Tables[0].DefaultView;
            gvlt.DataBind();
        }
        else
        {
            Response.Write("<script>alert('论坛维护中。。。');document.location='login.aspx'</script>");
        }
    }
    protected void bind1()
    {
        DB db = new DB();
        int page = Convert.ToInt32(Request.Params["page"]);//页索引
        int rows = Convert.ToInt32(Request.Params["rows"]);
        page = 1;
        rows = 30;
        string sqlstr = "select * from(select t.*,rownum rn from(select * from B_CARD ) t where rownum<=" + page * rows + ") where rn>" + (page - 1) * rows + "";
        string BKM = bkm.Value.ToString();
        string TZLX = tzlx.Value.ToString();
        string BT = bt.Text.Trim().ToString();
        string FTR = ftr.Text.Trim().ToString();
        string FTRQ1 = ftrq1.Value.ToString();
        string FTRQ2 = ftrq2.Value.ToString();
        string QSentence = " where 1=1 ";  //定义一个查询子句，当有一个或多个条件不为空时，使用该子句
                                           ///查询者等级的确定  
        if (TZLX != "" && TZLX != null)
        {
            QSentence = QSentence + "and TZLX='" + TZLX + "'";
        }
        if (BKM != "" && BKM != null)
        {
            QSentence = QSentence + "and BKM='" + BKM + "'";
        }
        if (BT != "" && BT != null)
        {
            QSentence = QSentence + "and BT='" + BT + "'";
        }
        if (FTR != "" && FTR != null)
        {
            QSentence = QSentence + "and FTR='" + FTR + "'";
        }
        if (FTRQ1 != null && FTRQ1 != "")
        {
            QSentence = QSentence + " and FTRQ >= to_date('" + FTRQ1 + "','yyyy-mm-dd')";
        }
        if (FTRQ2 != null && FTRQ2 != "")
        {
            QSentence = QSentence + " and FTRQ <= to_date('" + FTRQ2 + "','yyyy-mm-dd')";
        }
        sqlstr = "select * from(select t.*,rownum rn from(select * from B_CARD " + QSentence + ") t where rownum<=" + page * rows + ") where rn>" + (page - 1) * rows + "";
        DataSet ds = db.GetDataSet(sqlstr, B_card);
            ds.Tables[0].DefaultView.Sort = cmd + " " + strsort;
            gvlt.DataSource = ds.Tables[0].DefaultView;
            gvlt.DataBind();
    }
    protected void CX_Click(object sender, EventArgs e)
    {
        bind1();
    }



    protected void userLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("./login.aspx");
    }


    protected void ZhuCe_Click(object sender, EventArgs e)
    {
        Response.Redirect("./B_register.aspx");
    }

    protected void user_Space_Click(object sender, EventArgs e)
    {
       
        if (Session["UserName"] != null && Session["Userpwd"] != null)
        {
            string username = Request.QueryString["name"];
            Response.Redirect("yonghu/UserSpace.aspx?name=" + username);
        }
        else
        {
            Response.Write("<script> alert('请先进行登录!');</script>");
        }
    }

    protected void addcard_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["UserName"] != null && Session["Userpwd"] != null)
        {
            string username = (string)Session["UserName"].ToString();
            Response.Redirect("yonghu/add_card.aspx?name=" + username);
        }
        else
        {
            Response.Write("<script> alert('请先进行登录!');</script>");
        }
    }

    protected void ToMessage_Click(object sender, EventArgs e)
    {
        Response.Redirect("yonghu/show_message.aspx");
    }

    protected void tuichu_Click(object sender, EventArgs e)
    {
        string zxzt = "离线";
        string sql_exit = "update B_user set zxzt='"+zxzt+"'";
        DB db = new DB();
        db.ExecuteSQL(sql_exit);
        Response.Redirect("login.aspx");
    }

    protected void gvlt_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvlt.PageIndex = e.NewPageIndex;
        bind();
    }
}
