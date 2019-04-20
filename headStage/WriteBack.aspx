<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WriteBack.aspx.cs" ValidateRequest="false"
    MasterPageFile="~/headStage/headsite.Master" Inherits="BBS.headStage.WriteBack" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="Stylesheet" href="../css/WriteBack.css" />

    <script src="../fckeditor/fckeditor.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ContentPlaceHolderID="HeadstageContent" runat="server">
    <div id="Wbup">
        <span><a href="BBSIndex.aspx">首页</a> </span>&nbsp &nbsp>> &nbsp <span><a href="ListBBSnew.aspx?plateID=<%=Session["plate"]%>">
            <%=dt4.Rows[0]["PlateName"]%></a></span>
    </div>
    <div id="Wbcontent">
        <div id="Wbheader">
            <div style="color: #006699; font-size: 16px; font-weight: bolder;">
                回复话题</div>
            <div style="margin-top: 10px;">
                <table>
                    <tr>
                        <td style="width: 30px; background-color: White; border: solid 1px #999999;">
                            <img src="../pics/icon1.gif" />
                        </td>
                        <td>
                            <input type="text" value="<%=dt.Rows[0]["TopicTitle"] %>" />
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
                <span style="font-size: 15px; color: #C0C0C0">您可以回复500字的内容</span><br />
                <asp:Button ID="btnUpLoad" runat="server" OnClientClick="SubmitInput()" Text="提 交"
                    OnClick="btnUpLoad_Click" Style="width: 60px; height: 30px; background-color: #8DB9DB;
                    border-left: solid 1px gray; border-top: solid 1px gray;" />
            </div>
        </div>
    </div>
</asp:Content>
