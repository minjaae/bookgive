<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.*, bookgive.*"%>
<jsp:useBean id="regMgr" class="bookgive.PersonalDonationMgrPool" />
<html>
<head>
<title>데베 잘 연동됐는지 확인 페이지</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<h2>데베 잘 연동됐는지 확인</h2><br/>
<h3>개인 기부 데베</h3>
<table bordercolor="#0000ff" border="1">
<tr>
   <td><strong>personalDonationId</strong></td>
   <td><strong>userID</strong></td>
   <td><strong>title</strong></td>
   <td><strong>PWD</strong></td>
   <td><strong>content</strong></td>
   <td><strong>createAt</strong></td>
   <td><strong>donationState</strong></td>
   <td><strong>bookStatus</strong></td>
   <td><strong>count</strong></td>
   <td><strong>filename</strong></td>
   <td><strong>FileSize</strong></td>
</tr>
<%
	Vector<PersonalDonationBean> vlist = regMgr.getRegisterList();
	int counter = vlist.size();
	for(int i=0; i<vlist.size(); i++){
   		PersonalDonationBean pdBean =vlist.get(i);
%>
<tr>
	<td><%=pdBean.getPersonalDonationId()%></td>
	<td><%=pdBean.getUserID()%></td>
	<td><%=pdBean.getTitle()%></td>
	<td><%=pdBean.getPWD()%></td>
	<td><%=pdBean.getContent()%></td>
	<td><%=pdBean.getCreatedAt()%></td>
	<td><%=pdBean.getDonationState()%></td>
	<td><%=pdBean.getBookStatus()%></td>
	<td><%=pdBean.getCount()%></td>
	<td><%=pdBean.getFileName()%></td>
	<td><%=pdBean.getFileSize()%></td>
	
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