<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*" %> 
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
<head>
<title><bean:message key="system.tittle"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="style/css.css" rel="stylesheet" type="text/css">
</head>
<%
	HashMap indexmenumap=new HashMap();
	indexmenumap.put("sjlmbs","");
	indexmenumap.put("lmjb","0");
	indexmenumap.put("trade_type_code","0119");
	request.setAttribute("indexmenumap",indexmenumap);  
%>

<body> 
    <%HashMap addmenumap=new HashMap();%>
    <logic:iterate id="query1" name="query" scope="request">	
        <bean:define id="key" name="query1" property="key"  type="java.lang.String"/>       
        <bean:define id="values" name="query1" property="value"  type="java.lang.String[]"/> 
        <%
        	addmenumap.put(key,values[0]);
        	addmenumap.put("trade_type_code","0118");
        %>
    </logic:iterate>
    <%request.setAttribute("addmenumap",addmenumap);%>
<table width="100%" border="0" cellpadding="0" cellspacing="1" align="center" bordercolor="#D1D1D1" >
	<tr>
		<td class="grayE" width="50%">
		<html:link action="/getmodifyitemlist" name="indexmenumap">	
			<b><h5>回到首页</h5></b>
		</html:link>
		</td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >
	<tr>
		<td class="grayD" width="10%">栏目级别</td>
		<td class="grayD">栏目名称</td>
		<td class="grayD">修改</td>
		<td class="grayD">删除</td>
	</tr>
	<tr>                                                                                                     
    	<td class="grayD"  >
    		<logic:notEmpty name="result" scope="request">
	    	<logic:iterate id="result1" name="result" scope="request">		
	    	<tr>
				<logic:notEmpty name="result1" property="lmbs">
				<td class=grayBL widht="5"><bean:write name="result1" property="lmjb" filter="false"/></td>
				<td class=grayD onMouseover=this.className='grayE'; onMouseout=this.className='grayD' align=left>
					<bean:define id="lmBs" name="result1" property="lmbs" type="java.lang.String"/>
					<bean:define id="lmJb" name="result1" property="lmjb" type="java.lang.String"/>
					<%
						HashMap menumap=new HashMap();
		                menumap.put("sjlmbs",lmBs);
		                menumap.put("lmjb",lmJb);
		                menumap.put("trade_type_code","0119");
		                request.setAttribute("menumap",menumap);  
					%>
					<html:link action="/getmodifyitemlist" name="menumap">	
						<bean:write name="result1" property="lmmc" filter="false"/>
					</html:link>
				</td>
				<td class=grayBL widht="5">
					<%
						HashMap modifymenumap=new HashMap();
		                modifymenumap.put("lmbs",lmBs);
		                modifymenumap.put("lmjb",lmJb);
		                modifymenumap.put("trade_type_code","0116");
		                request.setAttribute("modifymenumap",modifymenumap);  
					%>
					<html:link action="/getmodifyiteminterf" name="modifymenumap">	
						 修改
					</html:link>
				</td>
				<td class=grayBL widht="5">
					<%						
		                modifymenumap.put("trade_type_code","0115");
		                request.setAttribute("modifymenumap",modifymenumap);  
					%>
					<html:link action="/getadditemlist" name="modifymenumap">	
						 删除
					</html:link>
				</td>
				</logic:notEmpty>
			</tr>	
		    </logic:iterate>
		    </logic:notEmpty>
    	</td>
  	</tr>
  	 
  </table>
</body>
</html>
