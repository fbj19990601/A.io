<!DOCTYPE HTML PUBLIC "-/W3C/DTD HTML 4.01 Transitional/EN"
"http:/www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@page import="com.saas.biz.enquirydealMgr.EnquirydInfo"%>
<%@page import="com.saas.biz.repositoryMgr.RepositoryInfo"%>
<%@page import="com.saas.biz.enquirydealMgr.Enquirydealinfo"%>
<%
	String trade_id = "";
	if (request.getParameter("trade_id") != null) {
		trade_id = request.getParameter("trade_id");
	}
	String iStart = "0";
	EnquirydInfo in = new EnquirydInfo();
	ArrayList list2 = in.getEnquiryByList(Integer.parseInt(iStart),5); 
	
	EnquirydInfo info = new EnquirydInfo();
	ArrayList list = info.getEnquiryById(trade_id);
	ArrayList list4 = info.getMax();
	
	RepositoryInfo re = new RepositoryInfo();
	ArrayList list1 = re.getRepositoryByType("4",Integer.parseInt(iStart),8);
	
	String req_title="",enquiry_date="",rsrv_str5="",enquiry_content="",rsrv_str1="";
	if(list != null && list.size() > 0) {
		HashMap map = (HashMap) list.get(0);
		if(map.get("rsrv_str3")!=null){req_title=map.get("rsrv_str3").toString();}
		if(map.get("rsrv_str1")!=null){rsrv_str1=map.get("rsrv_str1").toString();}
		if(map.get("rsrv_str5")!=null){rsrv_str5=map.get("rsrv_str5").toString();}
		if(map.get("enquiry_content")!=null){enquiry_content=map.get("enquiry_content").toString();}
		if(map.get("enquiry_date")!=null){enquiry_date=map.get("enquiry_date").toString();}	
		if (enquiry_date.length() > 10) {enquiry_date = enquiry_date.substring(0, 10);} 
	}
	Enquirydealinfo e = new Enquirydealinfo();
	ArrayList list3 = e.SchrepoitoryById(trade_id);
%>
<html>
	<head>
		<!--文字大小控制-->
		<SCRIPT>
