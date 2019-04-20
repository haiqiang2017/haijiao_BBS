<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginBBS.aspx.cs" MasterPageFile="~/headStage/headsite.Master"
    Inherits="BBS.headStage.LoginBBS" %>

<asp:Content ContentPlaceHolderID="HeadstageContent" runat="server">
    <div id="lgbody">
        <div id="lgbbsup">
            <div id="lgheader">
                用户登录</div>
        </div>
        <div id="lgbbsdown">
            <table>
                <tr>
                    <td>
                        <span>用户名：</span>
                        <input id="txtName" type="text" runat="server" style="width: 150px;" />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>密码：&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <input id="txtPwd" type="password" runat="server" style="width: 150px;" />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>验证码：</span>
                        <input id="txtCode" type="text" runat="server" style="width: 150px;" />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="../Codes.ashx" onclick="yzm()" id="code" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnOK" runat="server" Text="登 录" OnClick="btnOK_Click" Style="width: 60px;
                            height: 30px;" />
                    </td>
                </tr>
            </table>
            <div>
                <div>
                    <div id="lgbbsleft">
                        <div id="lgbbsleftcenter">
                            没有账号？ <a href="BBSRegister.aspx">加入会员</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <link rel="Stylesheet" href="../css/LoginBBS.css" type="text/css" />    
    <script>
    function yzm()
    {
       var code=document.getElementById("code");
      code.setAttribute("src","../Codes.ashx?id="+new Date());
    }
    </script>
</asp:Content>
