import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class Profile extends HttpServlet
{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.getRequestDispatcher("/profile").include(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String username = (String) request.getSession().getAttribute("username");
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment?user=root&password=Gmail@123");
			String collegeInput = (String) request.getParameter("collegename");
			request.getSession().setAttribute("collegename", collegeInput);
			String nickname = (String) request.getParameter("nickname");
			request.getSession().setAttribute("nickname", nickname);
			String dob = (String)request.getParameter("DOB");
			request.getSession().setAttribute("DOB", dob);
			String country = (String) request.getParameter("country");
			request.getSession().setAttribute("country", country);

			String sql = "update user_table set college_name = ?, nick_name = ?, date_of_birth = ?,country = ? where username = ?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, collegeInput);
			ps.setString(2, nickname);
			ps.setString(3, dob);
			ps.setString(4, country);
			ps.setString(5, username);

			ps.executeUpdate();
			// PrintWriter out = response.getWriter();
			// out.println("Successfully Updated");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally {
			request.getRequestDispatcher("/profile").include(request,response);
		}
	}
}