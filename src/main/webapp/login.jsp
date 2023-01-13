
<%	
	if(session.getAttribute("currentUser") != null){
		response.sendRedirect("index.jsp");
	}
%>

<%@page import="com.sub.blog.servlets.UserLogin"%>
<%@page import="com.sub.blog.helpers.ServerMessage"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login to SubBlog</title>

    <!-- font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- bootstrap 4 -->
    <link rel="stylesheet" href="vendor/css/bootstrap.css">

    <!-- custom css -->
    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>

	<%@include file="_partial/_navbar.jsp" %>


    <!-- login -->
    <main class="login-bg">
        <div class="container" style="height: 85vh; display: flex;justify-content: center; align-items: center;">
            <div class="col-lg-4 col-md-6 col-sm-9 col-10" >
                <form id="loginForm" action="UserLogin" method="post">                
                    <div class="card">
                        <div class="card-header primary-bg border-white">
                            <i class="fa fa-user-circle-o display-4 text-center d-block text-white"></i>
                            <h2 class="text-center text-light">Login Here</h2>
                            
                            
                            
                        </div>
                        <div class="card-body">                        
                       		<%
                       			//if there is any error
                       			String userInpEmail ;
                       			 userInpEmail = (String) session.getAttribute("loginInputEmail");
                           		ServerMessage sm = (ServerMessage) session.getAttribute("ServerMessage");
                           		if(sm != null){
                           			session.removeAttribute("ServerMessage");                           		
	                           		%>
		                           		<div class="alert <%= sm.getCssClass() %>" role="alert">
										  <%= sm.getContent() %>
										</div>
	                           		<% 
                           		}
                           		
                           	%>
                        	
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input value="<%if(userInpEmail != null){out.print(userInpEmail); session.removeAttribute("loginInputEmail"); }%>" type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with
                                    anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            </div>
                            <div class="form-group form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Remember me</label>
                            </div>
                            <button type="submit" class="btn btn-primary w-100 primary-outline-bg">Submit</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <script src="vendor/js/jquery.min.js"></script>
    <script src="vendor/js/popper.min.js"></script>
    <script src="vendor/js/bootstrap.min.js"></script>

    <!-- custom js here -->
    <script src="assets/js/main.js"></script>

    
    
</body>
</html>