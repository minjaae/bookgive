<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
	function idCheck(id) {
		frm = document.regFrm;
		if (id == "") {
			alert("아이디를 입력해 주세요.");
			frm.id.focus();
			return;
		}
		url = "idCheck.jsp?id=" + id;
		window.open(url, "IDCheck", "width=300,height=150");
	}

	function zipSearch() {
		url = "zipSearch.jsp?search=n";
		window
				.open(url, "ZipCodeSearch",
						"width=500,height=300,scrollbars=yes");
	}
</script>
<title>Sign up</title>
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

	<div align="center">
		<br /> <br />
		<form name="regFrm" method="post" action="memberProc.jsp">
			<table cellpadding="5">
				<tr>
					<td bgcolor="#FFFFCC">
						<table border="1" cellspacing="0" cellpadding="2" width="600">
							<tr bgcolor="#996600">
								<td colspan="2"><font color="#FFFFFF"><b>회원 가입</b></font></td>
							</tr>
							<tr>
								<td width="30%">아이디</td>
								<td width="70%"><input name="id" size="15"> <input
									type="button" value="ID중복확인"
									onClick="idCheck(this.form.id.value)"></td>
							</tr>
							<tr>
								<td>패스워드</td>
								<td><input type="password" name="pwd" size="15"></td>
							</tr>
							<tr>
								<td>패스워드 확인</td>
								<td><input type="password" name="repwd" size="15"></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input name="name" size="15"></td>
							</tr>
							<tr>
								<td>role</td>
								<td>개인<input type="radio" name="role" value="1" checked>
									기관<input type="radio" name="role" value="2">
								</td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td><input name="name" size="15"></td>
							</tr>

							<tr>
								<td>Email</td>
								<td><input name="email" size="30"></td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td><input name="zipcode" size="5" readonly> <input
									type="button" value="우편번호찾기" onClick="zipSearch()"></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input name="address" size="45"></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><input type="button"
									value="회원가입" onclick="inputCheck()"> &nbsp; &nbsp; <input
									type="reset" value="다시쓰기"> &nbsp; &nbsp; <input
									type="button" value="로그인"
									onClick="javascript:location.href='login.jsp'"></td>
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