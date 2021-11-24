<%@ page contentType="text/html; charset=UTF-8"%>
<%
      session.invalidate();
%>
<script>
   //alert('로그아웃 되었습니다.');
   //location.href="bookgive.jsp";
   if(!confirm("로그아웃 하시겠습니까?")){
	   //취소버튼 누를 시
	   //location.replace="bookgiveLogin.jsp";
	   history.go(-1);
   }
   else {
	   //확인버튼 누를 시
	   location.href="bookgive.jsp";
   }
</script>