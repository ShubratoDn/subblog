
<%@page import="java.util.ArrayList"%>
<%@page import="com.sub.blog.helpers.ConnectionProvider"%>
<%@page import="com.sub.blog.dao.Blog_DAO"%>
<%
	if((User_info)session.getAttribute("currentUser") == null){
		response.sendRedirect("login.jsp");
	}

%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write your blog</title>

	<!-- font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- bootstrap 4 -->
    <link rel="stylesheet" href="vendor/css/bootstrap.css">

    <!-- custom css -->
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
	<%@include file="_partial/_navbar.jsp" %>

	<div class="container">		
		<div class="jumbotron my-5">
			<h1 style="color: #564c4c; margin:  10px 0;">Write Your Blog Here</h1>
			<form action="" id="blog-form">
				
				<div class="form-group">
					<select class="form-control" name="category">
						<option selected disabled="disabled">--- Select Content Category ---</option>
						<%
							
							
							Blog_DAO bdW = new Blog_DAO(ConnectionProvider.getConnection());							
							ArrayList<Category> catListW= bd.getAllCategories();
							
							for(Category c : catList){
								%>
							<option value="<%= c.getCat_id()%>"><%=c.getCat_name() %></option>
								<%
							}
						%>					
					</select>
				</div>				
					
				<div class="form-group">
					<input type="text" name="blog-title" placeholder="Enter the blog title here" class="form-control">
				</div>
				
				<div class="form-group">
					<textarea style="height: 150px" name="blog-content" placeholder="Write the content here" class="form-control"></textarea>
				</div>
				
				<div class="form-group">
					<label for="fileInp">Select Image for your blog</label>
					<br>
					<input type="file" name="blog-img" id="fileInp" class="form-control">
				</div>
				
				<input type="submit" value="Upload Your Blog Now" class="btn btn-primary w-100 text-center mt-5" >
			
			</form>
		</div>	
	</div>


 	<script src="vendor/js/jquery.min.js"></script>
    <script src="vendor/js/popper.min.js"></script>
    <script src="vendor/js/bootstrap.min.js"></script>

	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- custom js here -->
    <script src="assets/js/main.js"></script>

	<script type="text/javascript">

		$(document).ready(function(){
			
			$("#blog-form").on("submit", function(event){
				event.preventDefault();
				
				let form = new FormData(this);
				
				$.ajax({
					url:"WriteBlog",
					type:"post",
					data:form,
					success: function(data, textStatus, jqXHR){
						if(data.trim() == "success" ){
							Swal.fire({
								  position: 'center',
								  icon: 'success',
								  title: 'Your blog is uploaded successfully!',
								  showConfirmButton: true
							}).then(function(value){
									window.location = "profile.jsp";
								});
						}else{
							Swal.fire({
							  icon: 'error',
							  title: 'Oops...',
							  text: data							  
							})
						}
					},
					error: function(jqXHR, textStatus, errorThrown){
						
					},
					processData: false,
					contentType: false
					//etar jonnoi MultiPart file (file gula) send korte pari server e
					//@MultipartConfig annotation use korte hobe class er upore					
				})			
				
				
			});
			
			
		});
	
	</script>


</body>
</html>