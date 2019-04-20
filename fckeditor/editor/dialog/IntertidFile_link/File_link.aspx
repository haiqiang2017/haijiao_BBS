<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="File_link.aspx.cs" Inherits="Intertid.Web.MVC.AppControl.fckeditor.editor.dialog.IntertidFile_link.File_link" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Link Properties</title>
    <meta http-equiv="Content-Type" content="text/html" />
    <meta name="robots" content="noindex, nofollow" />

    <script src="../common/fck_dialog_common.js" type="text/javascript"></script>

    <script src="fck_link.js" type="text/javascript"></script>

</head>
<body scroll="no" style="overflow: hidden">
    <div id="divInfo" style="display: none">
        <div id="divLinkTypeUrl">
            <select id="cmbLinkType" onchange="SetLinkType(this.value);" style="display: none">
                <option value="url" fcklang="DlgLnkTypeURL" selected="selected">URL</option>
            </select>
            <select id="cmbLinkProtocol" style="display: none">
                <option value="" fcklang="DlgLnkProtoOther">&lt;other&gt;</option>
            </select>
            <table cellspacing="0" cellpadding="0" width="100%" border="0" dir="ltr">
                <tr>
                    <td nowrap="nowrap" width="100%">
                        <span fcklang="DlgGenTitle">Advisory Title</span><br />
                        <input id="txtAttTitle" style="width: 50%" type="text" />
                    </td>
                </tr>
                <tr>
                    <td nowrap="nowrap" width="100%">
                        <span fcklang="DlgLnkURL">URL</span><br />
                        <input id="txtUrl" style="width: 80%" type="text" onkeyup="OnUrlChange();" onchange="OnUrlChange();" />
                    </td>
                </tr>
            </table>
            <br />
            <div id="divBrowseServer">
                <input type="button" value="Browse Server" fcklang="DlgBtnBrowseServer" onclick="BrowseServer();" />
            </div>
        </div>
    </div>
    <div id="divUpload" style="display: none">
        <form id="frmUpload" method="post" target="UploadWindow" enctype="multipart/form-data"
        action="" onsubmit="return CheckUpload();">
        <span fcklang="DlgLnkUpload">Upload</span><br />
        <input id="txtUploadFile" style="width: 100%" type="file" size="40" name="NewFile" /><br />
        <br />
        <input id="btnUpload" type="submit" value="Send it to the Server" fcklang="DlgLnkBtnUpload" />

        <script type="text/javascript">
            document.write('<iframe name="UploadWindow" style="display: none" src="' + FCKTools.GetVoidUrl() + '"><\/iframe>');
        </script>

        </form>
    </div>
    <div id="divTarget" style="display: none">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td nowrap="nowrap">
                    <span fcklang="DlgLnkTarget">Target</span><br />
                    <select id="cmbTarget" onchange="SetTarget(this.value);">
                        <option value="" fcklang="DlgGenNotSet" selected="selected">&lt;not set&gt;</option>
                        <option value="frame" fcklang="DlgLnkTargetFrame">&lt;frame&gt;</option>
                        <option value="popup" fcklang="DlgLnkTargetPopup">&lt;popup window&gt;</option>
                        <option value="_blank" fcklang="DlgLnkTargetBlank">New Window (_blank)</option>
                        <option value="_top" fcklang="DlgLnkTargetTop">Topmost Window (_top)</option>
                        <option value="_self" fcklang="DlgLnkTargetSelf">Same Window (_self)</option>
                        <option value="_parent" fcklang="DlgLnkTargetParent">Parent Window (_parent)</option>
                    </select>
                </td>
                <td>
                    &nbsp;
                </td>
                <td id="tdTargetFrame" nowrap="nowrap" width="100%">
                    <span fcklang="DlgLnkTargetFrameName">Target Frame Name</span><br />
                    <input id="txtTargetFrame" style="width: 100%" type="text" onkeyup="OnTargetNameChange();"
                        onchange="OnTargetNameChange();" />
                </td>
                <td id="tdPopupName" style="display: none" nowrap="nowrap" width="100%">
                    <span fcklang="DlgLnkPopWinName">Popup Window Name</span><br />
                    <input id="txtPopupName" style="width: 100%" type="text" />
                </td>
            </tr>
        </table>
        <br />
        <table id="tablePopupFeatures" style="display: none" cellspacing="0" cellpadding="0"
            align="center" border="0">
            <tr>
                <td>
                    <span fcklang="DlgLnkPopWinFeat">Popup Window Features</span><br />
                    <table cellspacing="0" cellpadding="0" border="0">
                        <tr>
                            <td valign="top" nowrap="nowrap" width="50%">
                                <input id="chkPopupResizable" name="chkFeature" value="resizable" type="checkbox" /><label
                                    for="chkPopupResizable" fcklang="DlgLnkPopResize">Resizable</label><br />
                                <input id="chkPopupLocationBar" name="chkFeature" value="location" type="checkbox" /><label
                                    for="chkPopupLocationBar" fcklang="DlgLnkPopLocation">Location Bar</label><br />
                                <input id="chkPopupManuBar" name="chkFeature" value="menubar" type="checkbox" /><label
                                    for="chkPopupManuBar" fcklang="DlgLnkPopMenu">Menu Bar</label><br />
                                <input id="chkPopupScrollBars" name="chkFeature" value="scrollbars" type="checkbox" /><label
                                    for="chkPopupScrollBars" fcklang="DlgLnkPopScroll">Scroll Bars</label>
                            </td>
                            <td>
                            </td>
                            <td valign="top" nowrap="nowrap" width="50%">
                                <input id="chkPopupStatusBar" name="chkFeature" value="status" type="checkbox" /><label
                                    for="chkPopupStatusBar" fcklang="DlgLnkPopStatus">Status Bar</label><br />
                                <input id="chkPopupToolbar" name="chkFeature" value="toolbar" type="checkbox" /><label
                                    for="chkPopupToolbar" fcklang="DlgLnkPopToolbar">Toolbar</label><br />
                                <input id="chkPopupFullScreen" name="chkFeature" value="fullscreen" type="checkbox" /><label
                                    for="chkPopupFullScreen" fcklang="DlgLnkPopFullScrn">Full Screen (IE)</label><br />
                                <input id="chkPopupDependent" name="chkFeature" value="dependent" type="checkbox" /><label
                                    for="chkPopupDependent" fcklang="DlgLnkPopDependent">Dependent (Netscape)</label>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" nowrap="nowrap" width="50%">
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td valign="top" nowrap="nowrap" width="50%">
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <table cellspacing="0" cellpadding="0" border="0">
                                    <tr>
                                        <td nowrap="nowrap">
                                            <span fcklang="DlgLnkPopWidth">Width</span>
                                        </td>
                                        <td>
                                            &nbsp;<input id="txtPopupWidth" type="text" maxlength="4" size="4" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td nowrap="nowrap">
                                            <span fcklang="DlgLnkPopHeight">Height</span>
                                        </td>
                                        <td>
                                            &nbsp;<input id="txtPopupHeight" type="text" maxlength="4" size="4" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                &nbsp;&nbsp;
                            </td>
                            <td valign="top">
                                <table cellspacing="0" cellpadding="0" border="0">
                                    <tr>
                                        <td nowrap="nowrap">
                                            <span fcklang="DlgLnkPopLeft">Left Position</span>
                                        </td>
                                        <td>
                                            &nbsp;<input id="txtPopupLeft" type="text" maxlength="4" size="4" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td nowrap="nowrap">
                                            <span fcklang="DlgLnkPopTop">Top Position</span>
                                        </td>
                                        <td>
                                            &nbsp;<input id="txtPopupTop" type="text" maxlength="4" size="4" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div id="divAttribs" style="display: none">
        <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
            <tr>
                <td valign="top" width="50%">
                    <span fcklang="DlgGenId">Id</span><br />
                    <input id="txtAttId" style="width: 100%" type="text" />
                </td>
                <td width="1">
                </td>
                <td valign="top">
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td width="60%">
                                <span fcklang="DlgGenLangDir">Language Direction</span><br />
                                <select id="cmbAttLangDir" style="width: 100%">
                                    <option value="" fcklang="DlgGenNotSet" selected>&lt;not set&gt;</option>
                                    <option value="ltr" fcklang="DlgGenLangDirLtr">Left to Right (LTR)</option>
                                    <option value="rtl" fcklang="DlgGenLangDirRtl">Right to Left (RTL)</option>
                                </select>
                            </td>
                            <td width="1%">
                                &nbsp;&nbsp;&nbsp;
                            </td>
                            <td nowrap="nowrap">
                                <span fcklang="DlgGenAccessKey">Access Key</span><br />
                                <input id="txtAttAccessKey" style="width: 100%" type="text" maxlength="1" size="1" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top" width="50%">
                    <span fcklang="DlgGenName">Name</span><br />
                    <input id="txtAttName" style="width: 100%" type="text" />
                </td>
                <td width="1">
                </td>
                <td valign="top">
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td width="60%">
                                <span fcklang="DlgGenLangCode">Language Code</span><br />
                                <input id="txtAttLangCode" style="width: 100%" type="text" />
                            </td>
                            <td width="1%">
                                &nbsp;&nbsp;&nbsp;
                            </td>
                            <td nowrap="nowrap">
                                <span fcklang="DlgGenTabIndex">Tab Index</span><br />
                                <input id="txtAttTabIndex" style="width: 100%" type="text" maxlength="5" size="5" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top" width="50%">
                    &nbsp;
                </td>
                <td width="1">
                </td>
                <td valign="top">
                </td>
            </tr>
            <tr>
                <td valign="top" width="50%">
                    <span fcklang="DlgGenTitle">Advisory Title</span><br />
                </td>
                <td width="1">
                    &nbsp;&nbsp;&nbsp;
                </td>
                <td valign="top">
                    <span fcklang="DlgGenContType">Advisory Content Type</span><br />
                    <input id="txtAttContentType" style="width: 100%" type="text" />
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <span fcklang="DlgGenClass">Stylesheet Classes</span><br />
                    <input id="txtAttClasses" style="width: 100%" type="text" />
                </td>
                <td>
                </td>
                <td valign="top">
                    <span fcklang="DlgGenLinkCharset">Linked Resource Charset</span><br />
                    <input id="txtAttCharSet" style="width: 100%" type="text" />
                </td>
            </tr>
        </table>
        <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
            <tr>
                <td>
                    <span fcklang="DlgGenStyle">Style</span><br />
                    <input id="txtAttStyle" style="width: 100%" type="text" />
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
