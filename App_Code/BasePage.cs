using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
/// <summary>
///BasePage 的摘要说明
/// </summary>
public class BasePage:System.Web.UI.Page
{
	public BasePage()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    protected override void OnLoad(EventArgs e)
    {
        //string userlevel = Convert.ToString(Session["userlevel"]);
        //userlevel = "1";
        //if (userlevel == "" || userlevel == null)
        //{
        //    Response.ContentType = "text/html";
        //    Response.Write("<script type='text/javascript'>alert('用户已过期,请重新登录！');window.top.location.href ='" + T.GetRootURI() + "/login.aspx'</script>");
        //    Response.End();
        //}
        //else
            base.OnLoad(e);//执行Load事件的委托链方法，执行Page_Load方法
    }
}