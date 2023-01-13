<%@page import="com.sub.blog.dao.Reaction_DAO"%>
<%@page import="java.sql.Date"%>
<%@page import="com.sub.blog.dao.User_info_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
  
<%@page import="com.sub.blog.entities.User_info"%>
<%
	User_info userLoggedIn = (User_info) session.getAttribute("currentUser");
	if(userLoggedIn == null){
		response.sendRedirect("login.jsp");
	} 
	
	int blogID = Integer.parseInt(request.getParameter("blog_id"));
	
%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

        <!-- font awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- bootstrap 4 -->
        <link rel="stylesheet" href="vendor/css/bootstrap.css">
    
        <!-- custom css -->
        <link rel="stylesheet" href="assets/css/style.css">
        
        <style type="text/css">
        
/*         	.btn-interact{
        		background-color: white;
        		color: var(--def-col);
        		border: 1px solid var(--def-col);
        	}
        	
        	.btn-interact:active {
				background-color: var(--def-col);
				color:white;			
			}
			
			.btn-interact.interacted {
				background-color: var(--def-col);
				color:white;			
			}   */      
        </style>
</head>
<body>
	<%@include file="_partial/_navbar.jsp" %>

	
	<%
		Blog blog = bd.getBlogById(blogID);
		Category category = bd.getCategoryByid(blog.getCat_id());
		User_info_Dao udao = new User_info_Dao(ConnectionProvider.getConnection());
		User_info user = udao.getUserById(blog.getAuthor_id());
	%>

    <section id="full-blog">
        <div class="container">
            <div class="row">
                <div class="col-lg-9">
                    <div class="blog-head">
                        <p class="category-name"><%=category.getCat_name() %></p>
                        <h2 class="title"><%=blog.getTitle() %></h2>
                        <br>
                        <p class="d-flex justify-content-between align-items-center">
                        	<span class="author time">Author: <a href="profile.jsp?id=<%=blog.getAuthor_id()%>"><%=user.getName() %></a></span>
                        	<span class="time"> Published : <%=new Date(blog.getUpload_time().getTime()) %></span>
                        </p>
                        
                    </div>

                    <img class="blog-image" src="assets/blogImage/<%=blog.getImage() %>" alt="Blog Image">

                    <div class="blog-content">
                        <%=blog.getContent() %>
                    </div>
					
					<%
						Reaction_DAO red = new Reaction_DAO(ConnectionProvider.getConnection());
						int x = -1;						
						
						if((User_info) session.getAttribute("currentUser") != null){
							x = red.getUserReact(blog.getBlog_id(),Integer.parseInt(loggedUser.getUserId()));	
						}
						
					%>
                    <div class="blog-footer" style="padding: 0 80px; padding-bottom: 30px ;" >
                        <button  onclick="reaction(<%=blog.getBlog_id()%>,1,this)" class="btn <%if(x==1){out.print("interacted");} %> like-btn btn-interact btn-lg w-25"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> <span class="like-counter"><%=red.countLike(blog.getBlog_id()) %></span></button>
                        <button  onclick="reaction(<%=blog.getBlog_id()%>,0,this)" class="btn <%if(x==0){out.print("interacted");} %> dislike-btn btn-interact btn-lg w-25"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i> <span class="dislike-counter"><%=red.countDisLike(blog.getBlog_id()) %></span></button >
                        <button  class="btn primary-outline-bg btn-lg w-25"><i class="fa fa-comments-o" aria-hidden="true"></i> <span>10</span></button >
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="ad">Ad 300 x 200</div>
                    <div class="ad">Ad 300 x 200</div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-9">

                </div>
            </div>

        </div>
    </section>




    <script src="vendor/js/jquery.min.js"></script>
    <script src="vendor/js/popper.min.js"></script>
    <script src="vendor/js/bootstrap.min.js"></script>

    <!-- custom js here -->
    <script src="assets/js/app.js"></script>
</body>
</html>