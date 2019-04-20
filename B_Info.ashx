<%@ WebHandler Language="C#" Class="B_Info" %>

using System;
using System.Web;

public class B_Info : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}