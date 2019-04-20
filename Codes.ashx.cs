using System;
using System.Collections;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Drawing;
using System.Text;
using System.Web.SessionState;

namespace BBS
{
    public class Codes : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string str ="";
            string[] s = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9","a","b","c","d","e",
                             "f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
            Random r = new Random();
            for (int i = 0; i < 4; i++)
            {
                int j = r.Next(s.Length + 1);
                str += s[j];
            }
            Bitmap b = new Bitmap(55, 21);
            Graphics g = Graphics.FromImage(b);
            g.DrawString(str.ToString(), new Font("黑体", 10), Brushes.White, 3, 3);
            b.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
            context.Session["yzm"] = str;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
