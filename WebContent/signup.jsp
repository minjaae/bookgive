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
	<div class="icon container" style="cursor: pointer;"
		onclick="location.href='login.jsp';">
		<i class="fas fa-sign-in-alt"></i>
	</div>
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
			<div class="join-box">
				<div id="join-frm">
					<h2 style="background: #fafaf0;">회원가입</h2>
					<p style="background: #fafaf0;">회원가입 시 '기관 / 일반 회원'을 정확히 구분해주시길
						바랍니다.</p>
					<form name="regFrm" method="post" action="memberProc.jsp">
						<div class="join-table-box">
							<table>
								<colgroup>
									<col width="30%" />
									<col width="auto" />
								</colgroup>
								<tbody>
									<tr>
										<th><span>role</span></th>
										<td>
										<input type="radio" name="role" value="user">일반 회원
                                        <input type="radio" name="role" value="agency">기관
										</td>
									</tr>

									<tr>
										<th><span>이름 / 기관명</span></th>
										<td><input type="text" name="name" size="15"
											placeholder=""></td>
									</tr>

									<tr>
										<th><span>아이디</span></th>
										<td><input type="text" name="id" size="15"
											placeholder="ID 를 입력하세요."> <a href="javascript:;"
											class="btn_confirm" onClick="idCheck(this.form.id.value)">아이디
												중복 확인</a></td>
									</tr>

									<tr>
										<th><span>비밀번호</span></th>
										<td><input type="password" name="pwd" size="15"
											placeholder="비밀번호를 입력해주세요."></td>
									</tr>

									<tr>
										<th><span>비밀번호 확인</span></th>
										<td><input type="password" name="repwd" size="15"
											placeholder="비밀번호를 확인하세요."></td>
									</tr>

									<tr class="email">
										<th><span>이메일</span></th>
										<td><input type="text" name="email" class="email" placeholder=""><span
											class="mar10">@</span> <input type="text" name="email"
											class="email email2" placeholder=""></td>
									</tr>
									<tr>
										<th><span>전화번호</span></th>
										<td><input type="text" name="phone" placeholder="번호를 입력하세요."></td>
									</tr>
								</tbody>
							</table>

							<div class="exform_txt">
								<span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span>
							</div>

							<div class="btn_wrap">
								<a href="javascript:;">가입하기</a>
							</div>
						</div>

					</form>

				</div>
			</div>
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