package projectBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class EvaluationMgr {
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String jdbcDriver = "jdbc:mysql://localhost:3306/db?autoReconnect=true&verifyServerCertificate=false&useSSL=true&useUnidoe=true&characterEncoding=UTF-8";
	private final String dbUser = "root";
	private final String dbPass = "6720";

	private int tot = 0;
	private int pList = 5;
	private int pageSu = 0;
	
	public EvaluationMgr() {
		try {
			Class.forName(JDBC_DRIVER);
	    } catch(Exception e) {
	        System.out.println("ERROR: JDBC 드라이버 로딩 실패");
	    }
	}
	
	public void write(EvaluationBean eva) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into evaluation (lectureName, professName, lectureYear, semesterDivide, evaluationContent, totalScore, likeCount, gnum, onum, nested)"
                + "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eva.getLectureName());
            pstmt.setString(2, eva.getProfessName());
            pstmt.setInt(3, eva.getLectureYear());
            pstmt.setString(4, eva.getSemesterDivide());
            pstmt.setString(5, eva.getEvaluationContent());
            pstmt.setString(6, eva.getTotalScore());
            pstmt.setInt(7, 0);
            pstmt.setInt(8, eva.getGnum());
            pstmt.setInt(9, 0);
            pstmt.setInt(10, 0);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return ;
	}
	
	
	/*public void write(EvaluationBean eva) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into evaluation values(null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eva.getLectureName());
            pstmt.setString(2, eva.getProfessName());
            pstmt.setInt(3, eva.getLectureYear());
            pstmt.setString(4, eva.getSemesterDivide());
            pstmt.setString(5, eva.getEvaluationContent());
            pstmt.setString(6, eva.getTotalScore());
            pstmt.setInt(7,0);
            pstmt.setInt(8,eva.getGnum());
            pstmt.setInt(9,0);
            pstmt.setInt(10,0);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return ;
	}*/
	
	public void totalList() {
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
		String sql = "select count(*) from evaluation";
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			tot = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("totallist err :" + e);
		} finally {
	         if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	         if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	         if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	    }
	}
	
	public int getPageSu() { // 총 페이지 수 반환
		pageSu = tot / pList;
		if(tot % pList > 0)pageSu++;
		return pageSu;
	}
	
	public ArrayList<EvaluationBean> getDataAll(int re_page, String stype, String sword){
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
		ArrayList<EvaluationBean> list = new ArrayList<>();
		String sql = "select * from evaluation";
		
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			if(sword == null) { //sword가 검색이 없을 경우
				sql += " order by evaluationID desc, gnum desc, onum asc";
				pstmt = conn.prepareStatement(sql);
			}else { // 검색이 있을 경우
				sql += " where " + stype + " like ?";
				sql += " order by gnum desc, onum asc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + sword + "%");
			}
			
			rs = pstmt.executeQuery();
			
			for(int i = 0; i < (re_page -1) * pList; i++) {
				rs.next(); // 레코드 위치, 0, 4, 9...
			}
			int k = 0;
			while(rs.next() && k < pList) {
				EvaluationBean bean = new EvaluationBean();
				bean.setEvaluationID(rs.getInt("evaluationID"));
				bean.setLectureName(rs.getString("lectureName"));
				bean.setProfessName(rs.getString("professName"));
				bean.setLectureYear(rs.getInt("lectureYear"));
				bean.setSemesterDivide(rs.getString("semesterDivide"));
				bean.setEvaluationContent(rs.getString("evaluationContent"));
				bean.setTotalScore(rs.getString("totalScore"));
				bean.setLikeCount(rs.getInt("likeCount"));
				bean.setNested(rs.getInt("nested"));
				
				list.add(bean);				
				k++;
			}				
		} catch (Exception e) {
			System.out.println("getDataAll err" + e);
		}finally {
	         if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	         if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	         if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	      }
		return list;
	}
	

	public void like(String eva_id) {
		String sql = "update evaluation set likeCount = likeCount + 1 where evaluationID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eva_id);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	         if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return ; 
	}
	
	public void delete(String eva_id) {
		String sql = "delete from evaluation where evaluationID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eva_id);
			
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return ; 
	}
	
}