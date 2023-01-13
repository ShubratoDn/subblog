package com.sub.blog.servlets;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.sub.blog.dao.User_info_Dao;
import com.sub.blog.entities.User_info;
import com.sub.blog.helpers.ConnectionProvider;
import com.sub.blog.helpers.ImageSet;
import com.sub.blog.helpers.ServerMessage;

@MultipartConfig
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//fetching the datas from the user
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String about = request.getParameter("about");
		
		//class er age annotation lagate hobe karon eta multipart type er data
		Part part = request.getPart("userImage");
		String imageName = part.getSubmittedFileName();	
		
		String oldPass = request.getParameter("old-pass");
		String newPass = request.getParameter("new-pass");
	
		
		//User Info er data gulo replace kortesi
		HttpSession session = request.getSession();		
		User_info user = (User_info) session.getAttribute("currentUser");	

		String dbPass = user.getPassword();
		String oldImageName = user.getUserImg();

		
		//replace kortesi new data gular sathe		
		String errMsg = "";
		
		user.setAbout(about);
		
		if(email.isBlank() || name.isBlank() || gender.isBlank()) {
			errMsg += "Email, Name and Gender can not be empty";
		}else {
			user.setName(name);
			user.setEmail(email);
			user.setGender(gender);
		}
		
		
		if(!oldPass.isBlank() || !newPass.isBlank()) {
			if(oldPass.equals(dbPass)) {
				if(!newPass.isBlank()) {
					user.setPassword(newPass);
				}else {
					errMsg += "New Password cannot be Null";
				}
			}else {
				errMsg += "Old password is <b>NOT</b> Matching";
			}
		}
		
		
		if(!imageName.isBlank()) {
			user.setUserImg(user.getUserId()+"_"+imageName);
		}

		//if no error occurs
		if(errMsg.isBlank()) {
			
			new ConnectionProvider();
			User_info_Dao uid = new User_info_Dao(ConnectionProvider.getConnection());
			
			ServerMessage sm = uid.updateProfile(user);	
			
			if(sm.getType().equals("success")) {
				
				if(!imageName.isBlank()) {
					//jodi file upload hoye jay tokhn eta korbe
					@SuppressWarnings("deprecation")
					String oldPath = request.getRealPath("/")+"assets"+File.separator+"userImage"+File.separator+oldImageName;
					@SuppressWarnings("deprecation")
					String path = request.getRealPath("/")+"assets"+File.separator+"userImage"+File.separator+user.getUserImg();
					/*
					 * ServletContext servletContext = getServletContext(); String path =
					 * servletContext.getRealPath(File.separator)+"assets"+File.separator+
					 * "userImage"+File.separator+user.getUserImg();
					 */
					
					
					ImageSet iset = new ImageSet();
					iset.deleteImage(oldPath);
					boolean f = iset.uploadImage( part.getInputStream(), path);
					if(!f) {
						sm.setContent("Information updated! But image cannot be uploaded");
						sm.setCssClass("alert-danger");
						sm.setType("error");
					}	
				}				
			}
			
			session.setAttribute("ServerMessage", sm);
			
			
		}else {
			ServerMessage sm = new ServerMessage(errMsg, "error", "alert-danger");
			session.setAttribute("ServerMessage", sm);			
		}
		
		response.sendRedirect("update.jsp");
	}

}

