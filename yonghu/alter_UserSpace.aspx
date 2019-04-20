<%@ Page Language="C#" AutoEventWireup="true" CodeFile="alter_UserSpace.aspx.cs" Inherits="yonghu_alter_UserSpace" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 633px;
            height: 125px;
            background-image:url('../image/new/4.png');
            margin-left: 60px;
        }
        .auto-style2 {
            margin-left: 60px;
        }
        .auto-style3 {
            margin-left: 90px;
        }
        .auto-style4 {
            height: 55px;
        }
        .auto-style5 {
            height: 54px;
        }
        .auto-style6 {
            height: 46px;
        }
    </style>
</head>
<body>
 <form runat="server" style="margin-right: 450px;" class="auto-style2">
<div>
        <h2 class="auto-style1"></h2> 
                       <marquee direction="left" width="883" height="30" id="scrollme" onmousemove="scrollme.stop()" onmouseout="scrollme.start()"> 
                       <% 
                           DB db1 = new DB();
                           string sql_getGonggao = "select nr from (select rownum rn, t.* from B_gonggao t order by fsrq desc) t1 where t1.rn=1";
                           System.Data.DataTable dt1 = db1.GetDataTable(sql_getGonggao);
                           Response.Write(dt1.Rows[0][0].ToString() );
                           %>
                   </marquee>
</div>
    <table align="center" class="auto-style5">
        <tr>
            <td align="center"; colspan="2" >
                <asp:Label ID="Label100"  runat="server"  Font-Names="华文新魏"  Font-Size="Large" Text="更改用户信息"></asp:Label>
            </td>
        </tr>

        <tr>
            <td class="auto-style4">
                <asp:Label ID="password" runat="server" Text="旧密码"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txt_passwd" runat="server" TextMode="Password" Width="278px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_passwd"
                    Display="Dynamic" ErrorMessage="必填"></asp:RequiredFieldValidator></td>
        </tr>
                <tr>
            <td class="auto-style4">
                <asp:Label ID="Label1" runat="server" Text="新密码"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox1" runat="server" TextMode="Password" Width="278px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_passwd"
                    Display="Dynamic" ErrorMessage="必填"></asp:RequiredFieldValidator></td>
        </tr>
       <tr> 
            <td class="auto-style4">
                <asp:Label ID="mail" runat="server" Text="邮箱"></asp:Label>
                </td>
            <td class="auto-style3"> 
                       <asp:TextBox ID="txt_mail" runat="server" Width="278px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_mail"
                    ErrorMessage="邮箱格式错误" 
                           ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>   
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="face" runat="server" Text="头像"></asp:Label>
            </td>
            <td class="auto-style3"> 
                       <input id="TX" type="file"  Width="278px" runat="server" /></td>
        </tr>
                <tr>
            <td class="auto-style4">
                <asp:Label ID="Label3" runat="server" Text="个性签名"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="QM" runat="server" Width="278px" ></asp:TextBox>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="introduction" runat="server" Text="简介"></asp:Label>
            </td>
            <td class="auto-style3"> 
                       <asp:TextBox ID="JJ" runat="server" Height="120px" 
                           TextMode="MultiLine" Width="278px"></asp:TextBox>
                       </td>
        </tr>
        <tr>
            <td class="auto-style6">
               </td>
            <td class="auto-style6"> 
                <asp:Button ID="btnSummit" runat="server" Text="提　 交" Style="margin-top: 20px;" CssClass="auto-style3" Height="31px" />
        </table>              
<div>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="lbtnsy" runat="server" CausesValidation="False" Font-Size="Small"  Width="77px" CssClass="auto-style8" OnClick="lbtnsy_Click">返回首页</asp:LinkButton>
</div>
<div id="footer">
        <div style="margin-top: 20px; " class="auto-style10">
            <span style="font-size: 16px; margin-top: 20px; margin-left: 50px;">powered by <b>wjq+fjy+jhq</b></span><br />
            <span style="font-size: 12px; margin-top: 20px; margin-left: 50px; color: Gray">&copy
                2006-2017 NEPU.JSJ</span>
        </div>
        <div style="margin-top: 20px;" class="auto-style9">
            <span style="font-size: 12px; margin-left: 300px;"><b>海角论坛，为中国网站设计添动力 </b>| 
            <br />
            <br />
            </span><br />
            <span style="font-size: 12px; margin-left: 170px; margin-top: 20px; color: Gray">gmt+8,2010-3-24
                08:55,processed in 0.005988 second(s),2 queries,gzip enabled</span>
        </div>
    </div>
</form>
</body>
</html>
