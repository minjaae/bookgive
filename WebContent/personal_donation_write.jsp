<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>	
<%@ page import="java.io.PrintWriter"%>
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

<title>개인 기부 게시판 글쓰기</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<nav>
		<div class="icon container" style="cursor: pointer;" onclick="location.href='login.jsp';">
			<i class="fas fa-sign-in-alt"></i>
		</div>
		<%
			if(id != null){
		%>
		<div align="right"> 
        	<strong><%=id%></strong>님이 로그인 하셨습니다.&nbsp;&nbsp; </div>
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
		<div>
			<form name="postFrm" method="post" action="PDWrite" enctype="multipart/form-data">
				<table
					style="text-align: center; border: 1px solid #dddddd; width: 72%; margin-left: 14%;">
					<thead>
					</thead>
					<tbody>
						<tr>
							<th colspan="2"
								style="background-color: #FAFAF0; text-align: center; width: 100%;">개인
								기부 게시판 책 등록</th>
						</tr>
						<tr>
						
							<td>
							<input type="text" placeholder="책 제목을 입력해주세요." name="title" maxlength="30"
								style="width: 100%; margin-top: 1rem; border-color: #537755; border-style: solid;"></td>
						</tr>
						<tr>
							<td><textarea placeholder="책의 상태를 자세히 작성해주세요." name="content"
									maxlength="2048"
									style="width: 100%; height: 350px; margin-top: 1rem; border-color: #537755; resize: none;"></textarea></td>
						</tr>
						<tr>
							<td>책 상태 <input type="text" placeholder="" name="book_status"
								maxlength="30" 
								style="width: 60%; margin-left : 1rem; margin-top: 1rem; border-color: #537755; border-style: solid;"></td>
						</tr>
						<tr>
							<td>비밀번호<input type="password" name="pwd"  maxlength="30" 
								style="width: 60%; margin-left : 1rem; margin-top: 1rem; border-color: #537755; border-style: solid;"></td>
						</tr>
						<tr>
     						<td>파일 찾기<input type="file" name="filename" size="50" maxlength="30" 
								style="width: 60%; margin-left : 1rem; margin-top: 1rem;"></td>
    					</tr>
    					<tr>
    						<td colspan="2" align = "center">
						 		<input type="submit" value="등록">
						 		<input type="reset" value="다시쓰기">
						 		<input type="button" value="리스트" onClick="javascript:location.href='personal_donation.jsp'">
							</td>
						</tr>
					</tbody>
					<tr>
				</table>
				<input type="hidden" name="userID" value="<%=id%>">
			</form>
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
