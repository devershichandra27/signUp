import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.ServletException;

import java.io.PrintWriter;
import java.io.IOException;

public class Logout extends HttpServlet
{
	public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out = response.getWriter();
		request.getSession(false).invalidate();
		out.println("Logout Successful");
		// request.getRequestDispatcher("/signUp").include(request, response);
		response.sendRedirect("/signUp");
	}
}