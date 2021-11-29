package bookgive;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookgive.PersonalDonationMgrPool;


@WebServlet("/PDWrite")
public class PersonalDonationWriteServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			PersonalDonationMgrPool bMgr = new PersonalDonationMgrPool();
			bMgr.insertBoard(request);
			response.sendRedirect("personal_donation.jsp");
	}

}
