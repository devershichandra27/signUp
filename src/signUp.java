import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import com.VerificationServlet;

public class signUp extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		// String sql = "Select * from user_table where username = ? and password = ?";

		if(VerificationServlet.validate(username, password))
		{	
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/welcome");
			requestDispatcher.forward(request, response);
		}
		else
		{
			//out.println("Sorry incorrect username or password " + username + " " + password);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("signUp.html");
			requestDispatcher.include(request, response);
		}
		out.close();
	}
}