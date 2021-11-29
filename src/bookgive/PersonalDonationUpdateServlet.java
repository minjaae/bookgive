package bookgive;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/bookgive/PDUpdate")

public class PersonalDonationUpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter(); 

		PersonalDonationMgrPool pd = new PersonalDonationMgrPool();
		PersonalDonationBean bean = (PersonalDonationBean) session.getAttribute("bean");
		String nowPage = request.getParameter("nowPage");
		
		PersonalDonationBean upBean = new PersonalDonationBean();
		upBean.setPersonalDonationId(Integer.parseInt(request.getParameter("personal_donation_id")));
		upBean.setUserID(request.getParameter("userID"));
		upBean.setTitle(request.getParameter("title"));
		upBean.setContent(request.getParameter("content"));
		upBean.setPWD(request.getParameter("pwd"));

		String upPass = upBean.getPWD();
		String inPass = bean.getPWD();

		if (upPass.equals(inPass)) {
			pd.updateBoard(upBean);
			String url = "personal_donation_read.jsp?nowPage=" + nowPage + "&personal_donation_id=" + upBean.getPersonalDonationId();
			response.sendRedirect(url);
		} else {
			out.println("<script>");
			out.println("alert('입력하신 비밀번호가 아닙니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}
}