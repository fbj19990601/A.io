config.ButtonDir = "blue";
config.InitMode = "EDIT";
config.AutoDetectPasteFromWord = "1";
config.ShowBorder = "0";
config.StateFlag = "1";
config.CssDir = "coolblue";

function showToolbar(){

	document.write ("<table border=0 cellpadding=0 cellspacing=0 width='100%' class='Toolbar' id='eWebEditor_Toolbar'><tr><td><div class=yToolbar><DIV CLASS=TBHandle></DIV><SELECT CLASS=TBGen onchange=\"format('FormatBlock',this[this.selectedIndex].value);this.selectedIndex=0\">"+lang["FormatBlock"]+"</SELECT><SELECT CLASS=TBGen onchange=\"formatFont('fontname',this[this.selectedIndex].value);this.selectedIndex=0\">"+lang["FontName"]+"</SELECT><SELECT CLASS=TBGen onchange=\"formatFont('fontsize',this[this.selectedIndex].value);this.selectedIndex=0\">"+lang["FontSize"]+"</SELECT><SELECT CLASS=TBGen onchange=\"doZoom(this[this.selectedIndex].value)\"><option value='10'>10%</option><option value='25'>25%</option><option value='50'>50%</option><option value='75'>75%</option><option value='100' selected>100%</option><option value='150'>150%</option><option value='200'>200%</option><option value='500'>500%</option></SELECT><DIV CLASS=Btn TITLE='"+lang["Bold"]+"' onclick=\"format('bold')\"><IMG CLASS=Ico SRC='buttonimage/blue/bold.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["Italic"]+"' onclick=\"format('italic')\"><IMG CLASS=Ico SRC='buttonimage/blue/italic.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["UnderLine"]+"' onclick=\"format('underline')\"><IMG CLASS=Ico SRC='buttonimage/blue/underline.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["StrikeThrough"]+"' onclick=\"format('StrikeThrough')\"><IMG CLASS=Ico SRC='buttonimage/blue/strikethrough.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["SuperScript"]+"' onclick=\"format('superscript')\"><IMG CLASS=Ico SRC='buttonimage/blue/superscript.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["SubScript"]+"' onclick=\"format('subscript')\"><IMG CLASS=Ico SRC='buttonimage/blue/subscript.gif'></DIV><DIV CLASS=TBSep></DIV><DIV CLASS=Btn TITLE='"+lang["JustifyLeft"]+"' onclick=\"format('justifyleft')\"><IMG CLASS=Ico SRC='buttonimage/blue/justifyleft.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["JustifyCenter"]+"' onclick=\"format('justifycenter')\"><IMG CLASS=Ico SRC='buttonimage/blue/justifycenter.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["JustifyRight"]+"' onclick=\"format('justifyright')\"><IMG CLASS=Ico SRC='buttonimage/blue/justifyright.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["JustifyFull"]+"' onclick=\"format('JustifyFull')\"><IMG CLASS=Ico SRC='buttonimage/blue/justifyfull.gif'></DIV></div></td></tr><tr><td><div class=yToolbar><DIV CLASS=TBHandle></DIV><DIV CLASS=Btn TITLE='"+lang["Image"]+"' onclick=\"showDialog('img.htm', true)\"><IMG CLASS=Ico SRC='buttonimage/blue/img.gif'></DIV><DIV CLASS=TBSep></DIV><DIV CLASS=Btn TITLE='"+lang["TableMenu"]+"' onclick=\"showToolMenu('table')\"><IMG CLASS=Ico SRC='buttonimage/blue/tablemenu.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["FormMenu"]+"' onclick=\"showToolMenu('form')\"><IMG CLASS=Ico SRC='buttonimage/blue/formmenu.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["ShowBorders"]+"' onclick=\"showBorders()\"><IMG CLASS=Ico SRC='buttonimage/blue/showborders.gif'></DIV><DIV CLASS=TBSep></DIV><DIV CLASS=Btn TITLE='"+lang["Fieldset"]+"' onclick=\"showDialog('fieldset.htm', true)\"><IMG CLASS=Ico SRC='buttonimage/blue/fieldset.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["Iframe"]+"' onclick=\"showDialog('iframe.htm', true)\"><IMG CLASS=Ico SRC='buttonimage/blue/iframe.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["HorizontalRule"]+"' onclick=\"format('InsertHorizontalRule')\"><IMG CLASS=Ico SRC='buttonimage/blue/inserthorizontalrule.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["Marquee"]+"' onclick=\"showDialog('marquee.htm', true)\"><IMG CLASS=Ico SRC='buttonimage/blue/marquee.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["CreateLink"]+"' onclick=\"createLink()\"><IMG CLASS=Ico SRC='buttonimage/blue/createlink.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["Anchor"]+"' onclick=\"showDialog('anchor.htm', true);\"><IMG CLASS=Ico SRC='buttonimage/blue/anchor.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["Map"]+"' onclick=\"mapEdit()\"><IMG CLASS=Ico SRC='buttonimage/blue/map.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["Unlink"]+"' onclick=\"format('UnLink')\"><IMG CLASS=Ico SRC='buttonimage/blue/unlink.gif'></DIV><DIV CLASS=TBSep></DIV><DIV CLASS=Btn TITLE='"+lang["Symbol"]+"' onclick=\"showDialog('symbol.htm', true)\"><IMG CLASS=Ico SRC='buttonimage/blue/symbol.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["Emot"]+"' onclick=\"showDialog('emot.htm', true)\"><IMG CLASS=Ico SRC='buttonimage/blue/emot.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["Excel"]+"' onclick=\"insert('excel')\"><IMG CLASS=Ico SRC='buttonimage/blue/excel.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["NowDate"]+"' onclick=\"insert('nowdate')\"><IMG CLASS=Ico SRC='buttonimage/blue/date.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["NowTime"]+"' onclick=\"insert('nowtime')\"><IMG CLASS=Ico SRC='buttonimage/blue/time.gif'></DIV><DIV CLASS=Btn TITLE='"+lang["Quote"]+"' onclick=\"insert('quote')\"><IMG CLASS=Ico SRC='buttonimage/blue/quote.gif'></DIV><DIV CLASS=TBSep></DIV>");

	if (sFullScreen=="1"){
		document.write ("<DIV CLASS=Btn TITLE='"+lang["Minimize"]+"' onclick=\"parent.Minimize()\"><IMG CLASS=Ico SRC='buttonimage/blue/minimize.gif'></DIV>");
	}else{
		document.write ("<DIV CLASS=Btn TITLE='"+lang["Maximize"]+"' onclick=\"Maximize()\"><IMG CLASS=Ico SRC='buttonimage/blue/maximize.gif'></DIV>");
	}

	document.write ("</div></td></tr></table>");

}
