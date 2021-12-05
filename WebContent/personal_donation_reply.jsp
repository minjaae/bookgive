<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*, bookgive.*"%>
<jsp:useBean id="bean" class="bookgive.PersonalDonationBean"
	scope="session" />
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String) session.getAttribute("idKey");
	String nowPage = request.getParameter("nowPage");
	String title = bean.getTitle();
	String content = bean.getContent();
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

<title>게시글 답변하기</title>
</head>
<body>

	<nav>
		<div class="icon container" style="cursor: pointer;"
			onclick="location.href='logout.jsp';">
			<i class="fas fa-sign-out-alt"></i>
		</div>
		<%
			if (id != null) {
		%>
		<div align="right">
			<strong><%=id%></strong>님이 로그인 하셨습니다.&nbsp;&nbsp;
		</div>
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
	<div>
		<div class="container">
			<div class="donation-read-box">
				<div id="donation-read-frm">
					<div class="donation-read-table-box">
						<p
							style="background: #fafaf0; font-weight: bold; font-size: 30px; color: #000;">답변하기</p>

						<form method="post" action="PDReply">
							<table width="100%;">
								<tr>
									<td>제 목</td>
									<td style="font-size: 15px;"><input name="title" size="50"
										value="ㄴ 답변 : <%=title%>" maxlength="50"></td>
								</tr>
								<tr>
									<td>내 용</td>
									<td style="font-size: 15px;"><textarea name="content" rows="12" cols="50">
      	<%=content%>
      	======== 답변 글을 쓰세요. =======
      	</textarea></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td style="font-size: 13px;"><input type="password" name="pwd" size="15"
										maxlength="15">&nbsp;
										답변 시에는 비밀번호가 필요합니다.</td>
								</tr>
								<tr>
									<td colspan="2" height="5"><hr /></td>
								</tr>
								<tr>
									<td colspan="2"><input style="border : 0; background-color : #fafaf0; color: #000000;" type="submit" value="[ 답변등록  |" >
										<a a style="color: #000000;" type="reset">다시 쓰기 | </a> <a style="color: #000000;" type="button"
										onClick="history.back()">뒤로 ]</a>
									</td>
								</tr>
							</table>
							<input type="hidden" name="nowPage" value="<%=nowPage%>">
							<input type="hidden" name="ref" value="<%=bean.getRef()%>">
							<input type="hidden" name="pos" value="<%=bean.getPos()%>">
							<input type="hidden" name="userID" value="<%=bean.getUserID()%>">
							<input type="hidden" name="depth" value="<%=bean.getDepth()%>">
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
							<a href="https://github.com/bookgive">Book,give</a>. All Rights Reserved. Design
							by <a href="https://github.com/bookgive/" target="_blank"
								class="text-primary">Book,give</a>
						</p>
					</div>
				</div>
			</div>

		</footer>
</body>
</html>
