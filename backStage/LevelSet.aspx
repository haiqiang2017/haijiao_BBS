<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LevelSet.aspx.cs" MasterPageFile="~/backStage/backsite.Master"
    Inherits="BBS.backStage.LevelSet1" %>

<asp:Content ContentPlaceHolderID="cph" runat="server">
    <div id="lsbody" style="min-height: 500px; background-color: #EEF2FB">
        <div id="klbanner" style="width: 800px;">
            <div style="margin-top: 80px; margin-left: 10px;">
                <div style="width: 200px; float: left; background-color: #808080; height: 20px; text-align: center;
                    border-right: solid 1px white; font-weight: bolder;">
                    经验值</div>
                <div style="width: 450px; float: left; background-color: #808080; height: 20px; text-align: center;
                    border-right: solid 1px white; border-left: solid 1px white; font-weight: bolder;">
                    等级积分</div>
                <div style="width: 120px; float: left; background-color: #808080; height: 20px; text-align: center;
                    border-left: solid 1px white; font77-weight: bolder;">
                    操作</div>
            </div>
        </div>
        <div id="lsmain" style="margin-top: 5px; width: 780px; margin-left: 10px;">
            <div style="min-height: 300px; border-bottom: dotted 1px #808080; border-left: dotted 1px #808080;
                border-right: dotted 1px #808080;">
                <div style="margin-top: 20px;">
                    <asp:Repeater ID="rpLevelSet" runat="server">
                        <ItemTemplate>
                            <div id="delete<%#Eval("LevelID") %>">
                                <div id="cpnew<%#Eval("LevelID")%>" style="width: 200px; float: left; height: 20px;
                                    text-align: center; padding-top: 5px;">
                                    <%#Eval("LevelCount") %></div>
                                <div style="width: 450px; float: left; height: 20px; text-align: center; padding-top: 5px;">
                                    <%#Eval("LevelName")%></div>
                                <div id="mlimage<%#Eval("LevelID")%>" style="width: 120px; float: left; height: 20px;
                                    text-align: center; padding-top: 5px;">
                                    <img src="../pics/edit.gif" style="padding-right: 10px;" id="edite<%#Eval("LevelID") %>"
                                        onclick="myeditkongjian(this)" />
                                    <img src="../pics/delete.gif" id="<%#Eval("LevelID")%>" onclick="mydelete(this)" /></div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <div id="lsfooter" style="padding-top: 30px; padding-left: 150px;">
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
   
    var t;
    var uu;
    var tt;
   function myeditkongjian(oj)
   {
      tt=oj.id;
      uu=tt.replace("edite","");
      var o=document.getElementById("cpnew"+uu);
      t=o.innerHTML;
      o.innerHTML="<input id='mm' type='text' style='width:80px;text-align:center;' value='"+t+"'>";
      
      var btn1=document.getElementById("mlimage"+uu);
      btn1.innerHTML="<input type='button' id='"+uu+"' value='修改' style='width:30px;' onclick='myedite(this)' /><input type='button' value='取消' onclick='myquxiao()' style='width:30px;' />";
   }
   
   
   var editename;
   function myedite(obj){
   editename=obj.id;
   var f=document.getElementById("mm").value;
   xhr.open("post","LevelSet.aspx",true);
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
       xhr.open("post","LevelSet.aspx",true);
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
