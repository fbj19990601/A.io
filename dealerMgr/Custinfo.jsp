<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page contentType="text/html;charset=GBK"%>
<%
	//    
	String menu_id = "", obj_cust_idx = "", user_idx = "";
	if (request.getParameter("menu_id") != null) {
		menu_id = request.getParameter("menu_id");
	}
	if (request.getParameter("obj_cust_id") != null) {
		obj_cust_idx = request.getParameter("obj_cust_id");
	}
	if (request.getParameter("user_id") != null) {
		user_idx = request.getParameter("user_id");
	}
%>
<html>
	<head>
		<title><bean:message key="str1577"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<!-- 中间 -->
				<td align="center">
					<div id="manager_body">
						<!--左边菜单-->
						<div id="manager_body_right">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<jsp:include page="viewCustinfo.jsp">
											<jsp:param name="obj_cust_id" value="<%=obj_cust_idx%>" />
											<jsp:param name="user_id" value="<%=user_idx%>" />
										</jsp:include>
									</td>
								</tr>
							</table>
						</div>
						<!--右边 主体部分结束  -->
					</div>
				</td>
				<!-- 中间 结束 -->
			</tr>
		</table>
	</body>
</html>