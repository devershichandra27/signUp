<%@page import = "java.sql.DriverManager"%>
<%@page import = "java.sql.ResultSet"%>
<%@page import = "java.sql.PreparedStatement"%>
<%@page import = "java.sql.Connection"%>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
</head>
<%! String first_name; %>
<%
	String username = (String)session.getAttribute("username");
	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment?user=root&password=Gmail@123");
		String sql = "Select * from user_table where username = ?";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, username);

		ResultSet rs = ps.executeQuery();
		rs.next();
		first_name = rs.getString("first_name");
		session.setAttribute("firstName", first_name);
		session.setAttribute("lastName", rs.getString("last_name"));
		session.setAttribute("nickname", rs.getString("nickname"));
		session.setAttribute("collegename", rs.getString("college_name"));
		session.setAttribute("country", rs.getString("country"));
		session.setAttribute("DOB", rs.getString("date_of_birth"));
	}
	catch (Exception e) {e.printStackTrace();}



%>
<body>
	<div class="jumbotron">
  <h1 class="display-3">Hello, <%= first_name  %></h1>
  <p class="lead">This is your home page. We wish you have amazing experience ahead.
  <hr class="my-2">
  <p>To continue click on the button below to update your profile.</p>
  <p class="lead">
  </p>
    <a class="btn btn-primary btn-lg"   role="button" href="profile">Update Profile</a>
</div>
</body>
</html>
