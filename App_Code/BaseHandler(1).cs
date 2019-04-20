using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Web.SessionState;

/// <summary>
///BaseHandler 的摘要说明
/// </summary>
public class BaseHandler : IHttpHandler, IRequiresSessionState
{
	public BaseHandler()
	{
		//0
		//TODO: 在此处添加构造函数逻辑
		//
	}
    public void ProcessRequest(HttpContext context)
    {
        string username = Convert.ToString(context.Session["UserName"]);
        if (username == "" || username == null)
        {
            context.Response.ContentType = "text/html";
            context.Response.Write("<script type='text/javascript'>alert('用户已过期,请重新登录！');window.top.location.href ='" + T.GetRootURI() + "/login.aspx'</script>");
        }
        else
            AjaxProcess(context);

    }

    public virtual void AjaxProcess(HttpContext context)
    {

    }
   
    public bool IsReusable
    {
        get
        {

            return false;
        }
    }
}