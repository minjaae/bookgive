<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.*, bookgive.*"%>
<jsp:useBean id="regMgr" class="bookgive.PersonalCommentMgrPool" />
<html>
<head>
<title>개인 기부 댓글 DB</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<h2>개인 기부 댓글 DB</h2><br/>
<table bordercolor="#0000ff" border="1">
<tr>
   <td><strong>CommentID</strong></td>
   <td><strong>PersonalDonationId</strong></td>
   <td><strong>UserID</strong></td>
   <td><strong>ModifiedAt</strong></td>
   <td><strong>CreateAt</strong></td>
</tr>
<%
	Vector<PersonalCommentBean> vlist = regMgr.getRegisterList();
	int counter = vlist.size();
	for(int i=0; i<vlist.size(); i++){
   		PersonalCommentBean Bean =vlist.get(i);
%>
<tr>
	<td><%=Bean.getCommentID()%></td>
	<td><%=Bean.getPersonalDonationID()%></td>
	<td><%=Bean.getUserID()%></td>
	<td><%=Bean.getCreatedAt()%></td>
	<td><%=Bean.getModifiedAt()%></td>
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