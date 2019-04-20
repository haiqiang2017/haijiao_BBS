using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.OleDb;

public partial class B_register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void register_Click(object sender, EventArgs e)
    {
        string user_name = txt_name.Text.Trim();
        string user_pwd = txt_passwd.Text.Trim();
        string user_mmts = MMTS.Text.Trim();
        string user_DA = DA.Text.Trim();
        string user_email = txt_mail.Text.Trim();
        string user_qm = QM.Text.Trim();
        string user_jj = JJ.Text.Trim();
        string user_qx = "普通用户";
        int length = TX.PostedFile.ContentLength;
        string str_type = TX.PostedFile.ContentType;
        string jyzt = "解除禁言";
        string file_name = TX.PostedFile.FileName;
        string path = Server.MapPath("./");
        string imgpath = path + "images/" + file_name;
        if (file_name != null)
        {
            if (length < 1024 * 1024 * 5)
            {
                if (str_type.IndexOf("png") > -1 || str_type.IndexOf("jpg") > -1 || str_type.IndexOf("image/jpeg") > -1)
                {
                    TX.PostedFile.SaveAs(imgpath);
                }
                else
                {
                    Response.Write("<script>alert('失败!上传文件类型不符合')</script>");
                }
            }
            else
                Response.Write("<script>alert('失败!上传文件过大！')</script>");
        }
        string register_time = System.DateTime.Today.ToString("yyyy-MM-dd");
            DB db = new DB();
        string sqlstr = "select * from B_user where name='" + user_name + "'and MM='" + user_pwd + "'";
        DataTable dt = new DataTable();
        dt = db.GetDataTable(sqlstr);
        int count = dt.Rows.Count;//判断是否已经存在数据如果已经存在执行语句
        if (count == 0)
        {
            string sql_id = "select * from B_USER";
            System.Data.DataTable dr = db.GetDataTable(sql_id);
            ID = (dr.Rows.Count + 1).ToString();
            string sql = "insert into B_USER(ID,NAME,MM,MMTS,DA,YX,TX,QM,JJ,ZCRQ,QX,JYTZ) values('" + ID + "','" + user_name + "','" + user_pwd + "','" + user_mmts + "','" + user_DA + "','" + user_email + "','" + "../touxiang/" + file_name + "','" + user_qm + "','" + user_jj + "',to_date('" + register_time + "','yyyy-mm-dd'),'" + user_qx + "','"+jyzt+"')";
            if (db.ExecuteSQL(sql))
            {
                Server.Execute("Login.aspx");//执行注册界面
                Session["UserName"] = user_name;
                Session["UserPwd"] = password;
                //   Response.Write("<script>alert('恭喜你，注册成功！');document.location='Login.aspx';</script>");
                // Response.Redirect("Login.aspx"); 
                Response.Write("<script>alert('恭喜你，注册成功！');</script>");
                Response.Redirect("youke.aspx?name="+user_name);
            }
            else
            {
                Response.Write("<script>alert('sql语句错误');</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('用户名已存在！');history.back();</script>");

        }
    }

    private string NewMethod()
    {
        return JJ.Text.Trim();
    }

    protected void lbtnsy_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/youke.aspx");
    }
}

