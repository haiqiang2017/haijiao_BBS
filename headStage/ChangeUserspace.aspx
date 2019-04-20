<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/headStage/headsite.Master"
    CodeBehind="ChangeUserspace.aspx.cs" Inherits="BBS.headStage.ChangeUserspace" %>

<asp:Content ContentPlaceHolderID="HeadstageContent" runat="server">
    <div style="height: 400px;">
        <div>
            <table style="height: 300px; width: 80%; margin-left: 100px;">
                <tr>
                    <td style="color: #006699; font-weight: bolder;">
                        用户名：
                    </td>
                    <td>
                        <input type="text" id="txtusername" value="<%=dt.Rows[0]["username"] %>" style="background-color: #E0E0E0" />
                    </td>
                    <td style="color: #006699; font-weight: bolder;">
                        真实姓名：
                    </td>
                    <td>
                        <input name="truename" type="text" value="<%=dt.Rows[0]["truename"]%>" />
                    </td>
                </tr>
                <tr>
                    <td style="color: #006699; font-weight: bolder;">
                        原密码：
                    </td>
                    <td>
                        <input type="password" style="width: 150px" value="<%=dt.Rows[0]["password"] %>" />
                    </td>
                    <td style="color: #006699; font-weight: bolder;">
                        新密码：
                    </td>
                    <td>
                        <input name="passwords" type="password" style="width: 150px" />
                    </td>
                </tr>
                <tr>
                    <td style="color: #006699; font-weight: bolder;">
                        查询密码问题：
                    </td>
                    <td>
                        <select style="width: 150px" name="question">
                            <option>-----------请选择----------</option>
                            <option>我的生日？</option>
                            <option>我的出生地？</option>
                            <option>我最爱的人？</option>
                            <option>我最喜欢吃的？</option>
                            <option>我高中班主任？</option>
                            <option>我大学班主任？</option>
                            <option>我的手机号码？</option>
                            <option>我从事的岗位？</option>
                            <option>我高中的学号？</option>
                            <option>我大学的学号？</option>
                            <option>我高中就读的学校？</option>
                            <option>我大学就读的学校？</option>
                        </select>
                    </td>
                    <td style="color: #006699; font-weight: bolder;">
                        查询问题答案：
                    </td>
                    <td>
                        <input type="text" name="answer" value="<%=dt.Rows[0]["answer"] %>" />
                    </td>
                </tr>
                <tr>
                    <td style="color: #006699; font-weight: bolder;">
                        等级：
                    </td>
                    <td>
                        <input type="text" readonly="readonly" style="background-color: #E0E0E0;" value="<%=dt.Rows[0]["LevelName"] %>" />
                    </td>
                    <td style="color: #006699; font-weight: bolder;">
                        积分：
                    </td>
                    <td>
                        <input type="text" readonly="readonly" style="background-color: #E0E0E0" value="<%=dt.Rows[0]["LevelCount"] %>" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="margin-left: 450px;">
            <asp:Button ID="btnReset" runat="server" Text="提　 交" Style="width: 80px; height: 30px;
                margin-top: 20px;" OnClick="btnReset_Click" />
        </div>
    </div>
</asp:Content>
