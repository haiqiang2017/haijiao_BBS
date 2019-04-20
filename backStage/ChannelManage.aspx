<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChannelManage.aspx.cs"
    MasterPageFile="~/backStage/backsite.Master" Inherits="BBS.backStage.ChannelManage" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="Stylesheet" type="text/css" href="../css/ChannelManage.css" />
</asp:Content>
<asp:Content ContentPlaceHolderID="cph" runat="server">
    <div id="bmbody" style=" min-height: 500px;">
        <div id="bmright">
            <div id="bmup">
                <table style="padding-left: 10px;">
                    <tr>
                        <div style="margin-top: 20px; padding-left: 10px;">
                            <td style="border: solid 1px #303030; background-image: url(../pics/bar_off.gif);
                                margin-top: 20px;">
                                <img src="../pics/new.gif" /><a href="AddSmalldoule.aspx">添加小版块</a>
                            </td>
                        </div>
                    </tr>
                </table>
            </div>
            <div id="bmcenter">
                <div style="width: 110px;">
                    排序ID</div>
                <div style="width: 340px;">
                    模块名称</div>
                <div style="width: 110px;">
                    状态</div>
                <div style="width: 110px;">
                    版主</div>
                <div style="width: 110px;">
                    操作</div>
            </div>
            <div id="bmright_body">
                <div style="border: dotted 1px #808080; min-height: 300px; margin-left: 10px;">
                    <asp:Repeater ID="rpSmallInfo" runat="server">
                        <ItemTemplate>
                            <div id="delete<%#Eval("PlateID") %>">
                                <div style="width: 110px;">
                                    <%#Eval("PlateID") %></div>
                                <div id="cpnew<%#Eval("PlateID")%>" style="width: 340px;">
                                    <%#Eval("PlateName")%></div>
                                <div style="width: 110px;">
                                    <%#Eval("PlateState") %></div>
                                <div style="width: 110px;">
                                    <asp:LinkButton ID="LinkButton1" runat="server">设置</asp:LinkButton></div>
                                <div id="mlimage<%#Eval("PlateID")%>" style="width: 110px;">
                                    <img src="../pics/edit.gif" id="edite<%#Eval("PlateID") %>" onclick="myeditkongjian(this)" />&nbsp
                                    &nbsp
                                    <img src="../pics/delete.gif" id="<%#Eval("PlateID")%>" onclick="mydelete(this)" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div id="cmfooter">
                        <div style="margin-top: 70px;">
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
   
    var t;
    var uu;
    var tt;
   function myeditkongjian(oj)
   {
      tt=oj.id;
      uu=tt.replace("edite","");
      var o=document.getElementById("cpnew"+uu);
      t=o.innerHTML;
      o.innerHTML="<input id='mm' type='text' style='width:150px;text-align:center;' value='"+t+"'>";
      
      var btn1=document.getElementById("mlimage"+uu);
      btn1.innerHTML="<input type='button' id='"+uu+"' value='修改' style='width:30px;' onclick='myedite(this)' /><input type='button' value='取消' onclick='myquxiao()' style='width:30px;' />";
   }
   
   
   var editename;
   function myedite(obj){
   editename=obj.id;
   var f=document.getElementById("mm").value;
   xhr.open("post","ChannelManage.aspx",true);
   xhr.onreadystatechange=edites;
   xhr.setrequestheader("Content-Type","application/x-www-form-urlencoded");
   xhr.send("myeditid="+editename+"&editname="+f);
   }
   function myquxiao()
   {
       var o=document.getElementById("cpnew"+uu);
       o.innerHTML=t;
       var btn1=document.getElementById("mlimage"+uu);
       var btn1=document.getElementById("mlimage"+uu);
       btn1.innerHTML=" <img src='../pics/edit.gif' id='"+tt+"' onclick='myeditkongjian(this)' />&nbsp&nbsp &nbsp<img src='../pics/delete.gif' id='"+uu+"' onclick='mydelete(this)' />";
       
   }
   
   function edites(){
   if(xhr.readystate==4)
       {
         if(xhr.status==200)
           {
            var result=xhr.responseText;
              if(result=="yes")
                {
                  alert("修改成功！");
                  var gg=document.getElementById("mm");
                  var ggzhi=gg.value;
                   var o=document.getElementById("cpnew"+uu);
                   o.innerHTML=ggzhi;
                   var btn1=document.getElementById("mlimage"+uu);
                   btn1.innerHTML=" <img src='../pics/edit.gif' id='"+tt+"' onclick='myeditkongjian(this)' />&nbsp&nbsp &nbsp<img src='../pics/delete.gif' id='"+uu+"' onclick='mydelete(this)' />";
                   
                  
                }
                else
                {
                 alert("修改失败!");
                }
           }
       }
   }
   
   var deletename;
   function mydelete(mydeletes){
       deletename=mydeletes.id;
       xhr.open("post","ModuleList.aspx",true);
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
