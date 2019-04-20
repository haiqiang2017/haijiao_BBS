<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" MasterPageFile="~/headStage/headsite.Master"
    Inherits="BBS.backStage.Index" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link href="../css/Index.css" type="text/css" rel="Stylesheet" />
    <script>
    function yzm()
    {
       var code=document.getElementById("code");
      code.setAttribute("src","../Codes.ashx?id="+new Date());
    }
    </script>
</asp:Content>
<asp:Content ContentPlaceHolderID="HeadstageContent" runat="server">
    <div id="indexbg">
        <div style="margin-left: 600px; padding-top: 100px;">
            <table>
                <tr>
                    
                        <td>
                            <span>用户名：</span>
                        </td>
                        <td>
                            <input type="text" id="txtname" runat="server" />
                        </td>
                    
                </tr>
                <tr>
                    
                        <td>
                            <span>密 码：</span>
                        </td>
                        <td>
                            <input type="password" id="txtPwd" runat="server" style="width: 150px;" />
                        </td>
                    
                </tr>
                <tr>
                    
                        <td>
                            <span>验证码:</span>
                        </td>
                        <td>
                            <input type="text" style="width: 60px;" id="txtCodes" runat="server"  />
                            <img src="../Codes.ashx" onclick="yzm()" id="code" />
                        </td>
                   
                </tr>
                <tr>
                   
                        <td>
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="登 录" Style="width: 90px; height: 35px;
                                background-color: #4387C4; font-size: 15px" OnClick="Button1_Click" />
                        </td>
                   
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
