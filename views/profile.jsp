<!DOCTYPE html>
<html>
<head>
	<title>Profile Page</title>
	<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
</head>
<body>
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
      <td> <input type="text" class="form-control" name="collegename" value="<%=request.getSession().getAttribute("collegename")%>">
  		 </td>
      <td> <a class="nav-link" href="#" > Change </a> </td>
    </tr>
    <tr>
      <th scope="row">Username</th>
      <td><%= request.getSession().getAttribute("username")%></td>
      <td> <a class="nav-link disabled" href="#"> Can't be changed </a> </td>
    </tr>
    <tr>
      <th scope="row">Nickname</th>
      <td>
      	<input type="text" class="form-control" name="nickname" value="<%=request.getSession().getAttribute("nickname")%>">
      </td>
      <td> <a class="nav-link" href="#"> Change </a> </td>
    </tr>
    <tr>
      <th scope="row">DOB</th>
      <td>
      	<input type="text" class="form-control" name="DOB" value="<%=request.getSession().getAttribute("DOB")%>">
      </td>
      <td> <a class="nav-link" href="#"> Change </a> </td>
    </tr>
  </tbody>
</table>
</body>
</html>