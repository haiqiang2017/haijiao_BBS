<%@ Page Language="C#" AutoEventWireup="true" CodeFile="card_manage.aspx.cs" Inherits="guanliyuan_card_manage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>海角论坛帖子管理</title>
    <link href="css.css" rel="stylesheet" type="text/css">
    <link href="../themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="../js/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="../js/datagrid-detailview.js" type="text/javascript"></script>
    <script src="../js/export.js" type="text/javascript"></script>
      <script type="text/javascript">
          $.fn.datebox.defaults.formatter = function (date) {
              var y = date.getFullYear();
              var m = date.getMonth() + 1;
              var d = date.getDate();
              return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
          };
          $.fn.datebox.defaults.parser = function (s) {
              if (!s) return new Date();
              var ss = s.split('-');
              var y = parseInt(ss[0], 10);
              var m = parseInt(ss[1], 10);
              var d = parseInt(ss[2], 10);
              if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
                  return new Date(y, m - 1, d);
              } else {
                  return new Date();
              }
          };   
      </script>
          <script type ="text/javascript">
            ///setValue是EasyUI固定的写法。
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

       <script type="text/javascript">
            $(function () {
              $('#dg').datagrid({
                  title: "帖子管理",
                  //alert("我爱学习");
              url: "get/get_card.ashx",
              fit: true,
              fitColumns: true,
              showFooters: true,
              collapsible: true,
              toolbar: "#toolbar",
              pagination: "true",
              pageSize: 30,
              singleSelect: false,
              sortName: 'BKM',               //排序字段
              sortOrder: 'asc',
              remoteSort: false,
              //multiSort:true,
              rownumbers: "true",
              view: detailview,
              detailFormatter: function (index, row) {
                  return '<div class="ddv"></div>';
              },
              onExpandRow: function (index, row) {
                  var rows = $('#dg').datagrid("getChecked");
                  if (row.CONTENE != "" && row.CONTENT != null)
                      row.CONTENT = row.CONTENT.replace(/\<br\/\>/g, "\r\n");
                  var ddv = $(this).datagrid('getRowDetail', index).find('div.ddv');
                  ddv.panel({
                      border: false,
                      cache: true,
                      href: "../yonghu/show_card.aspx?index=" + index,
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

           function destroyItem() {                   //姜海强  可批量删除 2017-07-06 改
               var rows = $('#dg').datagrid("getChecked");
               if (rows.length) {
                   $.messager.confirm('提示', '你确定要删除已选记录吗?', function (r) {
                       if (r) {
                           for (var i = rows.length - 1; i >= 0; --i) {
                               $.ajax({
                                   type: "post",
                                   url: "destroy/destroy_card.ashx",
                                   data: "ID=" + rows[i].ID,
                                   async: false,
                                   success: function (data) {
                                       if (data == "1") {
                                           var index = $('#dg').datagrid('getRowIndex', rows[i]);
                                           $('#dg').datagrid('deleteRow', index);
                                           $('#dg').datagrid('reload');
                                       }
                                       else
                                           alert("删除失败！");
                                   }
                               });
                           }
                       }
                   });
               }
           }
            function FindData() {
                $('#dg').datagrid('load', {
                    BKM: $('#BKM').combobox('getValue'),///下拉框的获取数值方法*王钧泽学长1月14日                 
                    BT: $('#BT').val(),
                    FTR: $('#FTR').val(), 
                    FTRQ1: $('#FTRQ1').datebox('getValue'),
                    FTRQ2: $('#FTRQ2').datebox('getValue'),
                });
            }
          </script>
 
</head>
<body>
<table id="dg"> 
        <thead>
            <tr>
                <th data-options="field:'ck',checkbox:true"></th>
				<th field="BKM"   width="50" sortable="true">板块</th>
                <th field="BT"   width="50" sortable="true">标题</th>
				<th field="FTR"   width="50" sortable="true">发帖人</th>
                <th field="FTRQ"   width="50" sortable="true">发帖日期</th>
				<th field="HTCS"   width="50" sortable="true">回帖人数</th>
                <th field="FWCS"   width="50" sortable="true">访问次数</th>
			</tr>
        </thead>
    </table>
        <div id="toolbar" class="auto-style1">
            <a href="#" class="easyui-linkbutton" iconcls="icon-remove" plain="true" onclick="destroyItem()">删除消息</a>
        <span>板块类型:</span>
          <input name="bkm" class="easyui-combobox" type="text" style="width:100px;" id="BKM"  runat="server" />
        <span>标题:</span><input type="text" id="BT" value="" size="10" /> 
        <span>发贴人:</span><input type="text" id="FTR" value="" size="10" />
       <span>发帖日期:</span><input name="FTRQ1" id="FTRQ1" class="easyui-datebox"  data-options="formatter:myformatter,parser:myparser" />
         <span>--</span><input name="FTRQ2"id="FTRQ2"class="easyui-datebox"  data-options="formatter:myformatter,parser:myparser" />&nbsp; 
        <a href="#" class="easyui-linkbutton" iconCls='icon-search' onclick="FindData()"">查询</a>
    </div>
    <script type="text/javascript">
       $(function () {
                //      alert("我爱学习");
                      var BKM = $('#BKM').combobox({
                          valueField: 'text',
                          textField: 'text',
                          url: 'get/getBankuaiName.ashx',
                          editable: false
                      });
            });
    </script>
</body>
</html>
