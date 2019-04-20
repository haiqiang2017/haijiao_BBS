<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>海角论坛</title>
    <style type="text/css">
        form
        {
        	background-repeat:no-repeat;
        }
        .style1
        {
            height: 73px;
            text-align: center;
        }
        .style2
        {
            width: 100px;
        }
        .style3
        {
            height: 73px;
            /*text-align:justify;*/
            width: 100px;
        }
        .style4
        {
            width: 57px;
        }
        .style5
        {
            height: 146px;
        }
        .style6
        {
            width: 100px;
            height: 146px;
        }
          .style7
        {
            height: 146px;
        }
        .auto-style1 {
            margin-top: 2px;
        }
        .auto-style2 {
            background-repeat:no-repeat;
            background-image: url('image/new/4.png');
            height: 146px;
            width: 100px;
        }
        .auto-style8 {
            height: 61px;
            text-align: center;
            width: 100px;
        }
        .auto-style9 {
            width: 100px;
        }
        .auto-style12 {
            height: 646px;
            margin:auto;
            width: 1005px;
        }
        .auto-style13 {
            height: 61px;
            width: 281px;
        }
        .auto-style14 {
            width: 281px;
        }
        .auto-style15 {
            height: 61px;
            width: 100px;
        }
        .auto-style16 {
            width: 404px;
        }
        .auto-style17 {
            height: 19px;
        }
        .auto-style18 {
            text-align: center;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
          <table class="auto-style12">
        <tr>
            <td class="auto-style2"  colspan="3";>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">
            </td>
            <td class="auto-style13">
            </td>
                 <td class="auto-style15">
                     &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">
                &nbsp;</td>   
            <td class="auto-style14">
                &nbsp;</td>
            <td class="auto-style16">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Text="论坛登录" Font-Names="华文新魏"  Font-Size="X-Large"></asp:Label>
                <table style="width: 100%; height: 110px; margin-bottom:120px;">
                    <tr>
                        <td class="style4">  
                        </td>
                        </tr>
                        <tr>
                        <td class="style4">
                            <asp:Label ID="Label2" runat="server" Text="用户名"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_name" runat="server" Width="164px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            <asp:Label ID="Label3" runat="server" Text="密码"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_password" runat="server" TextMode="Password" CssClass="auto-style1" Height="19px" Width="164px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            &nbsp;</td>
                        <td>
                     <asp:Button ID="Button_login" runat="server" Text="登录"  onclick="Button_login_Click" />
&nbsp;<input id="Reset1" type="reset" value="重置" runat="server" />&nbsp;&nbsp;
                            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/B_register.aspx">新用户注册</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>

        </tr>
    </table>       
        <div class="auto-style17" runat ="server">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:LinkButton ID="lbtnsy" runat="server" CausesValidation="False" Font-Size="Small" Width="87px" CssClass="auto-style18" OnClick="lbtnsy_Click"  Height="16px">返回游客界面</asp:LinkButton>
</div>
    </form>

</body>
</html>
