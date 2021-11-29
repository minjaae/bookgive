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
<link href="style.css" rel="stylesheet" type="text/css">


<title>책, 도움</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script language="JavaScript">
	//슬라이드 스크립
	var slideIndex = 1;
	// HTML 로드가 끝난 후 동작
	window.onload=function(){
	  showSlides(slideIndex);

	  // Auto Move Slide
	  var sec = 2000;
	  setInterval(function(){
	    slideIndex++;
	    showSlides(slideIndex);
	  }, sec);
	}
	function plusSlides(n) {
		showSlides(slideIndex += n);
		}

	function currentSlide(n) {
  		showSlides(slideIndex = n);
	}

	function showSlides(n) {
  		var i;
  		var slides = document.getElementsByClassName("mySlides");
  	  	var dots = document.getElementsByClassName("dot");
  		if (n > slides.length) {slideIndex = 1}
  		if (n < 1) {slideIndex = slides.length}
  		for (i = 0; i < slides.length; i++) {
      		slides[i].style.display = "none";
  		}
  		for (i = 0; i < dots.length; i++) {
  	      dots[i].className = dots[i].className.replace(" active", "");
  	  	}
  		slides[slideIndex-1].style.display = "block";
  		dots[slideIndex-1].className += " active";
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

	<!-- 메인 슬라이드 -->
	<div class="moveBtn2" style="text-align:center;">
			<a class="prev" onclick="plusSlides(-1)"> < </a>
			<a class="next"onclick="plusSlides(1)"> > </a>
	</div>
	<div class="slideshow-container" style="text-align:center;">
		<div class="mySlides fade2">
		<img class="main_slideImg" 
		src="https://user-images.githubusercontent.com/87636557/143853597-f6c64971-302c-40d1-8c09-f5d5c5d1cd9e.jpg"
		style="width:1000px; height:500px;">
		</div>
		<div class="mySlides fade2">
		<img class="main_slideImg" src="https://user-images.githubusercontent.com/87636557/143853639-b6b94356-b896-4a89-bed1-b07ac6e636e2.jpg"
		style="width:1000px; height:500px;">
		</div>
		<div class="mySlides fade2">
		<img class="main_slideImg" src="https://user-images.githubusercontent.com/87636557/143853614-e9fa8e0f-eb17-4be8-8f21-ca9b21fb871b.jpg"
		style="width:1000px; height:500px;">
		</div>
	</div>
	<div style="text-align: center">
		<span class="dot" onclick="currentSlide(1)"></span> 
		<span class="dot" onclick="currentSlide(2)"></span>
		<span class="dot" onclick="currentSlide(3)"></span>
	</div>


<div style="text-align: center"></div>

<!-- 메인 슬라이드 End -->

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
