package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.Customer;

public class CustomerDAO {
	final static String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	final static String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	
	//데이터 베이스 연결 메소드
	public Connection open() {
		Connection conn = null;
		
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, "test", "test1234");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	//고객 리스트 가져오는 메소드
	public ArrayList<Customer> getList() throws Exception {
		Connection conn = open();
		ArrayList<Customer> customerList = new ArrayList<>();
		
		String sql = "SELECT id, name, point, grade FROM customer";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		try(conn; pstmt; rs) {
			while(rs.next()) {
				Customer c = new Customer();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setPoint(rs.getInt("point"));
				c.setGrade(rs.getString("grade"));
				
				customerList.add(c);
			}
		}
		return customerList;
		
	}
	
	//고객 상세정보 가져오는 메소드
	public Customer getDetail(int id) throws Exception {
		Connection conn = open();
		Customer c = new Customer();
		
		String sql = "select id, name, address, phone, gender, age, img, point, grade from customer where id=? order by id";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,  id);
		ResultSet rs = pstmt.executeQuery();
		
		
		try(conn; pstmt; rs) {
			while(rs.next()) {
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setAddress(rs.getString("address"));
				c.setPhone(rs.getString("phone"));
				c.setGender(rs.getString("gender"));
				c.setAge(rs.getInt("age"));
				c.setImg(rs.getString("img"));
				c.setPoint(rs.getInt("point"));
				c.setGrade(rs.getString("grade"));
				
			}
		}
		
		return c;
	}
	
	//고객 등록하는 메소드
	public void registCustomer(Customer c) throws Exception {
		Connection conn = open();
		String sql = "INSERT INTO customer values(customer_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		try(conn; pstmt) {
			pstmt.setString(1, c.getName());
			pstmt.setString(2, c.getAddress());
			pstmt.setString(3, c.getPhone());
			pstmt.setString(4, c.getGender());
			pstmt.setInt(5, c.getAge());
			pstmt.setString(6, c.getImg());
			pstmt.setInt(7, c.getPoint());
			pstmt.setString(8, c.getGrade());
			pstmt.executeUpdate();
		}
		
	}

	//고객 정보 수정하는 메소드
	public void editCustomer(Customer c) throws Exception {
		Connection conn = open();
		String sql = "UPDATE customer SET name=?, address=?, phone=?, gender=?, age=?, img=?, point=?, grade=? WHERE id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		try (conn; pstmt) {
			pstmt.setString(1, c.getName());
			pstmt.setString(2, c.getAddress());
			pstmt.setString(3, c.getPhone());
			pstmt.setString(4, c.getGender());
			pstmt.setInt(5, c.getAge());
			pstmt.setString(6, c.getImg());
			pstmt.setInt(7, c.getPoint());
			pstmt.setString(8, c.getGrade());
			pstmt.setInt(9, c.getId());
			pstmt.executeUpdate();
		}
	}

	//고객 정보 삭제하는 메소드
	public void deleteCustomer(int id) throws Exception {
		Connection conn = open();
		String sql = "DELETE FROM customer WHERE id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		try(conn; pstmt) {
			pstmt.setInt(1, id);
			
			if(pstmt.executeUpdate() != 1) {
				throw new Exception("삭제된 고객이 없습니다.");
			}
		}
	}

}
