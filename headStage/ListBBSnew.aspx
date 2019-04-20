<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListBBSnew.aspx.cs" MasterPageFile="~/headStage/headsite.Master"
    Inherits="BBS.headStage.ListBBSnew" %>

<asp:Content ContentPlaceHolderID="HeadstageContent" runat="server">
    <div style="min-height: 600px;">
        <div id="listhead">
            <br />
            <span><a href="BBSIndex.aspx">首页</a></span>>><span><a href="ListBBSnew.aspx?plateID=<%=Session["plate"]%>"><%=dt4.Rows[0]["PlateName"]%></a></span></div>
        <div style="margin-top: 10px">
            <span style="font-family: 华文宋体; font-weight: bolder; font-size: 18px">
                <%=dt4.Rows[0]["PlateName"]%></span> <span id="listsmil">[ <font color="red">2</font><span
                    style="font-size: 14px; color: Gray">主题</span> / 1 <span style="font-size: 14px;
                        color: Gray;">回复</span> ]</span>
        </div>
        <br />
        <div id="listleft">
            <div style="color: Gray; font-size: 14px;">
                版块介绍：
                <%=dt4.Rows[0]["PlateRemarks"] %></div>
            <br />
            <div style="color: Gray; font-size: 14px;">
                版主：*空缺中*</div>
        </div>
        <div style="background-color: #F4F9FE;">
            <div style="height: 50px; border-bottom: solid 1px #E8E8E8">
                <div style="background-image: url(../pics/newtopic.gif); height: 30px; background-repeat: no-repeat;
                    padding-top: 10px;">
                    <div style="font-size: 15px; margin-left: 30px;">
                        <a href="WriteTopic.aspx?plateID=<%=plateID %>">发帖</a>
                    </div>
                </div>
                <div style="width: 80px; height: 20px; background-color: White; margin-top: -20px;
                    color: #006699; border-bottom: solid 1px #006699; border-left: solid 1px #006699;
                    border-top: solid 1px #006699; border-right: solid 1px #006699; font-size: 15px;
                    text-align: center; margin-left: 830px;">
                    <a href="ModeratorManage.aspx?plateID=<%=Session["plate"]%>">测试页面</a>
                </div>
                <div style="width: 80px; height: 20px; background-color: White; margin-top: -22px;
                    color: #006699; border-bottom: solid 1px #006699; border-left: solid 1px #006699;
                    border-top: solid 1px #006699; border-right: solid 1px #006699; font-size: 15px;
                    text-align: center; margin-left: 918px;">
                    <a href="BBSIndex.aspx">返回首页</a>
                </div>
            </div>
        </div>
        <div style="height: 40px; background-color: #F7F7F7; color: #444444; border-bottom: solid 1px #E8E8E8;">
            <div style="font-size: 13px; float: left; margin-top: 15px; display: inline; margin-left: 50px;">
                标题</div>
            <div style="font-size: 13px; float: left; margin-top: 15px; display: inline; margin-left: 600px;">
                作者</div>
            <div style="font-size: 13px; padding-top: 15px; float: left; display: inline; margin-left: 80px;">
                回复/查看</div>
            <div style="font-size: 13px; padding-top: 15px; float: left; display: inline; margin-left: 90px;">
                最后发表</div>
        </div>
        <div style="height: 35px; background-color: #E8F3FD; border-bottom: solid 1px #E8E8E8;
            cursor: pointer;">
            <div onclick="show()" style="font-size: 13px; float: left; margin-top: 10px; display: inline;
                margin-left: 50px;">
                论坛公告</div>
        </div>
        <asp:Repeater ID="rpGonggao" runat="server">
            <ItemTemplate>
                <div id="first" style="height: 40px; border-bottom: solid 1px #E8E8E8; display: none">
                    <div style="font-size: 13px; float: left; margin-top: 10px; display: inline; margin-left: 50px;">
                        <img src="../pics/pin_1.gif" />
                        <font style="color: Red; font-weight: bolder"><a href="ContentBBS.aspx?TopicID=<%#Eval("topicID")%>&page=1">
                            <%#Eval("TopicTitle") %></a></font>
                    </div>
                    <div style="font-size: 13px; float: left; margin-top: 10px; display: inline; margin-left: 382px;">
                        <%#Eval("username")%><br />
                        <font style="color: Gray">
                            <%# DateTime.Parse(Eval("writeDate").ToString()).ToString("yyyy-MM-dd")%></font>
                    </div>
                    <div style="font-size: 18px; padding-top: 10px; float: left; display: inline; margin-left: 60px;">
                        <font style="color: Blue">
                            <%#Eval("ReadCount")%></font> /<%#Eval("AnswerCount")%></div>
                    <div style="font-size: 13px; padding-top: 10px; float: left; display: inline; margin-left: 108px;">
                        <%#Eval("username")%><br />
                        <font style="color: gray; font-size: 12px;">
                            <%# DateTime.Parse(Eval("lastTime").ToString()).ToString("yyyy-MM-dd")%></font></div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div onclick="ww()" style="height: 35px; background-color: #E8F3FD; border-bottom: solid 1px #E8E8E8;
            cursor: pointer;">
            <div style="font-size: 13px; float: left; margin-top: 10px; display: inline; margin-left: 50px;">
                版内置顶</div>
        </div>
        <asp:Repeater ID="rpzhiding" runat="server">
            <ItemTemplate>
                <div id="second" style="height: 40px; border-bottom: solid 1px #E8E8E8; display: none">
                    <div style="font-size: 13px; float: left; margin-top: 10px; display: inline; margin-left: 50px;">
                        <img src="../pics/pin_1.gif" />
                        <font style="color: Red; font-weight: bolder"><a href="ContentBBS.aspx?TopicID=<%#Eval("topicID")%>&page=1">
                            <%#Eval("TopicTitle") %></a></font>
                    </div>
                    <div style="font-size: 13px; float: left; margin-top: 10px; display: inline; margin-left: 470px;">
                        <%#Eval("username")%><br />
                        <font style="color: Gray">
                            <%# DateTime.Parse(Eval("writeDate").ToString()).ToString("yyyy-MM-dd")%></font>
                    </div>
                    <div style="font-size: 18px; padding-top: 10px; float: left; display: inline; margin-left: 60px;">
                        <font style="color: Blue">
                            <%#Eval("ReadCount")%></font> /<%#Eval("AnswerCount")%></div>
                    <div style="font-size: 13px; padding-top: 10px; float: left; display: inline; margin-left: 105px;">
                        <%#Eval("username")%><br />
                        <font style="color: gray; font-size: 12px;">
                            <%# DateTime.Parse(Eval("lastTime").ToString()).ToString("yyyy-MM-dd")%></font></div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div onclick="sss()" style="height: 35px; background-color: #E8F3FD; border-bottom: solid 1px #E8E8E8;
            cursor: pointer;">
            <div style="font-size: 13px; float: left; margin-top: 10px; display: inline; margin-left: 50px;">
                普通主题</div>
        </div>
        <div id="three">
        <asp:Repeater ID="reputong" runat="server">
            <ItemTemplate>
                <div style="height: 40px; border-bottom: solid 1px #E8E8E8">
                    <div style="font-size: 13px; float: left; margin-top: 10px; width: 600px; display: inline;
                        margin-left: 50px;">
                        <img src="../pics/pin_1.gif" />
                        <font style="color: Red; font-weight: bolder"><a href="ContentBBS.aspx?TopicID=<%#Eval("topicID")%>&page=1">
                            <%#Eval("TopicTitle")%></a></font>
                    </div>
                    <div style="font-size: 13px; float: left; margin-top: 10px; display: inline; width: 100px;
                        text-align: center;">
                        <%#Eval("username")%><br />
                        <font style="color: Gray">
                            <%# DateTime.Parse(Eval("writeDate").ToString()).ToString("yyyy-MM-dd")%></font>
                    </div>
                    <div style="font-size: 18px; padding-top: 10px; float: left; display: inline; width: 100px;
                        text-align: center;">
                        <font style="color: Blue">
                            <%#Eval("ReadCount")%>
                        </font>/<%#Eval("AnswerCount")%></div>
                    <div style="font-size: 13px; padding-top: 10px; float: left; display: inline; width: 130px;
                        text-align: center; margin-left: 10px;">
                        <%#Eval("username")%><br />
                        <font style="color: gray; font-size: 12px;">
                            <%# DateTime.Parse(Eval("lastTime").ToString()).ToString("yyyy-MM-dd")%></font></div>
                </div>
            </ItemTemplate>
        </asp:Repeater></div>
        <div style="margin-top: 20px; height: 80px;">
            <div style="margin-top: 10px; height: 40px;">
                <div style="background-image: url(../pics/newtopic.gif); background-repeat: no-repeat;
                    height: 30px; margin-top: 10px;">
                    <div style="font-size: 15px; margin-left: 30px; padding-top: 10px;">
                        <a href="WriteTopic.aspx">发帖</a></div>
                    <div style="float: right; width: 80px; height: 20px; background-color: White; margin-top: -20px;
                        color: #006699; border-bottom: solid 1px #006699; border-left: solid 1px #006699;
                        border-top: solid 1px #006699; border-right: solid 1px #006699; font-size: 15px;
                        text-align: center">
                        <a href="BBSIndex.aspx">返回首页</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script language="javascript">
    function show(){
     var firstnew=document.getElementById("first");
     if(firstnew==null)
     {
     return;
     }
     if(firstnew.style.display=="none")
     {  
       firstnew.style.display="block";
     }
     else
     {
       firstnew.style.display="none";
      }
     }
     
      function ww(){
      var secondnew=document.getElementById("second");
      if(secondnew==null)
      {
       return;
      }
      if(secondnew.style.display=="none")
        {
         secondnew.style.display="block";
        }
        else
          {
           secondnew.style.display="none";
          }
        }
        
        function sss(){
         var sssss=document.getElementById("three");
         if(sssss==null)
         {
           return;
         }
         if(sssss.style.display=="none")
         {
           sssss.style.display="block";
         }
         else
         {
           sssss.style.display="none";
         }
        }
    </script>

</asp:Content>
