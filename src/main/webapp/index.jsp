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

	<!-- owl carousel desgin -->
    <link rel="stylesheet" href="vendor/css/owl.carousel.min.css">
    <link rel="stylesheet" href="vendor/css/owl.theme.default.min.css">



    <!-- custom css -->
    <link rel="stylesheet" href="assets/css/style.css">
    
    <style type="text/css">
    	
    	.experiment{
    		writing-mode: vertical-lr;
    		padding: 100px 00px;
    		display: block;    		
    	}
    	
    	#hero .container{
    		display: flex;
    		justify-content: center;
    		align-items: center;
    		gap: 10px;		
    	}
    </style>
    
</head>

<body>

	<!-- including jsp page -->	
	<%@include file="_partial/_navbar.jsp" %>
	

    <!-- hero section started designing here -->
    <section id="hero" class="primary-bg">
        <div class="container py-5">
            <a href="writeBlog.jsp" class="experiment btn btn-light px-3 mr-4"> <i class="fa fa-plus fa-spin mr-2" aria-hidden="true"></i> Write a Blogs now!</a>
            <div>
	            <h1 class="display-3 mb-4 text-center">Welcome to SubBlog</h1>
	            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima quos quam hic, explicabo quia iste. Rem quasi fuga asperiores dolorum. Repudiandae at laudantium quam dolorem vitae optio ipsa pariatur ad!</p>
	            <p class="mb-5">Lorem ipsum dolor sit amet consectetur adipisicing elit. Nesciunt, voluptatem quis? Consequuntur eius quasi nesciunt magni esse veniam hic sed. Lorem ipsum dolor, sit amet consectetur adipisicing elit. Iste minima, velit accusantium officia perferendis ut voluptate tempora commodi? Praesentium dolores corporis quo possimus neque voluptates voluptatum doloribus cumque, cupiditate quisquam.</p>            	
            </div>
            <a href="login.jsp" class="experiment  btn btn-light px-4 primary-outline-bg"> <i class="fa fa-user-circle  mr-2" aria-hidden="true"></i>Login</a>
        </div>
    </section>

 	
    <!-- blog category -->
    <section id="blog-categories">
        <div class="container">
            <div class="title text-center fa-3x mt-5 mb-3">Catgories</div>
            <div class="categories owl-carousel owl-theme">
            <%
            	for(Category cat: catList){
            		%>
            	<div class="category-box item">                    
                    <img class="cat-img" src="assets/blogImage/image.jpg" alt="blog-image">                    
                    <div class="cat-title">
                        <a href="#blogs" onclick="getBlogs(<%=cat.getCat_id() %>)" class="stretched-link"><%=cat.getCat_name() %></a>
                    </div>
                </div>	
            		<%		
            	}
            %>
            </div>
        </div>
    </section>

    

    <!-- blog list here -->
    <section id="blogs">
        <div class="container py-5">	
        	<div id="blog-loader" style="text-align: center"><i class="fa fa-spinner fa-spin fa-4x" aria-hidden="true"></i></div> 
        	
        	<div id="blogs-container"></div>
        	       	
        </div>
    </section>

    <script src="vendor/js/jquery.min.js"></script>
    <script src="vendor/js/popper.min.js"></script>
    <script src="vendor/js/bootstrap.min.js"></script>
 	<script src="vendor/js/owl.carousel.min.js"></script>

    <!-- custom js here --> 
    <script type="text/javascript" src="assets/js/app.js"></script>

    <script>
        $('.categories.owl-carousel').owlCarousel({
            loop:true,
            margin:10,
            nav:true,
            autoplay:true,
            autoplayTimeout:2000,
            autoplayHoverPause:true,
            responsive:{
                0:{
                    items:2
                },
                600:{
                    items:3
                },
                1000:{
                    items:4
                },
                1200:{
                    items:5
                }
            }
        })
    </script>
    
    
    <script type="text/javascript">
    	
    	function getBlogs(cat_id){
    		$("#blog-loader").show();
    		$("#blogs-container").hide();
    		$.ajax({
    			url: "blogs.jsp",
    			data: {catId : cat_id}, //catId ta link er maddhome send kortesi
    			success: function(data, textstatus, janina){
    				$("#blog-loader").hide();
    				$("#blogs-container").show();
    				$("#blogs-container").html(data);
    			}
    		});
    	}
    
    	$(document).ready(function(e){    		
    		getBlogs(0);
    	});
    </script> 
    
    
    
</body>
</html>