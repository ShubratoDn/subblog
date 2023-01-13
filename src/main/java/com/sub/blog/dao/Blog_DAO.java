package com.sub.blog.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.sub.blog.entities.Blog;
import com.sub.blog.entities.Category;

public class Blog_DAO {

	private Connection conn;
	
	public Blog_DAO(Connection conn) {
		this.conn = conn;
	}
	
	//Category provide krbe
	public ArrayList<Category> getAllCategories(){		
		ArrayList<Category> allCat = new ArrayList<>();		
		try {
			
			String q = "select * from category";
			Statement stmt = conn.createStatement();
			ResultSet set = stmt.executeQuery(q);
			
			while(set.next()) {
				int cat_id = set.getInt("cat_id");
				String cat_name = set.getString("name");
				String cat_description = set.getString(3);
				
				Category c = new Category(cat_id, cat_name, cat_description);
				
				allCat.add(c);
			}					
		}catch (Exception e) {
			System.out.println("BLOG_DAO: get all category failed. : " + e);
		}
		
		return allCat;
	}
	
	
	//get category by id
	public Category getCategoryByid(int cat_id) {
			
		try {			
			String q = "select * from category where cat_id='"+cat_id+"'";
			Statement stmt = conn.createStatement();
			ResultSet set = stmt.executeQuery(q);
			Category c = null;
			while(set.next()) {
				String cat_name = set.getString("name");
				String cat_description = set.getString(3);				
				 c = new Category(cat_id, cat_name, cat_description);
			}			
			return c;
		}catch (Exception e) {
			System.out.println("getCategoryByid failure: Because:  " + e);
			return null;
		}				
	}
	
	//Upload a written blog data  to the server
	public boolean uploadBlog(Blog blog) {
		
		int auth_id = blog.getAuthor_id();
		int cat_id =blog.getCat_id();
		String title = blog.getTitle();
		String content= blog.getContent();
		String imgName = blog.getImage();
		
		try {
			String query = "INSERT INTO `blog`(`author`, `cat_id`, `title`, `content`, `img`) VALUES (?,?,?,?,?)";
			
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, auth_id);
			pstmt.setInt(2, cat_id);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			pstmt.setString(5, imgName);
			
			pstmt.executeUpdate();
			
			return true;
		} catch (Exception e) {
			System.out.println("Blog_DAO-uploadBlog > Insert Blog info fail, because : " + e);
			return false;
		}			
	}
	
	
	//get recent blogs
	public ArrayList<Blog> getRecentBlogs(){
		ArrayList<Blog> blogList = new ArrayList<>();
		try {
			
			String query = "select * from blog order by blog_id desc limit 10";			
			Statement stmt = conn.createStatement();
			ResultSet set = stmt.executeQuery(query);
			
			while(set.next()) {
				int blod_id = set.getInt("blog_id");
				int auth_id = set.getInt("author");
				int cat_id = set.getInt("cat_id");
				String title = set.getString("title");
				String content = set.getString("content");
				String img = set.getString("img");
				Timestamp date = set.getTimestamp("upload_time");
				
				Blog b = new Blog(blod_id, auth_id, cat_id, title, content, img, null);	
				blogList.add(b);
			}
			
			return blogList;
			
		} catch (Exception e) {
			 System.out.println("GetRecentBlog method error : because, " + e);
			 return null;
		}
			
	}
	
	
	public ArrayList<Blog> getAllBlogs(){
		ArrayList<Blog> blogList = new ArrayList<>();
		try {			
			String query = "select * from blog order by blog_id desc";			
			Statement stmt = conn.createStatement();
			ResultSet set = stmt.executeQuery(query);
			
			while(set.next()) {
				int blod_id = set.getInt("blog_id");
				int auth_id = set.getInt("author");
				int cat_id = set.getInt("cat_id");
				String title = set.getString("title");
				String content = set.getString("content");
				String img = set.getString("img");
				Timestamp date = set.getTimestamp("upload_time");
				
				Blog b = new Blog(blod_id, auth_id, cat_id, title, content, img, date);	
				blogList.add(b);
			}
			
			return blogList;
			
		} catch (Exception e) {
			 System.out.println("getAllBlogs method error : because, " + e);
			 return null;
		}
	}
	
	
	//get Post by category id
	public ArrayList<Blog> getBlogsByCategory(int cat_id){
		ArrayList<Blog> blogList = new ArrayList<>();
		try {
			
			String query = "select * from blog  WHERE cat_id='"+cat_id+"' order by blog_id desc";			
			Statement stmt = conn.createStatement();
			ResultSet set = stmt.executeQuery(query);
			
			while(set.next()) {
				int blod_id = set.getInt("blog_id");
				int auth_id = set.getInt("author");
				String title = set.getString("title");
				String content = set.getString("content");
				String img = set.getString("img");
				Timestamp date = set.getTimestamp("upload_time");
				
				Blog b = new Blog(blod_id, auth_id, cat_id, title, content, img, null);	
				blogList.add(b);
			}
			
			return blogList;
			
		} catch (Exception e) {
			 System.out.println("getBlogsByCategory method error : because, " + e);
			 return null;
		}
			
	}
	
	
		//get Post by category id
	public Blog getBlogById(int blog_id){
		
		Blog blog = null;
		
		try {			
			String query = "select * from blog where blog_id='"+blog_id+"'";			
			Statement stmt = conn.createStatement();
			ResultSet set = stmt.executeQuery(query);
			
			if(set.next()) {				
				int auth_id = set.getInt("author");
				int cat_id = set.getInt("cat_id");
				String title = set.getString("title");
				String content = set.getString("content");
				String img = set.getString("img");
				Timestamp date = set.getTimestamp("upload_time");				
				blog = new Blog(blog_id, auth_id, cat_id, title, content, img, date);				
			}			
			return blog;			
		} catch (Exception e) {
			 System.out.println("getBlogById method error : because, " + e);
			 return null;
		}
			
	}
		
	
	
	public ArrayList<Blog> getBlogsByAuthorID(int author_id){
		ArrayList<Blog> blogs = new ArrayList<>();   
		try {			
			String q = "select * from blog where author='"+author_id+"'";
			
			Statement stmt = conn.createStatement();
			ResultSet set = stmt.executeQuery(q);
			while(set.next()) {
				int blod_id = set.getInt("blog_id");
				int cat_id = set.getInt("cat_id");
				String title = set.getString("title");
				String content = set.getString("content");
				String img = set.getString("img");
				Timestamp date = set.getTimestamp("upload_time");
				
				Blog b = new Blog(blod_id, author_id, cat_id, title, content, img, null);	
				blogs.add(b);
			}
			return blogs;
		}catch(Exception ex) {
			System.out.println("getBlogsByAuthorID error! because : " + ex );
			return null;
		}
		
	}
	
	
	
}
 