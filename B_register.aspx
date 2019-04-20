<%@ Page Language="C#" AutoEventWireup="true" CodeFile="B_register.aspx.cs" Inherits="B_register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    
    <style type="text/css">
        .auto-style1 {
            height: 121px;
            background-repeat:no-repeat;
            background-image:url('../image/new/4.png')
        }
        .auto-style2 {
            height: 899px;
            width: 883px;
            margin-left:220px;
        }
        .auto-style3 {
            width: 251px;
            height:10px;
        }
        .auto-style4 {
            width: 91px;
        }
        .auto-style5 {
            width: 70%;
            height: 476px;
        }
        .auto-style6 {
            width: 91px;
            height: 7px;
        }
        .auto-style7 {
            width: 251px;
            height: 7px;
        }
        .auto-style8 {
            margin-left: 351px;
        }
        .auto-style9 {
            height: 81px;
        }
        .auto-style10 {
            float: left;
            height: 79px;
        }
    </style>
</head>
<body>       
    <form runat="server" style="margin-right: 450px;" class="auto-style2">       
<div>
        <h2 class="auto-style1"></h2>  

    <%--数据从数据库中获取--%>
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
                <asp:Label ID="Label100"  runat="server"  Font-Names="华文新魏"  Font-Size="Large" Text="会员注册系统"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="name" runat="server" Text="用户名"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txt_name" runat="server" Width="278px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_name"
                    Display="Dynamic" ErrorMessage="必填"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="password" runat="server" Text="密码"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txt_passwd" runat="server" TextMode="Password" Width="278px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_passwd"
                    Display="Dynamic" ErrorMessage="必填"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="re_passwd" runat="server" Text="确认密码"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="txt_re_passwd" runat="server" TextMode="Password" Width="278px"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txt_re_passwd"
                    Display="Dynamic" ErrorMessage="密码不一致" ControlToCompare="txt_passwd"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td class="auto-style4">
                密码提示</td>
            <td class="auto-style3">
                <asp:TextBox ID="MMTS" runat="server" Width="278px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_name"
                    Display="Dynamic" ErrorMessage="必填"></asp:RequiredFieldValidator></td>
        </tr>
                <tr>
            <td class="auto-style4">
                <asp:Label ID="Label2" runat="server" Text="答案"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="DA" runat="server" Width="278px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_name"
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
            <td class="auto-style7"> 
                       <asp:Button ID="register" runat="server" Text="注册" onclick="register_Click" />
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="Reset" type="reset" value="重置" runat="server"/></tr>
        </table>              
<div>
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
