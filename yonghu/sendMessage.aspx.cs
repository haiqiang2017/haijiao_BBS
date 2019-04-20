using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class yonghu_sendMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null && Session["Userpwd"] != null)
        {
            txtnr.Focus();
         string name = (string)Session["UserName"].ToString();
            JSF.Text = Request.QueryString["FTR"];
            
            if (JSF.Text == (string)Session["UserName"].ToString())
            {
                Response.Write("<script> alert('不能给自己发送消息！');window.history.back(-1);</script>");
            }
       }
        else
        {
           Response.Write("<script> alert('请先进行登录!');window.history.back(-1);</script>");          
        }
    }

    protected void lbtnsy_Click(object sender, EventArgs e)
    {
            Response.Redirect("../youke.aspx");
    }

    protected void sendMessage1_Click(object sender, EventArgs e)
    {
        string fsf= (string)Session["UserName"].ToString();
        string jsf = JSF.Text.Trim().ToString();
        string nr = txtnr.Text.Trim().ToString();
        string fsrq = System.DateTime.Now.ToString("yyyy-MM-dd");
        string dbj = "未读";

        DB db = new DB();
        string sqlstr = "select * from B_MESSAGE where NR='" +nr+ "' and jsf='"+jsf+"'";
        DataTable dt = new DataTable();
        dt = db.GetDataTable(sqlstr);
        int count = dt.Rows.Count;//判断是否已经存在数据如果已经存在执行语句
        if (count == 0)
        {
            string sql_id = "select * from B_Message";
            System.Data.DataTable dr = db.GetDataTable(sql_id);
            ID = (dr.Rows.Count + 1).ToString();
            //string sqlquchong = "select * from B_Message where ID='" + ID + "'";
            //while(db.ExecuteSQL(sqlquchong))
            //{
            //    ID = (Convert.ToInt32(ID) + 1).ToString();
            //}
            string sql = "insert into B_Message(ID,FSF,JSF,NR,FSRQ,DBJ) values('" + ID + "','" + fsf + "','" + jsf + "','" + nr + "',to_date('" + fsrq + "','yyyy-mm-dd'),'"+dbj+"')";
            if (db.ExecuteSQL(sql))
            {
                Response.Write("<script>alert('恭喜你发布成功！');document.location='../youke.aspx';</script>");
                Response.Redirect("../youke.aspx");
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
}