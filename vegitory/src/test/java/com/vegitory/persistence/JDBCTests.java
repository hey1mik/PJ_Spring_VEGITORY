package com.vegitory.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBCTests {
	// 오라클 접속을 확인하기
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 마이바티스를 사용해서 오라클 접속 되는지 테스트
	@Test
	public void testConnection() {
		try (Connection conn =
			DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","USER1","1234")) {
			System.out.println(conn);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
}
