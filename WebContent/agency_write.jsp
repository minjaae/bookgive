<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String) session.getAttribute("idKey");
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

<title>개인 기부 게시판 글쓰기</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<nav>
		<%
			if(id != null){
		%>
		<div align="center"> 
        	<strong><%=id%></strong>님이 로그인 하셨습니다. </div>
  		<%
  			}
		%>
		<div class="icon container" style="cursor: pointer;" onclick="location.href='login.jsp';">
			<i class="fas fa-sign-in-alt"></i>
		</div>
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

	<div>
		<div>
			<form method="post" action="">
				<table
					style="text-align: center; border: 1px solid #dddddd; width: 80%; margin-left: 10%;">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #FAFAF0; text-align: center;">기관
								기부 게시판 책 등록</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" placeholder="책 제목을 입력해주세요." name="pdTitle"
								maxlength="50"
								style="width: 90%;"></td>
						</tr>
						<tr>
							<td><textarea placeholder="책의 상태를 자세히 작성해주세요." name="pdContent"
									maxlength="2048"
									style="width: 90%; height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" value="글쓰기"
					style="position: relative; left: 80%">
			</form>
		</div>
	</div>
</body>
</html>