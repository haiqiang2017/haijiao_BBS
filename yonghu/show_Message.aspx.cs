using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class yonghu_show_Message : System.Web.UI.Page
{
    static string cmd = "id";
    static string strsort = "ASC";
    static string B_message = "B_Message";
    protected void Page_Load(object sender, EventArgs e)
    {
        user.Text = (string)Session["UserName"].ToString();
        bind();
    }
    protected void bind()
    {

        string sql = "";
        // string name = Request.QueryString["name"];
        DB db = new DB();
        string JSF = (string)Session["UserName"].ToString();

        sql = "select * from B_Message where jsf='"+JSF+"'or fsf='"+JSF+"'";

        DataSet ds = db.GetDataSet(sql, B_message);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ds.Tables[0].DefaultView.Sort = cmd + " " + strsort;
            message_grid_view.DataSource = ds.Tables[0].DefaultView;
            message_grid_view.DataBind();
        }
        else
        {
            Response.Write("<script>alert('您并没有消息。。。');window.history.back(-1);</script>");
        }
    }

    protected void user_Space_Click(object sender, EventArgs e)
    {
        if (Session["UserName"] != null && Session["Userpwd"] != null)
        {
            string username = Request.QueryString["name"];
            Response.Redirect("UserSpace.aspx?name=" + username);
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
            string username = Request.QueryString["name"];
            Response.Redirect("add_card.aspx?name=" + username);
        }
        else
        {
            Response.Write("<script> alert('请先进行登录!');</script>");
        }
    }
    protected void bind1()
    {
        DB db = new DB();
        int page = Convert.ToInt32(Request.Params["page"]);//页索引
        int rows = Convert.ToInt32(Request.Params["rows"]);
        page = 1;
        rows = 30;
        string sqlstr = "select * from(select t.*,rownum rn from(select * from B_Message ) t where rownum<=" + page * rows + ") where rn>" + (page - 1) * rows + "";
        string JSF = jsf.Value.ToString();
        string FSF = fsf.Value.ToString();
        string DBJ = dbj.Value.ToString();
        string FSRQ1 = fsrq1.Value.ToString();
        string FSRQ2 = fsrq2.Value.ToString();
        string QSentence = " where 1=1 ";  //定义一个查询子句，当有一个或多个条件不为空时，使用该子句
                                           ///查询者等级的确定  
        if (JSF!= "" &&JSF != null)
        {
            QSentence = QSentence + "and jsf='" + JSF + "'";
        }
        if (FSF!= "" &&FSF != null)
        {
            QSentence = QSentence + "and fsf='" + FSF + "'";
        }
        if (DBJ != "" && DBJ != null)
        {
            QSentence = QSentence + "and dbj='" + DBJ + "'";
        }
        if (FSRQ1 != null && FSRQ1 != "")
        {
            QSentence = QSentence + " and FSRQ >= to_date('" + FSRQ1 + "','yyyy-mm-dd')";
        }
        if (FSRQ2 != null && FSRQ2 != "")
        {
            QSentence = QSentence + " and FSRQ <= to_date('" + FSRQ2 + "','yyyy-mm-dd')";
        }
        sqlstr = "select * from(select t.*,rownum rn from(select * from B_Message " + QSentence + ") t where rownum<=" + page * rows + ") where rn>" + (page - 1) * rows + "";
        DataSet ds = db.GetDataSet(sqlstr, B_message);
        ds.Tables[0].DefaultView.Sort = cmd + " " + strsort;
        message_grid_view.DataSource = ds.Tables[0].DefaultView;
        message_grid_view.DataBind();
    }
    protected void CX_Click(object sender, EventArgs e)
    {
        bind1();
    }

    //protected void message_grid_view_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    string id = this.message_grid_view.DataKeys[e.RowIndex].Value.ToString();
    //    DB db = new DB();
    //    string sqldel = "delete B_message where id='"+id+"'";
    //    if (db.ExecuteSQL(sqldel))
    //    {
    //        this.message_grid_view.EditIndex = -1;
    //    }
    //    else
    //    {
    //        Response.Write("<script>alert('删除失败！')</script>");
    //    }
    //}

    protected void lbtnsy_Click(object sender, EventArgs e)
    {
        Response.Redirect("../youke.aspx");
    }

    protected void message_grid_view_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        message_grid_view.PageIndex = e.NewPageIndex;
        bind();
    }
}