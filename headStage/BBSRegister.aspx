<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BBSRegister.aspx.cs" MasterPageFile="~/headStage/headsite.Master"
    Inherits="BBS.headStage.BBSRegister" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="Stylesheet" href="../css/BBSRegister.css" type="text/css" />

    <script>
    function yzm()
    {
       var code=document.getElementById("code");
      code.setAttribute("src","../Codes.ashx?id="+new Date());
    }
    </script>

</asp:Content>
<asp:Content ContentPlaceHolderID="HeadstageContent" runat="server">
    <div id="Reg-body1">
        <div id="Reg-left">
            <div>
                <table>
                    <tr>
                        <td colspan="3">
                            <div style="color: #006699;">
                                <span>加入会员</span></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>用户名：</span>
                        </td>
                        <td>
                            <input type="text" id="txtName" runat="server" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="用户名不能为空"
                                ControlToValidate="txtName" Style="height: 35px; width: 95px;"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>真实姓名：</span>
                        </td>
                        <td>
                            <input type="text" id="txtTruename" runat="server" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="真实姓名不能为空"
                                ControlToValidate="txtTruename" Style="height: 35px; width: 95px;"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>密 码：</span>
                        </td>
                        <td>
                            <input type="password" runat="server" id="firstPwd" style=" width:150px;" />
                        </td>
                        <td>
                            &nbsp
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>确认密码：</span>
                        </td>
                        <td>
                            <input type="password" runat="server" id="secondPwd" style=" width:150px;" />
                        </td>
                        <td>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="密码不一致"
                                ControlToCompare="firstPwd" ControlToValidate="secondPwd" Style="height: 35px;
                                width: 95px;"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>性别：</span>
                        </td>
                        <td>
                            <select style="width: 150px" id="Sex" runat="server">
                                <option>-----------请选择----------</option>
                                <option>男</option>
                                <option>女</option>
                            </select>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="性别不能为空"
                                ControlToValidate="Sex" Style="height: 35px; width: 95px;"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>查询密码问题：</span>
                        </td>
                        <td>
                            <select style="width: 150px" id="question" runat="server">
                                <option>-----------请选择----------</option>
                                <option>我的生日？</option>
                                <option>我的出生地？</option>
                                <option>我最爱的人？</option>
                                <option>我最喜欢吃的？</option>
                                <option>我高中班主任？</option>
                                <option>我大学班主任？</option>
                                <option>我的手机号码？</option>
                            </select>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="问题不能为空"
                                ControlToValidate="question" Style="height: 35px; width: 95px;"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>查询密码答案：</span>
                        </td>
                        <td>
                            <input type="text" runat="server" id="answear" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="答案不能为空"
                                ControlToValidate="answear" Style="height: 35px; width: 95px;"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>联系电话：</span>
                        </td>
                        <td>
                            <input type="text" runat="server" id="userphone" />
                        </td>
                        <td>
                            &nbsp
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>手机：</span>
                        </td>
                        <td>
                            <input type="text" runat="server" id="userTel" />
                        </td>
                        <td>
                            &nbsp
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="userTel" ErrorMessage="手机号码输入有误" 
                                ValidationExpression="^1[0-9]{10}"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>E-Mail:</span>
                        </td>
                        <td>
                            <input type="text" runat="server" id="email" />
                        </td>
                        <td>
                            &nbsp
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="email" ErrorMessage="邮箱格式不对" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>验证码：</span>
                        </td>
                        <td>
                            <input type="text" runat="server" id="Code" />
                        </td>
                        <td>
                            <img src="../Codes.ashx" onclick="yzm()" id="code" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="margin-left: 150px;">
                                <asp:Button ID="btnOK" runat="server" Text="提交" Style="width: 60px; height: 30px;"
                                    OnClick="btnOK_Click" />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="Reg-right">
            <div id="Reg-rightcenter">
                <span style="font-size: 14px;">已有账号? &nbsp <a href="LoginBBS.aspx">现在登录</a></span></div>
        </div>
    </div>
</asp:Content>
