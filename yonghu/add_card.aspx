<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_card.aspx.cs" Inherits="add_card" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>发表帖子</title>
     <link href="../themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="../js/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="../js/datagrid-detailview.js" type="text/javascript"></script>
    <script src="../js/export.js" type="text/javascript"></script>
    <style type="text/css">

        .auto-style1 {
            height: 27px;
        }
        .auto-style2 {
            height: 21px;
            width: 91px;
        }
        .auto-style3 {
            width: 91px;
        }
        .auto-style4 {
            height: 80px;
            width: 91px;
        }
        .auto-style5 {
            height: 22px;
            width: 91px;
        }
        .auto-style6 {
            width: 107px;
            height: 66px;
        }
        .auto-style7 {
            width: 81px;
            height: 66px;
        }
        .auto-style9 {
            width: 91px;
            height: 33px;
        }
        .auto-style10 {
            width: 704px;
            height: 178px;
        }
        .auto-style11 {
            height: 129px;
            background-repeat:no-repeat;
            background-image:url('../image/new/4.png')
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
<div style="text-align: center">
            <table border="1" style="width: 734px; margin-left:250px">
                <tr>
                    <td class="auto-style11" >
                     <marquee direction="left" width="883" height="30" id="scrollme" onmousemove="scrollme.stop()" onmouseout="scrollme.start()"> 
                       <% 
                           DB db1 = new DB();
                           string sql_getGonggao = "select nr from (select rownum rn, t.* from B_gonggao t order by fsrq desc) t1 where t1.rn=1";
                           System.Data.DataTable dt1 = db1.GetDataTable(sql_getGonggao);
                           Response.Write(dt1.Rows[0][0].ToString() );
                           %>
                   </marquee>    
                    </td>
                </tr>

                <tr style="font-family: Times New Roman">
                    <td align="center" style="width: 95px">
                        <table class="auto-style10">
                            <tr>
                                <td style="width: 107px; height: 16px">
                                </td>
                                <td colspan="2" style="height: 16px">
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                </td>
                                <td align="center" style="width: 81px; height: 16px">
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 107px; height: 4px">
                                </td>
                                <td align="center" colspan="2" rowspan="5">
                        <table style="width: 500px" align="center" border="1">
            <tr>
                <td align="center" colspan="2" bgcolor="#99ccff">
                    <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="发表新帖子" Font-Bold="True" ForeColor="White"></asp:Label></td>
            </tr>
            <tr style="font-size: 12pt; color: #000000">
                <td align="left" bgcolor="#99ccff" style="width: 36px; height: 21px">
                    <asp:Label ID="YHM" runat="server" Font-Size="Small" Text="用户名：" Width="56px"></asp:Label></td>
                <td class="auto-style2">
                    &nbsp;&nbsp;
                    <asp:Label ID="DQYH" runat="server" Text="Label"></asp:Label></td>
            </tr>

                <tr>
                <td align="center" bgcolor="#99ccff" style="width:36px">
                    <asp:Label ID="Label2" runat="server" Font-Size="Small" Text="板   块"  Width="55px" ></asp:Label></td>
                <td class="auto-style9">
                <input name="bkm" class="easyui-combobox" type="text" style="width:150px;" id="bkm"  runat="server" />
                   </td>
            </tr>

            <tr>
                <td align="center" bgcolor="#99ccff" style="width: 36px">
                    <asp:Label ID="BT" runat="server" Font-Size="Small" Text="标　题：" Width="55px"></asp:Label></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtbt" runat="server" Width="170px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvbt" runat="server" ControlToValidate="txtbt" Display="Dynamic"
                        ErrorMessage="标题不能为空" Font-Size="Small"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="center" bgcolor="#99ccff" style="width: 36px; height: 80px">
                    <asp:Label ID="NR" runat="server" Font-Size="Small" Text="具体内容：" Width="68px"></asp:Label></td>
                <td align="left" class="auto-style4">
                    <asp:TextBox ID="txtnr" runat="server" Height="77px" TextMode="MultiLine" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtnr"
                        Display="Dynamic" ErrorMessage="内容不能为空" Font-Size="Small"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="center" bgcolor="#99ccff" style="width: 36px; height: 22px">
                </td>
                <td align="center" class="auto-style5">
                    &nbsp; &nbsp;
                    <div style="text-align: center">
                        <table>
                            <tr>
                                <td style="width: 296px">
                    <asp:Button ID="send" runat="server" Text="发送" OnClick="send_Click" /></td>
                                <td style="width: 238px">
                    <input id="Reset1" type="reset" value="重置" runat="server" /></td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#99ccff" colspan="2" class="auto-style1">
                    <asp:LinkButton ID="lbtnsy" runat="server" Font-Size="Small" ForeColor="Blue"
                       CausesValidation="False" OnClick="lbtnsy_Click">返回首页</asp:LinkButton></td>
            </tr>
        </table>
                                    &nbsp;</td>
                                <td style="font-size: 12pt; width: 81px; font-family: Times New Roman; height: 4px">
                                    &nbsp;</td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td align="right" style="width: 107px">
                                </td>
                                <td style="width: 81px">
                                </td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td align="center" style="width: 107px">
                                </td>
                                <td align="center" style="width: 81px">
                                    &nbsp;</td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td style="width: 107px; height: 30px">
                                </td>
                                <td style="width: 81px; height: 30px">
                                </td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td class="auto-style6">
                                </td>
                                <td class="auto-style7">
                                </td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td colspan="1" style="width: 107px">
                                </td>
                                <td colspan="3">
                                    &nbsp;</td>
                            </tr>
                            <tr style="font-size: 12pt; font-family: Times New Roman">
                                <td colspan="1" style="width: 107px">
                                </td>
                                <td colspan="3">
                                    ------------------------------------------------------</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="font-size: 12pt; font-family: Times New Roman">
                    <td style="width: 95px">

                        &nbsp;</td>
                </tr>
            </table>
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
    </form>
</body>
</html>
