<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, bookgive.*"%>
<jsp:useBean id="regMgr" class="bookgive.IntroMgrPool" />
<html>

<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta name="description" content="" />
<meta name="keywords" content="" />

<!-- Font -->
<link
	href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:400,500i,700|Roboto:300,400,500,700&display=swap"
	rel="stylesheet">

<!-- Theme Style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css?after"
	type="text/css">

<title>login</title>
</head>
<body>
	<nav>
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
		<div class="container">
			<h2>About Us</h2>
			<p>'책, 도움'은 책이 필요한 누구에게나 '기부'를 통해 책을 제공하고 있습니다. 버려지는 책을 줄이고 많은
				사람들에게 책이 주는 기쁨을 드리고자 노력하고 있습니다. 지구와 발 맞춰 친환경적인 웹 플랫폼을 꾸려나가겠습니다.</p>
			<h2>Team Members</h2>
			<table border="1">
				<tr>
					<td><strong>학번</strong></td>
					<td><strong>이름</strong></td>
					<td><strong>학과</strong></td>
					<td><strong>학교</strong></td>
				</tr>
				<%
					Vector<IntroBean> vlist = regMgr.getRegisterList();
					int counter = vlist.size();
					for (int i = 0; i < vlist.size(); i++) {
						IntroBean iBean = vlist.get(i);
				%>
				<tr>
					<td><%=iBean.getStudentId()%></td>
					<td><%=iBean.getName()%></td>
					<td><%=iBean.getDepartment()%></td>
					<td><%=iBean.getSchool()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
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