import javax.servlet.http.*;
import java.io.*;

import com.VerificationServlet;

public class Register extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();


		String username = request.getParameter("username");
		String password = request.getParameter("password");
		/*String password2 = request.getParameter("confirmPassword");*/

		if(VerificationServlet.checkExistingUser(username))
		{
			out.println("Username already exists");
		}
		else
		{
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			VerificationServlet.insertNewUser(firstName, lastName, username, password);
			out.println("Account Created.");
		}

	}
}