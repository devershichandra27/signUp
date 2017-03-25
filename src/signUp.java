import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class signUp extends HttpServlet
{
	public static final String username ="root";
	public static final String password = "Gmail@123";
	
	public static boolean validate(String username, String password)
	{
		boolean status = false;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/assignment", username, password);

			String sql = "Select * from user_table where username = ? and password = ?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, username);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			status = rs.next();
		}
		catch(Exception e){System.out.println(e);}
		return status;
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		if(validate(username, password))
		{
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("Welcome");
			requestDispatcher.forward(request, response);
		}
		else
		{
			out.println("Sorry incorrect username or password");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("signUp.html");
			requestDispatcher.include(request, response);
		}
		out.close();
	}
}