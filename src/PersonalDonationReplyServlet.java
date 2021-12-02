import bookgive.PersonalDonationMgrPool;
import bookgive.PersonalDonationBean;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("PDReply")
public class PersonalDonationReplyServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		PersonalDonationMgrPool bMgr = new PersonalDonationMgrPool();
		PersonalDonationBean reBean = new PersonalDonationBean();
		reBean.setUserID(request.getParameter("userID"));
		reBean.setTitle(request.getParameter("title"));
		reBean.setContent(request.getParameter("content"));
		reBean.setRef(Integer.parseInt(request.getParameter("ref"))); 
		reBean.setPos(Integer.parseInt(request.getParameter("pos"))); 
		reBean.setDepth(Integer.parseInt(request.getParameter("depth"))); 
		reBean.setPWD(request.getParameter("pwd"));

		bMgr.replyUpBoard(reBean.getRef(), reBean.getPos());
		bMgr.replyBoard(reBean);
		
		String nowPage = request.getParameter("nowPage");
		response.sendRedirect("personal_donation.jsp?nowPage="+nowPage);
	}
}