<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSmalldoule.aspx.cs"
    MasterPageFile="~/backStage/backsite.Master" Inherits="BBS.backStage.AddSmalldoule" %>

<asp:Content ContentPlaceHolderID="cph" runat="server">
    <div style="height: 400px; background-color: #EEF2FB">
        <div style="margin-left: 150px; margin-top: 100px;" runat="server" id="main">
            请选择添加的模块：
            <asp:DropDownList ID="ddl" runat="server" Height="30px" Width="128px">
            </asp:DropDownList>
            <br />
            <br />
            请输入添加的小模块的名字:
            <input type="text" id="txtplateName" runat="server" /><br />
            <br />
            请输入添加的小模块的说明:
            <input type="text" id="txtRemark" runat="server" /><br />
            <div style="margin-top: 20px; margin-left: 100px;">
                <asp:Button ID="btnOK" runat="server" Text="确定" Style="background-color: #BFE2FF;
                    width: 60px; font-size: 15px; border: solid 1px #2360B1;" OnClick="btnOK_Click" /></div>
        </div>
    </div>
</asp:Content>
