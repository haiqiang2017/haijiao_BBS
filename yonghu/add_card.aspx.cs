using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

public partial class add_card : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            //实现方式有一个禁言了，所有帖子都发布了
            //string user_name = (string)Session["UserName"].ToString();
            //string bankuai = bkm.Value.ToString();
            Server.ScriptTimeout = 300;
            //DB db = new DB();
            //string sqlselect = "select * from B_jinyan where name='" + user_name + "'and bkm='" + bankuai + "'";
            //if (db.GetCount(sqlselect) >= 0)
            //{
            //               Response.Write("<script>alert('你已经被该板块禁言，无法发送！');window.location.href ='../youke.aspx?name=" + user_name + "'</script>");
            //}
        }
        DQYH.Text = (string)Session["UserName"].ToString();
    }
    protected void lbtnsy_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/youke.aspx");
    }

    protected void send_Click(object sender, EventArgs e)
    {
       
        string user_name = (string)Session["UserName"].ToString();
        string bankuai = bkm.Value.ToString();
        string bt = txtbt.Text.Trim().ToString();
        string nr = txtnr.Text.Trim().ToString();
        string ftrq = System.DateTime.Today.ToString("yyyy-MM-dd");
        string shzt = "审核中";
        string tzlx = "普通";
        DB db = new DB();
        string sqlstr = "select * from B_card where FTR='" + user_name + "'and BT='" + bt + "'";
        //禁言判定
        string sqlselect = "select * from B_jinyan where name='" + user_name + "'and bkm='" + bankuai + "'";
        DataTable dt = new DataTable();
        if (db.GetCount(sqlselect) <= 0)
        {
            dt = db.GetDataTable(sqlstr);
            int count = dt.Rows.Count;//判断是否已经存在数据如果已经存在执行语句
            if (count == 0)
            {
              //  string sql_id = "select * from B_card";
                string sql_id = "select SEQ_card.nextval from dual";
                System.Data.DataTable dr = db.GetDataTable(sql_id);
                if (dr.Rows.Count > 0) ID = dr.Rows[0][0].ToString();
                //System.Data.DataTable dr = db.GetDataTable(sql_id);
                //ID = (dr.Rows.Count + 1).ToString();
                //string sqlquchong = "select * from B_card where ID='" + ID + "'";
                //if (db.ExecuteSQL(sqlquchong))
                //{
                //    ID = (Convert.ToInt32(ID) + 1).ToString();
                //}
                //发帖后对数据库中的字段进行更新
                string sqlfts = "update B_user set fts=fts+1 where name='"+user_name+"'";
                string sql = "insert into B_card(ID,BKM,BT,FTR,FTRQ,HTCS,FWCS,NR,shzt,tzlx) values('" + ID + "','" + bankuai + "','" + bt + "','" + user_name + "',to_date('" + ftrq + "','yyyy-mm-dd'),'0','0','" + nr + "','" + shzt + "','" + tzlx + "')";
                if (db.ExecuteSQL(sql)&&db.ExecuteSQL(sqlfts))
                {
                    //Server.Execute("add_card.aspx");//执行注册界面
                    Session["UserName"] = user_name;
                    //   Response.Write("<script>alert('等待版主审核！！');</script>");
                    Response.Write("<script>alert('等待版主审核!');window.location.href ='../youke.aspx?name=" + user_name + "'</script>");
                    //   Response.Redirect("../youke.aspx?name=" + user_name);
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
        else
        {
            Response.Write("<script>alert('你已经被该板块禁言，无法发送！');window.location.href ='../youke.aspx?name=" + user_name + "'</script>");
        }
    }
}