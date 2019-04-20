<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewTopicManage.aspx.cs"
    MasterPageFile="~/backStage/backsite.Master" Inherits="BBS.backStage.NewTopicManage" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="Stylesheet" href="../css/NewTopicManage.css" type="text/css" />
</asp:Content>
<asp:Content ContentPlaceHolderID="cph" runat="server">
    <div id="Newheader" style="min-height: 500px;">
        <div id="nhhe">
            <table>
                <tr>
                    <td>
                        标题：
                    </td>
                    <td>
                        <input type="text" id="txtkeyword" style="width: 300px; height: 20px;" runat="server" />
                    </td>
                    <td>
                        <asp:Button ID="btnSelect" runat="server" Text="查询" Style="border: solid 1px #EEF2FB;
                            background-color: #8DB9DB; width: 60px; height: 25px;" OnClick="btnSelect_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="Newbanner">
            <div style="background-color: #808080; width: 150px; height: 20px; text-align: center;
                float: left; border: solid 1px white">
                主要类型</div>
            <div style="background-color: #808080; width: 250px; height: 20px; text-align: center;
                float: left; border: solid 1px white">
                标题</div>
            <div style="background-color: #808080; width: 250px; height: 20px; text-align: center;
                float: left; border: solid 1px white">
                创建时间</div>
            <div style="background-color: #808080; width: 100px; height: 20px; text-align: center;
                border: solid 1px white">
                操作</div>
        </div>
        <div id="Newmain" style="min-height: 300px;">
            <asp:Repeater ID="rpInfo" runat="server">
                <ItemTemplate>
                    <div id="delete<%#Eval("TopicID") %>>">
                        <div id='NTM<%#Eval("TopicID") %>' style="width: 150px;">
                            <%#Eval("TopicTope")%></div>
                        <div style="width: 250px;">
                            <%#Eval("TopicTitle")%></div>
                        <div style="width: 250px;">
                            <%#Eval("writeDate")%></div>
                        <div style="width: 100px;">
                            <input type="button" id='<%#Eval("TopicID") %>' value="删除" style="border: solid 1px Gray;
                                background-color: #8CB9DB" onclick="mydelete(this)" /></div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div id="Newfooter">
            <div id="page" style="margin-left: 120px; cursor: pointer;">
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
        var currentindex = href.split("page=")[1];
     
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
    </div>

    <script language="javascript">
      function t() {
        var t=false;
      try{
         t=new ActiveXObject("msxml2.xmlhttp");
      }catch(e)
      {
           try{
             t=new ActiveXObject("microsoft.xmlhttp");
          }catch(e)
          {
          t=false;
          }
      }
      if(!t)
      {
      t= new xmlhttprequest();
      }
      return t;
   }
   var xhr;
   window.onload=function(){
       xhr=t();
   }
   
   
    var deletename;
   function mydelete(mydeletes){
       deletename=mydeletes.id;
       xhr.open("post","NewTopicManage.aspx",true);
       xhr.onreadystatechange=changing;
       xhr.setrequestheader("Content-Type","application/x-www-form-urlencoded");
       xhr.send("id="+deletename);
   }
   function changing(){
     if(xhr.readystate==4)
     {
     if(xhr.status==200)
     {
       var zhi=xhr.responseText;
       if(zhi=="yes")
       {
       alert("删除成功！");  
       var y=document.getElementById("delete"+deletename);
       y.innerHTML="";    
       }
       else
       {
         alert("删除失败！");
       }
     }
     }
   }
    </script>

</asp:Content>
