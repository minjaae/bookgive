import bookgive.InstitutionBoardMgr;
import bookgive.InstitutionDonationBean;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("iboardReply")
public class iBoardReplyServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		InstitutionBoardMgr bMgr = new InstitutionBoardMgr();
		InstitutionDonationBean reBean = new InstitutionDonationBean();
		reBean.setUserID(request.getParameter("userID"));
		reBean.setTitle(request.getParameter("title"));
		reBean.setContent(request.getParameter("content"));
		reBean.setRef(Integer.parseInt(request.getParameter("ref"))); 
		reBean.setPos(Integer.parseInt(request.getParameter("pos"))); 
		reBean.setDepth(Integer.parseInt(request.getParameter("depth"))); 
		reBean.setPass(request.getParameter("pass"));

		bMgr.replyUpBoard(reBean.getRef(), reBean.getPos());
		bMgr.replyBoard(reBean);
		
		String nowPage = request.getParameter("nowPage");
		response.sendRedirect("agency_donation.jsp?nowPage="+nowPage);
	}
}