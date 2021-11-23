<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*, bookgive.*"%>
<jsp:useBean id="regMgr" class="bookgive.UserDBMgrPool" />
<html>
<head>
<title>데베 잘 연동됐는지 확인 페이지</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<h2>데베 잘 연동됐는지 확인</h2><br/>
<h3>팀원 소개 데베</h3>
<table bordercolor="#0000ff" border="1">
<tr>
   <td><strong>studentID</strong></td>
   <td><strong>name</strong></td>
   <td><strong>department</strong></td>
   <td><strong>school</strong></td>>
</tr>
<%
	Vector<UserBean> vlist = regMgr.getRegisterList();
	int counter = vlist.size();
	for(int i=0; i<vlist.size(); i++){
		UserBean iBean =vlist.get(i);
%>
<tr>
	<td><%=iBean.getName()%></td>
	<td><%=iBean.getAddress()%></td>
</tr>
<%
   }
%>
</table>
<br/>
<br/>
total records : <%= counter %> 
</body>
</html>