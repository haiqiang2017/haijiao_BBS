<%@ Page Language="C#" AutoEventWireup="true" CodeFile="show_card.aspx.cs" Inherits="yonghu_show_card" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 50%;
        }
        .auto-style2 {
            width: 100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
            <table style="width: 800px; margin-left:250px;">
                <tr>
                    <td style="width: 797px">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/image/new/4.png" Width="802px" /></td>
                </tr>
                <tr>
                    <td style="width: 797px">
                                <table border="0" class="auto-style1">
                                    <tr>
                                        <td class="auto-style8">
                                       <asp:Label ID="Label10" Text="当前用户:" runat="server" ForeColor="Black" Width="80px" Height="16px"></asp:Label>  
                                                 </td><td style="width:100px;">
                                        <asp:Label ID="user" runat="server" ForeColor="Black"></asp:Label></td>                                         
                                                  
                                                    <td class="auto-style2">
                                       <asp:Label ID="number"  runat="server" ForeColor="Black"></asp:Label>  
                                                        </td>
                                                    <td>
                                       <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="12pt" ForeColor="Blue"  Width="110px" CausesValidation="false" OnClick="userLogin_Click">条新消息</asp:LinkButton>
                                                    </td>                                    
                                                  <td style="width: 177px; height: 26px;">
                                        <asp:LinkButton ID="userLogin" runat="server" Font-Size="12pt" ForeColor="Blue"  Width="110px" CausesValidation="false" OnClick="userLogin_Click">用户登录</asp:LinkButton></td>                                      
                                                   <td style="width: 80px; height: 26px;">                                                 
                                        <asp:LinkButton ID="ZhuCe" runat="server" Font-Size="12pt" ForeColor="Blue" Width="104px" CausesValidation="false" OnClick="ZhuCe_Click" >用户注册</asp:LinkButton></td>
                                                 
                                                    <td style="width: 80px; height: 26px;">                                  
                                        <asp:LinkButton ID="user_Space" runat="server" Font-Size="12pt" ForeColor="Blue" CausesValidation="False"  Width="107px" OnClick="user_Space_Click">个人空间</asp:LinkButton></td>    
                                        <td style="width: 1871px">
                                            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image/faxintie an niu.gif" CausesValidation="False" OnClick="ImageButton2_Click" /></td>
                                    </tr>
                                </table>
                                           <marquee direction="left" width="810" height="30" id="scrollme" onmousemove="scrollme.stop()" onmouseout="scrollme.start()"> 
                       <% 
                           DB db1 = new DB();
                           string sql_getGonggao = "select nr from (select rownum rn, t.* from B_gonggao t order by fsrq desc) t1 where t1.rn=1";
                           System.Data.DataTable dt1 = db1.GetDataTable(sql_getGonggao);
                           Response.Write(dt1.Rows[0][0].ToString() );
                           %>
                   </marquee></td>
                </tr>
                <tr>
                    <td style="width: 797px">
                        <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" Width="810px">
                            <ItemTemplate>
                                <table border="1" bordercolor="#99ccff" style="width: 800px" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td bgcolor="#99ccff" style="width: 1356px; height: 1px;" valign="bottom">
                                            <div style="text-align: center">
                                                <table border="0" style="width: 100%">
                                                    <tr>
                                                        <td style="width: 76px">
                                                            <asp:Label ID="FT" runat="server" Font-Bold="True" Font-Size="9pt" ForeColor="White"
                                                                Text="发帖人：" Width="104px"></asp:Label></td>
                                                        <td style="width: 100px">
                                                            <asp:Label ID="FTR" runat="server" Font-Bold="True" Font-Size="9pt" ForeColor="White"
                                                                Text='<%# DataBinder.Eval(Container.DataItem,"FTR") %>' Width="76px"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                        <td bgcolor="#99ccff" style="width: 271px; height: 1px; padding-right: 0px; padding-left: 0px;
                                            padding-bottom: 0px; margin: 0px; padding-top: 0px;" valign="bottom">
                                            <div style="text-align: center">
                                                <table border="0" style="width: 340px" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="width: 29px; height: 16px;">
                                                            <asp:Label ID="lbltzbh" runat="server" Font-Bold="True" Font-Size="9pt" ForeColor="White" Text="帖子编号：" Width="68px"></asp:Label></td>
                                                        <td style="width: 263px; height: 16px;" align="left">
                                                            <asp:Label ID="ID" runat="server" Font-Bold="True" Font-Size="9pt" ForeColor="White" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' Width="60px"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 29px; height: 16px">
                                                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="9pt" ForeColor="White" Text="帖子标题：" Width="65px"></asp:Label></td>
                                                        <td align="left" style="width: 263px; height: 16px">
                                                            <asp:Label ID="BT" runat="server" Font-Bold="True" Font-Size="9pt" ForeColor="White" Text='<%# DataBinder.Eval(Container.DataItem,"BT") %>'></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                        <td bgcolor="#99ccff" style="width: 111px; height: 1px;" valign="top">
                                            <table>
                                                <tr>
                                                    <td style="height: 9px" width="100">
                                                        <asp:LinkButton ID="card_reply" runat="server" CommandName="hf" Font-Bold="True" Font-Size="11pt" Width="120px" ForeColor="White" CausesValidation="False">我要回复</asp:LinkButton></td>
                                                    <td style="width: 1760px; height: 9px">
                                                        <asp:LinkButton ID="LinkButton7" runat="server" Font-Bold="True" ForeColor="White" CausesValidation="False" CommandName="sctz" Font-Size="11pt" Width="100px" Visible="False"></asp:LinkButton></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 1356px; height: 16px">
                                            <input type="hidden" id="tihuan" />
                                            <asp:Image ID="TX" runat="server" Height="82px" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"TX") %>' Width="90px" /><br />
                                            &nbsp;
                                            <asp:Label ID="Label2" runat="server" Font-Size="Small" ForeColor="LightSkyBlue" Text="电子邮箱：" Width="104px"></asp:Label>
                                            <asp:Label ID="YX" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="#FFC080" Text='<%# DataBinder.Eval(Container.DataItem,"YX") %>'></asp:Label></td>
                                        <td style="width: 271px; height: 16px">
                                            &nbsp;<div style="text-align: center">
                                                <table>
                                                    <tr>
                                                        <td align="left" style="width: 100px"> 
                                                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="9pt" ForeColor="LightSkyBlue" Text="帖子内容："></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 100px">
                                                            <asp:TextBox ID="NR" runat="server" Height="68px" Text='<%# DataBinder.Eval(Container.DataItem,"NR") %>' ReadOnly="true" TextMode="MultiLine" Width="341px"></asp:TextBox></td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                        <td style="width: 111px; height: 16px">
                                            <div style="text-align: center">
                                                <table>
                                                    <tr>
                                                        <td style="width: 125px">
                                                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="9pt" ForeColor="LightSkyBlue"
                                                                Text="帖子创建日期及时间：" Width="174px"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 125px">
                                                            <asp:Label ID="FTRQ" runat="server" Font-Size="Small" ForeColor="#FFC080" Text='<%# DataBinder.Eval(Container.DataItem,"FTRQ") %>'></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 125px">
                                                            <table style="width: 98%">
                                                                <tr>
                                                                    <td style="width: 100px">
                                                                        <asp:Label ID="Label7" runat="server" Font-Size="9pt" Text="您是此帖的第" Width="88px"></asp:Label></td>
                                                                    <td style="width: 100px">
                                                                        <asp:Label ID="FWCS" runat="server" ForeColor="Red" Text='<%# DataBinder.Eval(Container.DataItem,"FWCS") %>'
                                                                            Font-Size="9pt"></asp:Label></td>
                                                                    <td style="width: 328px">
                                                                        <asp:Label ID="Label9" runat="server" Font-Size="9pt" Height="14px" Text="位浏览者" Width="78px"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:DataList ID="DataList2" runat="server" 
                            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3"
                            CellSpacing="1" OnItemCommand="DataList1_ItemCommand" Width="810px">
                            <ItemTemplate>
                                <table border="1" bordercolor="#99ccff" style="width: 800px; background-color: #ffffff;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td bgcolor="#99ccff" style="width: 221px; height: 1px;" valign="bottom" align="left">
                                       
                                                <table border="0" style="width: 100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="width: 100px">
                                                            <asp:Label ID="HFXM" runat="server" Font-Bold="True" Font-Size="9pt" ForeColor="White" Text="回复姓名：" Width="112px"></asp:Label></td>
                                                        <td style="width: 100px"> <asp:Label ID="HFNAME" runat="server" Font-Bold="True" Font-Size="9pt" ForeColor="White" Text='<%# DataBinder.Eval(Container.DataItem,"HFNAME") %>' Width="76px"></asp:Label></td>
                                                    </tr>
                                                </table>
       
                                          </td>
                                        <td bgcolor="#99ccff" style="width: 370px; height: 1px;" valign="bottom" align="left">
                                                <table border="0" style="width: 96%" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="width: 100px; height: 16px;">
                                                            <asp:Label ID="lblhfId" runat="server" ForeColor="White" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>'
                                                                Font-Size="9pt" Font-Bold="True" Visible="False"></asp:Label></td>
                                                        <td style="width: 68px; height: 16px;">
                                                            <asp:Label ID="lblhftitle" runat="server" Font-Bold="True" Font-Size="9pt" ForeColor="White"
                                                                Text="帖子标题："></asp:Label></td>
                                                        <td style="width: 74px; height: 16px;">
                                                            <asp:Label ID="BT" runat="server" Font-Bold="True" Font-Size="9pt" ForeColor="White"
                                                                Text='<%# DataBinder.Eval(Container.DataItem,"BT") %>'></asp:Label></td>
                                                    </tr>
                                                </table>
                                        </td>
                                        <td style="width: 100px; height: 1px;" bgcolor="#99ccff" align="left">
                                                        <asp:LinkButton ID="lnkbtnhfdelete" runat="server" CommandName="hfsc" Font-Bold="True"
                                                            Font-Size="9pt" Width="120px" ForeColor="White" CausesValidation="False">删除此帖</asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 221px; height: 25px" align="center">
                                            <asp:Image ID="TX" runat="server" Height="82px" Width="90px" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"TX") %>' /><br />
                                            &nbsp; &nbsp;
                                            <table>
                                                <tr>
                                                    <td style="width: 100px">
                                                        <asp:Label ID="lblhfEmail" runat="server" Font-Size="Small" ForeColor="LightSkyBlue"
                                                            Text="电子邮箱：" Width="116px"></asp:Label></td>
                                                    <td style="width: 100px">
                                                        <asp:Label ID="YX" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="#FFC080"
                                                            Text='<%# DataBinder.Eval(Container.DataItem,"YX") %>'></asp:Label></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="width: 370px; height: 25px">
                                            &nbsp;<div style="text-align: center">
                                                <table>
                                                    <tr>
                                                        <td align="left" style="width: 100px">
                                                            <asp:Label ID="lblhfnr" runat="server" Font-Bold="True" Font-Size="9pt" ForeColor="LightSkyBlue"
                                                                Text="回复内容："></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 100px">
                                                            <asp:TextBox ID="HFNR" runat="server" Height="68px" Text='<%# DataBinder.Eval(Container.DataItem,"HFNR") %>'
                                                                TextMode="MultiLine" Width="341px"></asp:TextBox></td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                        <td style="width: 100px; height: 25px" bordercolor="#ffffff">
                                            <div style="text-align: center">
                                                <table>
                                                    <tr>
                                                        <td style="width: 125px">
                                                            <asp:Label ID="lblhftime" runat="server" Font-Bold="True" Font-Size="9pt" ForeColor="LightSkyBlue"
                                                                Text="回复时间：" Width="174px"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 125px">
                                                            <asp:Label ID="HFRQ" runat="server" Font-Size="9pt" ForeColor="#FFC080" Text='<%# DataBinder.Eval(Container.DataItem,"HFRQ") %>'></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 125px">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                            <SelectedItemStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                            <ItemStyle BackColor="White" ForeColor="Black" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                        </asp:DataList></td>
                </tr>
                <tr>
                    <td style="width: 797px">
                        <div style="text-align: center">
                            <table border="0" style="width: 100%">
                                <tr>
                                    <td style="width: 100px">
                                        <asp:Label ID="Label7" runat="server" Text="当前页码为：" Font-Size="9pt" Font-Bold="True"
                                            ForeColor="SteelBlue" Height="16px" Width="148px"></asp:Label></td>
                                    <td style="width: 100px">
                                        [<asp:Label ID="lblPage" runat="server" Font-Size="Small" Text="1"></asp:Label>]</td>
                                    <td style="width: 100px">
                                        <asp:Label ID="Label6" runat="server" Font-Size="9pt" Text="总页码为：" Font-Bold="True"
                                            ForeColor="SteelBlue" Width="105px"></asp:Label></td>
                                    <td style="width: 100px">
                                        <asp:Label ID="pagesize" runat="server" Font-Size="9pt" Text="Label"></asp:Label></td>
                                    <td style="width: 100px">
                                        <asp:LinkButton ID="lnkbtnOne" runat="server" Font-Size="9pt" ForeColor="Red" OnClick="lnkbtnOne_Click"
                                            Width="112px" CausesValidation="False">第一页</asp:LinkButton></td>
                                    <td style="width: 100px">
                                        <asp:LinkButton ID="lnkbtnUp" runat="server" Font-Size="9pt" ForeColor="Red" OnClick="lnkbtnUp_Click"
                                            Width="66px" CausesValidation="False">上一页</asp:LinkButton></td>
                                    <td style="width: 100px">
                                        <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Size="9pt" ForeColor="Red" OnClick="lnkbtnNext_Click"
                                            Width="66px" CausesValidation="False">下一页</asp:LinkButton></td>
                                    <td style="width: 100px">
                                        <asp:LinkButton ID="lnkbtnLast" runat="server" Font-Size="9pt" ForeColor="Red" OnClick="lnkbtnLast_Click"
                                            Width="99px" CausesValidation="False">最后一页</asp:LinkButton></td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="width: 797px">
                        <table id="tabht" align="right" bgcolor="#99cccc" border="1" style="border-left-color: #b2d1fc; border-bottom-color: #b2d1fc; border-top-style: solid;
                            border-top-color: #b2d1fc; border-right-style: solid; border-left-style: solid;
                            border-right-color: #b2d1fc; border-bottom-style: solid; background-color: #99ccff;"
                            bordercolordark="#008000" cellpadding="0" cellspacing="0" width="810">
                            <tr>
                                <td align="left" bgcolor="#ffffff" colspan="2" style="height: 20px" bordercolordark="#ffffff">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/image/jiantou.gif" />
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black"
                                        Text="欢迎回帖"></asp:Label></td>
                            </tr>
                            <tr style="font-size: 12pt; color: #000000">
                                <td align="center" style="width: 62px; height: 21px;">
                                    <asp:Label ID="Label5" runat="server" Font-Size="9pt" Text="回帖编号：" Width="92px"></asp:Label></td>
                                <td align="left" style="width: 827px; height: 21px;">
                                    <asp:TextBox ID="ID" runat="server" Width="593px" Enabled="False" ToolTip="不能修改回帖编号"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ID"
                                        Display="Dynamic" ErrorMessage="回帖编号不能为空" Font-Size="Small"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr style="font-size: 12pt; color: #000000">
                                <td align="center" style="width: 62px; height: 21px">
                                    <asp:Label ID="lblhtname" runat="server" Font-Size="9pt" Text="回帖姓名：" Width="90px"></asp:Label></td>
                                <td style="width: 827px; height: 21px" align="left">
                                    &nbsp;&nbsp;
                                    <asp:Label ID="HFNAME" runat="server" Text="Label" ForeColor="Black"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 62px; height: 42px;">
                                    <asp:Label ID="lblhttitle" runat="server" Font-Size="9pt" Text="回复标题：" Width="95px"></asp:Label></td>
                                <td style="width: 827px; height: 42px;" align="left">
                                    <asp:TextBox ID="BT" runat="server" Width="586px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="BT"
                                        Display="Dynamic" ErrorMessage="回复标题不能为空" Font-Size="Small"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 62px; height: 76px;">
                                    <asp:Label ID="lblnr" runat="server" Font-Size="9pt" Text="回复内容：" Width="98px"></asp:Label></td>
                                <td align="left" style="width: 827px; height: 76px">
                                    <asp:TextBox ID="HFNR" runat="server" Height="77px" TextMode="MultiLine" Width="594px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="HFNR"
                                        Display="Dynamic" ErrorMessage="回复内容不能为空" Font-Size="Small"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="height: 23px">
                                    <asp:Button ID="btnOk" runat="server" Text="提交" OnClick="btnOk_Click" />
                                    <asp:Button ID="btnCancel" runat="server" Text="全部重写" OnClick="btnCancel_Click" CausesValidation="False" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>                                     <td style="width: 122px">               
                    <asp:LinkButton ID="lbtnsy" runat="server" Font-Size="Small" ForeColor="Blue"
                                                Width="158px" CausesValidation="False" OnClick="lbtnsy_Click1">返回首页</asp:LinkButton></td>
                </tr>
                <tr>
                    <td style="width: 797px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 797px">
                    </td>
                </tr>
            </table>
        </div>
        <script type="text/javascript">
            onload = function () {
            //    GGXH: $('#GGXH').val(),
           //   var tihuan = $('#tihuan').combobox({
           //       valueField: 'text',
           //       textField: 'text',
           //    url: 'guanliyuan/get/getBankuaiName.ashx',
           //       editable: true
           //});
              //  var innerHTMLText = "要替换的文字";
                document.body.innerHTML = document.body.innerHTML.replace(/法轮功/g, "****");
                document.body.innerHTML = document.body.innerHTML.replace(/干嘛/g, "****");
            }
            //$(function () {
            //    //      alert("我爱学习");
            //    var bkm = $('#bkm').combobox({
            //        valueField: 'text',
            //        textField: 'text',
            //        url: 'guanliyuan/get/getBankuaiName.ashx',
            //        editable: true
            //    });
            //});
            //window.onload = function () {
            //    var innerHTMLText = "要替换的文字";
            //    document.body.innerHTML = document.body.innerHTML.replace(/被替换的文字/, innerHTMLText);
            //}
        </script>
    </form>
</body>
</html>
