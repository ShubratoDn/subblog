package com.sub.blog.entities;

public class Reaction {

	private int react_id;
	private int blog_id;
	private int author_id;
	private int react_state;
	
	public Reaction(int react_id, int blog_id, int author_id, int react_state) {
		super();
		this.react_id = react_id;
		this.blog_id = blog_id;
		this.author_id = author_id;
		this.react_state = react_state;
	}
	
	public Reaction( int blog_id, int author_id, int react_state) {
		super();
		this.blog_id = blog_id;
		this.author_id = author_id;
		this.react_state = react_state;
	}

	public int getReact_id() {
		return react_id;
	}

	public void setReact_id(int react_id) {
		this.react_id = react_id;
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

	public int getReact_state() {
		return react_state;
	}

	public void setReact_state(int react_state) {
		this.react_state = react_state;
	}
	
	
	
	
	
}
