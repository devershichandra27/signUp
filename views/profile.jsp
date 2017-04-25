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
  		<form action="profile-servlet" method="post"> 
      		<td>
      			<input type="text" class="form-control" name="collegename" placeholder="<%=session.getAttribute("collegename")%>">
  	  </td> <td></td>
		
    </tr>
    <tr>
      <th scope="row">Username</th>
      <td><%= request.getSession().getAttribute("username")%></td>
      <td> <a class="nav-link disabled" href="#"> Can't be changed </a> </td>
    </tr>
    <tr>
      <th scope="row">Nickname</th>
      <td>
      	<input type="text" class="form-control" name="nickname" placeholder="<%=request.getSession().getAttribute("nickname")%>">
  	  </td><td></td>
    </tr>
    <tr>
      <th scope="row">Country</th>
      <td>
      	<input type="text" class="form-control" name="country" placeholder="<%=request.getSession().getAttribute("country")%>">
  	  </td><td></td>
    </tr>
    <tr>
      <th scope="row">DOB</th>
      <td>
      	<input type="text" class="form-control" name="DOB" placeholder="<%=request.getSession().getAttribute("DOB")%>">
  	  </td>
  	  <td>YYYY-MM-DD format</td>
    </tr>
    <tr>
    <td></td>
    <td>
    	<button class="btn btn-primary btn-block" >Update</button>
    	</td><td></td>
    </tr>
    </form>
  </tbody>
</table>
</body>
</html>