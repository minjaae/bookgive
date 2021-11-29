<%@page contentType="application; charset=EUC-KR"%>
<jsp:useBean id="PD" class="bookgive.PersonalDonationMgrPool" />
<%
	  PD.downLoad(request, response, out, pageContext);
%>