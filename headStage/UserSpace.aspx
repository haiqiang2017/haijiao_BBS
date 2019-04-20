<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserSpace.aspx.cs" MasterPageFile="~/headStage/headsite.Master"
    Inherits="BBS.headStage.WebForm1" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="Stylesheet" type="text/css" href="../css/UserSpace.css" />
</asp:Content>
<asp:Content ContentPlaceHolderID="HeadstageContent" runat="server">
    <div id="usbody">
        <div id="usleft">
            <div id="usleft_top">
                <div id="usleft_top_one">
                    个人资料</div>
            </div>
            <div id="usleft_center">
                <table>
                    <tr>
                        <td>
                            <span>真是姓名</span>
                        </td>
                        <td>
                            <span>
                                <%=dt.Rows[0]["truename"]%></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>积分</span>
                        </td>
                        <td>
                            <span>
                                <%=dt.Rows[0]["LevelCount"]%></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>个人头像</span>
                        </td>
                        <td>
                            <img src="../photos/<%=dt.Rows[0]["HeadImage"]%>" style="width: 117px; height: 107px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>性别</span>
                        </td>
                        <td>
                            <span>
                                <%=dt.Rows[0]["userSex"]%></span>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="usright" style="width: 214px; height: 400px; float: right;">
            <div style="border-bottom: solid 1px  #C8DCEC; height: 120px; width: 214px;">
                <div style="border-bottom: solid 1px #C8DCEC; height: 110px; width: 214px;">
                    <div style="color: #999999; font-size: 15px; padding-top: 30px; margin-left: 25px;
                        font-weight: bolder;">
                        个人中心</div>
                    <div style="font-size: 13px; padding-top: 10px; margin-left: 25px;">
                        <a href="ChangeUserspace.aspx">修改个人资料</a></div>
                    <div style="font-size: 13px; padding-top: 10px; margin-left: 25px;">
                        <a href="SelectBrow.aspx">修改头像</a></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
