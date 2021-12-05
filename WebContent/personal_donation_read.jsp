<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bookgive.PersonalDonationBean"%>
<%@ page import="java.util.Date,java.io.*,java.util.Enumeration"%>
<jsp:useBean id="PD" class="bookgive.PersonalDonationMgrPool" />

<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String) session.getAttribute("idKey");
	int personal_donation_id = Integer.parseInt(request.getParameter("personal_donation_id"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	PD.upCount(personal_donation_id);//조회수 증가
	PersonalDonationBean bean = PD.getBoard(personal_donation_id);//게시물 가져오기
	String userID = bean.getUserID();
	String title = bean.getTitle();
	Date created_at = bean.getCreatedAt();
	String content = bean.getContent();
	String filename = bean.getFileName();
	int filesize = bean.getFileSize();
	int count = bean.getCount();
	session.setAttribute("bean", bean);//게시물을 세션에 저장
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

<title>개인 기부 게시판</title>
<script type="text/javascript">
	function list() {
		document.listFrm.submit();
	}

	function down(filename) {
		document.downFrm.filename.value = filename;
		document.downFrm.submit();
	}
</script>
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
						<table align="center">
							<tr>
								<td align="center">제 목:</td>
								<td><%=title%></td>
							</tr>
							<tr>
								<td align="center">아이디:</td>
								<td><%=userID%></td>
							</tr>
							<tr>
								<td align="center">작성일:</td>
								<td><%=created_at%></td>
							</tr>
							<tr>
								<td align="center">첨부파일</td>
								<td>
									<%
										if (filename != null && !filename.equals("")) {
									%> <a href="javascript:down('<%=filename%>')"><%=filename%></a>
									&nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)
								</font> <% } else { %> 등록된 파일이 없습니다.<% } %>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center"><pre><%=content%></pre></td>
							</tr>

							<tr>
								<td align="center" colspan="2">
									<hr /> [ <a href="javascript:list()" style="color: #000000;">리스트</a>
									| <a
									href="personal_donation_update.jsp?nowPage=<%=nowPage%>&personal_donation_id=<%=personal_donation_id%>"
									style="color: #000000;">수 정</a> | <a
									href="personal_donation_reply.jsp?nowPage=<%=nowPage%>&personal_donation_id=<%=personal_donation_id%>"
									style="color: #000000;">답변</a> | <a
									href="personal_donation_delete.jsp?nowPage=<%=nowPage%>&personal_donation_id=<%=personal_donation_id%>"
									style="color: #000000;">삭 제</a> ]<br />
								</td>
							</tr>
						</table>

						<form name="downFrm" action="personal_donation_download.jsp"
							method="post">
							<input type="hidden" name="filename">
						</form>

						<form name="listFrm" method="post" action="personal_donation.jsp">
							<input type="hidden" name="nowPage" value="<%=nowPage%>">
							<%
								if (!(keyWord == null || keyWord.equals(""))) {
							%>
							<input type="hidden" name="keyField" value="<%=keyField%>">
							<input type="hidden" name="keyWord" value="<%=keyWord%>">
							<%
								}
							%>
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
							<a href="https://github.com/bookgive">Book,give</a>. All Rights
							Reserved. Design by <a href="https://github.com/bookgive"
								target="_blank" class="text-primary">Book,give</a>
						</p>
					</div>
				</div>
			</div>

		</footer>
</body>
</html>
