﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="input_shenhe.aspx.cs" Inherits="banzhu_input_shenhe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>审核结果！</title>
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
<table class="auto-style1" 
        style="background:#fafafa;padding:5px;margin-top:5px; ">
		<tr>
			<td class="style3">是否通过</td>
			<td class="style24">    
                <select class="easyui-combobox"  name="tg" id="SHZT" runat="server" style="width:153px; height:23px;">
            <option value="通过">通过</option>
            <option value="不通过">不通过</option>
            </select></td>		
        	<td class="style3">定义类型</td>
			<td class="style24">    
                <select class="easyui-combobox"  name="lx" id="TZLX"  runat="server" style="width:153px; height:23px;">
            <option value="申请精华">申请精华</option>
            <option value="普通">普通</option>
            </select></td>		
        </tr>
           </table>
    		<div style="padding:5px 0;text-align:right;padding-right:30px">
            <a href="#" id="save" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="saveItem($('#hd_index').val())">保存</a>&nbsp;&nbsp;&nbsp;
            <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="cancelItem($('#hd_index').val())">取消</a>
	</div>
         </form>
</body>
</html>