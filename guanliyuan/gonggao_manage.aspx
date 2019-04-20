<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gonggao_manage.aspx.cs" Inherits="guanliyuan_gonggao_manage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link href="../themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="../js/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="../js/datagrid-detailview.js" type="text/javascript"></script>
    <script src="../js/export.js" type="text/javascript"></script>
    <script type="text/javascript">
          $(function () {
          $('#dg').datagrid({
              title: "公告管理",
              url: "get/get_gonggao.ashx",
              fit: true,
              fitColumns: true,
              showFooters: true,
              collapsible: true,
              toolbar: "#toolbar",
              pagination: "true",
              pageSize: 30,
              singleSelect: false,
              sortName: 'FSR',               //排序字段
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
                      href: 'input_gonggao.aspx?index=' + index,
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

        function saveItem(index) {
         //   alert(index);
            var row = $('#dg').datagrid('getRows')[index];
            //     alert(row);
            var url = row.isNewRecord ? 'insert/insert_gonggao.ashx':'update/update_gonggao.ashx?ID=' + row.ID;
            // alert(url);
            $('#dg').datagrid('getRowDetail', index).find('form').form('submit', {
                url: url,
                onSubmit: function () {
                    //alert("success");
                    $("#save").removeAttr("onclick");
                    return $(this).form('validate');
                },
                success: function (data) {
                    // alert(data);
                    data = eval('(' + data + ')');
                    data.isNewRecord = false;
                    $('#dg').datagrid('collapseRow', index);
                    $('#dg').datagrid('updateRow', {
                        index: index,
                        row: data
                    });
                    $('#dg').datagrid('reload');
                }
            });
        }



        function cancelItem(index) {
            var row = $('#dg').datagrid('getRows')[index];
            if (row.isNewRecord) {
                $('#dg').datagrid('deleteRow', index);
            } else {
                $('#dg').datagrid('collapseRow', index);
            }
        }

        function destroyItem() {                   //姜海强  可批量删除 2017-07-06 改
            var rows = $('#dg').datagrid("getChecked");
            if (rows.length) {
                $.messager.confirm('提示', '你确定要删除已选记录吗?', function (r) {
                    if (r) {
                        for (var i = rows.length - 1; i >= 0; --i) {
                            $.ajax({
                                type: "post",
                                url: "destroy/destroy_gonggao.ashx",
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

        function newItem() {
            $('#dg').datagrid('appendRow', { isNewRecord: true });
            var index = $('#dg').datagrid('getRows').length - 1;
            $('#dg').datagrid('expandRow', index);
            $('#dg').datagrid('selectRow', index);
        }
          </script>
    <title>公告管理</title>
</head>
<body>
<table id="dg"> 
        <thead>
            <tr>
                <th data-options="field:'ck',checkbox:true"></th>
				<th field="FSR"   width="50" sortable="true">发送人</th>
                <th field="NR"   width="50" sortable="true">内容</th>
                <th field="FSRQ" width="50" sortable="true">发布时间</th>
			</tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="#" class="easyui-linkbutton" iconcls="icon-add" plain="true" onclick="newItem()">发布公告</a> 
        <a href="#" class="easyui-linkbutton" iconcls="icon-remove" plain="true" onclick="destroyItem()">删除公告</a>
    </div>
</body>
</html>
