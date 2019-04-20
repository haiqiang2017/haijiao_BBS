<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModeratorManage.aspx.cs"
    MasterPageFile="~/headStage/headsite.Master" Inherits="BBS.headStage.ModeratorManage" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="Stylesheet" href="../css/ModeratorManage.css" type="text/css" />
</asp:Content>
<asp:Content ContentPlaceHolderID="HeadstageContent" runat="server">
    <div id="content">
        <div class="toph1">
            <a href="BBSIndex.aspx">��ҳ</a>>><a href="ModeratorManage.aspx?plateID=<%=Session["plate"]%>">���԰��</a>
        </div>
        <div class="toph1">
            <span style="font-size: 16px;"><b>���԰��</b></span> <span style="font-size: 14px;">[2����/1�ظ�]</span><br />
            <span class="span1">�����ܣ�</span>
        </div>
        <div class="toph1">
            <span id="span3">������*��ȱ��*</span>
        </div>
        <div style="margin-top: 10px; height: 29px;">
            <div class="fttou">
               <a href ="WriteTopic.aspx?plateID=<%=Session["plate"]%>"> ����</a>
            </div>
            <div class="hhsy">
                <a class="alj" href="BBSIndex.aspx">������ҳ</a>
            </div>
        </div>
        <div style="border: solid 1px #E8E8E8; height: 30px;">
            <div class="tableg" style="width: 80px;">
            </div>
            <div class="tableg" style="width: 192px;">
                ����
            </div>
            <div class="tableg" style="width: 95px;">
                ����
            </div>
            <div class="tableg" style="width: 95px;">
                �ظ�/�鿴
            </div>
            <div class="tableg" style="width: 95px;">
                ��󷢱�
            </div>
            <div class="tableg" style="width: 130px;">
                ״̬
            </div>
            <div class="tableg" style="width: 310px;">
                ����
            </div>
        </div>
        <div>
            <div style="height: 35px; background-color: #E8F3FD; border-bottom: solid 1px #E8E8E8">
                <div style="font-size: 13px; float: left; margin-top: 10px; display: inline; margin-left: 80px;">
                    ��̳����</div>
            </div>
            <asp:Repeater ID="chesi" runat="server">
                <ItemTemplate>
                    <div style="height: 40px; border-bottom: solid 1px #E8E8E8">
                        <div class="tableg" style="font-size: 13px; float: left; margin-top: 10px; display: inline;
                            width: 60px; margin-left: 20px;">
                            <img src="../pics/folder_new.gif" /></div>
                        <div style="font-size: 13px; float: left; margin-top: 10px; display: inline; width: 192px;">
                            <font style="font-weight: bolder"><a href="ContentBBS.aspx?TopicID=<%#Eval("topicID")%>&page=1">
                                <%#Eval("TopicTitle") %></a></font>
                        </div>
                        <div style="font-size: 13px; float: left; margin-top: 10px; display: inline; width: 95px;">
                            <%#Eval("username")%><br />
                            <font style="color: Gray">
                                <%# DateTime.Parse(Eval("writeDate").ToString()).ToString("yyyy-MM-dd")%></font>
                        </div>
                        <div style="font-size: 18px; padding-top: 10px; float: left; display: inline; width: 95px;">
                            <font style="color: Blue">
                                <%#Eval("ReadCount")%></font> /<%#Eval("AnswerCountA")%></div>
                        <div style="font-size: 13px; padding-top: 10px; float: left; display: inline; width: 95px;">
                            <%#Eval("username")%><br />
                            <font style="color: gray; font-size: 12px;">
                                <%# DateTime.Parse(Eval("lastTime").ToString()).ToString("yyyy-MM-dd")%></font></div>
                        <div style="font-size: 15px; float: left; margin-top: 10px; display: inline; width: 130px;">
                            <%#Eval("state")%><br />
                        </div>
                        <div class="tableg" style="height: 41px; width: 310px;">
                            <asp:LinkButton runat="server" ID="LinkButton5" Text="��˲�ͨ��" Style="text-decoration: none"></asp:LinkButton>
                            &nbsp;
                            <asp:LinkButton ID="LinkButton6" runat="server" Text="ɾ�� " Style="text-decoration: none"
                                OnClick=" deletej"></asp:LinkButton>
                            &nbsp;
                            <asp:LinkButton ID="LinkButton7" runat="server" Text="��Ϊ����" Style="text-decoration: none"></asp:LinkButton>
                            &nbsp;
                            <asp:LinkButton ID="LinkButton8" runat="server" Text="�����ö�" Style="text-decoration: none"></asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div style="height: 35px; background-color: #E8F3FD; border-bottom: solid 1px #E8E8E8">
                <div style="font-size: 13px; float: left; margin-top: 10px; display: inline; margin-left: 80px;">
                    �����ö�</div>
            </div>
            <asp:Repeater ID="bnzd" runat="server">
                <ItemTemplate>
                    <div style="height: 40px; border-bottom: solid 1px #E8E8E8">
                        <div class="tableg" style="font-size: 13px; float: left; margin-top: 10px; display: inline;
                            width: 60px; margin-left: 20px;">
                            <img src="../pics/folder_new.gif" /></div>
                        <div style="font-size: 13px; float: left; margin-top: 10px; display: inline; width: 192px;">
                            <font style="font-weight: bolder"><a href="ContentBBS.aspx?TopicID=<%#Eval("topicID")%>&page=1">
                                <%#Eval("TopicTitle") %></a></font>
                        </div>
                        <div style="font-size: 13px; float: left; margin-top: 10px; display: inline; width: 95px;">
                            <%#Eval("username")%><br />
                            <font style="color: Gray">
                                <%# DateTime.Parse(Eval("writeDate").ToString()).ToString("yyyy-MM-dd")%></font>
                        </div>
                        <div style="font-size: 18px; padding-top: 10px; float: left; display: inline; width: 95px;">
                            <font style="color: Blue">
                                <%#Eval("ReadCount")%></font> /<%#Eval("AnswerCountA")%></div>
                        <div style="font-size: 13px; padding-top: 10px; float: left; display: inline; width: 95px;">
                            <%#Eval("username")%><br />
                            <font style="color: gray; font-size: 12px;">
                                <%# DateTime.Parse(Eval("lastTime").ToString()).ToString("yyyy-MM-dd")%></font></div>
                        <div style="font-size: 15px; float: left; margin-top: 10px; display: inline; width: 130px;">
                            <%#Eval("state")%><br />
                        </div>
                        <div class="tableg" style="height: 41px; width: 310px;">
                            <asp:LinkButton runat="server" ID="LinkButton5" Text="��˲�ͨ��" Style="text-decoration: none"></asp:LinkButton>
                            &nbsp;
                            <asp:LinkButton ID="LinkButton6" runat="server" Text="ɾ�� " Style="text-decoration: none"
                                OnClick=" deletej"></asp:LinkButton>
                            &nbsp;
                            <asp:LinkButton ID="LinkButton7" runat="server" Text="��Ϊ����" Style="text-decoration: none"></asp:LinkButton>
                            &nbsp;
                            <asp:LinkButton ID="LinkButton8" runat="server" Text="�����ö�" Style="text-decoration: none"></asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div style="height: 35px; background-color: #E8F3FD; border-bottom: solid 1px #E8E8E8">
                <div style="font-size: 13px; float: left; margin-top: 10px; display: inline; margin-left: 80px;">
                    ��ͨ����</div>
            </div>
            <asp:Repeater ID="ptzt" runat="server">
                <ItemTemplate>
                    <div style="height: 40px; border-bottom: solid 1px #E8E8E8">
                        <div class="tableg" style="font-size: 13px; float: left; margin-top: 10px; display: inline;
                            width: 60px; margin-left: 20px;">
                            <img src="../pics/folder_new.gif" /></div>
                        <div style="font-size: 13px; float: left; margin-top: 10px; display: inline; width: 192px;">
                            <font style="font-weight: bolder"><a href="ContentBBS.aspx?TopicID=<%#Eval("topicID")%>&page=1">
                                <%#Eval("TopicTitle") %></a></font>
                        </div>
                        <div style="font-size: 13px; float: left; margin-top: 10px; display: inline; width: 95px;">
                            <%#Eval("username")%><br />
                            <font style="color: Gray">
                                <%# DateTime.Parse(Eval("writeDate").ToString()).ToString("yyyy-MM-dd")%></font>
                        </div>
                        <div style="font-size: 18px; padding-top: 10px; float: left; display: inline; width: 95px;">
                            <font style="color: Blue">
                                <%#Eval("ReadCount")%></font> /<%#Eval("AnswerCountA")%></div>
                        <div style="font-size: 13px; padding-top: 10px; float: left; display: inline; width: 95px;">
                            <%#Eval("username")%><br />
                            <font style="color: gray; font-size: 12px;">
                                <%# DateTime.Parse(Eval("lastTime").ToString()).ToString("yyyy-MM-dd")%></font></div>
                        <div style="font-size: 15px; float: left; margin-top: 10px; display: inline; width: 130px;">
                            <%#Eval("state")%><br />
                        </div>
                        <div class="tableg" style="height: 41px; width: 310px;">
                            <asp:LinkButton runat="server" ID="LinkButton5" Text="��˲�ͨ��" Style="text-decoration: none"></asp:LinkButton>
                            &nbsp;
                            <asp:LinkButton ID="LinkButton6" runat="server" Text="ɾ�� " Style="text-decoration: none"
                                OnClick=" deletej"></asp:LinkButton>
                            &nbsp;
                            <asp:LinkButton ID="LinkButton7" runat="server" Text="��Ϊ����" Style="text-decoration: none"></asp:LinkButton>
                            &nbsp;
                            <asp:LinkButton ID="LinkButton8" runat="server" Text="�����ö�" Style="text-decoration: none"></asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <div style="height: 100px; margin-top: 10px;">
        <div class="fttou">
           <a href ="WriteTopic.aspx?plateID=<%=Session["plate"]%>"> ����</a>
        </div>
        <div class="hhsy">
            <a class="alj" href="BBSIndex.aspx">������ҳ</a>
        </div>
    </div>
</asp:Content>
