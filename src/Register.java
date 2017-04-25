import javax.servlet.http.*;
import java.io.*;
import javax.servlet.*;

import com.VerificationServlet;

public class Register extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,  IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();


		String username = request.getParameter("username");
		String password = request.getParameter("password");
		/*String password2 = request.getParameter("confirmPassword");*/

		if(VerificationServlet.checkExistingUser(username))
		{
			out.println("Username already exists");
			request.getRequestDispatcher("/register").include(request, response);
		}
		else
		{
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			VerificationServlet.insertNewUser(firstName, lastName, username, password);
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("firstName", firstName);
			session.setAttribute("lastName", lastName);
			out.println("Account Created.");
			request.getRequestDispatcher("/home").include(request, response);
		}

	}
}