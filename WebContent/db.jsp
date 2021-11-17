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
   <td><strong>content</strong></td>
   <td><strong>createAt</strong></td>
   <td><strong>modifiedAt</strong></td>
   <td><strong>donationState</strong></td>
   <td><strong>bookStatus</strong></td>
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
	<td><%=pdBean.getContent()%></td>
	<td><%=pdBean.getCreateAt()%></td>
	<td><%=pdBean.getModifiedAt()%></td>
	<td><%=pdBean.getDonationState()%></td>
	<td><%=pdBean.getBookStatus()%></td>
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