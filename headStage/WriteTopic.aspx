<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WriteTopic.aspx.cs" ValidateRequest="false"
    MasterPageFile="~/headStage/headsite.Master" Inherits="BBS.headStage.WriteTopic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>发帖页面</title>

    <script src="../fckeditor/fckeditor.js" type="text/javascript"></script>

    <script language="javascript" src="../JS/ToolTip.js"></script>

    <link rel="Stylesheet" type="text/css" href="../css/WriteTopic.css" />
    <link href="../css/ToolTip.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadstageContent" runat="server">
    <div id="up">
        <span><a href="BBSIndex.aspx">首页</a></span> &nbsp>><span><a href="ListBBSnew.aspx?plateID=<%=Session["plate"]%>">
            <%=dt4.Rows[0]["PlateName"]%></a></span>
    </div>
    <div id="Wtcontent">
        <div id="Wtheader">
            <div style="color: #006699; font-size: 16px; font-weight: bolder;">
                编写话题</div>
            <div style="margin-top: 10px;">
                <table>
                    <tr>
                        <td style="width: 30px; background-color: White; border: solid 1px #999999;">
                            <img src="../pics/icon1.gif" />
                        </td>
                        <td>
                            <input type="text" id="txtTitle" title="发表的标题字数不超过10个字" runat="server" />
                        </td>
                        <td>
                            <input type="checkbox" />投票帖
                        </td>
                    </tr>
                </table>
            </div>
            <div>

                <script type="text/javascript">
            window.onload = function() {

                var oFCKeditor = new FCKeditor('bbsContent');

                oFCKeditor.BasePath = "../fckeditor/";
                oFCKeditor.Height = 300;
                oFCKeditor.DefaultLanguage = "zh-cn";
               
                //bbs项目所在的虚拟目录 例：“  /IntertidBBS ”。 可以为空 
                oFCKeditor.Config.BBSPath = "";

                oFCKeditor.ReplaceTextarea();
            }



            function SubmitInput() {
                var oEditor = FCKeditorAPI.GetInstance('bbsContent');

              
                if (oEditor.GetHTML() == "") {
                    alert('内容不能为空！');
                }
                else {

                    document.getElementById("<%=hidContent.ClientID %>").value = oEditor.GetHTML();
                    return true;
                }

                return false;
            }
                </script>

                <asp:HiddenField ID="hidContent" runat="server" />
                <textarea rows="6" name="bbsContent" id="bbsContent">
                           
       </textarea><br />
                <span style="font-size: 15px; color: Gray">您可以发表500字的内容</span><br />
                <asp:Button ID="btnOK" runat="server" Text="提交" OnClientClick="SubmitInput()" OnClick="btnOK_Click"
                    Style="width: 60px; height: 30px; background-color: #8DB9DB; border-left: solid 1px gray;
                    border-top: solid 1px gray;" />
            </div>
        </div>
    </div>
</asp:Content>
