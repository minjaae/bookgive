<%@page contentType="application; charset=UTF-8"%>
<jsp:useBean id="bMgr" class="bookgive.InstitutionBoardMgr" />
<%
	  bMgr.downLoad(request, response, out, pageContext);
%>