<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Addmodule.aspx.cs" MasterPageFile="~/backStage/backsite.Master"
    Inherits="BBS.backStage.Addmodule" %>

<asp:Content ContentPlaceHolderID="cph" runat="server">
    <div style="background-color: #EEF2FB;min-height: 500px;">
    
        <div style="margin-top: 150px; padding-left: 150px;">
            版块的名称：<input type="text" id="txtname" runat="server" /><br />
            <br /><br />
            <asp:Button ID="Button1" runat="server" Text="确定" Style="background-color: #BFE2FF;
                width: 60px; font-size: 15px; border: solid 1px #2360B1; margin-left: 120px;
                margin-top: 30px;" onclick="Button1_Click" />
        </div>
    </div>
</asp:Content>
