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


<title>책, 도움</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script language="JavaScript">
	var idx = 0;
	var i = 0; // 사진 인덱스를 저장할 변수 설정
	$(".pre").click(
			function() { // img 크기만큼 왼쪽으로 이동
				idx = idx - 1;
				if (idx < 1) {
					i = idx % 3;
					i = i + 4;
					if (i == 4) {
						i = 1;
					}
				} else {
					i = idx % 3;
					if (i == 0) {
						i = 3;
					}
				}
				$(".imgSlide>li:last-child").remove();
				$(".imgSlide").prepend(
						"<li><img src='./img/("
								+ i + ").png' alt=''></li>");
				$(".imgSlide").css({
					"left" : "-3200px"
				});
				$(".imgSlide").stop().animate({
					"left" : "-2400px"
				}, "slow");
				console.log(idx);
			});
	$(".next").click(
			function() { // img 크기만큼 오른쪽으로 이동
				idx = idx + 1;
				if (idx < 1) {
					i = idx % 3;
					i = i + 3;
				} else {
					i = idx % 3;
					if (i == 0) {
						i = 3;
					}
				}
				$(".imgSlide>li:first-child").remove();
				$(".imgSlide").append(
						"<li><img src='./img/("
								+ i + ").png' alt=''></li>");
				$(".imgSlide").css({
					"left" : "-1600px"
				});
				$(".imgSlide").stop().animate({
					"left" : "-2400px"
				}, "slow");
				console.log(idx);
			});
</script>
</head>
<body>

	<nav>
		<div class="icon container" style="cursor: pointer;" onclick="location.href='login.jsp';">
			<i class="fas fa-sign-in-alt"></i>
		</div>
		<%
			if(id != null){
				response.sendRedirect("bookgiveLogin.jsp");
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

	<div class="banner">
		<div class="slide">
			<ul class="imgSlide">
				<li><img src="./img/1.png" alt=""></li>
				<li><img src="bannerImg.png" alt=""></li>
				<li><img src="bannerImg.png" alt=""></li>
				<li><img src="#.jpg" alt=""></li>
				<li><img src="#.jpg" alt=""></li>
				<li><img src="#.jpg" alt=""></li>
			</ul>
			<div class="moveBtn">
				<a href="#" class="pre"> < </a> <a href="#" class="next"> > </a>
			</div>
		</div>
	</div>

	<footer>

		<div class="container">
			<div class="row">
				<div class="col-md-4 pr-md-5">
					<h3>About Us</h3>
					<p>'책, 도움'은 책이 필요한 누구에게나 '기부'를 통해 책을 제공하고 있습니다. 버려지는 책을 줄이고 많은
						사람들에게 책이 주는 기쁨을 드리고자 노력하고 있습니다. 지구와 발 맞춰 친환경적인 웹 플랫폼을 꾸려나가겠습니다.</p>
					<p>
						<a href="#" class="readmore">Read more</a>
					</p>
				</div>
				<div class="col-md-8 ml-auto">
					<div class="row">
						<div class="col-md-3">
							<h3>Navigation</h3>
							<ul class="list-unstyled">
								<li><a href="bookgive.jsp">Home</a></li>
								<li><a href="agency_donation.jsp">기관기부</a></li>
								<li><a href="personal_donation.jsp">개인기부</a></li>
								<li><a href="about.jsp">About Us</a></li>
								<li><a href="contact.jsp">Contact</a></li>
							</ul>
						</div>
						<div class="col-md-9 ml-auto">
							<div class="row mb-3">
								<div class="col-md-6">
									<h3>Address</h3>
									<address>
										서울시 성북구 보문로 34다길 2로 <br> 성신여자대학교
									</address>
								</div>
								<div class="col-md-6">
									<h3>Telephone</h3>
									<p>
										<a href="#">02 920 7114</a> <br> <a href="#">+82 10
											2345 6789</a>
									</p>
								</div>
							</div>

							<h3 class="mb-0">Join our bookclub</h3>
							<p>Be the first to know our latest updates and news!</p>
							<form action="#" method="" class="form-subscribe">
								<div class="form-group d-flex">
									<input type="email" class="form-control mr-2"
										placeholder="Enter your email"> <input type="submit"
										value="Subscribe" class="btn btn-black px-4 text-white">
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>
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
