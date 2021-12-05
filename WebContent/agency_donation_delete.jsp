<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bookgive.InstitutionDonationBean"%>
<jsp:useBean id="bMgr" class="bookgive.InstitutionBoardMgr" />
<%@ page import="java.util.*, bookgive.*"%>
<jsp:useBean id="regMgr" class="bookgive.IntroMgrPool" />
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String) session.getAttribute("idKey");
	String nowPage = request.getParameter("nowPage");
	int num = Integer.parseInt(request.getParameter("num"));
	if (request.getParameter("pass") != null) {
		String inPass = request.getParameter("pass");
		InstitutionDonationBean bean = (InstitutionDonationBean) session.getAttribute("bean");
		String dbPass = bean.getPass();
		if (inPass.equals(dbPass)) {
			bMgr.deleteBoard(num);
			String url = "agency_donation.jsp?nowPage=" + nowPage;
			response.sendRedirect(url);
		} else {
%>
<script type="text/javascript">
	alert("입력하신 비밀번호가 아닙니다.");
	history.back();
</script>
<%
	}
	} else {
%>
<script type="text/javascript">
	function check() {
		if (document.delFrm.pass.value == "") {
			alert("패스워드를 입력하세요.");
			document.delFrm.pass.focus();
			return false;
		}
		document.delFrm.submit();
	}
</script>
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



<title>삭제</title>
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
			<div align="center">
				<br />
				<br />
				<table width="600" cellpadding="3">
					<tr>
						<td bgcolor=#dddddd height="21" align="center">사용자의 비밀번호를
							입력해주세요.</td>
					</tr>
				</table>
				<form name="delFrm" method="post"
					action="agency_donation_delete.jsp">
					<table width="600" cellpadding="2">
						<tr>
							<td align="center">
								<table>
									<tr>
										<td align="center"><input type="password" name="pass"
											size="17" maxlength="15"></td>
									</tr>
									<tr>
										<td><hr size="1" color="#eeeeee" /></td>
									</tr>

									<tr>
										<td align="center"><a style="color: #000000;" type="button" onClick="check()">[ 삭제 완료 | 
									</a> <a style="color: #000000;" type="reset">다시 쓰기 | </a> <a style="color: #000000;" type="button"
										onClick="history.go(-1)">뒤로 ]</a></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<input type="hidden" name="nowPage" value="<%=nowPage%>"> <input
						type="hidden" name="num" value="<%=num%>">
				</form>
			</div>
			<%
				}
			%>
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
						<a href="https://github.com/bookgive">Book,give</a>. All Rights Reserved. Design by
						<a href="https://github.com/bookgive" target="_blank" class="text-primary">Book,give</a>
					</p>
				</div>
			</div>
		</div>

	</footer>
</body>
</html>
