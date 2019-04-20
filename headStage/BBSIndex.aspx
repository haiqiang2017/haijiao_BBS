<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BBSIndex.aspx.cs"  MasterPageFile="~/headStage/headsite.Master"
    Inherits="BBS.headStage.BBSIndex" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <link rel="Stylesheet" href="../css/BBSIndex.css" type="text/css" />
</asp:Content>
<asp:Content ContentPlaceHolderID="HeadstageContent" runat="server">
    <div id="count" style="min-height: 490px;">
        <div id="tishi">
            你可以<a href="BBSRegister.aspx">注册</a> 一个账号，并以此<a href="LoginBBS.aspx">登录</a>， 以浏览更多精彩内容，并随时发布观点，与大家交流。</div>
        <div id="zhu">
            <asp:Repeater ID="zhuye" runat="server">
                <ItemTemplate>
                    <div onclick="show(<%# Eval("plateID")%>)" style="border: solid 1px #9DB3C5; cursor: pointer;">
                        <div class="title1">
                            <span class="yirows">
                                <%# Eval("PlateName")%></span> <span class="banz">
                                    <%# inputHtml(Eval("userName"))%>
                                </span>
                        </div>
                    </div>
                    
                    
                    
                    <div id="plate_<%# Eval("plateID")%>" style="display: none;">
                        <%# inputHtml2(Eval("plateID"))%>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <a href="BBSIndex.aspx"></a>
            <div id="huiy">
                <a href="#">在线会员</a> <span id="span2">-总计<%=Application["userCount"] %>人在线</span>
            </div>
        </div>
    </div>

    <script language="javascript">
    function show(id)
    {
       var plate=document.getElementById("plate_"+id);
       if(plate.style.display=="none")
       {
           plate.style.display="block";
        }
        else
       {
           plate.style.display="none";
       }
    }
    </script>

</asp:Content>
