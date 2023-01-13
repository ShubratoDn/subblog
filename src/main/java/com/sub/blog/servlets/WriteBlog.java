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
import java.io.PrintWriter;

import com.sub.blog.dao.Blog_DAO;
import com.sub.blog.entities.Blog;
import com.sub.blog.entities.User_info;
import com.sub.blog.helpers.ConnectionProvider;
import com.sub.blog.helpers.ImageSet;

@MultipartConfig
public class WriteBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		User_info user = (User_info) session.getAttribute("currentUser");

		String errMsg = "";
		
		//getting all inputs value
		int user_id = Integer.parseInt(user.getUserId());;
		int cat_id = 0;
		try {
			cat_id = Integer.parseInt(request.getParameter("category"));
			
		} catch (Exception ex) {
			errMsg += "Category cannot be Null! ";
		}

		String title = request.getParameter("blog-title");
		String content = request.getParameter("blog-content");
		Part part = request.getPart("blog-img");

		String imgName = user_id + "_" + cat_id + "_" + part.getSubmittedFileName();

		//Checking for all valid inputs
		Blog blog = new Blog();
		
		if(title.isBlank() || content.isBlank() || part.getSize() == 0) {
			errMsg += "Title, Content, Content Image cannot be null!";
		}else {
			blog.setAuthor_id(user_id);
			blog.setCat_id(cat_id);
			blog.setTitle(title);
			blog.setContent(content);
			blog.setImage(imgName);
		}
		
		
		Blog_DAO bd = new Blog_DAO(ConnectionProvider.getConnection());
		
		if(errMsg.isBlank()) {
		 	boolean flag = bd.uploadBlog(blog);
		 	//data gulo upload hoye jabe ekhane
		 	if(flag) {
		 		//image upload kortesi
		 		String path = request.getRealPath("/")+"assets" + File.separator + "blogImage" + File.separator + imgName;
		 		ImageSet imgset = new ImageSet();
		 		if(imgset.uploadImage(part.getInputStream(), path)) {
		 			out.print("success");		 			
		 		}else {
		 			out.print("Image Upload Fail");
		 		}		 		
		 	}else {
		 		out.print("Failed to upload your Blog! Try again letter. ");
		 	}
		}else
			out.print(errMsg);
	}

}
