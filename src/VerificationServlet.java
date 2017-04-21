package com;
/*import com.mysql.jdbc.Driver;*/
import java.sql.*;

public class VerificationServlet
{
	public static boolean validate(String username, String password)
	{
		boolean status = false;
		try
		{

			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment?user=root&password=Gmail@123");
			String sql = "Select * from user_table where username = ? and password = ?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, username);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			status = rs.next();
		}
		catch(Exception e) {e.printStackTrace();}	
		return status;
	}

	public static boolean checkExistingUser(String username)
	{
		boolean status=false;
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment?user=root&password=Gmail@123");
			String sql = "Select * from user_table where username  = ?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, username);

			ResultSet rs = ps.executeQuery();
			status = (rs.next());
		}
		catch(Exception e) {e.printStackTrace();}
		return status;
	}
	
	public static boolean insertNewUser(String firstName, String lastName, String username, String password)
	{
		boolean status = false;
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment?user=root&password=Gmail@123");
			String sql = "insert into user_table (first_name, last_name, username, password) values ( ?, ?, ?, ?)";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, firstName);
			ps.setString(2, lastName);
			ps.setString(3, username);
			ps.setString(4, password);

			status =  (ps.execute());
		}
		catch(Exception e) {e.printStackTrace();}
		return status;
	}
}