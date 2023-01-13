<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shubrato's Blog is here!</title>


    <!-- font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- bootstrap 4 -->
    <link rel="stylesheet" href="vendor/css/bootstrap.css">
    
    <!-- custom css -->
    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>

	<!-- including jsp page -->	
	<%@include file="_partial/_navbar.jsp" %>
	

	<!--  -->
	    <section >
	        <div class="row">
	            <div class="col-lg-3 primary-bg p-0">
	                <div class="category-list">
	                    <ul>
	                     	<li onclick="getBlogs(-1, this)"><a href="#">All Blogs</a></li>
	                     	<li onclick="getBlogs(0, this)"><a href="#">Recent Blogs</a></li>
	                    	<%
	                    		for(Category cat : catList){		
	                    	%>
	                        <li onclick="getBlogs(<%=cat.getCat_id()%>, this)"><a href="#"><%=cat.getCat_name() %></a></li>	                      
	                        <%
	                    		}
	                        %>
	                    </ul>
	                </div>
	            </div>
	            <div class="col-lg-9">
	                <div class="path">
<!-- 	                    <i class="fa fa-home"></i> <a href="index.html">Home</a> > Java -->
	                </div>
	
	                <div class="show_blogs">
	                	<div id="blog-loader" style="text-align: center"><i class="fa fa-spinner fa-spin fa-4x" aria-hidden="true"></i></div>
	                    <div id="blogs-container">
		                    <div class="row">
		                        <!-- a carrd -->
		                        <div class="col-lg-3 col-md-4 col-sm-6 pt-3 col-12">
		                            <div class="card">
		                                <img class="card-img-top" src="assets/blogImage/image.jpg" alt="Card image cap">
		                                <div class="card-body">
		                                    <h5 class="in-blog-title">Card title</h5>
		                                    <p class="in-blog-content">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
		                                    <a href="#" class="btn btn-primary-bg btn-sm">Read More...</a>
		                                    <a href="#" class="btn btn-primary-bg btn-sm"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> <span>10</span></a>
		                                    <a href="#" class="btn btn-primary-bg btn-sm"><i class="fa fa-comments-o" aria-hidden="true"></i> <span>10</span></a>
		                                </div>
		                            </div>
		                        </div>	                        
		                    </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>

    <script src="vendor/js/jquery.min.js"></script>
    <script src="vendor/js/popper.min.js"></script>
    <script src="vendor/js/bootstrap.min.js"></script>

    <!-- custom js here -->
    <script src="assets/js/app.js"></script>
    
    <script type="text/javascript">
    	
    	function getBlogs(cat_id, thisComponent){
    		$(".category-list ul li").removeClass("active");
    		
    		$("#blog-loader").show();
    		$("#blogs-container").hide();
    		$.ajax({
    			url: "blogs.jsp",
    			data: {catId : cat_id}, //catId ta link er maddhome send kortesi
    			success: function(data, textstatus, janina){
    				$("#blog-loader").hide();
    				$("#blogs-container").show();
    				$("#blogs-container").html(data);
    				$(thisComponent).addClass("active");
    			}
    		});
    	}
    
    	$(document).ready(function(e){    
    		let x = $(".category-list ul li")[0];
    		getBlogs(-1,x);
    	});
    </script> 
   
</body>
</html>