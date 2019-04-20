<%@ Page Language="C#" MasterPageFile="~/headStage/headsite.Master" AutoEventWireup="true"
    CodeBehind="ContentBBS.aspx.cs" Inherits="BBS.headStage.ContentBBS" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="Stylesheet" href="../css/contentBBS.css" type="text/css" />
</asp:Content>
<asp:Content ContentPlaceHolderID="HeadstageContent" runat="server">
    <div id="cbb-first">
        <b id="cbb-b"><a href="BBSIndex.aspx">首页</a></b>>><b id="cbb-b1"><a href="ListBBSnew.aspx?plateID=<%=Session["plate"]%>">
            <%=dt4.Rows[0]["PlateName"]%></a></b>
    </div>
    <div id="cbb-second">
        <label id="cbb-label">
            <%=dt2.Rows[0]["TopicTiTle"].ToString()%></label>
    </div>
    <div id="cbb-third">
        <div id="cbb-reply">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div style="font-size: 13px; margin-left: 30px;
                margin-top: -10px;">
                <a href="WriteBack.aspx?TopicID=<%=topicID %>">回复</a>
            </div>
        </div>
        <div id="cbb-publish">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp
            <div style="font-size: 13px; margin-left: 30px; margin-top: -10px;">
                <a href="WriteTopic.aspx">发帖</a>
            </div>
        </div>
        <div id="cbb-return">
            <span id="cbb-return1" style="padding-left: 10px; padding-top: 5px; font-size: 15px;">
                <a href="BBSIndex.aspx">返回首页</a></span>
        </div>
    </div>
    <div id="cbb-fourth">
        <div id="cbb-second1">
            <label id="cbb-label1">
                <%=dt2.Rows[0]["TopicTiTle"].ToString()%></label>
        </div>
        <div id="cbb-certer">
            <div id="cbb-userInfo">
                <div id="cbb-userName">
                    <br />
                    <%= dt2.Rows[0]["username"].ToString()%>
                </div>
                <div>
                    <table>
                        <tr>
                            <td>
                                <img src='<%=head(dt2.Rows[0]["HeadImage"])%>' width="80px" height="100px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                帖子&nbsp;&nbsp;&nbsp;&nbsp;
                                <%= dt2.Rows[0]["AllCount"].ToString()%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                积分&nbsp;&nbsp;&nbsp;&nbsp;
                                <%= dt2.Rows[0]["LevelCount"].ToString()%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                等级&nbsp;&nbsp;&nbsp;&nbsp;
                                <%= dt2.Rows[0]["LevelName"].ToString()%>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="cbb-topic">
                <div id="cbb-action">
                    &nbsp; &nbsp; &nbsp;<span>发表时间：
                        <%=((DateTime)(dt2.Rows[0]["WriteDate"])).ToString("yyyy年MM月dd日")%>楼主】作者：<label style="color: Red;"><%=dt2.Rows[0]["username"].ToString()%></label>
                        阅读：
                        <label style="color: Red;">
                            <%=dt2.Rows[0]["ReadCount"].ToString()%></label>人
                        <asp:LinkButton ID="lbtn" runat="server" Style="color: Black; font-weight: normal">编辑</asp:LinkButton></span>
                    <div id="cbb-bulid">
                        1#</div>
                </div>
                <div id="cbb-title">
                    <%=dt2.Rows[0]["TopicTiTle"].ToString()%>
                </div>
                <div id="cbb-body">
                    <%=dt2.Rows[0]["TopicContent"].ToString()%></div>
            </div>
        </div>
    </div>
    <asp:Repeater ID="recontBBS" runat="server">
        <ItemTemplate>
            <div id="fifth">
                <div id="cbb-userInfo1">
                    <div id="cbb-userName1">
                        <br />
                        <%# Eval("username")%>
                    </div>
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <img src='<%# head(Eval("HeadImage"))  %>' width="80px" height="100px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    帖子&nbsp;&nbsp;&nbsp;&nbsp;
                                    <%# Eval("Allcount")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    积分&nbsp;&nbsp;&nbsp;&nbsp;
                                    <%# Eval("LevelCount")%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    等级&nbsp;&nbsp;&nbsp;&nbsp;
                                    <%# Eval("LevelName")%>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div id="cbb-topic1">
                    <div id="cbb-action1">
                        &nbsp; &nbsp; &nbsp;<span>发表时间：
                            <%# DateTime.Parse(Eval("AnswerDate").ToString()).ToString("yyyy年MM月dd日")%>
                            <asp:LinkButton ID="LBtn2" runat="server" Style="color: Black; font-weight: normal">编辑</asp:LinkButton></span>
                        <div id="cbb-bulid1">
                            <%#  Container.ItemIndex+ (pageIndex-1) * 4 + 2 %>#</div>
                    </div>
                    <div id="cbb-title1">
                    </div>
                    <div id="cbb-body1">
                        <%# Eval("AnswerContent")%></div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <div>
        <div id="page" style="margin-left: 350px; padding-top: 20px;">
            <span>首页</span>&nbsp &nbsp &nbsp<span>上一页</span> &nbsp &nbsp
            <% if (pageIndex < pageCount)
               { %>
            <span>下一页</span>&nbsp &nbsp &nbsp
            <%}
               else
               { %>
            <span style="color: Gray;">下一页</span> &nbsp &nbsp &nbsp
            <%} %>
            <span>尾页</span>

            <script language="javascript">
        var page = document.getElementById("page");
        var spans = page.children;
        var partten = /&page=[1-9][0-9]*/;
        var href = window.location.toString();
        var currentindex = href.split("&page=")[1];
     
        var pageCount = parseInt('<%=pageCount %>');
         var index=currentindex;
        for (var i = 0; i < spans.length; i++) {
            spans[i].onclick = function() { 
              switch (this.innerText) {
              
                    case "首页":

                        index = 1;
                        break;
                    case "上一页":
                        if (index != 1) {
                            index -= 1;
                        }
                        break;
                    case "下一页":
                        if (index >= pageCount) {
                            return;
                        }
                        index= parseInt(index)+1;

                        break;
                    case "尾页":
                        index = pageCount;
                        break;
                  }   
                           
                //重新定向网页地址，跳转到指定分页
                window.location = href.replace(partten, "&page=" + index);
           
            };
        }
            </script>

        </div>
    </div>
    <div id="cbb-foot">
        <label id="cbb-leftbutton">
            <a href="BBSIndex.aspx">论坛首页</a>
        </label>
        <label id="cbb-rightbutton">
            <a href="ListBBSnew.aspx?plateID=<%=Session["plate"]%>">返回列表</a>
        </label>
    </div>
    <div id="cbb-end">
        <div id="cbb-answer">
            <label id="cbb-label2">
                快速回复主题</label>
        </div>
        <div id="cbb-left">
            <img src="../pics/touxiang.jpg" />
        </div>
        <div id="cbb-right">
            <input class="cbb-text" type="text" runat="server" id="txtContent" /><br />
            <asp:Button ID="btnAnswer" runat="server" Text="发表回复" Style="width: 100px; height: 25px;
                background-color: #F3F3EF; border: solid 1px #003C74; padding-top: 5px;" OnClick="btnAnswer_Click" />
        </div>
    </div>
</asp:Content>
