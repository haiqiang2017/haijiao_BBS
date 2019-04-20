<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserSpace.aspx.cs" Inherits="yonghu_UserSpace" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>个人空间</title>
    </head>
<body>
<style type="text/css">

#usbody
{
	height: 400px;
}
#usleft
{
	width: 780px;
	height: 400px;
	float: left;
}
#usleft_top
{
	background-image: url('http://localhost:4888/pics/portalbox_bg.gif');
	background-repeat: repeat-x;
	height: 40px;
}
#usleft_top_one
{
	margin-left: 50px;
	padding-top: 20px;
	font-size: 17px;
	font-weight: normal;
}
#usleft_center
{
	margin-left: 50px;
	padding-top: 20px;
	height: 280px;
}
#usleft_center table
{
	height: 270px;
	width: 300px;
}
span
{
	font-size: 14px;
}

a
{
	text-decoration: none;
}

        .auto-style1 {
            background-repeat:no-repeat;
            background-image: url('../image/new/4.png');
        width: 774px;
        height:120px;
        margin-left:500px;
    }

    .auto-style2 {
        height: 314px;
    }
    .auto-style3 {
        width: 778px;
        margin-left:300px;
    }
 </style>
    <form class="auto-style3" runat="server">
    <table>
        <tr>
<td class="auto-style1">
   </td>
        </tr>
    </table>
                       <marquee direction="left" width="778" height="30" id="scrollme" onmousemove="scrollme.stop()" onmouseout="scrollme.start()"> 
                       <% 
                           DB db1 = new DB();
                           string sql_getGonggao = "select nr from (select rownum rn, t.* from B_gonggao t order by fsrq desc) t1 where t1.rn=1";
                           System.Data.DataTable dt1 = db1.GetDataTable(sql_getGonggao);
                           Response.Write(dt1.Rows[0][0].ToString() );
                           %>
                   </marquee>
<div id="usbody">
    <div id="usleft">
        <div id="usleft_top">
            <div id="usleft_top_one">
                个人资料<div id="usright" style="width: 214px; height: 400px; float: right;">
        <div style="border-bottom: solid 1px  #C8DCEC; height: 120px; width: 214px;">
            <div style="border-bottom: solid 1px #C8DCEC; height: 110px; width: 214px;">
                <div style="color: #999999; font-size: 15px; padding-top: 30px; margin-left: 25px;
                        font-weight: bolder;">
                    个人中心</div>
                <div style="font-size: 13px; padding-top: 10px; margin-left: 25px;">
                    <a href="alter_Userspace.aspx">修改个人资料</a></div>
<%--                <div style="font-size: 13px; padding-top: 10px; margin-left: 25px;">
                    <a href="http://localhost:4888/headStage/SelectBrow.aspx">修改头像</a></div>--%>
                                <div style="font-size: 13px; padding-top: 10px; margin-left: 25px;">
                    <a href="show_Message.aspx?JSF="+<%=dt.Rows[0]["name"]%>>查看短消息</a></div>
                            <div style="font-size: 13px; padding-top: 10px; margin-left: 25px;">
                       <a href="show_mycard.aspx?JSF="+<%=dt.Rows[0]["name"]%>>我的帖子</a></div>
            </div>
        </div>
    </div>
            </div>
        </div>
        <div id="usleft_center">
            <table class="auto-style2">
                <tr>
                    <td><span>真实姓名</span> </td>
                    <td><span>   <%=dt.Rows[0]["name"]%> </span></td>
                </tr>
                <tr>
                    <td><span>个人头像</span> </td>
                    <td>
                      <img src='../photos/<%=dt.Rows[0]["TX"]%>' style="width: 117px; height: 107px" /> </td>
                </tr>
                 <tr>
                    <td><span>个性签名</span> </td>
                    <td>
                       
                        <span>   <%=dt.Rows[0]["QM"]%> </span></td>
                       
                </tr>
                <tr>
                    <td style="height:100px;"><span>自我简介</span> </td>           
                        <td><span>   <%=dt.Rows[0]["JJ"]%> </span></td>                             
                </tr>
            </table>
            <br />
        </div>
    </div>
</div>
    <div style="text-align:center;" runat="server">            
         <asp:LinkButton ID="lbtnsy" runat="server" Font-Size="Small" ForeColor="Blue"  Width="158px" CausesValidation="False" OnClick="lbtnsy_Click1" style="height: 13px">返回首页</asp:LinkButton>
    </div>   
   </form>             

</body>
</html>