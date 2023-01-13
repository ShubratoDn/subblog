<%@page import="com.sub.blog.dao.User_info_Dao"%>
<%@page import="com.sub.blog.entities.User_info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@page errorPage="error.jsp" %> --%>
<%
	User_info currUser = null;	
	int userID;
	
	if(request.getParameterMap().containsKey("id")){
		userID = Integer.parseInt(request.getParameter("id"));
		
		User_info_Dao udao = new User_info_Dao(ConnectionProvider.getConnection());
		currUser = udao.getUserById(userID);
	}else{
		currUser = (User_info)session.getAttribute("currentUser");
		if(currUser == null){
			response.sendRedirect("login.jsp");
		}
	}	
	
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
    <!-- font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- bootstrap 4 -->
    <link rel="stylesheet" href="vendor/css/bootstrap.css">

    <!-- custom css -->
    <link rel="stylesheet" href="assets/css/style.css">

	<style>
		.profile-box{
			border: 1px solid transparent;
			border-radius: 10px;
			background-color: white;
			height: auto;
			width: 100%;
			margin-top: 20px;
			padding: 20px;
		}	

	
		.user-image{
			width:300px; 
			height: 300px;
			object-fit: cover;
			border: 1px solid #c5c5c5;
			border-radius: 54%;
			padding: 10px;
		}
		
		.font-bold{
			font-weight: bold;
		}
		
		.user-info td{
			color:  #544e4e ;
			font-size: 20px;
		}
		
		.user-info .u-name td{
			font-size: 30px ;
		}
		
		.user-info .u-name td{
			width: fit-content;
		}

		td:first-child{
			width: 150px ;
			font-weight: bold;
		}
		
		tr{
			display: flex;
			margin-bottom: 16px; 
		}
		
		#user-blogs{
			background: white; 
			border-radius: 10px;
			padding: 20px 15px; 
			margin: 50px 0;
		}

	</style>

</head>
<body class="primary-bg">

	<%@include file="_partial/_navbar.jsp" %>

	<div class="container">
		<div class="profile-box">
			<%
				//eta korlam exception ashar jonno; Jeno page the redirect hote pare
				//exception ashlei 'error' taglib kaj korbe
				currUser.getName();
			
				if(currUser!=null){			
			%>		
			<div class="row">
				<div class="col-lg-4">
					<img alt="User Image" src="assets/userImage/<%= currUser.getUserImg()%>" class="image-fluid user-image">
				</div>				
				<div class="col-lg-8 user-info">					
					<table>
						<tr class="u-name">
							<td ><%= currUser.getName()%></td>							
						</tr>
						<tr>
							<td>User Email  </td>
							<td><%= currUser.getEmail()%></td>
						</tr>
						<tr>
							<td>Gender  </td>
							<td><%= currUser.getGender()%></td>
						</tr>
						<tr>
							<td>About </td>
							<td><%= currUser.getAbout()%></td>
						</tr>
						<tr>
							<td>Registration Date  </td>
							<td><%= currUser.getReg_date()%></td>
						</tr>					
					</table>
					
					<%
						if(!request.getParameterMap().containsKey("id")){
							%>
					<!-- Edit profile -->
					<a class="btn btn-primary mt-4" href="update.jsp">Edit profile</a>
							<%
						}
					%>			
										
				</div>				
			</div>
			<%
				}
			%>
		</div>		
	</div>
	
	
<!-- Showing all blogs of this author -->
	<div class="container">
		<div id="user-blogs">
			<h1 class="text-dark pt-3"><%=currUser.getName()+"'s"%> Blogs</h1>
			<hr>
			<div class="row">		
			<%
				ArrayList<Blog> blogs =	bd.getBlogsByAuthorID(Integer.parseInt(currUser.getUserId()));
				for(Blog blog: blogs){				
					String content = blog.getContent().substring(0,100);
			%>
			<!-- a card -->
	            <div class="col-lg-4 col-md-6 col-sm-6 pt-3 col-12">
	                <div class="card">
	                    <img class="card-img-top blog-img" src="assets/blogImage/<%=blog.getImage()%>" alt="Card image cap">
	                    <div class="card-body">
	                    	<p class="blog-info"><a href="profile.jsp?id=<%=blog.getAuthor_id()%>"><%=currUser.getName()%></a> <span>May 23, 2022</span></p>
	                        <h5 class="text-dark"><%=blog.getTitle() %></h5>
	                        <p class="text-muted text-justify">
	                        	<%=content %>...
	                        </p>
	                        <a href="blog.jsp?blog_id=<%=blog.getBlog_id() %>" class="btn btn-primary-bg btn-sm">Read More...</a>
	                        <a href="#" class="btn btn-primary-bg btn-sm"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> <span>10</span></a>
	                        <a href="#" class="btn btn-primary-bg btn-sm"><i class="fa fa-comments-o" aria-hidden="true"></i> <span>10</span></a>
	                    </div>
	                </div>
	            </div>
            <%
				}//end of for loop	
            %>
			</div>
	
		</div>
	</div>
	
	
    <script src="vendor/js/jquery.min.js"></script>
    <script src="vendor/js/popper.min.js"></script>
    <script src="vendor/js/bootstrap.min.js"></script>

    <!-- custom js here -->
    <script src="assets/js/app.js"></script>
	
</body>
</html>