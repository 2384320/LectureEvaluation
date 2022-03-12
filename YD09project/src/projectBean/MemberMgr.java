package projectBean;

import java.sql.*;
import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

import projectBean.MemberBean;

public class MemberMgr {
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String jdbcDriver = "jdbc:mysql://localhost:3306/db?autoReconnect=true&verifyServerCertificate=false&useSSL=true&useUnidoe=true&characterEncoding=UTF-8";
	private final String dbUser = "root";
	private final String dbPass = "6720";
	
	public MemberMgr() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch(Exception e) {
			System.out.println("ERROR: JDBC 드라이버 로딩 실패");
		}
	}
	
    public boolean checkId(String i) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean checkCon = false;
        try {
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
            pstmt = conn.prepareStatement("select memberid from membertbl where memberid = ?");
            pstmt.setString(1, i);
            rs = pstmt.executeQuery();
            checkCon = rs.next();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
        	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        }
        return checkCon;
    }
	
	public void insertMember(MemberBean mem) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement("insert into membertbl values (?, ?, ?, ?, ?, ?)");
			pstmt.setNString(1,  mem.getMemberid());
			pstmt.setNString(2,  mem.getPassword());
			pstmt.setNString(3,  mem.getName());
			pstmt.setNString(4,  mem.getEmail());
			pstmt.setNString(5,  mem.getStudentdp());
			pstmt.setNString(6,  mem.getStudentid());
			
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return ;
	}
	
	public boolean adminLoginCheck(String i, String p) {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean adminLoginCon = false;
        try {
        	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
            pstmt = conn.prepareStatement("select adminid, password from admintbl where adminid = ? and password = ?");
            pstmt.setString(1, i);
            pstmt.setString(2, p);
            rs = pstmt.executeQuery();
            adminLoginCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
        	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        }
        return adminLoginCon;
	}
	
    public boolean loginCheck(String i, String p) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
        	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
            pstmt = conn.prepareStatement("select memberid, password from membertbl where memberid = ? and password = ?");
            pstmt.setString(1, i);
            pstmt.setString(2, p);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
        	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        }
        return loginCon;
    }
    
    public ArrayList<MemberBean> getMyAll(String mem_id) {
		ArrayList<MemberBean> list = new ArrayList<>();
    	Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
	    String query = "select * from membertbl where memberid = ? order by MEMBERID";

        try {
        	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
        	stmt = conn.prepareStatement(query);
			stmt.setString(1, mem_id);
			
			rs = stmt.executeQuery();
			
			while(rs.next()){
				MemberBean bean = new MemberBean();
				bean.setMemberid(rs.getString("memberid"));
				bean.setPassword(rs.getString("password"));
				bean.setName(rs.getString("name"));
				bean.setEmail(rs.getString("email"));
				bean.setStudentdp(rs.getString("studentdp"));
				bean.setStudentid(rs.getString("studentid"));
				list.add(bean);
			}
		     
		
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
        	if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        }
        return list;
    }
    
    
    public String getUserEmail(String memberid) {
    		Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
    		
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement("select email from membertbl where memberid = ?");
			pstmt.setString(1, memberid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				return rs.getString(1); // 이메일 주소 반환
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
        	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        }
		return null; // 데이터베이스 오류
	}
    
    public String getUserName(String memberid) {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement("select name from membertbl where memberid = ?");
			pstmt.setString(1, memberid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				return rs.getString(1); // 이메일 주소 반환
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
	    	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	    }
		return null; // 데이터베이스 오류
    }

    public String getAdminName(String memberid) {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement("select name from admintbl where adminid = ?");
			pstmt.setString(1, memberid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				return rs.getString(1); // 이메일 주소 반환
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
	    	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	    }
		return null; // 데이터베이스 오류
    }
    
    public ArrayList<MemberBean> getMemberAll(){
		ArrayList<MemberBean> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from membertbl order by MEMBERID";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				MemberBean bean = new MemberBean();
				bean.setMemberid(rs.getString("memberid"));
				bean.setPassword(rs.getString("password"));
				bean.setName(rs.getString("name"));
				bean.setEmail(rs.getString("email"));
				bean.setStudentdp(rs.getString("studentdp"));
				bean.setStudentid(rs.getString("studentid"));
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("Exception" + e);
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return list;
	}

    public void deleteMember(String memberid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			String sql = "delete from membertbl where MEMBERID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberid);
			pstmt.executeUpdate();		           
		} catch (Exception e) {
		    System.out.println("Exception" + e);
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return ;
	}
}
