<%@page import="com.sub.blog.helpers.ServerMessage"%>
<%@page import="com.sub.blog.entities.User_info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	User_info currUser = (User_info)session.getAttribute("currentUser");
	
	if(currUser == null){
		response.sendRedirect("login.jsp");
	}else{
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile</title>
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


		input, textarea{
			outline: none;
			padding: 3px 10px;
			border-radius:  5px;
			border-color: #ccc;
			border-style: solid;		
		}
		
		input:focus {
			border-color: red;
		}

		/* image selection section */
		.img-selection{
			width:300px;
			height:300px;
			
			position: relative;
		}
		
		#FileInput{
			position: absolute;
			left:0;
			top:0;
			background: transparent;
			opacity: 0;
		    height: 100%;
		    width: 100%;
		    border-radius: 50%;		
		}
		
		.user-image{
			width:300px; 
			height: 300px;
			object-fit: cover;
			border: 1px solid #c5c5c5;
			border-radius: 54%;
			padding: 10px;
		}
		
		#imgSelectionMsg{
			position: absolute;
			top: 0;
			left:0;
			color: white;
			border-radius: 50%;
			height: 100%;
			width: 100%;
			background-color: #2b3d48e6;
			display: flex;
			justify-content: center;
			align-items:  center;
			font-size: 20px;
			opacity: 0;
			transition: all .5s;
		}
		
		.img-selection:hover #imgSelectionMsg{			
			opacity: 1;
		}
		
		#imgSelectionMsg.imgSelected {
			background-color: black;
			opacity: 1;
		}
		.alert-success{	
			color: #155724 !important;
		}
		
		.alert-danger {
		    color: #721c24 !important;		
		}
		
	</style>

</head>
<body class="primary-bg">

	<%@include file="_partial/_navbar.jsp" %>

	<form method="post" action="UpdateProfile" enctype="multipart/form-data">
	<div class="container">
		<div class="profile-box">
			<div class="row">
				<div class="col-lg-4">
					<div class="img-selection m-3">
						<img alt="User Image" src="assets/userImage/<% out.print(currUser.getUserImg());%>" class="image-fluid user-image">
						<p id="imgSelectionMsg">Click to Select Image</p>
						<input type="file" id="FileInput" name="userImage">
					</div>
				</div>				
				<div class="col-lg-8 user-info">
				
					<%
						ServerMessage sm = (ServerMessage) session.getAttribute("ServerMessage");
						if(sm!=null){						
						
					%>
					<!-- Alert message  -->
					<div class="alert <%=sm.getCssClass() %>" role="alert">
					  <%=sm.getContent() %>
					</div>
					
					<% 
						session.removeAttribute("ServerMessage");
						}					
					%>
						<table>
							<tr class="u-name">
								<td> <input name="name" type="text" value="<%= currUser.getName() %>" id="upNameId"> <label for="upNameId"><i class="fa fa-pencil" aria-hidden="true"></i></label> </td>							
							</tr>
							<tr>
								<td>User Email  </td>
								<td> <input name="email" type="text" value="<%= currUser.getEmail() %>" id="upEmailId"> <label for="upEmailId"><i class="fa fa-pencil" aria-hidden="true"></i></label> </td>
							</tr>
							<tr>
								<td>Gender  </td>
								<td> 
									<input <%if(currUser.getGender().toLowerCase().equals("male"))out.print("checked"); %> name="gender" type="radio" value="Male" id="upGenMaleId"> <label for="upGenMaleId">Male</label>
									<input <%if(currUser.getGender().toLowerCase().equals("female"))out.print("checked"); %> name="gender" type="radio" value="Female" id="upGenFemId"> <label for="upGenFemId">Female</label>									
								</td>
							</tr>
							<tr>
								<td>About </td>
								<td>
									<textarea name="about" rows="2" cols="30" id="upAboutId"><%= currUser.getAbout() %></textarea>
									<label for="upAboutId"><i class="fa fa-pencil" aria-hidden="true"></i></label>
								</td>
							</tr>
							<tr>
								<td>Registration Date  </td>
								<td><%= currUser.getReg_date()%></td>
							</tr>
							
							<tr>
								<td>Current Password :</td>
								<td> 
									<input type="password" name="old-pass" placeholder="Enter Current Password">									
								</td>
							</tr>
							
							<tr>
								<td>New Password :</td>
								<td> 
									<input type="password" name="new-pass" placeholder="Enter New Password">									
								</td>
							</tr>																						
						</table>
						
						<!-- Edit profile -->
						<input type="submit" value="Update profile" class="btn btn-primary mt-4 d-block w-5" >												
				</div>				
			</div>
		</div>		
	</div>
	</form>
	<%} %>
	
    <script src="vendor/js/jquery.min.js"></script>
    <script src="vendor/js/popper.min.js"></script>
    <script src="vendor/js/bootstrap.min.js"></script>

    <!-- custom js here -->
    <script src="assets/js/main.js"></script>
	
	<script type="text/javascript">
		var file = document.querySelector("#FileInput");
		var fileMsg =  document.querySelector("#imgSelectionMsg");
		file.onchange = function(){
			fileMsg.classList.add("imgSelected");
			fileMsg.innerHTML = ""+ file.value;
		};		
		
	
	</script>
	
	
</body>
</html>