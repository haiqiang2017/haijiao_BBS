using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class guanliyuan_input_user : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string index = Request.Params["index"];
        hd_index.Value = index;
    }
}