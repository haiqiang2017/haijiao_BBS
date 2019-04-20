using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class yonghu_show_card : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            { 
            if (Session["UserName"] != null && Session["userpwd"] != null)
            {
                ZhuCe.Visible = false;
                userLogin.Visible = false;
                Label1.Visible = true;
                user.Visible = true;
                number.Visible = true;
                user.Text = Session["UserName"].ToString();

            }
            else
            {
                //    pagesize.Visible = false;
                HFNAME.Visible = false;
                userLogin.Visible = true;
                Label1.Visible = true;
                user.Visible = false;
                number.Visible = false;
            }
            string id = Request["ID"];
            string sql = "update  B_card set FWCS=FWCS+1 where id='"+id+"'";
            string sqldel = "delete  B_card where id='"+id+"';";
            DB db = new DB();
            if (db.ExecuteSQL(sql))
            {
                bind();
            }
            else
            {
                db.ExecuteSql(sqldel);
                Response.Write("<script>alert('此帖已被作者删除，请浏览其他帖子');document.location='../youke.aspx';</script>");
       //         Response.Redirect("~/youke.aspx");
            }
            }
        } 
        hfbind();
    }
    protected void bind()
    {
        //string userlevel = (string)Session["userlevel"].ToString();
        string id = Request["ID"];
        string index = Request.Params["index"];
        if (index != null)
        {
            this.form1.Attributes.Add("ReadOnly", "true");
            id = (Convert.ToInt32(index + 1)).ToString();
        }
        string name = Request.QueryString["FTR"];
        string B_card = "B_card";
        string sql = "select * from B_card a,B_user b where a.id='" +id+ "'and a.FTR=b.name";
        DB db = new DB();
        DataSet dr = db.GetDataSet(sql, B_card);
        if (dr.Tables[0].Rows.Count <= 0)
        {
            Response.Write("<script>alert('此帖已被删除，请浏览其他帖子');document.location='~/youke.aspx';</script>");
        }
        DataList1.DataSource = dr.Tables[0].DefaultView;
        DataList1.DataBind();
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {

    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "hf")
        {
            if (Session["UserName"] != null && Session["Userpwd"] != null)
            {

                HFNAME.Visible = true;
                string userlevel = (string)Session["userlevel"].ToString();
                string username = (string)Session["UserName"].ToString();
                this.HFNAME.Text = username;
                ID.Text = Request["id"];
                string index = Request.Params["index"];
                if (index != "" && userlevel != "普通用户")
                {
                    this.form1.Attributes.Add("ReadOnly", "true");
                    ID.Text = (Convert.ToInt32(index + 1)).ToString();
                }
                string sql = "select BT from B_card where id='" + ID.Text + "'";
                DB db = new DB();
                DataTable dt = new DataTable();
                dt = db.GetDataTable(sql);
                this.BT.Text = (string)dt.Rows[0]["BT"];
            }
            else
            {
                Response.Write("<script> alert('请先进行登录!');</script>");
            }
        }
    }
    public void hfbind()
    {
        string B_HFCARD = "B_HFCARD";
        string id = Request["ID"];
        string sql = "select a.*,b.* from B_USER a,B_HFCARD b where a.Name=b.hfname  and b.id='" + id + "'";
        DB db = new DB();
  
        DataSet dr = db.GetDataSet(sql, B_HFCARD);
        DataList2.DataKeyField = "ID";
        DataList2.DataSource = dr.Tables[0].DefaultView;
        DataList2.DataBind();
        //SqlConnection con = DB.createDB();
        //con.Open();
        //SqlDataAdapter sda1 = new SqlDataAdapter("select a.*,b.* from tb_Users as a join tb_hf as b on a.UserName=b.hfname where b.ContId='" + ContId + "'", con);
        //DataSet ds1 = new DataSet();
        //sda1.Fill(ds1, "tb_hf");
        //this.DataList2.DataSource = ds1;
        //this.DataList2.DataKeyField = "hfId";
        //this.DataList2.DataBind();
        //con.Close();
    }
    public void pagebind()
    {
        string id = Request["ID"];
        string B_HFCARD = "B_HFCARD";
        int curpage = Convert.ToInt32(this.lblPage.Text);
        PagedDataSource ps = new PagedDataSource();
        DB db = new DB();
        string sql = "select a.*,b.* from B_USER a,B_HFCARD b where a.Name=b.hfname  and b.id='" + id + "'";
        DataSet dr = db.GetDataSet(sql, B_HFCARD);
        ps.DataSource = dr.Tables["B_HFCARD"].DefaultView;
        ps.AllowPaging = true;
        ps.PageSize = 2;
        ps.CurrentPageIndex = curpage - 1;
     //   this.pagesize.Text = Convert.ToString(ps.PageCount);
        this.lnkbtnUp.Enabled = true;
        this.lnkbtnNext.Enabled = true;
        this.lnkbtnLast.Enabled = true;
        this.lnkbtnOne.Enabled = true;
        if (curpage == 1)
        {
            //this.lnkbtnOne.Visible = false;
            //this.lnkbtnUp.Visible = false;
            this.lnkbtnOne.Enabled = false;//不显示第一页按钮
            this.lnkbtnUp.Enabled = false;//不显示上一页按钮
        }
        if (curpage == ps.PageCount)
        {
            //this.lnkbtnNext.Visible = false;
            //this.lnkbtnLast.Visible = false;
            this.lnkbtnNext.Enabled = false;//不显示下一页
            this.lnkbtnLast.Enabled = false;//不显示最后一页
        }
        this.pagesize.Text = Convert.ToString(ps.PageCount);
        this.DataList2.DataSource = ps;
        this.DataList2.DataKeyField = "ID";
        this.DataList2.DataBind();
    }
    protected void lnkbtnOne_Click(object sender, EventArgs e)
    {
        this.lblPage.Text = "1";
        this.pagebind();
    }

    protected void lnkbtnUp_Click(object sender, EventArgs e)
    {
        this.lblPage.Text = Convert.ToString(Convert.ToInt32(this.lblPage.Text) - 1);
        this.pagebind();
   }
   protected void lnkbtnNext_Click(object sender, EventArgs e)
    {
        this.lblPage.Text = Convert.ToString(Convert.ToInt32(this.lblPage.Text) + 1);
        this.pagebind();
    }
    protected void lnkbtnLast_Click(object sender, EventArgs e)
    {
       this.lblPage.Text = this.pagesize.Text;
       this.pagebind();
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["UserName"] != null && Session["Userpwd"] != null)
        {
            string name = (string)Session["UserName"].ToString();
            Response.Redirect("add_card.aspx?name="+name);
        }
        else
        {
            Response.Write("<script> alert('请先进行登录!');</script>");
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    protected void btnOk_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];
        string HFNAME = (string)Session["UserName"].ToString();
        string hfnr = HFNR.Text.ToString();
        string hfrq = System.DateTime.Today.ToString("yyyy-MM-dd");
        string BT = this.BT.Text;
        string sqlinsert = "insert into B_HFCARD (ID,HFNAME,HFNR,HFRQ,BT) values('"+id+"','"+HFNAME+"','"+hfnr+ "',to_date('" + hfrq + "','yyyy-mm-dd'),'"+BT+"')";
        string sqlupdate = "update  B_card set HTCS=HTCS+1 where id='" + id + "'";
        string sqlupdate1 = "update B_user set htcs=htcs+1 where name='" + HFNAME + "'";
        DB db = new DB();
        if (db.ExecuteSQL(sqlinsert) && db.ExecuteSQL(sqlupdate) && db.ExecuteSQL(sqlupdate1))
        {
            HFNR.Text = "";
            HFNR.Focus();
            bind();
            hfbind();
        }
    }


    protected void lbtnsy_Click1(object sender, EventArgs e)
    {
        Response.Redirect("../youke.aspx");
    }

    protected void userLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("../login.aspx");
    }


    protected void user_Space_Click(object sender, EventArgs e)
    {
        if (Session["UserName"] != null && Session["Userpwd"] != null)
        {
            Response.Redirect("UserSpace.aspx");
        }
        else
        {
            Response.Write("<script> alert('请先进行登录!');</script>");
        }
    }

    protected void ZhuCe_Click(object sender, EventArgs e)
    {
        Response.Redirect("../B_register.aspx");
    }
}