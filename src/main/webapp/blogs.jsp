<%@page import="com.sub.blog.dao.Reaction_DAO"%>
<%@page import="com.sub.blog.dao.User_info_Dao"%>
<%@page import="com.sub.blog.entities.User_info"%>
<%@page import="com.sub.blog.entities.Category"%>
<%@page import="com.sub.blog.entities.Blog"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sub.blog.helpers.ConnectionProvider"%>
<%@page import="com.sub.blog.dao.Blog_DAO"%>

<%@page errorPage="error.jsp" %>
			<%
				Thread.sleep(1000);	
			
				Blog_DAO bd = new Blog_DAO(ConnectionProvider.getConnection());
				User_info_Dao userDao = new User_info_Dao(ConnectionProvider.getConnection());
				
				int cat_id = Integer.parseInt(request.getParameter("catId"));
				
				ArrayList<Blog> blogs = null;
				if(cat_id == 0){
					blogs = bd.getRecentBlogs();	
				}else if(cat_id == -1){
					blogs = bd.getAllBlogs();					
				}else{
					blogs = bd.getBlogsByCategory(cat_id);
				}
				
        	%>        
        	<!-- in refers to index page -->
            
                <div class="blog-cat-name fa-3x">
                    <%
                    	if(blogs.size() != 0){
                    		if(cat_id == 0){
                            	out.print("Recent Blogs");
                            }else if(cat_id == -1){
                            	out.print("All Blogs");
                            }
                    		else{
                            	Category category= bd.getCategoryByid(cat_id);
                            	out.print(category.getCat_name());
                            }
                    	}else{
                    		Category category= bd.getCategoryByid(cat_id);
                        	if(category == null){                        		
	                    		out.print("Ho! Amra to DEV Tool use krotei parina! &#x1F612");
                        	}else{
                        		out.print(category.getCat_name());
                        	}
                    	}
                    %>
                </div>
                <hr>
                <div class="row">
                <%
               	if(blogs.size() == 0){
               		out.print("<div class='display-3 text-center'>No Blog found for this category</div>");
               	}else{                
                	for(Blog blog: blogs){
                		String content = blog.getContent().substring(0,100);
                		User_info userinfo = userDao.getUserById(blog.getAuthor_id());
                %>
                    <!-- a card -->
                    <div class="col-lg-3 col-md-4 col-sm-6 pt-3 col-12">
                        <div class="card">
                            <img class="card-img-top blog-img" src="assets/blogImage/<%=blog.getImage()%>" alt="Card image cap">
                            <div class="card-body">
                            	<p class="blog-info"><a href="profile.jsp?id=<%=blog.getAuthor_id()%>"><%=userinfo.getName()%></a> <span>May 23, 2022</span></p>
                                <h5 class="in-blog-title"><%=blog.getTitle() %></h5>
                                <p class="in-blog-content text-justify">
                                	<%=content %>...
                                </p>
                                <a href="blog.jsp?blog_id=<%=blog.getBlog_id() %>" class="btn btn-primary-bg btn-sm w-100 m-1">Read More...</a>
                                
                                
                               
								<%
									Reaction_DAO red = new Reaction_DAO(ConnectionProvider.getConnection());
									int x = -1;						
									User_info userIn = (User_info) session.getAttribute("currentUser");
									if((User_info) session.getAttribute("currentUser") != null){
										x = red.getUserReact(blog.getBlog_id(),Integer.parseInt(userIn.getUserId()));	
									}
									
								%>
                                
                                <div class="m-1 text-center">
                                	<button onclick="reaction(<%=blog.getBlog_id()%>,1,this)" class="btn <%if(x==1){out.print("interacted");} %> btn-interact like-btn btn-sm"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> <span><%=red.countLike(blog.getBlog_id()) %></span></button>
                                	<button onclick="reaction(<%=blog.getBlog_id()%>,0,this)" class="btn <%if(x==0){out.print("interacted");} %>  btn-interact dislike-btn btn-sm"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i> <span><%=red.countDisLike(blog.getBlog_id()) %></span></button>
                                	<button class=" btn-interact btn btn-primary-bg btn-sm"><i class="fa fa-comments-o" aria-hidden="true"></i> <span>10</span></button>
                                </div>
                            </div>
                        </div>
                    </div>
				<%
        		 	}	//ENDING OF THE LOOP
               	}//ENDING OF IF CONDITION
        		%>
                </div>     	        			
        		