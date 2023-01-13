<%@page import="java.util.ArrayList"%>
<%@page import="com.sub.blog.helpers.ConnectionProvider"%>
<%@page import="com.sub.blog.dao.Blog_DAO"%>
<nav class="navbar navbar-expand-lg navbar-dark primary-bg">
        <div class="container">
            <a class="navbar-brand" href="index.jsp"><img src="assets/img/logo.svg" alt=""></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                   <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Blogs
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        	<a class="dropdown-item" href="show_blogs.jsp">Recent Blogs</a>
                            <a class="dropdown-item" href="show_blogs.jsp">All Blogs</a>
                            
                            <%
								Blog_DAO bd = new Blog_DAO(ConnectionProvider.getConnection());
                            	ArrayList<Category> catList= bd.getAllCategories();
                            	
                            	for(Category cat : catList){
                            		%>
                             <a class="dropdown-item" onclick="redirect(this)"><%=cat.getCat_name() %></a>                            		
                            		<%
                            	}
                            	
							%>
                                                                                
                        </div>
                        <script type="text/javascript">
                        	function redirect(thisComponent){
                        		window.location =  "show_blogs.jsp";
                        	}                        	
                        </script>
                    </li>
                    <%@page import="com.sub.blog.entities.*"%>
                    <%
	                    User_info loggedUser = (User_info)session.getAttribute("currentUser");
	                	
	                	if(loggedUser == null){
	                		%>
                	<li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp">Register</a>
                    </li>
	                		<% 
	                	}
                    %>                    
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Themes
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                    
                    <%if(loggedUser != null){
                    %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <%= loggedUser.getName() %>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="profile.jsp">Profile</a>
                            <a class="dropdown-item" href="profile.jsp">My Blogs</a>
                            <a class="dropdown-item" href="writeBlog.jsp">Write Blog</a>
                            <a class="dropdown-item" href="update.jsp">Update Profile</a>
                            <a class="dropdown-item" href="Logout">Logout </a>                            
                        </div>
                    </li>
                    <%	
                    }%>
                    
                    
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>

 