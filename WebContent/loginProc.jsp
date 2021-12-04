<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="mMgr" class="bookgive.UserDBMgrPool"/>
<%
	  request.setCharacterEncoding("EUC-KR");
	  String id = request.getParameter("id");
	  String pwd = request.getParameter("pwd");
	  String url = "login.jsp";
	  String msg = "로그인에 실패하였습니다.";
	  
	  boolean result = mMgr.login(id,pwd);
	  if(result){
	    session.setAttribute("idKey",id);
	    msg = "로그인에 성공하였습니다.";
	    url = "bookgiveLogin.jsp";
	  }
%>
<script>
	alert("<%=msg%>");	
	location.href="<%=url%>";
</script>

