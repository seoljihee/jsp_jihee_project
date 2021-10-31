package com.care.root.board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BoardDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public BoardDAO(){
		String url="jdbc:oracle:thin:@210.221.253.215:1521:xe";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url,"g3","1234");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
