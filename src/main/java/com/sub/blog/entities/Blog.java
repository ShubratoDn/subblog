package com.sub.blog.entities;

import java.sql.Timestamp;

public class Blog {

	private int blog_id;
	private int author_id;
	private int cat_id;
	private String title;
	private String content;
	private String image;
	private Timestamp upload_time;
	
	public Blog() {
		
	}
	
	public Blog(int blog_id, int author_id, int cat_id, String title, String content, String image,Timestamp date) {
		super();
		this.blog_id = blog_id;
		this.author_id = author_id;
		this.cat_id = cat_id;
		this.title = title;
		this.content = content;
		this.image = image;
		this.upload_time = date;
	}
	
	public Blog( int author_id, int cat_id, String title, String content, String image,Timestamp upload_time) {
		super();
		this.author_id = author_id;
		this.cat_id = cat_id;
		this.title = title;
		this.content = content;
		this.image = image;
		this.upload_time = upload_time;
	}

	public int getBlog_id() {
		return blog_id;
	}

	public void setBlog_id(int blog_id) {
		this.blog_id = blog_id;
	}

	public int getAuthor_id() {
		return author_id;
	}

	public void setAuthor_id(int author_id) {
		this.author_id = author_id;
	}

	public int getCat_id() {
		return cat_id;
	}

	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Timestamp getUpload_time() {
		return upload_time;
	}

	public void setUpload_time(Timestamp upload_time) {
		this.upload_time = upload_time;
	}
	
	
	
	
}
