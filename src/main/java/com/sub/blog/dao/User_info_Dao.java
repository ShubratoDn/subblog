package com.sub.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.sub.blog.entities.User_info;
import com.sub.blog.helpers.ServerMessage;

//import jakarta.servlet.http.HttpSession;

public class User_info_Dao {
	private Connection conn;
	
	public User_info_Dao(Connection conn) {
		this.conn = conn;
	}
	
	
//	method for inserting data to user info table
	public String insertUserInfo(User_info ui) {
		String errMsg ="";
		try {		
			//checking if the email is already exist or not
			String inpMail = ui.getEmail();
			String avChkQuery = "select  * from user_info WHERE email='"+inpMail+"'";	
			Statement stmt = conn.createStatement();			
			ResultSet set = stmt.executeQuery(avChkQuery);		
			
			if(set.next()) {
				//Already Email is exist
				errMsg = "Email Already Exist";
				
				//database theke data nicchi
				System.out.println(set.getString("name")+" " + set.getString("email"));				
			}else {				
				String query = "INSERT INTO `user_info`(`name`, `email`, `gender`, `about`, `password`) VALUES (?,?,?,?,?)";			
				PreparedStatement pstmt = this.conn.prepareStatement(query);
				pstmt.setString(1, ui.getName());
				pstmt.setString(2, ui.getEmail());
				pstmt.setString(3, ui.getGender());
				pstmt.setString(4, ui.getAbout() );
				pstmt.setString(5, ui.getPassword());				
				pstmt.execute();				
			}	
			
			//sending the message to the server
			if(errMsg.isBlank()) {
				return "success";
			}else {
				return errMsg;
			}	
			
		}catch(Exception ex) {
			System.out.println("Error inserting User Info Becuse \n" + ex);
			return ex.toString();
		}	
	}

	
	

	//eta use korsi jeno object a data assign kore seta UserLogin servlet theke acceess kore Session Start korte pari
	public User_info userLogin;	
	private ServerMessage sm = null;
	
	//user login
	@SuppressWarnings("deprecation")
	public ServerMessage login(String userEmail, String userPassword) {	
		
		try {			
			String q = "SELECT * from user_info where email=?";
			PreparedStatement pstmt = conn.prepareStatement(q);
			pstmt.setString(1, userEmail);
			
			ResultSet set = pstmt.executeQuery();
			if(set.next()) {
				String dbPass = set.getString("password");
				//if password is matched
				if(dbPass.equals(userPassword) ) {
					//creating the object
					userLogin = new User_info();
					
					userLogin.setUserId(set.getString("user_id"));
					userLogin.setName(set.getString("name"));
					userLogin.setEmail(set.getString("email"));
					userLogin.setGender(set.getString("gender"));
					userLogin.setAbout(set.getString("about"));
					userLogin.setUserImg(set.getString("img"));
					userLogin.setPassword(set.getString("password"));
					userLogin.setReg_date(set.getTimestamp("reg_date").toGMTString());					
					
					sm = new ServerMessage("Logged In", "success", "alert-success");
					return sm;
				}else {					
					return sm = new ServerMessage("You have inserted wrong password!", "error", "alert-danger");
				}				
			}else {
				return sm = new ServerMessage("Email is invalid!", "info", "alert-info");
			}			
			
		}catch(Exception ex) {
			/* return "Login Method Failur, because : \n" + ex; */

			System.out.println("Login Method Failur, because : \n" + ex);
			return sm = new ServerMessage("Login Method Failur, because : "+ ex, "info", "alert-info");
		}
			
	}
	
	
	//==================================================
	//update profile
	//==================================================
	public ServerMessage updateProfile(User_info user) {
	
		try {
			String query = "UPDATE `user_info` SET `name`=?,`email`=?,`gender`= ? ,`about`= ? ,`password`= ? ,`img`= ? WHERE user_id= ?";
			
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getGender());
			pstmt.setString(4, user.getAbout());
			pstmt.setString(5, user.getPassword());
			pstmt.setString(6, user.getUserImg());
			pstmt.setInt(7, Integer.parseInt(user.getUserId()));
			
			pstmt.executeUpdate();
			
			return new ServerMessage("<b>Successfully updated your profile!</b>", "success", "alert-success");
		}catch (Exception e) {
			return new ServerMessage("<b>Failed to Update Profile!</b> <br> " + e, "error", "alert-danger");
		}		
	}
	
	
	
	public User_info getUserById(int user_id) {
		try {
			String q = "select * from user_info where user_id='"+user_id+"'";
			Statement stmt = conn.createStatement();
			ResultSet set = stmt.executeQuery(q);
			
			User_info user = null;
			
			while(set.next()) {
				user = new User_info();				
				user.setUserId(set.getString("user_id"));
				user.setName(set.getString("name"));
				user.setEmail(set.getString("email"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setUserImg(set.getString("img"));
				user.setPassword(set.getString("password"));
				user.setReg_date(set.getTimestamp("reg_date").toGMTString());	
			}
			
			return user;
		}catch(Exception ex) {
			System.out.println("User_dao-getUserById; Error Getting user info " + ex);
			return null;
		}		
	}
	
}

