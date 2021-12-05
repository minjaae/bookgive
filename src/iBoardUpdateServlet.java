import bookgive.InstitutionBoardMgr;
import bookgive.InstitutionDonationBean;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/iboardUpdate")
public class iBoardUpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter(); 

		InstitutionBoardMgr bMgr = new InstitutionBoardMgr();
		InstitutionDonationBean bean = (InstitutionDonationBean) session.getAttribute("bean");
		String nowPage = request.getParameter("nowPage");
		
		InstitutionDonationBean upBean = new InstitutionDonationBean();
		upBean.setInstitutionDonationId(Integer.parseInt(request.getParameter("num")));
		upBean.setUserID(request.getParameter("userID"));
		upBean.setTitle(request.getParameter("title"));
		upBean.setContent(request.getParameter("content"));
		upBean.setPass(request.getParameter("pass"));
		upBean.setDonationState(Boolean.parseBoolean(request.getParameter("donation_state")));

		String upPass = upBean.getPass();
		String inPass = bean.getPass();

		if (upPass.equals(inPass)) {
			bMgr.updateBoard(upBean);
			String url = "agency_donation_read.jsp?nowPage=" + nowPage + "&institutionDonationId=" + upBean.getInstitutionDonationId();
			response.sendRedirect(url);
		} else {
			out.println("<script>");
			out.println("alert('입력하신 비밀번호가 아닙니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}
}