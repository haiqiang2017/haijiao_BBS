<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LevelSet.aspx.cs" MasterPageFile="~/backStage/backsite.Master"
    Inherits="BBS.backStage.LevelSet" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>等级积分设置</title>
    <link rel="Stylesheet" type="text/css" href="../css/LevelSet.css" />
</asp:Content>
<asp:Content ContentPlaceHolderID="cph" runat="server">
    <div id="lsbody">
        <div id="lsheader">
            <div style="width: 200px;">
                经验值</div>
            <div style="width: 350px;">
                等级名称</div>
            <div style="width: 200px;">
                操作</div>
        </div>
        <div id="lsmain">
        </div>
        <div>
            <uc:page ID="ucPage" runat="server" />
        </div>
    </div>
</asp:Content>
