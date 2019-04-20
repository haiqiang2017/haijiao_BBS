﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="show_mycard.aspx.cs" Inherits="yonghu_show_mycard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
   <link href="css.css" rel="stylesheet" type="text/css">
    <style type="text/css">    
        .auto-style1 {
            width: 866px;
        }
        .auto-style4 {
            width: 76px;
        }
        .auto-style6 {
            width: 108%;
        }
        .auto-style7 {
            width: 850px;
            margin:auto;
        }
        .auto-style8 {
            height: 26px;
            width: 759px;
        }
        .auto-style9 {
            height: 26px;
            width: 220px;
        }
        .auto-style10 {
            width: 51px;
        }
        .auto-style11 {
            text-align:center;

        }
        </style>
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
</head>
<body>
    <form id="form1" runat="server" >

     <div>
        <div style="text-align: center">
            <table border="0" class="auto-style7">
                <tr>
                    <td style="width: 807px" align="center">
                  
                        <div style="text-align: center">
                            <table border="0" style="width: 100%">
                                <tr>
                                    <td style="width: 100px; height: 161px;">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/image/new/4.png" Width="863px" /></td>
                                </tr>
                            </table>
                        </div><label id="huoqugonggao"></label>
                   <marquee direction="left" width="883" height="30" id="scrollme" onmousemove="scrollme.stop()" onmouseout="scrollme.start()"> 
                       <% 
                           DB db1 = new DB();
                           string sql_getGonggao = "select nr from (select rownum rn, t.* from B_gonggao t order by fsrq desc) t1 where t1.rn=1";
                           System.Data.DataTable dt1 = db1.GetDataTable(sql_getGonggao);
                           Response.Write(dt1.Rows[0][0].ToString() );
                           %></marquee>
                    </td>   
                   
                </tr>
                <tr>
                    <td style="width: 807px; height: 44px;">
                        <div style="text-align: center">
                            <table border="0" class="auto-style6">
                              
                                <tr>                              
                                    <td colspan="6" class="auto-style4">
                                        <div style="text-align: center" class="auto-style1">
                                            <table border="0" ; class="auto-style10">
                                                <tr>
                                                    <td>&nbsp;</td>
                                             <td class="auto-style8">
                                       <asp:Label ID="Label1" Text="当前用户:" runat="server" ForeColor="Black" Width="80px" Height="16px"></asp:Label>  
                                                 </td><td class="auto-style11">
                                        <asp:Label ID="user" runat="server" ForeColor="Black" Font-Size="Large" ></asp:Label>&nbsp; </td>                                         
                                                              <td></td>                             
                                                  
                                                    <td class="auto-style9">
                                       <asp:Label ID="number"  runat="server" ForeColor="Black"></asp:Label>  
                                                        </td>
                                                    <td>
                                       <asp:LinkButton ID="ToMessage" runat="server" Font-Size="12pt" ForeColor="Blue"  Width="82px" OnClick="ToMessage_Click" >条新消息</asp:LinkButton>
                                                    </td>                                                                                       
                                                  <td style="width: 80px; height: 26px;">                                             
                                        <asp:LinkButton ID="tuichu" runat="server" Font-Size="12pt" ForeColor="Blue" Width="107px" OnClick="tuichu_Click">退出</asp:LinkButton></td>
                                        <td>&nbsp;&nbsp;&nbsp; &nbsp;</td>     
                                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                                    <td style="width: 80px; height: 26px;">                                  
                                        <asp:LinkButton ID="user_Space" runat="server" Font-Size="12pt" ForeColor="Blue"
                                             Width="107px" OnClick="user_Space_Click">个人空间</asp:LinkButton></td>                                               
                                                    <td style="width: 80px; height: 26px; margin-left:0px;">
                                                <asp:ImageButton ID="addcard" runat="server" ImageUrl="~/image/faxintie an niu.gif" OnClick="addcard_Click" Width="86px" /></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>

                                </tr>                         
                                <tr>
                                    <td colspan="6" class="auto-style4">
    <div id="toolbar"  class="auto-style1">
         <span>板块类型:</span>    
      <input name="bkm" class="easyui-combobox" type="text" style="width:130px;" id="bkm"  runat="server" />
    <%--     <span>板块类型:</span>
       <select class="easyui-combobox"  name="BK" id="bkm"  runat="server"></select>
            <option value="八卦头条">八卦头条</option>
            <option value="国际新闻">国际新闻</option>
            <option value="我的大学">我的大学</option>
            </select>--%>
        <span>标题:</span> <asp:TextBox ID="bt" runat="server" Width="130px" ></asp:TextBox>
       <span>发帖日期:</span><input name="FTRQ1"  id="ftrq1" class="easyui-datebox" runat="server" style="width:130px;" data-options="formatter:myformatter,parser:myparser" />
         <span>--</span><input name="FTRQ2" id="ftrq2" class="easyui-datebox"  style="width:130px;"  runat="server" data-options="formatter:myformatter,parser:myparser" />&nbsp; 
        <asp:Button Text="查询" ID="CX" runat="server" OnClick="CX_Click"/>
