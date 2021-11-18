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
	<div class="wrap wd668">
		<div class="container">
			<div class="form_txtInput">
				<h2>회원가입</h2>
				<p class="exTxt">회원가입 시 '기관 / 일반 회원' 선택을 반드시 진행하셔야 합니다.</p>
				<div class="join_form">
					<table>
						<colgroup>
							<col width="30%" />
							<col width="auto" />
						</colgroup>
						<tbody>
							<tr>
								<th><span>아이디</span></th>
								<td><input type="text" placeholder="ID 를 입력하세요."></td>
							</tr>
							<tr>
								<th><span>이름</span></th>
								<td><input type="text" placeholder=""></td>
							</tr>
							<tr>
								<th><span>비밀번호</span></th>
								<td><input type="text" placeholder="비밀번호를 입력해주세요."></td>
							</tr>
							<tr>
								<th><span>비밀번호 확인</span></th>
								<td><input type="text" placeholder="비밀번호를 확인하세요"></td>
							</tr>
							<tr class="email">
								<th><span>이메일</span></th>
								<td><input type="text" class="email" placeholder=""><span
									class="mar10">@</span> <input type="text" class="email email2"
									placeholder=""> <a href="javascript:;"
									class="btn_confirm">인증번호 발송</a></td>
							</tr>
							<tr>
								<th><span>인증번호 확인</span></th>
								<td><input type="text" class="send_number"
									placeholder="10:00"> <a href="javascript:;"
									class="btn_confirm">인증번호 발송</a></td>
							</tr>
							<tr>
								<th><span>휴대폰 번호</span></th>
								<td><input type="text" placeholder="ID 를 입력하세요."></td>
							</tr>
						</tbody>
					</table>
					<div class="exform_txt">
						<span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span>
					</div>
				</div>
				<!-- join_form E  -->
				<div class="agree_wrap">
					<div class="checkbox_wrap">
						<input type="checkbox" id="news_letter" name="news_letter"
							class="agree_chk"> <label for="news_letter">[선택]뉴스레터
							수신동의</label>
					</div>
					<div class="checkbox_wrap mar27">
						<input type="checkbox" id="marketing" name="marketing"
							class="agree_chk"> <label for="marketing">[선택]마케팅
							목적 개인정보 수집 및 이용에 대한 동의</label>
						<ul class="explan_txt">
							<li><span class="red_txt">항목 : 성별, 생년월일</span></li>
							<li>고객님께서는 위의 개인정보 및 회원정보 수정 등을 통해 추가로 수집하는 개인정보에<br /> 대해
								동의하지 않거나 개인정보를 기재하지 않음으로써 거부하실 수 있습니다.<br /> 다만 이때 회원 대상 서비스가
								제한될 수 있습니다.
							</li>
						</ul>
					</div>
				</div>
				<div class="btn_wrap">
					<a href="javascript:;">다음</a>
				</div>
			</div>
			<!-- form_txtInput E -->
		</div>
		<!-- content E-->
	</div>
	<!-- container E -->

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