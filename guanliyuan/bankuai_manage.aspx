<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bankuai_manage.aspx.cs" Inherits="guanliyuan_bankuai_manage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>板块管理</title>
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

    <script type="text/javascript">
          $(function () {
              $('#dg').datagrid({
                  title: "板块管理",
                  url: "get/get_bankuai.ashx",
                  fit: true,
                  fitColumns:true,
                  showFooters:true,
                  collapsible:true,
                  toolbar: "#toolbar",
                  pagination: 'true',
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
                  var ddv = $(this).datagrid('getRowDetail', index).find('div.ddv');
                  ddv.panel({
                      border: false,
                      cache: true,
                      href: "input_bankuai.aspx?index=" + index, ///../crud_form/
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

          ////使layout自动适应高度
          $(document).ready(function () {
              var height1 = $(window).height() - 20;
              $("#cc").attr("style", "width:100%;height:" + height1 + "px");
              $("#cc").layout("resize", {
                  width: "100%",
                  height: height1 + "px"
              });
          });
          $(window).resize(function () {
              var height1 = $(window).height() - 30;
              $("#cc").attr("style", "width:100%;height:" + height1 + "px");
              $("#cc").layout("resize", {
                  width: "100%",
                  height: height1 + "px"
              });
          });

        function saveItem(index) {
            //alert(index);
            var row = $('#dg').datagrid('getRows')[index];
            alert(row);
            var url = row.isNewRecord ? 'insert/insert_bankuai.ashx' : 'update/update_bankuai.ashx?ID=' + row.ID;
            // alert(url);
            $('#dg').datagrid('getRowDetail', index).find('form').form('submit', {
                url: url,
                onSubmit: function () {
                    //alert("success");
                    $("#save").removeAttr("onclick");
                    return $(this).form('validate');
                },
                success: function (data) {
                    //alert(data);
                    data = eval('(' + data + ')');
                    data.isNewRecord = false;
                    $('#dg').datagrid('collapseRow', index);
                    $('#dg').datagrid('updateRow', {
                        index: index,
                        row: data
                    });
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
            $('#dg').datagrid('reload');
        }

        function destroyItem() {                   //姜海强  可批量删除 2017-07-06 改
            var rows = $('#dg').datagrid("getChecked");
            if (rows.length) {
                $.messager.confirm('提示', '你确定要删除已选记录吗?', function (r) {
                    if (r) {
                        for (var i = rows.length - 1; i >= 0; --i) {
                            $.ajax({
                                type: "post",
                                url: "destroy/destroy_bankuai.ashx",
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

        //function go(val, row) {
        //    if (row.PICTURE != '#' && row.PICTURE != '' && row.PICTURE != undefined)
        //        return '<a  href="downloadPic.aspx?picName=' + escape(row.PICTURE) + '&package=signature" target="_blank">' + '下载' + '</a>  '
        //    else
        //        return ''
        //    // return '<a href="downloadPic.aspx?picName=' + escape(row.PICTURE) + '&package='ftpimage'" target="_blank">' + row.PICTURE + '</a>  '      
        //}

        function resetPassword(val, row) {
            return '<a href="yonghu/alter_UserSpace.aspx?ID=' + row.ID + '" target="_blank">重置密码</a>  '
        }
        ///方法说明：查询 
        /// </summary>     
        function FindData() {
            $('#dg').datagrid('load', {
                BKM: $('#BKM').val()
            });
        }
          </script>

</head>
<body>
<table id="dg"> 
        <thead>
            <tr>
                <th data-options="field:'ck',checkbox:true"></th>
				<th field="BKM" width="50" sortable="true">板块名</th>
                <th field="BZ"  width="50" sortable="true">版主</th>
             
			</tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="#" class="easyui-linkbutton" iconcls="icon-add" plain="true" onclick="newItem()">新建板块</a> 
        <a href="#" class="easyui-linkbutton" iconcls="icon-remove" plain="true" onclick="destroyItem()">删除板块</a>
        <span>板块名:</span><input type="text" id="BKM" value="" size="10" /> 
        <a href="#" class="easyui-linkbutton" iconCls='icon-search' onclick="FindData()"">查询</a>
    </div>
</body>
</html>
