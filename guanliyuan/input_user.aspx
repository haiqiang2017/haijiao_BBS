<%@ Page Language="C#" AutoEventWireup="true" CodeFile="input_user.aspx.cs" Inherits="guanliyuan_input_user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
           <link href="../themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="../js/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="../js/datagrid-detailview.js" type="text/javascript"></script>
 <script src="../js/export.js" type="text/javascript"></script>
<script type="text/javascript">
    function myformatter(date) {
          var y = date.getFullYear();
          var m = date.getMonth() + 1;
          var d = date.getDate();
          return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
      }
      function myparser(s) {
          if (!s)
              return new Date();
          var ss = (s.split('-'));
          var y = parseInt(ss[0], 10);
          var m = parseInt(ss[1], 10);
          var d = parseInt(ss[2], 10);
          if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
              return new Date(y, m - 1, d);
          } else {
              return new Date();
          }
      }
      </script>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 116px;
        }
    </style>
</head>
<body>
 <form id="form1" method= "post"  runat="server">
    <input type="hidden" value="1"  id="hd_index"  runat="server"/>
	<table class="dv-table" 
        style="width:100%;background:#fafafa;padding:5px;margin-top:5px; height: 142px;">
		<tr>
			<td class="style3">用户名</td>
			<td class="style24"><input name="NAME" id="NAME" class="easyui-combobox" required="true"/></td>        
			<td class="style3">密码</td>
			<td class="auto-style6" >
            <input name="MM"style="width:153px; height: 23px; margin-left: 0px;" required="true" class="easyui-validatebox"  value="不能为空！" onfocus="myFocus(this)" onblur="myblur(this)"  /></td>                
            <td class="style3">权限</td>
			<td class="style14">
                <select class="easyui-combobox"  name="QX"  
                    style="width:153px; height:23px;">
            <option value="管理员">管理员</option>
            <option value="普通用户">普通用户</option>
            </select></td>			
         </tr>
           </table>
		<div style="padding:5px 0;text-align:right;padding-right:30px">
            
            <a href="#" id="save" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="saveItem($('#hd_index').val())">保存</a>&nbsp;&nbsp;&nbsp;
            <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="cancelItem($('#hd_index').val())">取消</a>
	</div>
  
 <script type="text/javascript">
     $(function () {       //高俊涛添加 2014-0-10-26 根据用户级别设置form表单是否可编辑
     //    var userlevel = $('#userLevel').val();
     //    var dm = $('#dm').val();
     //    if ((userlevel == "6" || userlevel == "2")&&dm!="仪表室") {
     //        $("form :input").attr("readonly", "readonly"); //设置控件为只读
     //        $("form :input[type='file']").hide(); //隐藏上传文件窗口
     //        $("form a").hide(); //隐藏保存和撤销按钮    
     //    }
 //        alert("1");
         var NAME = $('#NAME').combobox({
             valueField: 'text',
            textField: 'text',
             url: 'get/get_UserName.ashx',
             editable: true
         });
     });
     function myFocus(obj) {
         //判断文本框中的内容是否是默认内容
         if (obj.value == "不能为空！") {
             obj.value = "";
         }
     }
     function myblur(obj) {
         //当鼠标离开时候改变文本框背景颜色
         if (obj.value == "") {
             obj.value = "不能为空！";
         }
     }
     function BindUnit(unitID)
     {
         $('#MM').val($('#MM').val() + $('#' + unitID).val());
     }
   </script>
    </form>
</body>
</html>
