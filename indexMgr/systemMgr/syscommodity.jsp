<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="com.saas.biz.ClassMgr.*" %>
<%@ page import="com.ahbay.commenMgr.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<html> 
	<head>
		<meta name = "Generator" content = "Easy Struts Xslt generator for Eclipse (http://easystruts.sf.net).">
		<title><bean:message key="str3268"/>(http://soft.xsaas.com)</title>
		<link href="/style/css.css" rel="stylesheet" type="text/css">  
	</head>
<script language="javascript">
function confirmremove()
{
	if(confirm('是否确认注销本条记录？')) 
	{
		return true;
	}
	else
	{
		return false;
	}
}
</script>
<%
    commMethodMgr comm=  new commMethodMgr();
    String commodityclass = request.getParameter("class");
     String class_type = request.getParameter("class_type");
    String upClassId = "";
    String upClassName = "";
    int previous=0;
    if (!commodityclass.equalsIgnoreCase("1"))
    {
    	 upClassId = request.getParameter("classId");
    	 upClassName = comm.getClassNameByClassId(upClassId);
    	 previous =new Integer(commodityclass).intValue() - 1;
    }
    else
    {
    	upClassName = "一级分类";
    	previous =1;
    }
    int iClass = new Integer(commodityclass).intValue() + 1;
    String strNextClass= String.valueOf(iClass);
%>
<body>  
<h5><bean:message key="str2553"/>[<%=upClassName%>]</h5><br>
<table width="80%" border="0" cellpadding="10" cellspacing="1" align="center" bordercolor="#D1D1D1" >

  <tr>    
    <td class="grayE" align="right" colspan="6">
    <a href="addcommodityclass.jsp?class=<%=commodityclass%>&classId=<%=upClassId%>&class_type=<%=class_type%>"><bean:message key="str4241"/></a>   
    </td>
  </tr>
  <tr>    
    <td class="grayD" align="center" width="8%"><bean:message key="str1340"/></td>
    <td class="grayD" align="center" width="30%"><bean:message key="str2554"/></td>
    <td class="grayD" align="center" width="8%"><bean:message key="str2696"/></td>
  </tr>
<%
    ClassinfoMgr classList = new ClassinfoMgr();
 	classList.setClass_level(request.getParameter("class"));
 	classList.setClass_type(request.getParameter("class_type"));
    String strSql = "";
    if (request.getParameter("class").equalsIgnoreCase("1"))
    {
    	strSql = "SEL_BY_CLASS_1";
    }
    else
    {
    	classList.setUp_class_id(upClassId);
    	strSql = "SEL_BY_UP";
    } 
    ArrayList classArray = classList.GetClassList(strSql);
 
	ClassinfoMgr[] classinfo = classList.GetList(classArray);
	String strRows =  String.valueOf(classinfo.length);
 	int intBegin=0;                          
    int realcount=classinfo.length;
    String Begin="0";
	if (request.getParameter("Begin")==null)
    {
        intBegin=0;        						
    }
    else 
    {
    	intBegin = new Integer(request.getParameter("Begin")).intValue();
    }
    if (intBegin>=realcount) 
    {
    	intBegin=realcount;                      			 
    }
    if (intBegin<=0) 
    {
    	intBegin=0;                      			 
    }
    String upBegin = String.valueOf(new Integer(intBegin).intValue()-15);
    String downBegin= "0";
    String endBegin = String.valueOf(realcount-15);
	int j = 0;
	for (int i=intBegin;i<classinfo.length;i++)
    {
	    	String classId = classinfo[i].getClass_id();
	    	String className = classinfo[i].getClass_name();
	    	HashMap classmap=new HashMap();
	    	HashMap delmap=new HashMap();
	    	classmap.put("classId",classId);
	    	classmap.put("class_type",class_type);
  		classmap.put("upClassId",upClassId);		
  		classmap.put("class",strNextClass);
  		delmap.put("class_id",classId);			
  		pageContext.setAttribute("classmap",classmap);
  		pageContext.setAttribute("delmap",delmap);
%>
	<tr>
	<td class="grayBL" align="left"><%=String.valueOf(i+1)%></td>
    <td class="grayBL" align="left">
    <html:link href="syscommodity.jsp" name="classmap">
    <%=className%>
    </html:link></td>
	<td class="grayBL" align="left">    
	<html:link action="/doTradeReg.do?trade_type_code=0701" name="delmap" target="right" onclick="return confirmremove()">
    <bean:message key="str157"/>
    </html:link></td>
    </tr>
<%
    	
    	downBegin=String.valueOf(i+1);
    	j++;
    	if (j>=15) break;    
    }

%>
	<tr> 
	    <td colspan=7> 
		    <table width="100%" border="0" cellspacing="1" cellpadding="0">
		    <tr> 
			    <td height="20"><bean:message key="str610"/><font color="#990000"><%=strRows%></font>  <bean:message key="str2544"/></td>
			    <td width="220"> 
			    <div align="right">
			    <%			                          	
			    	    HashMap indexmap=new HashMap();  					
			  		indexmap.put("Begin","0"); 
			  		indexmap.put("class",request.getParameter("class")); 
			  		indexmap.put("classId",upClassId);
			  		indexmap.put("class_type",request.getParameter("class_type"));							 
			  		pageContext.setAttribute("indexmap",indexmap);
			  	%>
			  		  								
				<html:link href="syscommodity.jsp" name="indexmap"><bean:message key="str1030"/> </html:link>
			    <%
			    	    HashMap upmap=new HashMap();  					
			  		upmap.put("Begin",upBegin); 
			  		upmap.put("classId",upClassId);
			  		upmap.put("class_type",request.getParameter("class_type"));	
			  		upmap.put("class",request.getParameter("class")); 							 
			  		pageContext.setAttribute("upmap",upmap);
			  	%>
			  		  								
				<html:link href="syscommodity.jsp" name="upmap"><bean:message key="str1031"/></html:link>
			    <%
				    HashMap downmap=new HashMap();  				
				  	downmap.put("Begin",downBegin);
				  	downmap.put("classId",upClassId);
				  	downmap.put("class_type",request.getParameter("class_type"));	
				  	downmap.put("class",request.getParameter("class")); 
				  	pageContext.setAttribute("downmap",downmap);
			  	%>
			  		  									
				<html:link href="syscommodity.jsp" name="downmap"><bean:message key="str1032"/> </html:link>
			    <%
				    HashMap endmap=new HashMap();   						
				  	endmap.put("Begin",endBegin);	
				  	endmap.put("classId",upClassId);
				  	endmap.put("class_type",request.getParameter("class_type"));	
				  	endmap.put("class",request.getParameter("class")); 
				  	pageContext.setAttribute("endmap",endmap);
			  	%>			  		  					
				<html:link href="syscommodity.jsp" name="endmap"><bean:message key="str2545"/> </html:link>
			    </div>
			    </td>
		    </tr>
		    </table>
	    </td>
    </tr>
</table>
	<body>
</html>
