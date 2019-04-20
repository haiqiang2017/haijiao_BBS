<%@ Application Language="C#" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Text" %>
<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // 在应用程序启动时运行的代码
        Application["onlinenum"] = 0;  // 在线人数
        Application["useronline"]=0;
    }

    void Application_End(object sender, EventArgs e)
    {
        //  在应用程序关闭时运行的代码

    }

    void Application_Error(object sender, EventArgs e)
    {
        // 在出现未处理的错误时运行的代码

    }

    void Session_Start(object sender, EventArgs e)
    {
        // 在新会话启动时运行的代码
        Application.Lock();
        Application["onlinenum"] = (int)Application["onlinenum"] + 1;
        Application.UnLock();
        //总人数访问统计
        if (Session["total"] == null)
        {
            StreamReader objReader;
            StreamWriter objWriter;
            String sFile;
            String sCount;
            int iCount;
            try
            {
                sFile = Server.MapPath("counter/counter.txt");
                if (!File.Exists(sFile))
                {
                    objWriter = File.CreateText(sFile);
                    objWriter.Write("0");
                    objWriter.Close();
                }
                objReader = File.OpenText(sFile);
                sCount = objReader.ReadToEnd();
                objReader.Close();
                iCount = Int32.Parse(sCount);
                iCount = iCount + 1;
                sCount = iCount.ToString();
                objWriter = File.CreateText(sFile);
                objWriter.Write(sCount);
                objWriter.Close();
                Session["total"] = "set";
            }
            catch (Exception edd)
            {
            }
        }
    }

    void Session_End(object sender, EventArgs e)
    {
        // 在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer
        // 或 SQLServer，则不引发该事件。
        // 在会话结束时运行的代码。
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer
        // 或 SQLServer，则不会引发该事件。
        Application.Lock();
        Application["onlinenum"] = (int)Application["onlinenum"] - 1;
        DB db = new DB();
        string zxzt = "离线";
        string sqlupdate = "update B_user set zxzt='"+zxzt+"'where name='"+Session["UserName"].ToString()+"'";
        //Application["useronline"] = (int)Application["useronline"] - 1;
        Application.UnLock();
    }

</script>
