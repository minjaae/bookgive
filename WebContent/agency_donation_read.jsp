<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bookgive.InstitutionDonationBean"%>
<jsp:useBean id="bMgr" class="bookgive.InstitutionBoardMgr" />
<%@ page import="java.util.*, bookgive.*"%>

<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String) session.getAttribute("idKey");
	int num = Integer.parseInt(request.getParameter("institutionDonationId"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	bMgr.upCount(num);//조회수 증가
	InstitutionDonationBean bean = bMgr.getBoard(num);//게시물 가져오기
	String name = bean.getUserID();
	String subject = bean.getTitle();
	Date regdate = bean.getCreatedAt();
	String bookstatus = bean.getBookStatus();
	String content = bean.getContent();
	String filename = bean.getFilename();
	int filesize = bean.getFilesize();
	int count = bean.getCount();
	int pos = bean.getPos();
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

<script type="text/javascript">
	function list() {
		document.listFrm.submit();
	}

	function down(filename) {
		document.downFrm.filename.value = filename;
		document.downFrm.submit();
	}
</script>

<!-- Theme Style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css?after"
	type="text/css">

<title>기관 기부 게시판</title>
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
							style="background: #fafaf0; font-weight: bold; font-size: 30px; color: #000;">
							<%=subject%></p>
						<p style="background: #fafaf0; font-size: 17px; color: #000;">
							아이디 |
							<%=name%>
							&nbsp; 작성일 |
							<%=regdate%>
							&nbsp; 조회수 |
							<%=count%>
						</p>

						<hr>

						<textarea readonly><%=content%></textarea>

						<p style="background: #fafaf0; font-size: 15px; color: #000;">
							<%if (pos == 0) {%>
							책 상태 | <%=bookstatus%> <br> <%	}%>첨부파일 |
							<%
							if (filename != null && !filename.equals("")) {
						%>
							<a href="javascript:down('<%=filename%>')"><%=filename%></a>
							&nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)
							</font><%} else {%>등록된 파일이 없습니다.<%}%>
						</p>
						<hr />
						<table>
							<tr>
								<td align="center" colspan="2">
									 [ <a href="javascript:list()" style="color: #000000;">리스트</a>
									| <a
									href="agency_donation_upadte.jsp?nowPage=<%=nowPage%>&num=<%=num%>"
									style="color: #000000;">수 정</a> | <a
									href="agency_donation_reply.jsp?nowPage=<%=nowPage%>"
									style="color: #000000;">답 변</a> | <a
									href="agency_donation_delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>"
									style="color: #000000;">삭 제</a> ]<br />
								</td>
							</tr>

						</table>

						<form name="downFrm" action="agency_donation_download.jsp"
							method="post">
							<input type="hidden" name="filename">
						</form>

						<form name="listFrm" method="post" action="agency_donation.jsp">
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
