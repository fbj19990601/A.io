<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="com.saas.biz.conTractMgr.ConTractInfo"%>
<%
	HttpSession logsession = request.getSession();
	String iStart = "0";
	String meun_idx = "";
	String cust_id = "";
	if (request.getParameter("iStart") != null) {
		iStart = request.getParameter("iStart");
	}
	if (logsession.getAttribute("SESSION_CUST_ID") != null) {
		cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
	}
	if (request.getParameter("menu_id") != null) {
		meun_idx = request.getParameter("menu_id");
		logsession.setAttribute("menu_id", meun_idx);
	}

	ConTractInfo conInfo = new ConTractInfo();
	ArrayList autoList = conInfo.getConTractList(Integer.parseInt(iStart), cust_id, "6");
	int counter = conInfo.getConTractList(cust_id, "6");
	int pages = counter / 20 + 1;
	int pageUp = 0, pageDown = 0;
	int currenPage = Integer.valueOf(iStart).intValue();
	if (pages > currenPage) {
		if (currenPage > 0) {
			pageUp = currenPage - 1;
		}
		pageDown = currenPage + 1;
	} else if (pages == currenPage) {
		pageUp = currenPage - 1;
		pageDown = currenPage;
	}
%>
<html>
	<head>
		<title><bean:message key="str116"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script src="/www/fuction/calendar.js" type="text/javascript"></script>
		<script language="JavaScript" src="/www/fuction/public.js"></script>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="../ext/resources/css/ext-all.css" />
		<script type="text/javascript" src="../ext/adapter/ext/ext-base.js"></script>
		<script type="text/javascript" src="../ext/ext-all.js"></script>
		<script type="text/javascript" src="../ext/build/locale/ext-lang-zh_CN.js"></script>
		<script type="text/javascript" src="/js/prototype.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<SCRIPT>WinLIKEerrorpage='/winlike/winman/hlp-error.html';</SCRIPT>
		<SCRIPT SRC="/winlike/winman/wininit.js"></SCRIPT>
		<SCRIPT SRC="/winlike/winman/winman.js"></SCRIPT>
		<SCRIPT>
	            WinLIKE.definewindows=mydefss;
	            function mydefss() {
	            	var j=new WinLIKE.window('', 100, 100, '90%', 'WinLIKE.browsersize().Height -Top-30', 2);
	            	j.Vis=false;
	            	j.Nam='appwin';
	            	WinLIKE.addwindow(j);
	            };
	    </SCRIPT>
		<script type="text/javascript">
		function delet(){
		 if(window.confirm('确定要生效本条记录？')){
		   return true;
		 }else{
		   return false;
		 }
		}
		</script>
	</head>
	<body>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="2"></td>
			</tr>
			<tr>
				<td valign="top">
					<table width=100% border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
						<tr>
							<td class="line1" style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="20%">
								<bean:message key="str1594"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="20%">
								<bean:message key="str4703"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
								<bean:message key="str1595"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="20%">
								<bean:message key="str1596"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="15%">
								<bean:message key="str1597"/>
							</td>
							<td style="background-color: #e2e2e2; color: #000000; font-weight: bold; font-size: 13px;" align=center width="10%">
								<bean:message key="str1610"/>
							</td>
						</tr>
						<%
								if (autoList != null && autoList.size() > 0) {
								for (int i = 0; i < autoList.size(); i++) {
									HashMap map = (HashMap) autoList.get(i);
									String con_id = "", con_no = "", con_name = "", sign_date = "", con_object = "", state_code = "", start_date = "", end_date = "", state_code_date = "", remark = "";
									if (map.get("con_id") != null) {
								con_id = map.get("con_id").toString();
									}
									if (map.get("con_no") != null) {
								con_no = map.get("con_no").toString();
									}
									if (map.get("con_name") != null) {
								con_name = map.get("con_name").toString();
									}
									if (map.get("remark") != null) {
								remark = map.get("remark").toString();
									}
									if (map.get("state_code_date") != null) {
								state_code_date = map.get("state_code_date").toString();
									}
									if (map.get("start_date") != null) {
								start_date = map.get("start_date").toString();
									}
									if (map.get("end_date") != null) {
								end_date = map.get("end_date").toString();
									}
									if (map.get("sign_date") != null) {
								sign_date = map.get("sign_date").toString();
									}
									if (sign_date.length() > 10) {
								sign_date = sign_date.substring(0, 10);
									}
									if (map.get("con_object") != null) {
								con_object = map.get("con_object").toString();
									}
									if (map.get("state_code") != null) {
								state_code = map.get("state_code").toString();
									}
									if (state_code.equals("6") || state_code == "6") {
								state_code = "未执行!";
									}
						%>
						<tr style="background-color: #f9f9f9;">
							<td style="color: #000000;" align="left"><%=con_name%></td>
							<td style="color: #000000;" align="left"><%=con_no%></td>
							<td style="color: #000000;" align="left"><%=sign_date%></td>
							<td style="color: #000000;" align="center"><%=con_object%></td>
							<td style="color: #000000;" align="center"><%=state_code%></td>
							<td style="color: #000000;" align="center">
								<a href="/doTradeReg.do?trade_type_code=1264&con_id=<%=con_id%>&state_code=<%=0%>&start_date=<%=start_date%>&end_date=<%=end_date%>&state_code_date=<%=state_code_date%>&state_resean=<%=remark%>&oper_date=<%=state_code_date%>&remark=<%=remark%>" target="_self" onclick="return delet();"><img src=/img/edit.png width=16 height=16 border=0 style="cursor: hand" alt="生效"> </a>
							</td>
						</tr>
						<%
							}
							}
						%>
						<tr>
							<td align="left" colspan="3">
								<bean:message key="str3988"/><%=counter%><bean:message key="str611"/> &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart) + 1%><bean:message key="str1029"/>&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/>
							</td>
							<td align="right" colspan="3">
								<a href="take_effect.jsp?iStart=0"><bean:message key="str1030"/></a>&nbsp; &nbsp;
								<%
								if (Integer.parseInt(iStart) > 0) {
								%>
								<a href="take_effect.jsp?iStart=<%=pageUp%>"><bean:message key="str1031"/></a> &nbsp;
								<%
									}
									if (Integer.parseInt(iStart) < pages - 1) {
								%>
								<a href="take_effect.jsp?iStart=<%=pageDown%>"> <bean:message key="str1032"/></a>&nbsp;
								<%
								}
								%>
								<a href="take_effect.jsp?iStart=<%=pages - 1%>"><bean:message key="str1033"/></a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
