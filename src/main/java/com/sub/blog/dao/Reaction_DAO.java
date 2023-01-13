package com.sub.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.sub.blog.entities.Reaction;

public class Reaction_DAO {	
	private Connection conn = null;
	
	public Reaction_DAO(Connection con) {
		this.conn = con;
	}
	
	public int countLike(int blog_id) {		
		int count = 0;		
		try {			
			String q = "select count(*) as count from reaction where blog_id='"+blog_id+"' and react_state='1'";
			PreparedStatement pstmt = conn.prepareStatement(q);
			
			ResultSet set = pstmt.executeQuery();
		
			if(set.next()) {
				count = set.getInt("count");
			}			
			return count;			
		}catch(Exception ex) {
			System.out.println("countLike() method fail. " + ex);
			return -1;
		}
	}
	
	
	
	public int countDisLike(int blog_id) {		
		int count = 0;		
		try {			
			String q = "select count(*) as count from reaction where blog_id='"+blog_id+"' and react_state='0'";
			PreparedStatement pstmt = conn.prepareStatement(q);
			
			ResultSet set = pstmt.executeQuery();
		
			if(set.next()) {
				count = set.getInt("count");
			}			
			return count;			
		}catch(Exception ex) {
			System.out.println("countDisLike() method fail. " + ex);
			return -1;
		}
	}
	
	
	
	public boolean insertReact(Reaction react) {
		try {			
			String q = "INSERT INTO `reaction`(`blog_id`, `author_id`, `react_state`) VALUES (?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(q);
			pstmt.setInt(1, react.getBlog_id());
			pstmt.setInt(2, react.getAuthor_id());
			pstmt.setInt(3, react.getReact_state());
			pstmt.executeUpdate();
			return true;			
		}catch(Exception ex) {
			System.out.println("insertReact() method fail. " + ex);
			return false;
		}
	}
	
	
	
	public boolean reactionAvailableCheck(Reaction react) {
		try {			
			String q = "select * from reaction where blog_id=? and author_id=?";
			PreparedStatement pstmt = conn.prepareStatement(q);
			pstmt.setInt(1, react.getBlog_id());
			pstmt.setInt(2, react.getAuthor_id());
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				return true;
			}else {
				return false;
			}			
						
		}catch(Exception ex) {
			System.out.println("reactionAvailableCheck() method fail. " + ex);
			return false;
		}
	}
	
	
	
	public int getReact(Reaction react) {
		try {			
			String q = "select * from reaction where blog_id=? and author_id=?";
			PreparedStatement pstmt = conn.prepareStatement(q);
			pstmt.setInt(1, react.getBlog_id());
			pstmt.setInt(2, react.getAuthor_id());
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				int x = set.getInt("react_state");
				return x;
			}else
				return -2;
			
			
			
		}catch(Exception ex) {
			System.out.println("getReact() method fail. " + ex);
			return -1;
		}
	}
	
	
	
	
	public int getUserReact(int blog_id, int user_id) {
		try {			
			String q = "select * from reaction where blog_id=? and author_id=?";
			PreparedStatement pstmt = conn.prepareStatement(q);
			pstmt.setInt(1, blog_id);
			pstmt.setInt(2, user_id);
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				int x = set.getInt("react_state");
				return x;
			}else
				return -1;			
		}catch(Exception ex) {
			System.out.println("getReact() method fail. " + ex);
			return -1;
		}
	}
	
	
	public boolean deleteReaction(Reaction react) {
		try {			
			String q = "DELETE FROM `reaction` where blog_id=? and author_id=?";
			PreparedStatement pstmt = conn.prepareStatement(q);
			pstmt.setInt(1, react.getBlog_id());
			pstmt.setInt(2, react.getAuthor_id());			
			pstmt.executeUpdate();			
			
			return true;
			
		}catch(Exception ex) {
			System.out.println("deleteReaction() method fail. " + ex);
			return false;
		}
	}
	
	
	
	public boolean updateReaction(Reaction react) {
		try {			
			String q = "UPDATE `reaction` SET `react_state`=? WHERE blog_id=? and author_id= ?";
			PreparedStatement pstmt = conn.prepareStatement(q);
			pstmt.setInt(1, react.getReact_state());
			pstmt.setInt(2, react.getBlog_id());
			pstmt.setInt(3, react.getAuthor_id());			
			pstmt.executeUpdate();			
			
			return true;
			
		}catch(Exception ex) {
			System.out.println("updateReaction() method fail. " + ex);
			return false;
		}
	}
	
	
	
	
}
