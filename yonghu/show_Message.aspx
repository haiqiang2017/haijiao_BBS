<%@ Page Language="C#" AutoEventWireup="true" CodeFile="show_Message.aspx.cs" Inherits="yonghu_show_Message" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
           align-content:center;
            width: 1091px;
        }
        to table {table-layout:fixed;
        }
        .auto-style2 {
            margin-left: 4px;
            width: 1091px;
        }
        .auto-style3 {
            margin-left: 0px;
            width: 1091px;
        }
        .auto-style4 {
            width: 1091px;
        }
        .auto-style5 {
            width: 1091px;
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
<form id="form1" runat="server" class="auto-style1" >

     <div>
        <div style="text-align: center">
            <table border="0" class="auto-style7">
                <tr>
                    <td style="width: 807px" align="center">
                  
                        <div style="text-align: center">
                            <table border="0" style="width: 100%">
                                <tr>
                                    <td style="width: 1091px;text-align:left; height: 57px;">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/image/new/2.png" Height="71px"/>
                  <marquee direction="left" height="30" id="scrollme" onmousemove="scrollme.stop()" onmouseout="scrollme.start()" class="auto-style5"> 
                       <% 
                           DB db1 = new DB();
                           string sql_getGonggao = "select nr from (select rownum rn, t.* from B_gonggao t order by fsrq desc) t1 where t1.rn=1";
                           System.Data.DataTable dt1 = db1.GetDataTable(sql_getGonggao);
                           Response.Write(dt1.Rows[0][0].ToString() );
                           %></marquee>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="width: 807px; height: 44px;">
                        <div style="text-align: center">
                            <table border="0" class="auto-style6">
                              
                                <tr>                              
                                    <td colspan="6" class="auto-style4">
                                        <div style="text-align: center" class="auto-style3">
                                            <table border="0" ; class="auto-style10">
                                                <tr>
                                             <td class="auto-style8">
                                       <asp:Label ID="Label1" Text="当前用户:" runat="server" ForeColor="Black" Width="80px" Height="16px"></asp:Label>  
                                                 </td><td class="auto-style11">
                                        <asp:Label ID="user" runat="server" ForeColor="Black"></asp:Label></td>                                         
                                                  
                                                   <td style="width:800px;"></td>
                                                    <td style="width: 80px; height: 26px;">                                  
                                        <asp:LinkButton ID="user_Space" runat="server" Font-Size="12pt" ForeColor="Blue"
                                             Width="107px" OnClick="user_Space_Click">个人空间</asp:LinkButton></td>                                               
                                                    <td style="width: 80px; height: 26px;">
                                                <asp:ImageButton ID="addcard" runat="server" ImageUrl="~/image/faxintie an niu.gif" OnClick="addcard_Click" Width="86px" /></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
</tr>
                          
                                <tr>
                                    <td colspan="6" class="auto-style4">
    <div id="toolbar" class="auto-style2">
        <span>发送人:</span><input type="text" id="fsf" runat="server" value="" size="10" style="width:100px;" />
        <span>接收人:</span><input type="text" id="jsf" runat="server" value="" size="10" style="width:100px;" />
          <span>是否已读:</span>
       <select class="easyui-combobox"  name="DBJ" id="dbj" style="width:80px;" runat="server">
            <option value="已读">已读</option>
            <option value="未读">未读</option>
            </select>
       <span>发送日期:</span><input name="FSRQ1"  id="fsrq1" style="width:100px;"  class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" runat="server"/>
         <span>--</span><input name="FSRQ2"  id="fsrq2" style="width:100px;"  class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" runat="server"/>

        <asp:Button Text="查询" ID="CX" runat="server" OnClick="CX_Click"/>
    </div>
                        <asp:GridView ID="message_grid_view" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            CellPadding="4" Font-Size="12pt" ForeColor="#333333" GridLines="None" Width="1091px" Font-Names="行楷" PageSize="10" OnPageIndexChanging="message_grid_view_PageIndexChanging" >
                            <%--OnRowDeleting="gvlt_RowDeleting"--%>
                            <FooterStyle BackColor="#8080FF" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="编号" Visible="False" />
                                <asp:BoundField DataField="FSF" HeaderText="发送方" />
                                <asp:BoundField DataField="JSF" HeaderText="接收方" />
                                <asp:BoundField DataField="FSRQ" HeaderText="发送日期" />
                                 <asp:BoundField DataField="NR" HeaderText="内容" />
                                 <asp:BoundField DataField="DBJ" HeaderText="是否已读" />
                                <asp:HyperLinkField DataNavigateUrlFields="ID,FSF" DataNavigateUrlFormatString="~/yonghu/replyMessage.aspx?ID={0}&amp;FSF={1}" HeaderText="回复短消息" Text="回复" />
                                 <asp:HyperLinkField DataNavigateUrlFields="ID,FSF" DataNavigateUrlFormatString="~/yonghu/deleteMessage.aspx?ID={0}&amp;FSF={1}" HeaderText="删除短消息" Text="删除" />
                                <asp:CommandField ShowDeleteButton="false" />
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
         <div style="text-align:center;">
    <asp:LinkButton ID="lbtnsy" runat="server" Font-Size="Small" ForeColor="Blue" Width="158px" CausesValidation="False" OnClick="lbtnsy_Click">返回首页</asp:LinkButton>
</div>
    </div>

    </form>
</body>
</html>
