package projectBean;

import java.sql.*;
import java.util.ArrayList;

public class BoardMgr {
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String jdbcDriver = "jdbc:mysql://localhost:3306/db?autoReconnect=true&verifyServerCertificate=false&useSSL=true&useUnidoe=true&characterEncoding=UTF-8";
	private final String dbUser = "root";
	private final String dbPass = "6720";
	
	private int tot = 0;
	private int pList = 5;
	private int pageSu = 0;
	
	
	public BoardMgr() {
		try {
			Class.forName(JDBC_DRIVER);
	    } catch(Exception e) {
	        System.out.println("ERROR: JDBC 드라이버 로딩 실패");
	    }
	}
	
	public int currentGetmaxnum() { 
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "select max(num) from board";
		int cnt = 0;
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(!rs.next()) cnt = 1;
			else cnt = rs.getInt(1);
			
		} catch (Exception e) {
			System.out.println("currentGetmaxnum err : " + e);
		} finally {
	         if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	         if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	         if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	      }
		return cnt;
	}
	
	public void saveData(BoardBean bean) {
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
		String sql = "insert into board values(?,?,?,?,?,?,?,?,?,?)";
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bean.getNum());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPass());
			pstmt.setString(4, bean.getTitle());
			pstmt.setString(5, bean.getCont());
			pstmt.setString(6, bean.getBdate());
			pstmt.setInt(7,0); //readcnt
			pstmt.setInt(8,bean.getGnum());
			pstmt.setInt(9,0); //onum
			pstmt.setInt(10,0); //nested
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("saveData err: " + e);
		}finally {
	         if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	         if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	         if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	      }
	}
	
	public void totalList() {
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
		String sql = "select count(*) from board";
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			tot = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("totallist err :" + e);
		}finally {
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
	
	public ArrayList<BoardBean> getDataAll(int page, String stype, String sword){
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
		ArrayList<BoardBean> list = new ArrayList<>();
		String sql = "select * from board";
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			if(sword == null) { //sword가 검색이 없을 경우
				sql += " order by gnum desc,onum asc";
				pstmt = conn.prepareStatement(sql);
			}else { // 검색이 있을 경우
				sql += " where " + stype + " like ?";
				sql += " order by gnum desc,onum asc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + sword + "%");
			}
			
			rs = pstmt.executeQuery();
			
			for(int i = 0; i < (page -1) * pList; i++) {
				rs.next(); // 레코드 위치, 0, 4, 9...
			}
			int k = 0;
			while(rs.next() && k < pList) {
				BoardBean boardBean = new BoardBean();
				boardBean.setNum(rs.getInt("num"));
				boardBean.setName(rs.getString("name"));
				boardBean.setTitle(rs.getString("title"));
				boardBean.setBdate(rs.getString("bdate"));
				boardBean.setReadcnt(rs.getInt("readcnt"));
				boardBean.setNested(rs.getInt("nested"));
				list.add(boardBean);				
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
	
	public ArrayList<BoardBean> getBoardAll_main(){
		ArrayList<BoardBean> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from board order by num desc LIMIT 5";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setPass(rs.getString("pass"));
				bean.setTitle(rs.getString("title"));
				bean.setCont(rs.getString("cont"));
				bean.setBdate(rs.getString("bdate"));
				bean.setReadcnt(rs.getInt("readcnt"));
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
	
	public BoardBean getData(String num) {
		BoardBean boardBean = null;
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
		try {
			String sql = " select * from board where num=?";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				boardBean = new BoardBean();
				boardBean.setName(rs.getString("name"));
				boardBean.setPass(rs.getString("pass")); //비밀번호
				boardBean.setTitle(rs.getString("title")); // 글제목
				boardBean.setCont(rs.getString("cont")); // 컨텐트
				boardBean.setBdate(rs.getString("bdate")); // 등록일
				boardBean.setReadcnt(rs.getInt("readcnt")); // 조회수
			}
			
		} catch (Exception e) {
			System.out.println("getData err" + e);
		}finally {
	         if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	         if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	         if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	      }
		
		return boardBean;
	}
	
	public void updateReadcnt(String num) {
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
		// 글 내용 보기 전에 조회수 증가 작업
		try {
			String sql = "update board set readcnt=readcnt + 1 where num=?";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateReadcnt err" + e);
		}finally {
	         if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	         if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	         if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	      }
	}

	public void updateOnum(int gnum, int onum) {
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
		try {
			String sql = "update board set onum=onum+1 where onum >= ? and gnum=?";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, onum);
			pstmt.setInt(2, gnum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateOnum err" + e);
		}finally {
	         if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	         if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	         if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	      }
	}
	
	public boolean checkPass(int num, String new_pass) {
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
		// 수정 작업을 하기 전에 비밀번호 검사 : db에 잇는 비밀 == new__pass 여부 확인
		boolean b = false;
		try {
			String sql = "select pass from board where num=?";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(new_pass.equals(rs.getString("pass"))) {
					b = true;
				}
			}
			
		} catch (Exception e) {
			System.out.println("checkPass err" + e);
		}finally {
	         if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	         if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	         if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	      }
		
		
		return b;
	}
	
	public void saveEdit(BoardBean bean) {
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
		String sql = "update board set name=?, title=?, cont=? where num=?";
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getTitle());
			pstmt.setString(3, bean.getCont());			
			pstmt.setInt(4, bean.getNum());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("saveEdit err" + e);
		}finally {
	         if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	         if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	         if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	      }
	}
	
	public void saveDelete(BoardBean bean) {
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
		String sql = "delete from board where gnum=?";
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,bean.getNum());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("delete err" + e);
		}finally {
	         if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	         if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	         if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	      }
	}
	
}