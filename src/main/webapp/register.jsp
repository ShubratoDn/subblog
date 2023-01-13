<%@page import="com.sub.blog.servlets.Registration"%>
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

	<!-- including navbar -->
	<%@include file="_partial/_navbar.jsp" %>	

	<% String x = request.getParameter("name"); %>
	
	<script type="text/javascript">
	
	<%-- alert("<%=x%>"); --%>
		
	</script>
	
    <!-- Register Form -->
    <main class="register-bg">
        <div class="reg-des-top"></div>
        <div class="reg-des-bottom"></div>
        <div class="container d-flex justify-content-center align-items-center" style="padding: 30px 0;">
            <div class="col-lg-4 col-md-6 col-sm-9 col-10">
                <form id="register-form" action="Register" method="post">
                    <div class="card">
                        <div class="card-header primary-bg border-white">
                            <i class="fa fa-user-plus display-4 text-center d-block text-white"></i>
                            <h2 class="text-center text-light"> Register Now, <%= x %></h2>
                        </div>                   
                        
                        <div class="card-body" id="reg-body">
                            <div class="form-group">
                                <label for="exampleInputName">User Name</label>
                                <input type="text" name="name" class="form-control" id="exampleInputName"
                                    placeholder="Your Name">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" name="email" class="form-control" id="exampleInputEmail1"
                                    aria-describedby="emailHelp" placeholder="Enter email">
                                <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with
                                    anyone else.</small> -->
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" name="password" class="form-control" id="exampleInputPassword1"
                                    placeholder="Password">
                            </div>
                            <div class="form-group">
                                <label>Gender</label>
                               <div class="d-flex">
                                    <div class="form-check col-6">
                                        <input class="form-check-input" type="radio" name="gender" value="male" id="exampleRadios1"
                                            value="option1" checked>
                                        <label class="form-check-label" for="exampleRadios1">
                                            Male
                                        </label>
                                    </div>
                                    <div class="form-check col-6"> 
                                        <input class="form-check-input" type="radio" name="gender" value="female" id="exampleRadios2"
                                            value="option2">
                                        <label class="form-check-label" for="exampleRadios2">
                                            Female
                                        </label>
                                    </div>
                               </div>
                            </div> 
                            <div class="form-group">
                                <textarea name="about" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Write something about you..."></textarea>
                              </div>
                            <!-- /check box -->
                            <div class="form-group form-check">
                                <input type="checkbox" name="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Accept all terms and
                                    conditions</label>
                            </div>
                            
                            <input id="subBtn" type="submit" class="btn btn-primary w-100 primary-outline-bg" value="Register Now">
                                                    
                       		<!-- wating laoder -->
	                       <div id="waiting" style="width: fit-content; display: none; margin: 20px auto; text-align:center">
		                       	<i class="fa fa-spinner fa-spin fa-4x" aria-hidden="true"></i>
		                       	<p>Loading...</p>
	                       </div>    
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
    
    <!-- sweet alert js -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    
    <script type="text/javascript">
		
    	$(document).ready(function(){
    		
    		console.log("Loaded all file...");		

    		
    		$('#register-form').on('submit', function(event){
    			event.preventDefault();
    		
    			//this mane hocche #register-form id tar tag ta 
    			let form = new FormData(this);
    			
    			
   				$("#waiting").show();
       			$("#subBtn").hide();
    			
    			
    			//etar object contain kore
    			$.ajax({
    				url: "Register", // action er url ta
    				type: "post",
    				data: form,
    				success: function(data, textStatus, jqXHR){
    					
    	    			setTimeout(function(){
    	    				$("#waiting").hide();
        	    			$("#subBtn").show();
    	    			}, 1000);
    	    			
    	    			if(data.trim() == "success"){    	    				
    	    				swal("Congratulations!", "Successfully Registered", "success").
    	    				then((value) => {
   	    	    			  window.location = "login.jsp";
   	    	    			});
    	    			}else{
    	    				swal(data);
    	    			}   	    			
    	    			
    				},
    				error: function(jqXHR, textStatus, errorThrown){
    					
    				},
    				processData: false,
    				
    				contentType: false //etar mane: ami janate chai na ki type content ami send kortesi server a
    				//N.B: @MultipartConfig anotation lagate hobe jei servlet a first a data send hocche sekhane
    				
    			});
    			
    		});
    		
    	});
     		
    </script>
    
</body>
</html>