package com.sub.blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import com.sub.blog.dao.User_info_Dao;
import com.sub.blog.entities.User_info;
import com.sub.blog.helpers.ConnectionProvider;

 
@MultipartConfig
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String name = "Hello";
	String email;
	String password;
	String gender;
	String about;
	String checkbox;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		values from user input
		name = request.getParameter("name");
		email = request.getParameter("email");
		password = request.getParameter("password");
		gender = request.getParameter("gender");
		about = request.getParameter("about");
		checkbox =  request.getParameter("checkbox");
		
		response.setContentType("text/html");
		PrintWriter out =  response.getWriter();
//		
//		out.println("Name  : " + name);
//		out.println("<br>email  : " + email);
//		out.println("<br>password  : " + password);
//		out.println("<br>gender: " +gender);
//		out.println("<br>about : " + about);
//		out.println("<br>Checkbox  : " + checkbox);
//		
//		System.out.println("Name  : " + name);
//		System.out.println("email  : " + email);
//		System.out.println("password  : " + password);
//		System.out.println("gender: " +gender);
//		System.out.println("about : " + about);
//		System.out.println("Checkbox  : " + checkbox);
		
		if(checkbox != null) {
			//getting the connection here
			Connection conn = ConnectionProvider.getConnection();		
			
			if(name.isEmpty() || email.isEmpty() || password.isEmpty() || gender.isEmpty() ) {
				out.println("Please, fill all inputs!");
			}else {					
				
				User_info ui = new User_info(name,  email,  gender,  about,  password);				
				User_info_Dao ud = new User_info_Dao(conn);		
				
				//Sending this message to the client
				out.println(ud.insertUserInfo(ui));		
			}

		}else {
			out.println("Please Accept All Terms and Conditions");
		}		
	}
}