<%--            <script type="text/javascript">
                $(function Bind() {
                    var bkm = $('#bkm').combobox({
                        valueField: 'text', //值字段
                        textField: 'text', //显示的字段
                        url: 'guanliyuan/get/getBankuaiName.ashx',
                        editable: true,
                    });
                    alert(url);
                });
 </script>   --%>
        
    </div>
                        <asp:GridView ID="gvlt" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            CellPadding="4" Font-Size="12pt" ForeColor="#333333" GridLines="None" Width="870px" Font-Names="行楷" OnPageIndexChanging="gvlt_PageIndexChanging" >
                            <%--OnRowDeleting="gvlt_RowDeleting"--%>
                            <FooterStyle BackColor="#8080FF" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="编号" Visible="False" />
                                <asp:BoundField DataField="BKM" HeaderText="板块" />
                                <asp:BoundField DataField="BT" HeaderText="标题" />
                                <asp:BoundField DataField="FTR" HeaderText="发帖人　" />
                                <asp:BoundField DataField="FTRQ" HeaderText="发帖日期" />
                                 <asp:BoundField DataField="HTCS" HeaderText="回帖人数" />
                                 <asp:BoundField DataField="FWCS" HeaderText="访问人数" />
                                <asp:HyperLinkField DataNavigateUrlFields="ID,FTR" DataNavigateUrlFormatString="~/yonghu/show_card.aspx?ID={0}&amp;FTR={1}" HeaderText="详细" Text="详细" />
                                <asp:HyperLinkField DataNavigateUrlFields="ID,FTR" DataNavigateUrlFormatString="~/yonghu/delete_card.aspx?ID={0}&amp;FTR={1}" HeaderText="删除帖子" Text="删除" />
                                
                                <asp:CommandField ShowDeleteButton="false" />
                            </Columns>
                            <RowStyle BackColor="LightBlue" />
                            <EditRowStyle BackColor="#2461BF" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle BackColor="LightBlue" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#EFF3FB" Font-Bold="True" ForeColor="DimGray" />
                            <AlternatingRowStyle BackColor="White" Font-Size="Small" />
                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
    </div>            
                   <div style="text-align:center;">
    <asp:LinkButton ID="lbtnsy" runat="server" Font-Size="Small" ForeColor="Blue" Width="158px" CausesValidation="False" OnClick="lbtnsy_Click">返回首页</asp:LinkButton>
</div>
    </div>
              <script type="text/javascript">                
                  $(function () {
                //      alert("我爱学习");
                      var bkm = $('#bkm').combobox({
                          valueField: 'text',
                          textField: 'text',
                          url:'../guanliyuan/get/getBankuaiName.ashx',
                          editable: true
                      });
                  });
    </script> 

    </form >
</body>
</html>
