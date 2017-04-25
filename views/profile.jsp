<%@page import = "java.sql.DriverManager"%>
<%@page import = "java.sql.ResultSet"%>
<%@page import = "java.sql.PreparedStatement"%>
<%@page import = "java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
	<title>Profile Page</title>
	<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
</head>
<body>
	<nav class="navbar sticky-top navbar-inverse bg-primary">
	<!-- <a  href="#" style="color:#FFFFFF; font-size: 25px;" align="right">Profile</a> -->
  	<a  href="logout" style="color:#FFFFFF; font-size: 25px;" align="right">Logout</a>
	</nav>
	<div class="jumbotron">
  <h1 class="display-3">Hello, <%= request.getSession().getAttribute("firstName")  %></h1>
  <p class="lead">This is your profile page. Edit your info here, that you want to share with your friends.</p>
  </div>
	<table class="table table-hover">
  <tbody>
    <tr>
      <th scope="row">First Name</th>
      <td> <%= request.getSession().getAttribute("firstName") %> </td> 
      <td> <a class="nav-link disabled" href="#" > Can't be Changed </a> </td>
    </tr>
    <tr>
      <th scope="row">Last Name</th>
      <td><%= request.getSession().getAttribute("lastName") %></td>
      <td> <a class="nav-link disabled" href="#"> Can't be Changed </a> </td>
    </tr>
    <tr>
      <th scope="row">College</th>
      <form action="profile" method="post"> 
      <td>
      	<input type="text" class="form-control" name="collegename" placeholder="<%=request.getSession().getAttribute("collegename")%> ">
  	  </td>
  	  <td>
  	  	<button type="submit" class="btn btn-primary btn-lg"> Change 
  	  					</button>  
		</td>
		</form>
    </tr>
    <tr>
      <th scope="row">Username</th>
      <td><%= request.getSession().getAttribute("username")%></td>
      <td> <a class="nav-link disabled" href="#"> Can't be changed </a> </td>
    </tr>
    <tr>
      <th scope="row">Nickname</th>
      <form action="profile" method="post"> 
      <td>
      	<input type="text" class="form-control" name="nickname" value="<%=request.getSession().getAttribute("nickname")%>">
  	  </td>
  	  <td>
  	  	<button type="submit" class="btn btn-primary btn-lg" onclick="<% request.getSession().setAttribute("nickname", request.getParameter("nickname")); %>" > Change 
  	  					</button>  
		</td>
		</form>
    </tr>
    <tr>
      <th scope="row">DOB</th>
      <form action="profile" method="post"> 
      <td>
      	<input type="text" class="form-control" name="DOB" value="<%=request.getSession().getAttribute("DOB")%>">
  	  </td>
  	  <td>
  	  	<button type="submit" class="btn btn-primary btn-lg" onclick="<% request.getSession().setAttribute("DOB", request.getParameter("DOB")); %>" > Change 
  	  					</button>  
		</td>
		</form>
    </tr>
  </tbody>
</table>
</body>
</html>