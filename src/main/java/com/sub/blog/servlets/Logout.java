package com.sub.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.sub.blog.helpers.ServerMessage;

/**
 * Servlet implementation class Logout
 */
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public void service(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
    	HttpSession session = req.getSession();
    	
    	session.removeAttribute("currentUser");
    	
    	ServerMessage sm = new ServerMessage("You are logged out","info","alert-info");
    	
    	session.setAttribute("ServerMessage", sm);
    	
    	res.sendRedirect("login.jsp");
    }

}
