<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bookgive.PersonalDonationBean"%>
<%@ page import="java.util.Date,java.io.*,java.util.Enumeration"%>
<jsp:useBean id="PD" class="bookgive.PersonalDonationMgrPool" />	

<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String) session.getAttribute("idKey");
	int personal_donation_id = Integer.parseInt(request.getParameter("personal_donation_id"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	PD.upCount(personal_donation_id);//조회수 증가
	PersonalDonationBean bean = PD.getBoard(personal_donation_id);//게시물 가져오기
	String userID = bean.getUserID();
	String title = bean.getTitle();
	Date created_at = bean.getCreatedAt();
	String content = bean.getContent();
	String filename = bean.getFileName();
	int filesize = bean.getFileSize();
	int count = bean.getCount();
	session.setAttribute("bean", bean);//게시물을 세션에 저장
%>
<html>

<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta name="description" content="" />
<meta name="keywords" content="" />

<!-- Font -->

<!-- Icon -->
<script src="https://kit.fontawesome.com/e72d46677a.js"
	crossorigin="anonymous"></script>

<!-- Theme Style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css?after"
	type="text/css">
	
<title>개인 기부 게시판</title>
<script>
	function check() {
	   if (document.updateFrm.pass.value == "") {
		 alert("수정을 위해 패스워드를 입력하세요.");
		 document.updateFrm.pass.focus();
		 return false;
		 }
	   document.updateFrm.submit();
	}
</script>
</head>
<body>
	<nav>
		<div class="icon container" style="cursor: pointer;" onclick="location.href='login.jsp';">
			<i class="fas fa-sign-in-alt"></i>
		</div>
		<%
			if(id != null){
		%>
		<div align="right"> 
        	<strong><%=id%></strong>님이 로그인 하셨습니다.&nbsp;&nbsp; </div>
  		<%
  			}
		%>
		<div class="mainLogo container">
			<div>
				<a href="bookgive.jsp"><p>책,</p>도움</a>
			</div>
		</div>
		<div class="menu container">
			<ul class="nav">
				<li><a href="bookgive.jsp">Home</a></li>
				<li><a href="agency_donation.jsp">기관기부</a></li>
				<li><a href="personal_donation.jsp">개인기부</a></li>
				<li><a href="about.jsp">About Us</a></li>
				<li><a href="contact.jsp">Contact</a></li>
			</ul>
		</div>
	</nav>
	<div align="center"><br/><br/>
		<table width="600" cellpadding="3">
  			<tr>
   				<td bgcolor="#FF9018"  height="21" align="center">수정하기</td>
  			</tr>
		</table>
		<form name="updateFrm" method="post" action="PDUpdate">
			<table width="600" cellpadding="7">
 				<tr>
  					<td>
   						<table>
    						<tr>
     							<td width="20%">성 명</td>
     							<td width="80%">
	  								<input name="name" value="<%=userID%>" size="30" maxlength="20">
	 							</td>
							</tr>
							<tr>
     							<td>제 목</td>
     							<td>
	  								<input name="subject" size="50" value="<%=title%>" maxlength="50">
	 							</td>
    						<tr>
     							<td>내 용</td>
     							<td>
	  								<textarea name="content" rows="10" cols="50"><%=content%></textarea>
	 							</td>
    						</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<footer>
		<div class="container">
			<div class="row mt-5 pt-5 align-items-center">
				<div class="col-md-6 text-md-left">
					<p>
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						<a href="index.html">Book,give</a>. All Rights Reserved. Design by
						<a href="https://untree.co/" target="_blank" class="text-primary">Book,give</a>
					</p>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>
