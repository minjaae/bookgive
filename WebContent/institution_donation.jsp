<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.*, bookgive.*"%>
<jsp:useBean id="regMgr" class="bookgive.InstitutionDonationMgrPool" />
<html>
<head>
<title>데베 잘 연동됐는지 확인 페이지</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<h2>데베 잘 연동됐는지 확인</h2><br/>
<h3>기관 기부 데베</h3>
<table bordercolor="#0000ff" border="1">
<tr>
   <td><strong>institutionDonationId</strong></td>
   <td><strong>userID</strong></td>
   <td><strong>title</strong></td>
   <td><strong>content</strong></td>
   <td><strong>img</strong></td>
   <td><strong>createAt</strong></td>
   <td><strong>modifiedAt</strong></td>
   <td><strong>institution</strong></td>
   <td><strong>donationState</strong></td>
   <td><strong>bookStatus</strong></td>
</tr>
<%
	Vector<InstitutionDonationBean> vlist = regMgr.getRegisterList();
	int counter = vlist.size();
	for(int i=0; i<vlist.size(); i++){
		InstitutionDonationBean idBean =vlist.get(i);
%>
<tr>
	<td><%=idBean.getInstitutionDonationId()%></td>
	<td><%=idBean.getUserID()%></td>
	<td><%=idBean.getTitle()%></td>
	<td><%=idBean.getContent()%></td>
	<td><%=idBean.getImg()%></td>
	<td><%=idBean.getCreateAt()%></td>
	<td><%=idBean.getModifiedAt()%></td>
	<td><%=idBean.getInstitution()%></td>
	<td><%=idBean.getDonationState()%></td>
	<td><%=idBean.getBookStatus()%></td>
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