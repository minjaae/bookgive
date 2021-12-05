<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bookgive.PersonalDonationBean"%>
<%@ page import="java.util.Date,java.io.*,java.util.Enumeration"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="PD" class="bookgive.PersonalDonationMgrPool" />


<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String) session.getAttribute("idKey");
	int totalRecord = 0;
	int numPerPage = 10;
	int pagePerBlock = 15;

	int totalPage = 0;
	int totalBlock = 0;

	int nowPage = 1;
	int nowBlock = 1;

	int start = 0;//personal_donation 테이블의 select 시작번호
	int end = 10; //시작번호로부터 가져올 select개수

	int listSize = 0;

	String keyWord = "", keyField = "";
	Vector<PersonalDonationBean> vlist = null;
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	if (request.getParameter("reload") != null) {
		if (request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
		}
	}

	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = (nowPage * numPerPage) - numPerPage;
	end = numPerPage;
	totalRecord = PD.getTotalCount(keyField, keyWord);
	totalPage = (int) Math.ceil((double) totalRecord / numPerPage); //전체페이지수
	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); //현재블럭 계산 
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); //전체블럭계산
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
		document.listFrm.action = "personal_donation.jsp";
		document.listFrm.submit();
	}

	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}

	function block(value) {
		document.readFrm.nowPage.value =
<%=pagePerBlock%>
	* (value - 1) + 1;
		document.readFrm.submit();
	}

	function read(num) {
		document.readFrm.personal_donation_id.value = num;
		document.readFrm.action = "personal_donation_read.jsp";
		document.readFrm.submit();
	}

	function check() {
		if (document.searchFrm.keyWord.value == "") {
			alert("검색어를 입력하세요.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
	}
</script>
</head>

<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
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
			<table class="donation-table"
				style="text-align: center; width: 100%; margin: 0 auto;">
				<%
					vlist = PD.getBoardList(keyField, keyWord, start, end);
					listSize = vlist.size();//브라우저 화면에 보여질 게시물갯수
					if (vlist.isEmpty()) {
						out.println("등록된 게시물이 없습니다.");
					} else {
				%>
				<thead>
					<tr>
						<th
							style="background-color: #FAFAF0; text-align: center; width: 20%">번호</th>
						<th
							style="background-color: #FAFAF0; text-align: center; width: 20%">제목</th>
						<th
							style="background-color: #FAFAF0; text-align: center; width: 20%">작성자</th>
						<th
							style="background-color: #FAFAF0; text-align: center; width: 20%">작성일</th>
						<th
							style="background-color: #FAFAF0; text-align: center; width: 20%">거래상태</th>
					</tr>
				</thead>
				<%
					for (int i = 0; i < numPerPage; i++) {
						if (i == listSize)
							break;
						PersonalDonationBean bean = vlist.get(i);
						int personal_donation_id = bean.getPersonalDonationId();
						String userid = bean.getUserID();
						int pos = bean.getPos();
						String title = bean.getTitle();
						Date regdate = bean.getCreatedAt();	
						int count = bean.getCount();
						boolean donation_state = bean.getDonationState();
						String state;
						if (String.valueOf(donation_state) == "true")
							state = "O";
						else
							state = "X";
						if(pos !=0) state="";
			%>
				<tbody>
					<tr>
						<td align="center"><%=totalRecord - ((nowPage - 1) * numPerPage) - i%>
						</td>
						<td><a href="javascript:read('<%=personal_donation_id%>')"
							style="color: #000000;"><%=title%></a></td>
						<td align="center"><%=userid%></td>
						<td align="center"><%=regdate%></td>
						<td align="center"><%=state%></td>
					</tr>
				</tbody>
				<%
					}
				%>
				<%
					}
				%>
			</table>
		</div>
	</div>

	<!-- 글쓰기, 처음으로 -->
	<div>
		<div class="write-frm-btn container">
			<table style="border: 0; width: 100%;">
				<tr>
					<td style="text-align: right;">
					  <input type="button" value="글쓰기" onClick="location.href='personal_donation_write.jsp'">
					  <input type="button" value="처음으로" onClick="location.href='personal_donation.jsp'">
					</td>
				</tr>
				<tr>
					<td align="center">
						<!-- 페이징 및 블럭 처리 Start--> <%
 	int pageStart = (nowBlock - 1) * pagePerBlock + 1; //하단 페이지 시작번호
 	int pageEnd = ((pageStart + pagePerBlock) <= totalPage) ? (pageStart + pagePerBlock) : totalPage + 1;
 	//하단 페이지 끝번호
 	if (totalPage != 0) {
 		if (nowBlock > 1) {
 %> <a href="javascript:block('<%=nowBlock - 1%>')">prev...</a> <%
 	}
 %>&nbsp; <%
 	for (; pageStart < pageEnd; pageStart++) {
 %> <a href="javascript:pageing('<%=pageStart%>')"> <%
 	if (pageStart == nowPage) {
 %><font color="black"> <%
 	}
 %> [<%=pageStart%>] <%
 	if (pageStart == nowPage) {
 %></font> <%
 	}
 %></a> <%
 	} //for
 %>&nbsp; <%
 	if (totalBlock > nowBlock) {
 %> <a href="javascript:block('<%=nowBlock + 1%>')">.....next</a> <%
 	}
 %>&nbsp; <%
 	}
 %>
					</td>
					<!-- 페이징 및 블럭 처리 End-->
				</tr>
			</table>
		</div>
		
		&nbsp;
		<form name="searchFrm" method="get" action="personal_donation.jsp">
			<table align="center" width="600" cellpadding="4" cellspacing="0">
				<tr>
					<td align="center" valign="bottom"><select name="keyField"
						size="1">
							<option value="userID">이 름</option>
							<option value="title">제 목</option>
							<option value="content">내 용</option>
					</select> <input size="16" name="keyWord"> <input size="16"
						type="button" value="찾기" onClick="javascript:check()"> <input
						type="hidden" name="nowPage" value="1"></td>
				</tr>
			</table>
		</form>
		<form name="listFrm" method="post">
			<input type="hidden" name="reload" value="true"> <input
				type="hidden" name="nowPage" value="1">
		</form>
		<form name="readFrm" method="get">
			<input type="hidden" name="personal_donation_id"> <input
				type="hidden" name="nowPage" value="<%=nowPage%>"> <input
				type="hidden" name="keyField" value="<%=keyField%>"> <input
				type="hidden" name="keyWord" value="<%=keyWord%>">
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
