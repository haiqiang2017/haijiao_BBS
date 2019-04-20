using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;


public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       Server.ScriptTimeout = 300;
        //txt_name.Text = "";
        //txt_password.Text = "";
        txt_name.Focus();
        //string id = Request.Params["id"];
        //if (id == "1")
        //{
        //    Application["useronline"] = (int)Application["useronline"]-1;
        //}
    }


    protected void Button_login_Click(object sender, EventArgs e)
    {

        string username = txt_name.Text.Trim();
        string password = txt_password.Text.Trim();
        string admin = "admin";
        string table = "B_user";
        string guanli = "管理员";
        string putong = "普通用户";
        string banzhu = "版主";
        string zaixian = "在线";
        string b_user = "B_USER";
        //string sqlxitong = "select * from B_USER where name='" + username + "'and MM='" + password + "'and qx='" +admin+ "'";
        //string sqlguanli = "select * from B_USER where name='" + username + "'and MM='" + password + "'and qx='"+guanli+"'";
        //string sqlputong = "select * from B_USER where name='" + username + "'and MM='" + password + "'and qx='" + putong + "'";
        //string sqlbanzhu = "select * from B_USER where name='" + username + "'and MM='" + password + "'and qx='" + banzhu + "'";
        string sqlselect ="select qx from B_user where name='"+username+"'and MM='"+password+"'";
        string sqlsel = "select id from B_user where zxzt='"+zaixian+"'";
        DB db = new DB();
       // DataTable dt = new DataTable();
       //dt = db.dataTable(sqlselect);

        //try
        //{
        //    string qx1 = dt.Rows[0]["qx"].ToString().Trim();
        //}
        //catch
        //{
        //    Response.Write("<script> alert('用户名或密码错误，请重新登录!');</script>");
        //}
        //dt = db.GetDataTable(sqlstr);
        //int count = dt.Rows.Count;//判断是否已经存在数据如果已经存在执行语句
        System.Data.DataTable dt = db.GetDataTable(sqlselect);
        if (dt.Rows.Count > 0)
        {
            string zxzt = "在线";
            DataTable dt1 = new DataTable();
            dt1 = db.dataTable(sqlselect);
            string qx = dt1.Rows[0]["qx"].ToString().Trim();
            if (qx == admin)
            {
                Session["UserName"] = username;
                Session["UserPwd"] = password;
                Session["userlevel"] = admin;
                Response.Cookies["user"].Value = username;
                Response.Cookies["user"].Expires = System.DateTime.Now.AddHours(2);
                string user = Server.UrlEncode(username);
                string sqlupdate = "update b_user set zxzt='" + zxzt + "'where name='" + username + "'";
                if (db.ExecuteSQL(sqlupdate))
                {
                    DataTable dt3 = db.GetDataTable(sqlsel);
                    Application["useronline"] = dt3.Rows.Count;
                    //DataSet dr = db.GetDataSet(sqlsel,b_user);
                    int i = db.ExecuteSql(sqlsel);
                    //Application["useronline"] = (int)Application["useronline"] + 1;
                    Application["useronline"]=db.ExecuteSql(sqlsel);
                    Response.Redirect("guanliyuan/guanliyuan.aspx?name= '"+username+"'");
                }
                else { Response.Write("<script> alert('系统维护中...');</script>"); }

            }
            if (qx == guanli)
            {
                
                Session["UserName"] = username;
                Session["UserPwd"] = password;
                Session["userlevel"] = guanli;
                Response.Cookies["user"].Value = username;
                Response.Cookies["user"].Expires = System.DateTime.Now.AddHours(2);
                string user = Server.UrlEncode(username);
                string sqlupdate = "update b_user set zxzt='" + zxzt + "'where name='" + username + "'";
                if (db.ExecuteSQL(sqlupdate))
                {
                    //Application["useronline"] = (int)Application["useronline"] + 1;
                    DataTable dt3 = db.GetDataTable(sqlsel);
                    Application["useronline"] = dt3.Rows.Count;
                    //Application["useronline"] = db.ExecuteSql(sqlsel);
                    Response.Redirect("guanliyuan/guanliyuan.aspx?name= '" + username + "'");
                }
                else { Response.Write("<script> alert('系统维护中...');</script>"); }
               
            }
            if (qx == putong)
            {
                Session["UserName"] = username;
                Session["UserPwd"] = password;
                Session["userlevel"] = putong;
                Response.Cookies["user"].Value = username;
                Response.Cookies["user"].Expires = System.DateTime.Now.AddHours(2);
                string user = Server.UrlEncode(username);
                string sqlupdate = "update b_user set zxzt='"+zxzt+"'where name='"+username+"'";
                if (db.ExecuteSQL(sqlupdate))
                {
                    //Application["useronline"] = (int)Application["useronline"] + 1;
                    Application["useronline"] = db.ExecuteSql(sqlsel);
                    Response.Redirect("youke.aspx?name= '" + username + "'");
                }
                else { Response.Write("<script> alert('系统维护中...');</script>"); }
            }
            if (qx == banzhu)
            {
                string sql1 = "select bkm from b_bk where bz='" + username + "'";
                DataTable dt2 = db.dataTable(sql1);
                Session["bkm"] = dt2.Rows[0]["bkm"].ToString().Trim();
                Session["UserName"] = username;
                Session["UserPwd"] = password;
                Session["userlevel"] = banzhu;
                Response.Cookies["user"].Value = username;
                Response.Cookies["user"].Expires = System.DateTime.Now.AddHours(2);
                string user = Server.UrlEncode(username);
                string sqlupdate = "update b_user set zxzt='" + zxzt + "'where name='" + username + "'";
                if (db.ExecuteSQL(sqlupdate))
                {

                    DataTable dt3 = db.GetDataTable(sqlsel);
                    Application["useronline"] = dt3.Rows.Count;
                    //Application["useronline"] = (int)Application["useronline"] + 1;
                    //Application["useronline"] = db.ExecuteSql(sqlsel);
                    Response.Redirect("banzhu/banzhu.aspx?name= '" + username + "'");
                }
                else { Response.Write("<script> alert('系统维护中...');</script>"); }
              
            }
        }
        else
        {
            Response.Write("<script> alert('用户名或密码错误，请重新登录!');</script>");
        }
    }
    protected void lbtnsy_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/youke.aspx");
    }
}

