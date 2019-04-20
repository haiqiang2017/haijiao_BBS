<%@ Page Language="C#" AutoEventWireup="true" CodeFile="replyMessage.aspx.cs" Inherits="yonghu_replyMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
<form id="form1" runat="server" style="margin-left:300px">
        <table>        
        <tr>
            <td class="auto-style4">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/image/new/4.png" Width="802px" />
                                   <marquee direction="left" width="802" height="30" id="scrollme" onmousemove="scrollme.stop()" onmouseout="scrollme.start()"> 
                       <% 
                           DB db1 = new DB();
                           string sql_getGonggao = "select nr from (select rownum rn, t.* from B_gonggao t order by fsrq desc) t1 where t1.rn=1";
                           System.Data.DataTable dt1 = db1.GetDataTable(sql_getGonggao);
                           Response.Write(dt1.Rows[0][0].ToString() );
                           %>
                   </marquee>
                                <table border="0" class="auto-style1">
                                    <tr>
                                        <td style="width: 164px">
                                            <asp:Label ID="Label8" runat="server" Font-Size="9pt" Text="欢迎使用海角论坛 ！" Width="170px" ForeColor="#C04000"></asp:Label></td>
                            

                                        <td style="width: 122px">
                                            <asp:LinkButton ID="lbtnsy" runat="server" Font-Size="Small" ForeColor="Blue"
                                                 Width="158px" CausesValidation="False" OnClick="lbtnsy_Click">返回首页</asp:LinkButton></td>
                                        <td style="width: 1871px">
                                            &nbsp;</td>
                                    </tr>
                                </table>

                        </td>
                </tr>
                <tr>
                    <td class="auto-style4">

                        <table border="1" style="width: 797px">


                <tr style="font-family: Times New Roman">
                    <td align="center" class="auto-style2">
                        <table style="width: 704px; height: 178px">
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
                        <table style="width: 500px" align="center" border="0">
            <tr>
                <td align="center" colspan="2" bgcolor="#99ccff">
                    <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="回复短消息" Font-Bold="True" ForeColor="White"></asp:Label></td>
            </tr>
            <tr style="font-size: 12pt; color: #000000">
                <td align="left" bgcolor="#99ccff" style="width: 36px; height: 21px">
                    <asp:Label ID="lblname" runat="server" Font-Size="Small" Text="用户名：" Width="56px"></asp:Label></td>
                <td style="width: 100px; height: 21px">
                    &nbsp;&nbsp;
                    <asp:Label ID="JSF" runat="server" ></asp:Label></td>
            </tr>

            <tr>
                <td align="center" bgcolor="#99ccff" style="width: 36px; height: 80px">
                    <asp:Label ID="lblnr" runat="server" Font-Size="Small" Text="具体内容：" Width="68px"></asp:Label></td>
                <td align="left" style="width: 100px; height: 80px">
                    <asp:TextBox ID="txtnr" runat="server" Height="90px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtnr"
                        Display="Dynamic" ErrorMessage="内容不能为空" Font-Size="Small"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="center" bgcolor="#99ccff" style="width: 36px; height: 22px">
                </td>
                <td >
&nbsp;<asp:Button ID="sendMessage1" runat="server" Text="发送" Width="35px" OnClick="sendMessage1_Click"  />
                    &nbsp;&nbsp;                           
                    <asp:Button ID="Button1" runat="server" Text="重写" CausesValidation="False" OnClick="Button1_Click" />
                       &nbsp;&nbsp;      
                     <asp:Button ID="btn_return" runat="server" Text="返回" CausesValidation="False" OnClick="btn_return_Click" />                   
                </td>
            </tr>
        </table>
                                 
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
                                <td style="width: 107px">
                                </td>
                                <td style="width: 81px">
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
                                    ---------------------------------------------------------------------------</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="font-size: 12pt; font-family: Times New Roman">
                    <td class="auto-style2">               
                    </td>
                </tr>
            </table>
          </table>
    </form>
</body>
</html>
