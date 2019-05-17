package com.hyuna.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnector {
	
	
	//Connection
	
	public static Connection getConnect() throws Exception {
		
		//1. 4가지 정보
		
		String user = "user03";
		String password = "user03";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String driver = "oracle.jdbc.driver.OracleDriver";
		
		//2. driver 메모리에 로딩
		
		Class.forName(driver);
		
		//3. 로그인 Connection
		
		Connection con = DriverManager.getConnection(url, user, password);
		
		
		return con;
	}
	
	public static void disConnect(Connection con) throws Exception {
		
		con.close();
		
	}
	
	
	public static void disConnect(Connection con, PreparedStatement st) throws Exception {
		
		st.close();
		con.close();
		
	}
	
	public static void disConnect(Connection con, PreparedStatement st, ResultSet rs) throws Exception {
		
		rs.close();
		st.close();
		con.close();
		
		
	}

}
