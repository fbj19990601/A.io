<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="formBean" class="com.saas.biz.templateFormMgr.TempFormInfo" scope="page" />
<jsp:useBean id="comParam" class="com.saas.biz.commen.ParamethodMgr" scope="page"/>
<html>
<head>
<title><bean:message key="str3419"/></title>
<link href="/style/layout.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function deleteForm(){
 if(window.confirm('确定要删除本模板？')){
   return true;
 }else{
  return false;
 }
}
</script>
</head>
<body>
<%
   HttpSession  logsession = request.getSession(); 
    String cust_id = "";
    String iStart ="0";
    String meun_idx="";
   
    if (request.getParameter("iStart") != null)
    {
        iStart = request.getParameter("iStart");
    }
    if (logsession.getAttribute("SESSION_CUST_ID") != null)
    {
        cust_id = logsession.getAttribute("SESSION_CUST_ID").toString();
    }
    if (request.getParameter("menu_id") != null)
    {
        meun_idx = request.getParameter("menu_id");
    }
    
    HashMap p_types=comParam.getCompareInfoByCode("CRM","form_type");
    ArrayList tableList =formBean.getTemplateFormList(Integer.parseInt(iStart),cust_id);
    int counter=formBean.getTemplateSize(cust_id);
    int pages=counter/20+1;
	int pageUp=0,pageDown=0;
	int currenPage=Integer.valueOf(iStart).intValue();
	if(pages>currenPage)
	{
	   if(currenPage>0)
	   {
		pageUp=currenPage-1;
	   }
		pageDown=currenPage+1;
	}
    else if(pages==currenPage)
	{
	   pageUp=currenPage-1;
	   pageDown=currenPage;
	}
%>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="13" align="left">
	    </td>
	  </tr>
	  <tr>
	    <td>
		     <table width=100% border=0 cellpadding=2 cellspacing=1 align=center  bgcolor="#e7e7e7">
		        <tr>
			        <td class="line1" style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=left width="45%"><bean:message key="str3420"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="20%"><bean:message key="str3421"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="15%"><bean:message key="str3422"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%"><bean:message key="str322"/></td>
					<td style="background-color:#e2e2e2; color:#000000;  font-weight:bold; font-size:13px;" align=center width="10%" ><bean:message key="str323"/></td>
		        </tr>
		       <%
		         if(tableList !=null && tableList.size()>0){
		         for(int i=0;i<tableList.size();i++){
		           HashMap map=(HashMap)tableList.get(i);
		         
		           String form_id="",form_name="",entity_type="",in_date="";
		           if(map.get("form_id")!=null){
		             form_id=map.get("form_id").toString();
		           }
		            if(map.get("form_name")!=null){
		             form_name=map.get("form_name").toString();
		           }
		            if(map.get("entity_type")!=null){
		             entity_type=map.get("entity_type").toString();
		             if(p_types.get(entity_type)!=null){
		              entity_type=p_types.get(entity_type).toString();
		             }
		           }
		           if(map.get("in_date")!=null){
		              in_date=map.get("in_date").toString();
		               if(in_date.length()>10){
		                in_date=in_date.substring(0,10);
		              }
		           }
		       %>
		        <tr style="background-color:#f9f9f9;"id="changcolor_tr<%=i%>" onmouseover="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#ffffff','DIV')" onmouseout="MM_changeProp('changcolor_tr<%=i%>','','backgroundColor','#f9f9f9','DIV')">
	              <td style="color:#000000;" align="left"><a href="viewTemplateInfo.jsp?id=<%=form_id %>&name=<%=form_name%>" target="_blank"><%=form_name%></a></td>
	              <td style="color:#000000;" align="center"><%=entity_type%></td>
	              <td style="color:#000000;" align="center"><%=in_date%></td>
	              <td style="color:#000000;" align="center"><a href="editTemplateInfo.jsp?id=<%=form_id %>&name=<%=form_name%>" TARGET=appwin onclick="mydefss()"><img src=/img/edit.gif width=16 height=16 border=0></a></td>
	              <td style="color:#000000;" align="center"><a href="/doTradeReg.do?trade_type_code=1077&form_id=<%=form_id%>" target="_self" onclick="return deleteForm()"><img src=/img/del.gif width=16 height=16 border=0></a></td>
	            </tr>
	            <%}%>
			   <tr>

																		<td  align="left" colspan="2" style="font-weight:normal; padding:2px 5px;"><bean:message key="str3988"/><%=counter%><bean:message key="str611"/>  &nbsp;<bean:message key="str759"/><%=Integer.parseInt(iStart)+1 %><bean:message key="str1029"/>
&nbsp;&nbsp;<bean:message key="str3988"/><%=pages%><bean:message key="str1029"/>
</td>
											
																		<td  align="right" colspan="3"  style=" padding:2px 5px;">
																		<a href="indexMgr.jsp?iStart=0"><bean:message key="str1030"/>  </a>&nbsp; &nbsp;
																		<% 
																			if(Integer.parseInt(iStart)>0){
																		%>
																			<a href="indexMgr.jsp?iStart=<%=pageUp%>"><bean:message key="str1031"/></a> &nbsp;
																		<%
																			}
																			if(Integer.parseInt(iStart)<pages-1){
																		%>
																			<a href="indexMgr.jsp?iStart=<%=pageDown%>"> <bean:message key="str1032"/></a>&nbsp; 
																		<%
																			}
																		%>
																		<a  href="indexMgr.jsp?iStart=<%=pages-1%>"><bean:message key="str1033"/></a></td>
											
															         </tr>

		       <%}%>
		    </table>
	     </td>
	  </tr>
	  <tr>
	    <td height="13"></td>
	  </tr>
	</table>
</body>
</html>
