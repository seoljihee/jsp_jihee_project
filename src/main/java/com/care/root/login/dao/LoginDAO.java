package com.care.root.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public LoginDAO(){
		String url="jdbc:oracle:thin:@210.221.253.215:1521:xe";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url,"g3","1234");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int loginChk(String id, String pwd) {
		int result = 0;
		String sql = "select * from jsp_member where id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				if(pwd.equals(rs.getString("pwd"))) {
					result = 0;
				}else {
					result = 1;
				}
			}else {
				result = -1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
