﻿using System;
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
using BBS.Entity;


namespace BBS.headStage
{
    public partial class ContentBBS : System.Web.UI.Page
    {
        protected string topicID = "";
        protected DataTable dt = null;
        protected DataTable dt2 = null;
        protected DataTable dt3 = null;
        protected DataTable dt4 = null;
        //当前页码
        public int pageIndex = 0;
        //共多少页
        public int pageCount;
        protected void Page_Load(object sender, EventArgs e)
        {
          
                topicID = Request.QueryString["topicID"].ToString();
                fresh();

            string plateID = Session["plate"].ToString();
            dt4 = new plateBLL().GetplateRemark(Convert.ToInt32(plateID));

        }
        public string head(Object h)
        {
            return "../photos/" + h.ToString();
        }

        protected void btnAnswer_Click(object sender, EventArgs e)
        {
            AnswerEntity obj = new AnswerEntity();
            string username = "";
            if (Session["username"] != null)
            {
                username = Session["username"].ToString();
            }
            else
            {
                Response.Write("<script>alert('您还没有登录，请先登录！')</script>");
                Response.Redirect("LoginBBS.aspx");
            }
            dt3 = new userInfoBLL().GetUserID(username);

            obj.userID = Convert.ToInt32(dt3.Rows[0]["userID"]);

            obj.TopicID = Convert.ToInt32(Request.QueryString["TopicID"]);
            obj.AnswerDate = DateTime.Now;
            obj.AnswerContent = txtContent.Value;

            BLL.AnswerBLL.InsertAnswer(obj);
            Response.Write("<script>alert('发表成功！')</script>");
            userInfoBLL.UpdateUserLevelCount(username);
            fresh();
        }

        protected void fresh()
        {
            //获取当前页码
            string page = Request.QueryString["page"].ToString();

            pageIndex = int.Parse(page);
            //初始化分页数据源
            PagedDataSource pds = new PagedDataSource();
            pds.AllowPaging = true;
            pds.PageSize = 4;
            pds.CurrentPageIndex = pageIndex-1;
            topicID = Request.QueryString["TopicID"].ToString();
            dt = new AnswerBLL().GetAnswerInfo(int.Parse(topicID));
            dt2 = new TopicBLL().GetTopicInfo(int.Parse(topicID));
            pds.DataSource = dt.DefaultView;
            pageCount = pds.PageCount;
            recontBBS.DataSource = pds;
            recontBBS.DataBind();
        }




    }
}