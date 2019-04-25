<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.saas.biz.JobMgr.JobInfo"%>
<%@ page import="com.saas.biz.userMgr.UserInfo"%>
<%@ page import="com.saas.biz.custMgr.Custinfo"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>

<%

	String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	String job_id = "";
	String title = "";
	String req = "";
	String publish_user_id="";
	String cust_id="";
	String cust_name="";
	String job_addr = "";



	if (request.getParameter("job_id") != null)
	{
		job_id = request.getParameter("job_id");
	}

	JobInfo jobObj = new JobInfo();
	ArrayList jobList = new ArrayList();

	if (job_id != null && !job_id.equals("")) 
	{
		jobList = jobObj.genOneJob(job_id);
		if (jobList != null && jobList.size() > 0) 
		{
			HashMap map = (HashMap) jobList.get(0);
			job_id = map.get("job_id").toString();

			if (map.get("title") != null) 
			{
				title = map.get("title").toString();
			}

			if (map.get("request") != null) 
			{
				req = map.get("request").toString();			
				
		
			}
            
        if (map.get("publish_user_id") != null) 
				{
					publish_user_id = map.get("publish_user_id").toString();
					UserInfo userInfo = new UserInfo();
					ArrayList list = new ArrayList(); 
					HashMap map1 = new HashMap();
					list = userInfo.genOneUserInfo(publish_user_id);
					if (list != null && list.size() > 0)
					{
						   map1 = (HashMap) list.get(0);
						   cust_id = map1.get("cust_id").toString();
						  
						    Custinfo custInfo = new Custinfo();
							ArrayList list2 = new ArrayList(); 
							HashMap map2 = new HashMap();
							list2 = custInfo.genSpecCustInfo(cust_id);
							if (list2 != null && list2.size() > 0)
							{
								  map2 = (HashMap) list2.get(0);
								  cust_name = map2.get("cust_name").toString();
							}
					}
				}
            
        
			if (map.get("job_addr") != null) 
			{
				job_addr = map.get("job_addr").toString();
			}

	
		}

	}

%>

<html>

	<head>

		<title><bean:message key="str182"/></title>
		<link href="/style/layout.css" rel="stylesheet" type="text/css">
		<script language="JavaScript" src="/www/fuction/public.js"></script>
		<script language="javascript" src="/js/Calendar_Ly.js"></script>
		<script language="JavaScript">

    function Check_Value()
	{
 	    return true;
	}
     function check_none(current_obj)
     {
          if (current_obj.advshow.checked)
          {
      	    current_obj.submit1.disabled=false;        	     
      	  }
        else
        {
      	    current_obj.submit1.disabled=true;
      	}
  	}
    	function exit()
    	{
    	    window.close();
    	}

    	function confirmsub(formobj)
    	{
    	    if(window.confirm('你确定要提交吗？')) 
    	    {
    	        if (!Check_Value())
    	        {
    	             return;
    	        }    	            	           
    	        formobj.submit();    	         
    	    }
    	    else
    	    {
    	        return;
    	    }
    	}

  </script>

	</head>

	<body>
  <form  name="classForm" method="post" action="/doTradeReg.do" target="_bank">
		<table width="818" border="0" cellspacing="0" cellpadding="0" align="center">
			<tr>
				<td height="26" >&nbsp;				
				</td>
			</tr>
			<tr>
					<table width="93%" border=0 cellpadding=5 cellspacing=1 align=center bgcolor="#dddddd">
						<tr>
							<td class="line1" align="left" colspan="2">
								<bean:message key = "str1409"/>
							</td>
						</tr>
						<tr>
							<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right width=15%>
								<bean:message key = "str1410"/>
							</td>
							<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left width=85%>
								<%=title%>
							</td>
						</tr>
						<tr>
							<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right valign="top">
								<bean:message key="str1411"/>
							</td>
							<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
									<%=req%>
							</td>
						</tr>
			
						
						<tr>
							<td style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;" align=right>
								<bean:message key="str1412"/>
							</td>
							<td style="background-color:#ffffff; color:#000000;  font-size:12px;" align=left>
								<%=job_addr%>
							</td>
						</tr>
						
						
						
					
						
						<tr>
							<td align="center" style="background-color:#f6f6f6; color:#000000;  font-weight:bold; font-size:13px;padding-top:10px;padding-bottom:10px;" colspan="2">
								<!--input class="gban" name=button1 type=button value="" onclick=exit()-->
							</td>
						</tr>
					</table>
			</tr>
			
		</table>
	</form>
	</body>

</html>

