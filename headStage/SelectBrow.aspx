<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectBrow.aspx.cs" MasterPageFile="~/headStage/headsite.Master"
    Inherits="BBS.headStage.SelectBrow" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="Stylesheet" href="../css/SelectRrow.css" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 120px;
        }
        .style2
        {
            width: 510px;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="HeadstageContent" runat="server">
    <div style="height: 500px;">
        <div id="one">
            <div id="hanzi">
                自定义头像</div>
        </div>
        <div>
            <table style="height: 60px;">
                <tr>
                    <td style="font-size: 14px; text-align: center" class="style1">
                        上传头像
                    </td>
                    <td class="style2">
                        &nbsp;<asp:FileUpload ID="FileUpload1" runat="server" Width="354px" />
                    </td>
                    <td>
                        &nbsp;<asp:Button ID="Button1" runat="server" Text="确认更新!" 
                            onclick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="two">
            <div style="margin-top: 15px; margin-left: 20px; font-size: 14px; font-weight: bolder;">
                系统默认头像</div>
            <div>
                <input type="button" value="提交更新" style="border: solid 2px #699AD4; background-color: #E9F1F5;
                    float: right; margin-top: -20px;" onclick="GetInfo()" />
            </div>
        </div>
        <div id="select-cencer">
            <div style="height: 150px; margin-top: 10px;">
                <div style="display: inline; margin-left: 80px; padding-top: 50px;">
                    <input type="radio" id="r1" onclick="go(this)" name="1" />
                    <img id="t1" src="../photos/psb.jpg" style="height: 130px; width: 130px;" />
                </div>
                <div style="display: inline; padding-left: 50px; margin-top: 50px;">
                    <input type="radio" id="r2" onclick="go(this)" name="1" />
                    <img id="t2" src="../photos/headImg.bmp" style="height: 130px; width: 130px;" />
                </div>

                <script language="javascript">
                function zzz()
                {
                   var t=false;
                   try{
                       t=new ActiveXObject("msxml2.XmlHttp");
                   }
                   catch(e)
                   {
                       try{
                       t=new ActiveXObject("microsoft.XmlHttp");
                       }
                       catch(e1)
                       {
                         t=false;
                       }
                   }
                   if(!t)
                   {
                      t=new XmlHttpRequest();
                   }
                   return t;
                }
                var xhr ; 
               window.onload=function(){
                 xhr=zzz()
               }
                function GetInfo(obj){
                 var filename=y;
                 xhr.open("post","SelectBrow.aspx",true);
                 xhr.onreadystatechange=changing;
                 xhr.setrequestheader("Content-Type","application/x-www-form-urlencoded");
                 xhr.send("filename="+filename);
                 }
                function changing(){
                if(xhr.readystate==4)
                 {
                    if(xhr.status==200)
                    {
                      var result=xhr.responseText;
                      if(result=="yes")
                      {
                      alert("头像更新成功！");
                      }else{
                      alert("头像更新失败！");
                      }
                    }
                 }
                }
                
                var y;
                function go(a)
                {
                var t=a.id;
                var z=t.substring(1,t.length);
                var img=document.getElementById("t"+z);
                var t= img.getAttribute("src");
                var m= t.lastIndexOf("/")
                y= t.substring(m+1,t.length);
                }
                
                </script>

                <div style="display: inline; padding-left: 50px; margin-top: 50px;">
                    <input type="radio" onclick="go(this)" id="r3" name="1" />
                    <img id="t3" src="../photos/ccc.gif" style="height: 130px; width: 130px;" />
                </div>
                <div style="display: inline; padding-left: 50px; margin-top: 50px;">
                    <input type="radio" onclick="go(this)" id="r4" name="1" />
                    <img id="t4" src="../photos/hhhh.gif" style="height: 130px; width: 130px;" />
                </div>
            </div>
            <div id="end">
            </div>
        </div>
        <div style="height: 180px; margin-top: 10px;">
            <div style="display: inline; margin-left: 80px; padding-top: 50px;">
                <input type="radio" onclick="go(this)" id="r5" name="1" />
                <img id="t5" src="../photos/18256_o.gif" style="height: 130px; width: 130px;" />
            </div>
            <div style="display: inline; padding-left: 50px; margin-top: 50px;">
                <input type="radio" onclick="go(this)" id="r6" name="1" />
                <img id="t6" src="../photos/3887177_165322705184_2.gif" style="height: 130px; width: 130px;" />
            </div>
            <div style="display: inline; padding-left: 50px; margin-top: 50px;">
                <input type="radio" onclick="go(this)" id="r7" name="1" />
                <img id="t7" src="../photos/a5961850_s.gif" style="height: 130px; width: 130px;" />
            </div>
            <div style="display: inline; padding-left: 50px; margin-top: 50px;">
                <input type="radio" onclick="go(this)" id="r8" name="1" />
                <img id="t8" src="../photos/baoruan.com_1089500b.gif" style="height: 130px; width: 130px;" />
            </div>
        </div>
    </div>
</asp:Content>
