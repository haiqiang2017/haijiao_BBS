﻿<%@ WebHandler Language="C#" Class="destroy_user" %>

using System;
using System.Web;

public class destroy_user :  BaseHandler {
    
    public override void AjaxProcess(HttpContext context) {
      string ID = context.Request.Params["ID"];
        DB db = new DB();

        string sql = "delete from B_user where ID=" + ID.ToString();
        bool result = db.ExecuteSQL(sql);

        if (result)
        {
            context.Response.Write("1");//删除之后给其那台的返回值
            context.Response.End();
        }
        else
        {
                context.Response.Write("0");
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}