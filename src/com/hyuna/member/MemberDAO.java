package com.hyuna.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hyuna.util.DBConnector;

public class MemberDAO {
	
	public MemberDAO() {
		
	}
	
	
	/* 회원정보수정 */
	
	public int memberUpdate(MemberDTO memberDTO) throws Exception {
		
		Connection con = DBConnector.getConnect();
		
		String sql = "update member set phone=?, email=?, age=? where id=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, memberDTO.getPhone());
		st.setString(2, memberDTO.getEmail());
		st.setInt(3, memberDTO.getAge());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(con, st);
		
		return result;
		
	}
	
	/* 로그인 */
	
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception {
		
		Connection con = DBConnector.getConnect();
		
		String sql = "select * from member where id=? and pw=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		
		ResultSet rs = st.executeQuery();
		
		MemberDTO m = null;
		
		if(rs.next()) {
			
			m = new MemberDTO();
			
			m.setId(rs.getString("id"));
			m.setPw(rs.getString("pw"));
			m.setName(rs.getString("name"));
			m.setPhone(rs.getString("phone"));
			m.setEmail(rs.getString("email"));
			m.setAge(rs.getInt("age"));
			
		}
		
		DBConnector.disConnect(con, st, rs);
		
		return m;
		
	}
	
	
	/* 회원탈퇴 */
	
	public int memberDelete(MemberDTO memberDTO) throws Exception {
		
		Connection con = DBConnector.getConnect();
		
		String sql = "delete member where id=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, memberDTO.getId());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(con, st);
		
		return result;
		
	}
	
	
	/* 회원가입 */
	
	public int memberJoin(MemberDTO memberDTO) throws Exception {
		
		Connection con = DBConnector.getConnect();
		
		String sql = "insert into member values(?, ?, ?, ?, ?, ?)"; //id, pw, name, phone, email, age
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		st.setString(3, memberDTO.getName());
		st.setString(4, memberDTO.getPhone());
		st.setString(5, memberDTO.getEmail());
		st.setInt(6, memberDTO.getAge());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(con, st);
		
		
		return result;
		
		
	}

}
