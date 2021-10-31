package com.care.root.board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.care.root.board.dto.BoardDTO;

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
	public ArrayList<BoardDTO> list() {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		String sql = "select * from test_board";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setId(rs.getInt("id"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setStep(rs.getInt("step"));
				dto.setIndent(rs.getInt("indent"));
				
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				
				dto.setSavedate(rs.getTimestamp("savedate"));
				
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	private void upHit(String id) {
		String sql = "update test_board set hit = hit + 1 where id=?";
		try {
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//public BoardDTO contentView(int id,int num) {
		//if(num == 1)
			//upHit(id);
		//return dto;
	//}
	
	pu
}