<!--
function doZoom(size){
  document.getElementById('zoom').style.fontSize=size+'px';
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</SCRIPT>
<SCRIPT language=JavaScript> 
document.oncontextmenu=new Function("event.returnValue=false;"); //禁止右键功能,单击右键将无任何反应 
document.onselectstart=new Function("event.returnValue=false;"); //禁止先择,也就是无法复制 
</SCRIPT>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title><bean:message key="str3604"/></title>
		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
		<link href="/zone_b2b/css/css.css" rel="stylesheet" type="text/css" />
		<script language=JavaScript>
		function showHS(){
			var id=document.getElementById("trade_id").value;
			window.open("sch_list_answer.jsp?trade_id="+id);
		}
		function checkRelation(){
		    if(document.getElementById("keyword").value!=""){
		      return true;
		    }else{
		      alert('请输入关键字，否则会影响你的查询结果！');
		      document.getElementById("keyword").focus();
		    }
		  }
		</script>
	</head>
	<body>
		<jsp:include flush="true" page="/zone_b2b/school/sch_top.jsp"/>
		<table width="980" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="DBECF4">
			<tr>
				<td height="26" valign="top" background="/zone_b2b/images/xian4.gif" bgcolor="#FFFFFF">
					<bean:message key="str2239"/>
					<a href="/" class="lanse"><bean:message key="str1030"/></a> &gt;
					<a href="/zone_b2b/school" class="lanse"><bean:message key="str2030"/></a>
					 &gt;<bean:message key="str5074"/>
				</td>
			</tr>
		</table>
		<table width="980" height="10" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td></td>
			</tr>
		</table>
		<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="235" valign="top">
					<table width="220" border="0" cellpadding="0" cellspacing="1" bgcolor="DBECF4">
						<tr>
							<td height="166" valign="top" bgcolor="F5FAFC">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="21">
											<img src="/zone_b2b/images/xueyuan_11.gif" width="21" height="30" alt="">
										</td>
										<td width="80" align="center" background="/zone_b2b/images/xueyuan_12.gif">
											<span class="btlanse"><bean:message key="str5064"/></span>
										</td>
										<td width="23">
											<img src="/zone_b2b/images/xueyuan_14.gif" width="23" height="30" alt="">
										</td>
										<td align="right" background="/zone_b2b/images/xueyuan_15.gif">
											<a href="#" class="lanse"></a>&nbsp;
										</td>
									</tr>
								</table>
								<table width="100%" height="10" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td></td>
									</tr>
								</table>
								<table width="96%" border="0" align="center" cellpadding="4" cellspacing="0">
									<tr>
										<td>
											<form name="searchForm" id="searchForm" action="search_list.jsp" method="post">
												<input name="keyword" type="text" class="0" value="请输入你要查的关键字" size="22" onblur="chek()" onmousedown="javascript:this.value=''">
												<input type="submit" name="Submit2" value="搜 索" onclick="return checkRelation()">
											</form>
										</td>
									</tr>
									<tr>
										<td class="lanse_renceitop">
											<bean:message key="str5065"/>
											<br>
											<bean:message key="str5066"/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<table width="220" height="10" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td></td>
						</tr>
					</table>
					<table width="220" border="0" cellpadding="0" cellspacing="1" bgcolor="DBECF4">
						<tr>
							<td height="222" valign="top" bgcolor="F5FAFC">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="21">
											<img src="/zone_b2b/images/xueyuan_11.gif" width="21" height="30" alt="">
										</td>
										<td width="80" align="center" background="/zone_b2b/images/xueyuan_12.gif">
											<span class="btlanse"><bean:message key="str5032"/></span>
										</td>
										<td width="23">
											<img src="/zone_b2b/images/xueyuan_14.gif" width="23" height="30" alt="">
										</td>
										<td align="right" background="/zone_b2b/images/xueyuan_15.gif">
											<a href="sch_knowlist.jsp?repository_type=4" class="lanse"><bean:message key="str2249"/></a>&nbsp;
										</td>
									</tr>
								</table>
								<table width="100%" height="10" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td></td>
									</tr>
								</table>
								<table width="209" border="0" align="center" cellpadding="0" cellspacing="0">
									<%
											if (list1 != null && list1.size() > 0) {
											for (int i = 0; i < list1.size(); i++) {
												HashMap map = (HashMap) list1.get(i);
												String repository_id = "", title = "";
												if (map.get("repository_id") != null) {repository_id = map.get("repository_id").toString();}
												if (map.get("title") != null) {title = map.get("title").toString();}
												if (title.length() > 15) {title = title.substring(0, 15);}
									%>
									<tr>
										<td width="209" class="rencei_table_xian">
											·
											<A href="sch_knowlist_con.jsp?repository_id=<%=repository_id%>" target="_blank" class="lanse"><%=title%></A>
										</td>
									</tr>
									<%
										}
										}
									%>
								</table>
							</td>
						</tr>
					</table>
					<table width="220" height="10" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td></td>
						</tr>
					</table>
					<table width="220" border="0" cellpadding="0" cellspacing="1" bgcolor="DBECF4">
						<tr>
							<td height="220" valign="top" bgcolor="F5FAFC">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="21">
											<img src="/zone_b2b/images/xueyuan_11.gif" width="21" height="30" alt="">
										</td>
										<td width="80" align="center" background="/zone_b2b/images/xueyuan_12.gif">
											<span class="btlanse"><bean:message key="str5067"/></span>
										</td>
										<td width="23">
											<img src="/zone_b2b/images/xueyuan_14.gif" width="23" height="30" alt="">
										</td>
										<td align="right" background="/zone_b2b/images/xueyuan_15.gif">
											<a href="sch_list.jsp" target="_blank" class="lanse"><bean:message key="str2249"/></a>&nbsp;
										</td>
									</tr>
								</table>
								<table width="100%" height="10" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td></td>
									</tr>
								</table>
								<table width="209" border="0" align="center" cellpadding="0" cellspacing="0">
								<%
								if(list4 != null && list4.size() > 0) 
								{
									for(int i=0;i<list4.size();i++) 
									{
										HashMap map = (HashMap) list4.get(i);
										String rsrv_str3="",trade_idx="";
										if(map.get("rsrv_str3")!=null){rsrv_str3=map.get("rsrv_str3").toString();}
										if (rsrv_str3.length() > 15) {rsrv_str3 = rsrv_str3.substring(0, 15);} 
										if(map.get("trade_id")!=null){trade_idx=map.get("trade_id").toString();}
								%>
									<tr>
										<td width="209" class="rencei_table_xian">
											·
											<A href="sch_list_content.jsp?trade_id=<%=trade_idx%>" class="lanse"><%=rsrv_str3%></A>
										</td>
									</tr>
								<%
									}
								}
								%>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<td valign="top">
					<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="DBECF4">
						<tr>
							<td height="212" valign="top" bgcolor="#FFFFFF">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="21">
											<img src="/zone_b2b/images/xy_11.gif" width="21" height="30" alt="">
										</td>
										<td width="100" align="center" background="/zone_b2b/images/xueyuan_12.gif">
										<%if(rsrv_str1!="2" && !rsrv_str1.equals("2")){%>
											<span class="btlanse"><bean:message key="str5075"/></span>
										<%}else{%>
											<span class="btlanse"><bean:message key="str5076"/></span>
										<%}%>
										</td>
										<td width="23">
											<img src="/zone_b2b/images/xy_14.gif" width="23" height="30" alt="">
										</td>
										<td align="right" background="/zone_b2b/images/xy_15.gif">
											&nbsp;
										</td>
									</tr>
								</table>
								<table width="96%" height="5" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td></td>
									</tr>
								</table>
								<table width="96%" border="0" align="center" cellpadding="5" cellspacing="0">
									<tr>
										<td valign="top">
											<!--//重复-->
											<div style="line-height: 200%" class="rencei_table_xian">
												<span class="shixuan"><%=req_title%></span>
												<br>
													<%=enquiry_content%>
												<p>
													<input type="hidden" id="trade_id" name="trade_id" value="<%=trade_id%>">
													<%if(rsrv_str1!="2" && !rsrv_str1.equals("2")){%>
													<input type="submit" name="Submit3" value="回答该问题" onclick="showHS()">
													<%}%>
												</p>
											</div>
											<!--重复//-->
										</td>
									</tr>
								</table>
								<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td height="49" align="right" class="time">
											<bean:message key="str5077"/><%=rsrv_str5%>&nbsp;&nbsp;<bean:message key="str4688"/>:<%=enquiry_date%>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<table width="96%" height="8" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td></td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="DBECF4">
						<tr>
							<td height="212" valign="top" bgcolor="#FFFFFF">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="21">
											<img src="/zone_b2b/images/xy_11.gif" width="21" height="30" alt="">
										</td>
										<td width="100" align="center" background="/zone_b2b/images/xueyuan_12.gif">
											<span class="btlanse"><bean:message key="str5078"/></span>
										</td>
										<td width="23">
											<img src="/zone_b2b/images/xy_14.gif" width="23" height="30" alt="">
										</td>
										<td align="right" background="/zone_b2b/images/xy_15.gif">
											&nbsp;
										</td>
									</tr>
								</table>
								<table width="96%" height="5" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td></td>
									</tr>
								</table>
								<table width="96%" border="0" align="center" cellpadding="5" cellspacing="0">
								<%
								if(list3 != null && list3.size() > 0) 
								{
									for(int i=0;i<list3.size();i++) 
									{
										HashMap map = (HashMap) list3.get(i);
										String deal_content="",deal_date="",deal_user="";
										if(map.get("deal_content")!=null){deal_content=map.get("deal_content").toString();}
										deal_content=deal_content.replaceAll("<[^<>]+>","");
										if(map.get("deal_user")!=null){deal_user=map.get("deal_user").toString();}
										if(map.get("deal_date")!=null){deal_date=map.get("deal_date").toString();}
										if (deal_date.length() > 10) {deal_date = deal_date.substring(0, 10);}
								%>
									<tr>
										<td valign="top">
											<div style="line-height: 200%" class="rencei_table_xian">
											<%=deal_content%>&nbsp;&nbsp;&nbsp;<span class=time><bean:message key="str5079"/><%=deal_user%>&nbsp;&nbsp;<%=deal_date%> </span>
											</div>
										</td>
									</tr>
								<%
									}
								}
								%>
								</table>
							</td>
						</tr>
					</table>
					<table width="96%" height="8" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td></td>
						</tr>
					</table>
					<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="DBECF4">
						<tr>
							<td height="212" valign="top" bgcolor="#FFFFFF">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="21">
											<img src="/zone_b2b/images/xy_11.gif" width="21" height="30" alt="">
										</td>
										<td width="110" align="center" background="/zone_b2b/images/xueyuan_12.gif">
											<span class="btlanse"><bean:message key="str5074"/></span>
										</td>
										<td width="23">
											<img src="/zone_b2b/images/xy_14.gif" width="23" height="30" alt="">
										</td>
										<td align="right" background="/zone_b2b/images/xy_15.gif">
											&nbsp;
										</td>
									</tr>
								</table>
								<table width="96%" height="5" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td></td>
									</tr>
								</table>
								<table width="96%" border="0" align="center" cellpadding="5" cellspacing="0">
									<tr>
										<td valign="top">
											<%
													if (list2 != null && list2.size() > 0) {
													for (int i = 0; i < list2.size(); i++) {
														HashMap map = (HashMap) list2.get(i);
														String req_titles = "", trade_idx = "", enquiry_dates = "";
														if (map.get("rsrv_str3") != null) {req_titles = map.get("rsrv_str3").toString();}
														if (map.get("trade_id") != null) {trade_idx = map.get("trade_id").toString();}
														if (map.get("enquiry_date") != null) {enquiry_dates = map.get("enquiry_date").toString();}
														if (enquiry_dates.length() > 10) {enquiry_dates = enquiry_dates.substring(0, 10);}
											%>
											<div style="line-height: 200%" class="rencei_table_xian">
												·
												<A href="sch_list_content.jsp?trade_id=<%=trade_idx%>" target=_blank class=lansed><%=req_titles%> </A><span class=time><%=enquiry_dates%> </span>
											</div>
											<%
												}
												}
											%>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<jsp:include flush="true" page="/zone_b2b/footer.jsp" />
	</body>
</html>