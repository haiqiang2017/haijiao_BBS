/**
Jquery easyui datagrid js导出excel
修改自extgrid导出excel
* allows for downloading of grid data (store) directly into excel
* Method: extracts data of gridPanel store, uses columnModel to construct XML excel document,
* converts to Base64, then loads everything into a data URL link.
*
* @author Animal <extjs support team>
*
*/
$.extend($.fn.datagrid.methods, {
    getExcelXml: function (jq, param) {
        var worksheet = this.createWorksheet(jq, param);
        //alert($(jq).datagrid('getColumnFields'));
        var totalWidth = 0;
        var cfs = $(jq).datagrid('getColumnFields');
        for (var i = 1; i < cfs.length; i++) {
            totalWidth += $(jq).datagrid('getColumnOption', cfs[i]).width;
        }
        //var totalWidth = this.getColumnModel().getTotalWidth(includeHidden);
        return '<?xml version="1.0" encoding="utf-8"?>' + //xml申明有问题，以修正，注意是utf-8编码，如果是gb2312，需要修改动态页文件的写入编码
            '<ss:Workbook xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns:o="urn:schemas-microsoft-com:office:office">' +
            '<o:DocumentProperties><o:Title>' + param.title + '</o:Title></o:DocumentProperties>' +
            '<ss:ExcelWorkbook>' +
            '<ss:WindowHeight>' + worksheet.height + '</ss:WindowHeight>' +
            '<ss:WindowWidth>' + worksheet.width + '</ss:WindowWidth>' +
            '<ss:ProtectStructure>False</ss:ProtectStructure>' +
            '<ss:ProtectWindows>False</ss:ProtectWindows>' +
            '</ss:ExcelWorkbook>' +
            '<ss:Styles>' +
            '<ss:Style ss:ID="Default">' +
            '<ss:Alignment ss:Vertical="Top"  />' +
            '<ss:Font ss:FontName="arial" ss:Size="10" />' +
            '<ss:Borders>' +
            '<ss:Border  ss:Weight="1" ss:LineStyle="Continuous" ss:Position="Top" />' +
            '<ss:Border  ss:Weight="1" ss:LineStyle="Continuous" ss:Position="Bottom" />' +
            '<ss:Border  ss:Weight="1" ss:LineStyle="Continuous" ss:Position="Left" />' +
            '<ss:Border ss:Weight="1" ss:LineStyle="Continuous" ss:Position="Right" />' +
            '</ss:Borders>' +
            '<ss:Interior />' +
            '<ss:NumberFormat />' +
            '<ss:Protection />' +
            '</ss:Style>' +
            '<ss:Style ss:ID="title">' +
            '<ss:Borders />' +
            '<ss:Font />' +
            '<ss:Alignment  ss:Vertical="Center" ss:Horizontal="Center" />' +
            '<ss:NumberFormat ss:Format="@" />' +
            '</ss:Style>' +
            '<ss:Style ss:ID="headercell">' +
            '<ss:Font ss:Bold="1" ss:Size="10" />' +
            '<ss:Alignment  ss:Horizontal="Center" />' +
            '<ss:Interior ss:Pattern="Solid"  />' +
            '</ss:Style>' +
            '<ss:Style ss:ID="even">' +
            '<ss:Interior ss:Pattern="Solid"  />' +
            '</ss:Style>' +
            '<ss:Style ss:Parent="even" ss:ID="evendate">' +
            '<ss:NumberFormat ss:Format="yyyy-mm-dd" />' +
            '</ss:Style>' +
            '<ss:Style ss:Parent="even" ss:ID="evenint">' +
            '<ss:NumberFormat ss:Format="0" />' +
            '</ss:Style>' +
            '<ss:Style ss:Parent="even" ss:ID="evenfloat">' +
            '<ss:NumberFormat ss:Format="0.00" />' +
            '</ss:Style>' +
            '<ss:Style ss:ID="odd">' +
            '<ss:Interior ss:Pattern="Solid"  />' +
            '</ss:Style>' +
            '<ss:Style ss:Parent="odd" ss:ID="odddate">' +
            '<ss:NumberFormat ss:Format="yyyy-mm-dd" />' +
            '</ss:Style>' +
            '<ss:Style ss:Parent="odd" ss:ID="oddint">' +
            '<ss:NumberFormat ss:Format="0" />' +
            '</ss:Style>' +
            '<ss:Style ss:Parent="odd" ss:ID="oddfloat">' +
            '<ss:NumberFormat ss:Format="0.00" />' +
            '</ss:Style>' +
            '</ss:Styles>' +
            worksheet.xml +
            '</ss:Workbook>';
    },
    createWorksheet: function (jq, param) {
        // Calculate cell data types and extra class names which affect formatting
        var cellType = [];
        var cellTypeClass = [];
        //var cm = this.getColumnModel();
        var totalWidthInPixels = 0;
        var colXml = '';
        var headerXml = '';
        var visibleColumnCountReduction = 0;
        var cfs = $(jq).datagrid('getColumnFields');
        var colCount = cfs.length;
        for (var i = 1; i < colCount; i++) {
            if (cfs[i] != '') {
                var w = $(jq).datagrid('getColumnOption', cfs[i]).width;
                totalWidthInPixels += w;
                if (cfs[i] === "") {
                    cellType.push("None");
                    cellTypeClass.push("");
                    ++visibleColumnCountReduction;
                }
                else {
                    colXml += '<ss:Column ss:AutoFitWidth="1" ss:Width="130" />';
                    headerXml += '<ss:Cell ss:StyleID="headercell">' +
                        '<ss:Data ss:Type="String">' + $(jq).datagrid('getColumnOption', cfs[i]).title + '</ss:Data>' +
                        '<ss:NamedCell ss:Name="Print_Titles" /></ss:Cell>';
                    cellType.push("String");
                    cellTypeClass.push("");
                }
            }
        }
        var visibleColumnCount = cellType.length - visibleColumnCountReduction;
        var result = {
            height: 9000,
            width: Math.floor(totalWidthInPixels * 30) + 50
        };
        var rows = $(jq).datagrid('getRows');
        // Generate worksheet header details.
        var t = '<ss:Worksheet ss:Name="' + param.title + '">' +
            '<ss:Names>' +
            '<ss:NamedRange ss:Name="Print_Titles" ss:RefersTo="=\'' + param.title + '\'!R1:R2" />' +
            '</ss:Names>' +
            '<ss:Table x:FullRows="1" x:FullColumns="1"' +
            ' ss:ExpandedColumnCount="' + (visibleColumnCount + 2) +
            '" ss:ExpandedRowCount="' + (rows.length + 2) + '">' +
            colXml +
            '<ss:Row ss:AutoFitHeight="1">' +
            headerXml +
            '</ss:Row>';
        // Generate the data rows from the data in the Store
        //for (var i = 0, it = this.store.data.items, l = it.length; i < l; i++) {
        for (var i = 0, it = rows, l = it.length; i < l; i++) {
            t += '<ss:Row>';
            var cellClass = (i & 1) ? 'odd' : 'even';
            r = it[i];
            var k = 0;
            for (var j = 1; j < colCount; j++) {
                //if ((cm.getDataIndex(j) != '')
                if (cfs[j] != '') {
                    //var v = r[cm.getDataIndex(j)];
                    var v = r[cfs[j]];
                    if (cellType[k] !== "None") {
                        t += '<ss:Cell ss:StyleID="' + cellClass + cellTypeClass[k] + '"><ss:Data ss:Type="' + cellType[k] + '">';
                        if (cellType[k] == 'DateTime') {
                            t += v.format('Y-m-d');
                        } else {
                            t += v;
                        }
                        t += '</ss:Data></ss:Cell>';
                    }
                    k++;
                }
            }
            t += '</ss:Row>';
        }
        result.xml = t + '</ss:Table>' +
            '<x:WorksheetOptions>' +
            '<x:PageSetup>' +
            '<x:Layout x:CenterHorizontal="1" x:Orientation="Landscape" />' +
            '<x:Footer x:Data="Page &amp;P of &amp;N" x:Margin="0.5" />' +
            '<x:PageMargins x:Top="0.5" x:Right="0.5" x:Left="0.5" x:Bottom="0.8" />' +
            '</x:PageSetup>' +
            '<x:FitToPage />' +
            '<x:Print>' +
            '<x:PrintErrors>Blank</x:PrintErrors>' +
            '<x:FitWidth>1</x:FitWidth>' +
            '<x:FitHeight>32767</x:FitHeight>' +
            '<x:ValidPrinterInfo />' +
            '<x:VerticalResolution>600</x:VerticalResolution>' +
            '</x:Print>' +
            '<x:Selected />' +
            '<x:DoNotDisplayGridlines />' +
            '<x:ProtectObjects>False</x:ProtectObjects>' +
            '<x:ProtectScenarios>False</x:ProtectScenarios>' +
            '</x:WorksheetOptions>' +
            '</ss:Worksheet>';
        return result;
    }
});
function SCLoader(param, success, error) {//刘靖 2016/3/10  定义datagrid的loader方法
    var that = $(this);
    var opts = that.datagrid("options");
    if (!opts.url) {
        return false;
    }
    $.ajax({
        type: opts.method,
        url: opts.url,
        data: param,
        dataType: "json",
        success: function (data) {
            that.data().datagrid['cache'] = data;
            success(bulidData(data));
        },
        error: function () {
            //alert(data);
            alert('用户已过期,请重新登录！');
            window.top.location.href = getRootPath_web() + '/login.aspx';
        }
    });
    function bulidData(data) {
        var temp = $.extend({}, data);
        var tempRows = [];
        var start = 0;
        var end = parseInt(param.rows);
        var rows = data.rows;
        for (var i = start; i < end; i++) {
            if (rows[i]) {
                tempRows.push(rows[i]);
            } else {
                break;
            }
        }
        temp.rows = tempRows;
        return temp;
    }
    function getRootPath_web() {
        //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
        var curWwwPath = window.document.location.href;
        //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
        var pathName = window.document.location.pathname;
        var pos = curWwwPath.indexOf(pathName);
        //获取主机地址，如： http://localhost:8083
        var localhostPaht = curWwwPath.substring(0, pos);
        //获取带"/"的项目名，如：/uimcardprj
        //var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
        return (localhostPaht);
    }

}
function URLencode(data) {
    data = data.replace(/\%/g, "%25").replace(/\#/g, "%23").replace(/\&/g, "%26").replace(/\+/g, "%2B").replace(/\ /g, "%20").replace(/\//g, "%2F").replace(/\?/g, "%3F").replace(/\=/g, "%3D");
    return data;
}

//计划运行-自主设计 对datagride列渲染
function color1(val, row) {
    if (row.SOLUCOMPDATE_P >= row.SOLUCOMPDATE_R) {
        return 'color:green;';
    }
    else
        return 'color:red;';
}
function color2(val, row) {
    if (row.INSTCHECKDATE_P >= row.INSTCHECKDATE_R) {
        return 'color:green;';
    }
    else
        return 'color:red;';
}
function color3(val, row) {
    if (row.FACTCHECKDATE_P != "") {
        if (row.FACTCHECKDATE_P >= row.FACTCHECKDATE_R) {
            return 'color:green;';
        }
        else
            return 'color:red;';
    }
    else
        return 'color:black;'
}
function color4(val, row) {
    row.MAJORDELEGATEDATE_R = formatterdate(val, row);
    if (row.MAJORDELEGATEDATE_R == "" || row.MAJORDELEGATEDATE_R == undefined)
        return ''
    else if (row.MAJORDELEGATEDATE_P >= row.MAJORDELEGATEDATE_R) {
        return '<a style="color:green;">' + row.MAJORDELEGATEDATE_R + '</a><a style="margin-left:20px" onclick=\"addInfm(\'一次委托资料\',\'' + row.PNAME + '\',\'' + row.PNUMBER + '\',\'一次委托资料\',\'show_ComInfMain.aspx\')\"><img width="18px" height="18px" src="../../themes/icons/application_edit.png"/></a>';
    }
    else
        return '<a style="color:red;">' + row.MAJORDELEGATEDATE_R + '</a><a style="margin-left:20px" onclick=\"addInfm(\'一次委托资料\',\'' + row.PNAME + '\',\'' + row.PNUMBER + '\',\'一次委托资料\',\'show_ComInfMain.aspx\')\"><img width="18px" height="18px" src="../../themes/icons/application_edit.png"/></a>';
}
function color5(val, row) {
    if (row.WORKLOADSUBMITDATE_P >= row.WORKLOADSUBMITDATE_R)
        return 'color:green;'
    else
        return 'color:red;'
}
function color6(val, row) {
    if (row.BUDGETCOMPDATE_P >= row.BUDGETCOMPDATE_R) {
        return 'color:green;';
    }
    else
        return 'color:red;';
}
function color7(val, row) {
    if (row.INITIALDESISUBMITDATE_P >= row.INITIALDESISUBMITDATE_R) {
        return 'color:green;';
    }
    else
        return 'color:red;';
}
function color8(val, row) {
    row.MAJORDELEGATEDATE_P = formatterdate(val, row);
    if (row.MAJORDELEGATEDATE_P != "") {
        return '<a href="#" onclick="ShowDialog(\'' + row.PID + '\',\'' + row.PNAME + '\',\'' + row.PNUMBER + '\',\'fircom\')">' + row.MAJORDELEGATEDATE_P + '</a>  '
    }
    else
        return ''
}
function color9(val, row) {
    row.WHITEGRAPHCHECKDATE_R = formatterdate(val, row);
    if (row.WHITEGRAPHCHECKDATE_R == "" || row.WHITEGRAPHCHECKDATE_R == undefined)
        return ''
    else if (row.WHITEGRAPHCHECKDATE_P >= row.WHITEGRAPHCHECKDATE_R) {
        return '<a style="color:green;">' + row.WHITEGRAPHCHECKDATE_R + '</a><a style="margin-left:20px" onclick=\"addInfm(\'白图校审\',\'' + row.PNAME + '\',\'' + row.PNUMBER + '\',\'\',\'show_proofcheck.aspx\')\"><img width="18px" height="18px" src="../../themes/icons/application_edit.png"/></a>';
    }
    else
        return '<a style="color:red;">' + row.WHITEGRAPHCHECKDATE_R + '</a><a style="margin-left:20px" onclick=\"addInfm(\'白图校审\',\'' + row.PNAME + '\',\'' + row.PNUMBER + '\',\'\',\'show_proofcheck.aspx\')\"><img width="18px" height="18px" src="../../themes/icons/application_edit.png"/></a>';
}
function color10(val, row) {
    row.BLUEGRAPHDOCUMENT_R = formatterdate(val, row);
    if (row.BLUEGRAPHDOCUMENT_R == "" || row.BLUEGRAPHDOCUMENT_R == undefined)
        return ''
    else if (row.BLUEGRAPHDOCUMENT_P >= row.BLUEGRAPHDOCUMENT_R) {
        return '<a style="color:green;">' + row.BLUEGRAPHDOCUMENT_R + '</a><a style="margin-left:20px" onclick=\"addInfm(\'蓝图\',\'' + row.PNAME + '\',\'' + row.PNUMBER + '\',\'\',\'show_ConstructionMain.aspx\')\"><img width="18px" height="18px" src="../../themes/icons/application_edit.png"/></a>';
    }
    else
        return '<a style="color:red;">' + row.BLUEGRAPHDOCUMENT_R + '</a><a style="margin-left:20px" onclick=\"addInfm(\'蓝图\',\'' + row.PNAME + '\',\'' + row.PNUMBER + '\',\'\',\'show_ConstructionMain.aspx\')\"><img width="18px" height="18px" src="../../themes/icons/application_edit.png"/></a>';
}
function color11(val, row) {
    row.SOLUAPPROVEDATE = formatterdate(val, row);
    if (row.SOLUAPPROVEFILE != '#' && row.SOLUAPPROVEFILE != '' && row.SOLUAPPROVEFILE != undefined)
        return '<a style="color:black" href="../../datasubmit/downloadPic.aspx?picName=' + row.SOLUAPPROVEFILE + '&package=archives" target="_blank">' + row.SOLUAPPROVEDATE + '</a><a style="margin-left:20px" onclick=\"addInfm(\'方案批复\',\'' + row.PNAME + '\',\'' + row.PNUMBER + '\',\'方案批复\',\'show_PlanReply.aspx\')\"><img width="18px" height="18px" src="../../themes/icons/application_edit.png"/></a>'
    else
        return row.SOLUAPPROVEDATE
}
function color12(val, row) {
    row.PLANARRIVALDATE = formatterdate(val, row);
    if (row.PLANARRIVALFILE != '#' && row.PLANARRIVALFILE != '' && row.PLANARRIVALFILE != undefined)
        return '<a style="color:black" href="../../datasubmit/downloadPic.aspx?picName=' + row.PLANARRIVALFILE + '&package=archives" target="_blank">' + row.PLANARRIVALDATE + '</a>  <a style="margin-left:20px" onclick=\"addInfm(\'计划下达\',\'' + row.PNAME + '\',\'' + row.PNUMBER + '\',\'下达计划\',\'show_PlanReply.aspx\')\"><img width="18px" height="18px" src="../../themes/icons/application_edit.png"/></a>'
    else
        return row.PLANARRIVALDATE
}
function color13(val, row) {
    row.DESIAPPROVALARRIVALDATE = formatterdate(val, row);
    if (row.DESIAPPRFILE != '#' && row.DESIAPPRFILE != '' && row.DESIAPPRFILE != undefined)
        return '<a style="color:black" href="../../datasubmit/downloadPic.aspx?picName=' + row.DESIAPPRFILE + '&package=archives" target="_blank">' + row.DESIAPPROVALARRIVALDATE + '</a>  <a style="margin-left:20px" onclick=\"addInfm(\'设计批复\',\'' + row.PNAME + '\',\'' + row.PNUMBER + '\',\'设计批复\',\'show_PlanReply.aspx\')\"><img width="18px" height="18px" src="../../themes/icons/application_edit.png"/></a>'
    else
        return row.DESIAPPROVALARRIVALDATE
}
function color14(val, row) {
    row.BUDGETADJUSTDATE_R = formatterdate(val, row);
    if (row.BUDGETADJUSTDATE_R == "")
        return ''
    else if (row.BUDGETADJUSTDATE_P >= row.BUDGETADJUSTDATE_R)
        return '<a style="color:green" href="../../datasubmit/downloadPic.aspx?picName=' + row.FINALBUDGETFILE + '&package=archives" target="_blank">' + row.BUDGETADJUSTDATE_R + '</a>  <a style="margin-left:20px" onclick=\"addInfm(\'最终概算\',\'' + row.PNAME + '\',\'' + row.PNUMBER + '\',\'\',\'show_estimate.aspx\')\"><img width="18px" height="18px" src="../../themes/icons/application_edit.png"/></a>'
    else
        return '<a style="color:red" href="../../datasubmit/downloadPic.aspx?picName=' + row.FINALBUDGETFILE + '&package=archives" target="_blank">' + row.BUDGETADJUSTDATE_R + '</a>  <a style="margin-left:20px" onclick=\"addInfm(\'最终概算\',\'' + row.PNAME + '\',\'' + row.PNUMBER + '\',\'\',\'show_estimate.aspx\')\"><img width="18px" height="18px" src="../../themes/icons/application_edit.png"/></a>'
}
function color15(val, row) {
    row.WORKLOADSUBMITDATE_P = formatterdate(val, row);
    if (row.WORKLOADSUBMITDATE_P != "" ) {
        return '<a href="#" onclick="ShowDialog(\'' + row.PID + '\',\'' + row.PNAME + '\',\'' + row.PNUMBER + '\',\'wl\')">' + row.WORKLOADSUBMITDATE_P + '</a>  '
    }
    else
        return ' '
}
function color16(val, row) {
    row.SECONDCOMMISSIONDATE = formatterdate(val, row);
    if (row.SECONDCOMMISSIONDATE != "") {
        return '<a href="#" onclick="ShowDialog(\'' + row.PID + '\',\'' + row.PNAME + '\',\'' + row.PNUMBER + '\',\'seccom\')">' + row.SECONDCOMMISSIONDATE + '</a>  <a style="margin-left:20px" onclick=\"addInfm(\'二次委托资料\',\'' + row.PNAME + '\',\'' + row.PNUMBER + '\',\'二次委托资料\',\'show_ComInfMain.aspx\')\"><img width="18px" height="18px" src="../../themes/icons/application_edit.png"/></a>';
    }
    else if (row.WHITEGRAPHCHECKDATE_R != "" && row.SECONDCOMMISSIONDATE == "") {
        return '<a href="#" onclick="ShowDialog(\'' + row.PID + '\',\'' + row.PNAME + '\',\'' + row.PNUMBER + '\',\'seccom\')">正在进行二次委托</a>  '
    }
    else
        return ' '
}
function color17(val, row) {
    row.BLUEGRAPHDOCUMENT_P = formatterdate(val, row);
    if (row.BLUEGRAPHDOCUMENT_P != "") {
        return '<a href="#" onclick="ShowDialog(\'' + row.PID + '\',\'' + row.PNAME + '\',\'' + row.PNUMBER + '\',\'blue\')">' + row.BLUEGRAPHDOCUMENT_P + '</a>  '
    }
    else
        return ' '
}
function color18(val, row) {
    row.BLUEGRAPHARRIVALDATE = formatterdate(val, row);
    if (row.BLUEGRAPHARRIVALDATE != "") {
        return '<a href="#" onclick="ShowDialog(\'' + row.PID + '\',\'' + row.PNAME + '\',\'' + row.PNUMBER + '\',\'arrivalBlue\')">' + row.BLUEGRAPHARRIVALDATE + '</a>  '
    }
    else if (row.BLUEGRAPHDOCUMENT_R != "" && row.BLUEGRAPHARRIVALDATE == "") {
        return '<a href="#" onclick="ShowDialog(\'' + row.PID + '\',\'' + row.PNAME + '\',\'' + row.PNUMBER + '\',\'arrivalBlue\')">正在下发蓝图</a>  '
    }
    else
        return ' '
}
function finalFileFormatter(val, row) {
    if (row.FINALSOLUTIONFILE != "" && row.FINALSOLUTIONFILE != "#" && row.FINALSOLUTIONFILE != undefined)
        return '<a href="../../datasubmit/downloadPic.aspx?picName=' + row.FINALSOLUTIONFILE + '&package=archives" target="_blank">下载</a>  <a style="margin-left:20px" onclick=\"addInfm(\'方案文档\',\'' + row.PNAME + '\',\'' + row.PNUMBER + '\',\'\',\'show_plan.aspx\')\"><img width="18px" height="18px" src="../../themes/icons/application_edit.png"/></a>'
    else
        return ''
}
function desiConditionTable(val, row) {
    if (row.DESICONDITIONTABLE != "" && row.DESICONDITIONTABLE != "#" && row.DESICONDITIONTABLE != undefined)
        return '<a href="../../datasubmit/downloadPic.aspx?picName=' + row.DESICONDITIONTABLE + '&package=archives" target="_blank">下载</a>  <a style="margin-left:20px" onclick=\"addInfm(\'设计条件表\',\'' + row.PNAME + '\',\'' + row.PNUMBER + '\',\'\',\'show_desiConditionTable.aspx\')\"><img width="18px" height="18px" src="../../themes/icons/application_edit.png"/></a>'
    else
        return ''
}
//datagrid日期格式化
//function formatterdate(val, row) {
//    if (val != null && val != "" && val != undefined) {
//        var date = new Date(val);
//        var y = date.getFullYear();
//        var m = date.getMonth() + 1;
//        var d = date.getDate();
//        return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
//    }
//    else
//        return '';
//}
//四场不需要转化，从数据库取出来就是yyyy-mm-dd形式
function formatterdate(val, row) {
    return val;
}