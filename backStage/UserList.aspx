<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" MasterPageFile="~/backStage/backsite.Master"
    Inherits="BBS.backStage.UserList" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="Stylesheet" href="../css/UserList.css" type="text/css" />
</asp:Content>
<asp:Content ContentPlaceHolderID="cph" runat="server">
    <div style="background-color: #EEF2FB; min-height: 500px;">
        <div id="ulheader">
            <table style="padding-left: 10px;">
                <tr>
                    <td>
                        用户名：
                    </td>
                    <td>
                        <input type="text" id="txtname" style="width: 300px; height: 20px;" runat="server" />
                    </td>
                    <td>
                        <asp:Button ID="btnSelect" runat="server" Text="查询" Style="border: solid 1px gray;
                            background-color: #8DB9DB; width: 60px; height: 25px;" OnClick="btnSelect_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="Ulbanner">
            <div id="liuserName">
                用户名</div>
            <div id="Pwd">
                密码</div>
            <div id="lisex">
                性别</div>
            <div id="liaction">
                操作</div>
        </div>
        <div id="Ulmian">
            <asp:Repeater ID="rpDetail" runat="server">
                <ItemTemplate>
                    <div id="delete<%#Eval("userID") %>">
                        <div style="width: 300px; height: 20px; text-align: center; float: left; margin-top: 10px;
                            border: solid 1px #EEF2FB;">
                            <%#Eval("username")%></div>
                        <div id="cpnew<%#Eval("userID")%>" style="border: solid 1px #EEF2FB; width: 100px;
                            height: 20px; text-align: center; float: left; margin-top: 10px;">
                            <%#Eval("password")%></div>
                        <div id="sex" style="width: 150px; height: 20px; text-align: center; float: left;
                            margin-top: 10px; border: solid 1px #EEF2FB;">
                            <%#Eval("userSex") %></div>
                        <div id="mlimage<%#Eval("userID")%>" style="width: 200px; height: 20px; text-align: center;
                            margin-top: 10px; border: solid 1px #EEF2FB">
                            <input type="button" id="edite<%#Eval("userID") %>" onclick="myeditkongjian(this)"
                                value="重置密码" style="border: solid 1px gray; background-color: #8DB9DB" />
                            <input type="button" id="<%#Eval("userID") %>" onclick="mydelete(this)" value="删除用户"
                                style="border: solid 1px gray; background-color: #8DB9DB" /></div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div id="Ulfooter">
            <div>
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

    <script language="javascript">
     function t() {
      var t=false;
      try{
            t=new ActiveXObject("msxml2.xmlhttp");
         }
          catch(e)
           {
             try{
                  t=new ActiveXObject("microsoft.xmlhttp");
                 }
              catch(e)
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
      btn1.innerHTML="<input type='button' id='"+tt+"' value='修改' style='width:50px;' onclick='myedite(this)' /><input type='button' value='取消' onclick='myquxiao()' style='width:50px;' /> <input type='button' id='"+uu+"'onclick='mydelete(this)' value='删除用户'style='border: solid 1px gray; background-color: #8DB9DB' />";
   }
   
   
   var editename;
   function myedite(obj){
   editename=obj.id;
   var f=document.getElementById("mm").value;
   xhr.open("post","UserList.aspx",true);
   xhr.onreadystatechange=edites;
   xhr.setrequestheader("Content-Type","application/x-www-form-urlencoded");
   xhr.send("myeditid="+editename+"&editname="+f);
   }
   function myquxiao()
   {
       var o=document.getElementById("cpnew"+uu);
       o.innerHTML=t;
       var btn1=document.getElementById("mlimage"+uu);
       btn1.innerHTML="<input type='button' id='"+tt+"'onclick='myeditkongjian(this)' value='重置密码' style='border: solid 1px gray; background-color: #8DB9DB' /> <input type='button' id='"+uu+"'onclick='mydelete(this)' value='删除用户'style='border: solid 1px gray; background-color: #8DB9DB' />";
       
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
                   btn1.innerHTML="<input type='button' id='"+tt+"'onclick='myeditkongjian(this)' value='重置密码' style='border: solid 1px gray; background-color: #8DB9DB' /><input type='button' id='"+uu+"'onclick='mydelete(this)' value='删除用户'style='border: solid 1px gray; background-color: #8DB9DB' />";
                   
                  
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
       xhr.open("post","UserList.aspx",true);
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
