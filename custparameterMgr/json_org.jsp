<%@ page pageEncoding="GBK"%>
<jsp:useBean id="bean" class="com.saas.biz.organizeMgr.OrganizeInfo" scope="page" />
<%
	HttpSession htSe = request.getSession();
	String cust_id = (String) htSe.getAttribute("SESSION_CUST_ID");
	String json = bean.getJSONCheckBoxTreeData(cust_id, "000000000000000", "Tree-Img");
	out.print(json);
%>
