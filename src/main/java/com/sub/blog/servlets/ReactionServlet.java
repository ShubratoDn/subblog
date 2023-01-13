package com.sub.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.sub.blog.dao.Reaction_DAO;
import com.sub.blog.entities.Reaction;
import com.sub.blog.entities.User_info;
import com.sub.blog.helpers.ConnectionProvider;


public class ReactionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("html/text");
		
		try {
			int blog_id = Integer.parseInt(request.getParameter("blogID"));
			int reactState = Integer.parseInt(request.getParameter("reactState"));
			
			HttpSession session = request.getSession();
			User_info user = (User_info) session.getAttribute("currentUser");
			//checking if the user is logged in or not
			if( user != null) {				
				Reaction react = new Reaction(blog_id, Integer.parseInt(user.getUserId()), reactState);
				Reaction_DAO red = new Reaction_DAO(ConnectionProvider.getConnection());				
				
				//dekhtesi j User kono react dise ki deynai
				if(red.reactionAvailableCheck(react)) {
					int dbReactState =red.getReact(react);
					if(dbReactState == reactState) {
						red.deleteReaction(react);
						if(dbReactState == 1) {
							out.print("rmvlike");
						}else {
							out.print("rmvdislike");
						}
					}else {
						red.updateReaction(react);
						if(dbReactState == 1) {
							out.print("updislike");
						}else {
							out.print("uplike");
						}
					}
					
				}else {
					//reaction DB te chilona tai diye dilam reaction
					red.insertReact(react);
					if(reactState == 1) {
						out.print("liked");
					}else {
						out.print("disliked");
					}
				}
				
			}else {
				out.print("notLogin");
			}
		}catch(Exception ex) {
			out.print("hack");
		}		
		
	}

}
