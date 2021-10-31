package com.care.root.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.care.root.member.dto.MemberDTO;

public class MemberDAO1 {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public MemberDAO1(){
		String url="jdbc:oracle:thin:@210.221.253.215:1521:xe";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url,"g3","1234");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int memberSave(MemberDTO dto) {
		int result = 0;
		String sql = "insert into jsp_member(id,pwd,name,addr) values(?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getAddr());
			
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<MemberDTO> memberView(){
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		String sql = "select * from jsp_member";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public MemberDTO memberInfo(String id) {
		String sql = "select * from jsp_member where id=?";
		MemberDTO dto = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int update(MemberDTO dto) {
		int result = 0;
		String sql = "update jsp_member set addr=?, name=?, pwd=? where id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getAddr());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getPwd());
			ps.setString(4, dto.getId());
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int delete(String id) {
		int result = 0;
		String sql = "delete from jsp_member where id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
