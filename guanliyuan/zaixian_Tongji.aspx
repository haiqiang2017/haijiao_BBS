<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zaixian_Tongji.aspx.cs" Inherits="guanliyuan_zaixian_Tongji" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>在线信息统计</title>
      <link href="../themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="../js/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="../js/datagrid-detailview.js" type="text/javascript"></script>
    <script src="../js/export.js" type="text/javascript"></script>

      <script type="text/javascript">

      $(function () {
          $('#dg').datagrid({
              title: "在线信息统计",
              url: "get/get_zaixian.ashx",
              fit: true,
              fitColumns: true,
              showFooters: true,
              collapsible: true,
              toolbar: "#toolbar",
              pagination: "true",
              pageSize: 30,
              singleSelect: false,
              sortName: '',               //排序字段
              sortOrder: 'asc',
              remoteSort: false,
              //multiSort:true,
              rownumbers: "true",
              view: detailview,

              detailFormatter: function (index, row) {
                  return '<div class="ddv"></div>';
              },
              onExpandRow: function (index, row) {
                  if (row.CONTENE != "" && row.CONTENT != null)
                      row.CONTENT = row.CONTENT.replace(/\<br\/\>/g, "\r\n");
                  var ddv = $(this).datagrid('getRowDetail', index).find('div.ddv');
                  ddv.panel({
                      border: false,
                      cache: true,
                      href: 'input_user.aspx?index=' + index,
                      onLoad: function () {
                          $('#dg').datagrid('fixDetailRowHeight', index);
                          $('#dg').datagrid('selectRow', index);
                          $('#dg').datagrid('getRowDetail', index).find('form').form('load', row);
                      }
                  });
                  $('#dg').datagrid('fixDetailRowHeight', index);
              },
              loader: SCLoader
          });
          });
          </script>
</head>
<body>
 <table id="dg"> 
        <thead>
            <tr>
                <th data-options="field:'ck',checkbox:true"></th>
				<th field="NAME"   width="50" sortable="true">用户名</th>
                <th field="FTS"   width="50" sortable="true">发帖数</th>
                <th field="HTS"   width="50" sortable="true">回帖数</th>
<%--                <th field="FWCS"   width="50" sortable="true">访问次数</th>--%>
			</tr>
        </thead>
    </table>
    <div id="toolbar">
<%-- 
        <a href="#" class="easyui-linkbutton" iconcls="icon-remove" plain="true" onclick="destroyItem()">删除</a>

        <a href="#" class="easyui-linkbutton" iconCls='icon-search' onclick="FindData()"">查询</a>--%>
    </div>
</body>
</html>
