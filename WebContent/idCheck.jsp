<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="mMgr" class="bookgive.UserDBMgrPool" />
<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	boolean result = mMgr.checkId(id);
%>
<html>
<head>
<title>ID 중복체크</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#E6E4BC">
	<div align="center">
		<br/><b><%=id%></b>
		<%
			if (result) {
				out.println("는 이미 존재하는 ID입니다.<p/>");
			} else {
				out.println("는 사용가능 합니다.<p/>");
			}
		%>
		<a href="#" onClick="self.close()">닫기</a>
	</div>
</body>
</html>