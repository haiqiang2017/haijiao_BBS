<%@ Page Language="C#" AutoEventWireup="true" CodeFile="banzhu.aspx.cs" Inherits="banzhu_banzhu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>版主操作界面</title>
    <link href="../themes/default/easyui.css" rel="stylesheet" type="text/css" />  
    <link href="../themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="../js/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="../js/datagrid-detailview.js" type="text/javascript"></script>
    <script src="../js/sichang.js" type="text/javascript"></script>   
    <script src="../js/export.js" type="text/javascript"></script>
     <script type="text/javascript">
         $(function() {
                $("#tab").tabs({ fit: true });
            });
    </script>
</head>
<body class="easyui-layout">
    <form id="form1" method="post" action="guanli_Reload.ashx">
     <div region="west" title="功能选择" style="width: 200px;" split="true">
        <div class="easyui-accordion" style="width: 198px; height: 460px;">
               <div id="div1" title="禁言管理" iconcls="icon-ok" style="overflow: auto;"  >
                <ul>
                    <li id="user_manage" style="list-style-type: none; line-height: 1.8;"><a href="#" style="cursor: pointer;
                        text-decoration: none;" onclick="addTab('禁言管理','jinyan_manage.aspx')">禁言管理</a> </li>
               </ul>
           </div>


            <div id="div2" title="审核管理" iconcls="icon-ok" style="overflow: auto;"  >
                <ul>
                    <li id="bk_manage" style="list-style-type: none; line-height: 1.8;"><a href="#" style="cursor: pointer;
                        text-decoration: none;" onclick="addTab('审核管理','cardshenhe_manage.aspx')">审核管理</a> </li>
               </ul>
            </div>

                <div id="tiezi" title="帖子管理" iconcls="icon-ok" style="overflow: auto;"  >
                <ul>
                    <li id="card_manage" style="list-style-type: none; line-height: 1.8;"><a href="#" style="cursor: pointer;
                        text-decoration: none;" onclick="addTab('帖子管理','BK_card_manage.aspx')">帖子管理</a> </li>
               </ul>
          </div>
        </div>
         </div>

     <div region="center">
        <div class="easyui-tabs" id="tab">
            <div title="主页" closable="true" id="t1">
                <br />
                <br />
                <h3>
                    欢迎使用海角论坛……</h3>
            </div>
        </div>
    </div>


     <div region="north" style="height: 55px; background-image: url(images/top/backpic.png)">
        <img alt="title" src="../image/new/2.png" border="0" style="float: left; margin-top: 0px;
            margin-left: 40px; height: 52px;" />
         <span style="float: left; margin-top: 35px;
            margin-left: 40px; "> 当前登录用户：<asp:Label ID="labelname" runat="server" Text=""></asp:Label> 
             &nbsp;&nbsp;&nbsp;
              在线人数：<span id="span2"><%=Application["onlinenum"] %>人</span>
                           &nbsp;&nbsp;
             在线用户数：<span id="span2"><%=Application["useronline"] %>人</span>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a  href="../logout.aspx?" style="text-decoration: none;">注销</a>
           
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%--         <a  href="./alterPsw.aspx"  target="_blank" style="text-decoration: none;" >修改密码</a> --%>
         </span>   
    </div>
        </form>
</body>
</html>
