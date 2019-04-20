using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class yonghu_replyMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null && Session["Userpwd"] != null)
        {
            string name = (string)Session["UserName"].ToString();
            JSF.Text = Request.QueryString["FSF"];
            txtnr.Focus();
            if (JSF.Text == (string)Session["UserName"].ToString())
            {
                Response.Write("<script> alert('不能给自己发送消息！');window.history.back(-1);</script>");
            }
            else
            {
                string YD = "已读";
                string sqlupdate = "update B_message set DBJ='" + YD + "'where fsf='" + JSF.Text.ToString() + "'and id='"+Request.QueryString["ID"]+"'";
                DB db = new DB();
                db.ExecuteSQL(sqlupdate);
            }
        }
        else
        {
            Response.Write("<script> alert('请先进行登录!');document.location='UserSpace.aspx';</script>");
        }
    }

    protected void lbtnsy_Click(object sender, EventArgs e)
    {
        Response.Redirect("../youke.aspx");
    }

    protected void sendMessage1_Click(object sender, EventArgs e)
    {
        string fsf = (string)Session["UserName"].ToString();
        string jsf = Request.QueryString["FSF"];
        string nr = txtnr.Text.Trim().ToString();
        string fsrq = System.DateTime.Now.ToString("yyyy-MM-dd");
        string dbj = "未读";

        DB db = new DB();
        string sqlstr = "select * from B_MESSAGE where NR='" + nr + "'and JSF='" + jsf + "'";
        DataTable dt = new DataTable();
        dt = db.GetDataTable(sqlstr);
        int count = dt.Rows.Count;//判断是否已经存在数据如果已经存在执行语句
        if (count == 0)
        {
            string sql_id = "select * from B_Message";
            System.Data.DataTable dr = db.GetDataTable(sql_id);
            ID = (dr.Rows.Count + 1).ToString();
            //string sqlquchong = "select * from B_Message where ID='" + ID + "'";
            //if (db.ExecuteSQL(sqlquchong))
            //{
            //    ID = (Convert.ToInt32(ID) + 1).ToString();
            //}
            string sql = "insert into B_Message(ID,FSF,JSF,NR,FSRQ,DBJ) values('" + ID + "','" + fsf + "','" + jsf + "','" + nr + "',to_date('" + fsrq + "','yyyy-mm-dd'),'" + dbj + "')";
            if (db.ExecuteSQL(sql))
            {
                Response.Write("<script>alert('恭喜你回复成功！');document.location='show_Message.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('sql语句错误');</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('请勿重发发送！');</script>");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        txtnr.Text = "";
        txtnr.Focus();
    }

    protected void btn_return_Click(object sender, EventArgs e)
    {
        Response.Redirect("show_Message.aspx");
    }
}
