<%@ WebHandler Language="C#" Class="guanli_Reload" %>
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Web.Script.Serialization;
using System.Web.SessionState;

public class guanli_Reload : IHttpHandler,IRequiresSessionState{

    public void ProcessRequest (HttpContext context)
    {
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}