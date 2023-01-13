package com.sub.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.sub.blog.dao.User_info_Dao;
import com.sub.blog.helpers.ConnectionProvider;
import com.sub.blog.helpers.ServerMessage;

@MultipartConfig
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String email;
	private String password;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		email = request.getParameter("email");
		password = request.getParameter("password");

		User_info_Dao ud = new User_info_Dao(ConnectionProvider.getConnection());

		ServerMessage returnMsg = ud.login(email, password);

		if (returnMsg != null) {			
			HttpSession session = request.getSession();
			session.setAttribute("ServerMessage", returnMsg);
			session.setAttribute("loginInputEmail", email);
			response.sendRedirect("login.jsp");
			
			System.out.println("UserLogin : "+returnMsg.getContent());
		}
		 

		if (ud.userLogin != null) {
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", ud.userLogin);
//			response.sendRedirect("profile.jsp");
		}
		
	}
}
