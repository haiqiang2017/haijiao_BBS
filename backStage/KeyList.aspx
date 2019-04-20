<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KeyList.aspx.cs" MasterPageFile="~/backStage/backsite.Master"
    Inherits="BBS.backStage.KeyList" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="Stylesheet" type="text/css" href="../css/KeyList.css" />
</asp:Content>
<asp:Content ContentPlaceHolderID="cph" runat="server">
    <div id="klheader">
        <div id="klhead">
            <table>
                <tr>
                    <td>
                        关键字：
                    </td>
                    <td>
                        <input type="text" style="width: 500px;" id="txtKeywords" runat="server" />
                    </td>
                    <td>
                        <asp:Button ID="btnSelect" runat="server" Text="查询" Style="background-color: #8DB9DB;
                            border: solid 1px #8CB9DB; width: 60px;" OnClick="btnSelect_Click" />
                        <asp:Button ID="btnInsert" runat="server" Text="新增" Style="background-color: #8DB9DB;
                            border: solid 1px #8CB9DB; width: 60px;" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="klbanner">
            <div style="width: 200px;">
                关键字</div>
            <div style="width: 200px;">
                替换文字</div>
            <div style="width: 150px;">
                状态</div>
            <div style="width: 200px;">
                操作</div>
        </div>
        <div id="klmian">
            <asp:Repeater ID="reKeylist" runat="server">
                <ItemTemplate>
                    <div id="delete<%#Eval("KeyListID") %>">
                        <div>
                            <div id="cpnew<%#Eval("KeyListID")%>" style="width: 200px;">
                                <%#Eval("KeyWord") %></div>
                        </div>
                        <div>
                            <div style="width: 200px;" id="keyword<%#Eval("KeyListID") %>">
                                <%#Eval("ReplaceWord")%></div>
                        </div>
                        <div>
                            <div id="statekey" style="width: 150px;">
                                <%#Eval("State")%></div>
                        </div>
                        <div style="width: 200px;" id="mlimage<%#Eval("KeyListID")%>">
                            <div id="gbb" style="padding: 3px;">
                                <input type="button" id="startid<%#Eval("KeyListID")%>" value="启动" style="width: 60px;"
                                    onclick="startid(this)" />
                            </div>
                            <div style="padding-left: 3px;">
                                <input type="button" id="edite<%#Eval("KeyListID") %>" value="修改" onclick="myeditkongjian(this)"
                                    style="width: 60px;" /></div>
                            <div style="padding-left: 3px;">
                                <input type="button" value="删除" onclick="mydelete(this)" id="<%#Eval("KeyListID")%>"
                                    style="width: 60px;" /></div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div id="klfooter">
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
    var secondcontent;
   function myeditkongjian(oj)
   {
      tt=oj.id;
      uu=tt.replace("edite","");//id
      var o=document.getElementById("cpnew"+uu);//拿到原先的关键字
      t=o.innerHTML;
      o.innerHTML="<input id='mm' type='text' style='width:80px;text-align:center; height:20px;' value='"+t+"'>";
      
       var second=document.getElementById("keyword"+uu);
       secondcontent=second.innerHTML;
       second.innerHTML="<input id='gg' type='text' style='width:80px;text-align:center; height:20px;' value='"+secondcontent+"'>";
      
       var twobutton=document.getElementById("mlimage"+uu);
       twobutton.innerHTML="<input type='button' value='修改' onclick='makeedit()'style='padding-left:5px;' />&nbsp &nbsp<input type='button' value='取消' onclick='cancel()' style='padding-left:5px;' />";
      
      
//      var btn1=document.getElementById("mlimage"+uu);
//      btn1.innerHTML="<input type='button' id='"+uu+"' value='修改' style='width:30px;' onclick='myedite(this)' /><input type='button' value='取消' onclick='myquxiao()' style='width:30px;' />";
   }
   
   var first;
   var second;
   function makeedit(){
   first=document.getElementById("mm").value;//修改后原先的值
   second=document.getElementById("gg").value;//修改后原先的值
   
   
   xhr.open("post","KeyList.aspx",true);
   xhr.onreadystatechange=edites;
   xhr.setrequestheader("Content-Type","application/x-www-form-urlencoded");
   xhr.send("first="+first+"&second="+second+"&keyid="+uu);
   }
   function cancel()
   {
                  var newfirst=document.getElementById("cpnew"+uu);
                   newfirst.innerHTML=t;
                   var newsecond=document.getElementById("keyword"+uu);
                   newsecond.innerHTML=secondcontent;
                   
                  var newthreecontrol=document.getElementById("mlimage"+uu);
                  newthreecontrol.innerHTML="<div id='gbb'><input type='button' value='启动' style='width: 60px; padding-left:5px;' /></div><input type='button' id='edite"+uu+"' value='修改' onclick='myeditkongjian(this)' style='width: 60px; padding-left:5px;' /><input type='button' value='删除' onclick='mydelete(this)' id='"+uu+"'style='width: 60px; padding-left:5px;' />";
   
   
//       var o=document.getElementById("cpnew"+uu);
//       o.innerHTML=t;
//       var btn1=document.getElementById("mlimage"+uu);
//       var btn1=document.getElementById("mlimage"+uu);
//       btn1.innerHTML=" <input type='button' value='启动' style='width: 60px;' /><input type='button' id='edite"+uu+"' value='修改' onclick='myeditkongjian(this)'style='width: 60px;' /><input type='button' value='删除' onclick='mydelete(this)' id='"+uu+"' style='width: 60px;' />";
       
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
                   var newfirst=document.getElementById("cpnew"+uu);
                   newfirst.innerHTML=first;
                   var newsecond=document.getElementById("keyword"+uu);
                   newsecond.innerHTML=second;
                   
                  var newthreecontrol=document.getElementById("mlimage"+uu);
                  newthreecontrol.innerHTML="<div id='gbb'><input type='button' value='启动' style='width: 60px; padding-left:5px;' /></div><input type='button' id='edite"+uu+"' value='修改' onclick='myeditkongjian(this)' style='width: 60px; padding-left:5px;' /><input type='button' value='删除' onclick='mydelete(this)' id='"+uu+"'style='width: 60px; padding-left:5px;' />";
                  
                }
                else
                {
                 alert("修改失败!");
                }
           }
       }
   }
    var lastID;
    
    
    
    
     var qiyong;
    function startid(obj){
      var startname=obj.id;
      qiyong =startname.replace("startid","");//keylistid
    
      xhr.open("post","KeyList.aspx",true);
      xhr.onreadystatechange=OK;
      xhr.setrequestheader("Content-Type","application/x-www-form-urlencoded");
      xhr.send("qiyongid="+qiyong);
    
    }
     function OK(){
     if(xhr.readystate==4)
       {
         if(xhr.status==200)
         {
           var result=xhr.responseText;
            if(result=="yes")
               {
                  alert("启动成功！");
                  var statevalue= document.getElementById("statekey");
                  statevalue.innerHTML="打开";
                  
                  var xx=document.getElementById("gbb");
                  xx.innerHTML=" <input type='button' id='"+qiyong+"' value='停用' style='width: 60px;padding-left: 5px;' onclick='tingyong(this)' />";
               }
            else
              {
                alert("启用失败！");
               }
           }
        }
   }
    
    
    
    
    var tingyongid;
    function tingyong(obj){
      tingyongid=obj.id;
      xhr.open("post","KeyList.aspx",true);
      xhr.onreadystatechange=no;
      xhr.setrequestheader("Content-Type","application/x-www-form-urlencoded");
      xhr.send("tingyongid="+tingyongid);
    
    }
     function no(){
     if(xhr.readystate==4)
       {
         if(xhr.status==200)
         {
           var result=xhr.responseText;
            if(result=="yes")
               {
                  alert("停用成功！");
                  var statevalue= document.getElementById("statekey");
                  statevalue.innerHTML="停用";
                  
                  var xx=document.getElementById("gbb");
                  xx.innerHTML="<input type='button' id='"+tingyongid+"' value='启用' style='width: 60px;padding-left: 5px;' onclick='startid(this)' />";
               }
            else
              {
                alert("停用失败！");
               }
           }
        }
   }
    
    
    
    var deletename;
   function mydelete(mydeletes){
       deletename=mydeletes.id;
       xhr.open("post","KeyList.aspx",true);
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
