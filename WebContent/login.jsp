<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script type="text/javascript">
	function loginCheck() {
		if (document.loginFrm.id.value == "") {
			alert("아이디를 입력해 주세요.");
			document.loginFrm.id.focus();
			return;
		}
		if (document.loginFrm.pwd.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.loginFrm.pwd.focus();
			return;
		}
		document.loginFrm.submit();
	}
</script>

<title>login</title>
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

	<div align="center">
		<br /> <br />
		<%
			if (id != null) {
		%>
		<b><%=id%></b>님 환영 합니다.<br>
		제한된 기능을 사용 할 수가 있습니다.<br>
		<a href="logout.jsp">로그아웃</a>
		<%
			} else {
		%>
		<h2>Login</h2>
		<form name="loginFrm" method="post" action="loginProc.jsp">
			<div class="login-box">
				<input id="username" type="text" name="id" placeholder="아이디">
				<label for="id">아이디</label>
			</div>
			<div class="login-box">
				<input id="password" type="password" name="pwd" placeholder="비밀번호">
				<label for="pwd">비밀번호</label>
			</div>
			<div id="join" onClick="javascript:location.href='signup.jsp'">회원가입</div>
			<div id="loginBtn" value="로그인" onClick="loginCheck()">로그인</div>
		</form>
		<%
			}
		%>
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