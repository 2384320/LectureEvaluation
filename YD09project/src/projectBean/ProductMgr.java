package projectBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductMgr {
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String jdbcDriver = "jdbc:mysql://localhost:3306/db?autoReconnect=true&verifyServerCertificate=false&useSSL=true&useUnidoe=true&characterEncoding=UTF-8";
	private final String dbUser = "root";
	private final String dbPass = "6720";
	
	public ProductMgr() {
	      try {
	         Class.forName(JDBC_DRIVER);
	      } catch(Exception e) {
	         System.out.println("ERROR: JDBC 드라이버 로딩 실패");
	      }
	   }
	
	public boolean insertProduct(HttpServletRequest req) {
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
        boolean result = false;
        
        try {
        	if (-1 < req.getContentType().indexOf("multipart/form-data")) {
        		int sizeLimit = 15 * 1024 * 1024;
            	String uploadDir = this.getClass().getResource("").getPath();
            	uploadDir = uploadDir.substring(1, uploadDir.indexOf(".metadata")) + "YD09project/WebContent/market/data";
                
            	MultipartRequest multi = new MultipartRequest(req, uploadDir, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());

    	    	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
                
                pstmt = conn.prepareStatement("insert into product(proname, writer, price, detail, image)"
                        + "values(?, ?, ?, ?, ?)");
                pstmt.setString(1, multi.getParameter("proname"));
                pstmt.setString(2, multi.getParameter("writer"));
                pstmt.setInt(3, Integer.parseInt(multi.getParameter("price")));
                pstmt.setString(4, multi.getParameter("detail"));
                
                if (multi.getFilesystemName("image") == null) {
                    pstmt.setString(5, "ready.gif");
                } else {
                    pstmt.setString(5, multi.getFilesystemName("image"));
                }
                int count = pstmt.executeUpdate();
                if (count == 1) result = true;
        	}
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
        	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return result;
    }
	
	public ArrayList<ProductBean> getProductAll(){
		ArrayList<ProductBean> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from product order by prono desc";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ProductBean bean = new ProductBean();
				bean.setProno(rs.getInt("prono"));
				bean.setProname(rs.getString("proname"));
				bean.setWriter(rs.getString("writer"));
				bean.setPrice(rs.getInt("price"));
				bean.setDetail(rs.getString("detail"));
				bean.setImage(rs.getString("image"));
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
	
	public ArrayList<ProductBean> getProductAll_main(){
		ArrayList<ProductBean> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from product order by prono desc LIMIT 3";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ProductBean bean = new ProductBean();
				bean.setProno(rs.getInt("prono"));
				bean.setProname(rs.getString("proname"));
				bean.setWriter(rs.getString("writer"));
				bean.setPrice(rs.getInt("price"));
				bean.setDetail(rs.getString("detail"));
				bean.setImage(rs.getString("image"));
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
	
	public ProductBean getProduct(String no) {
		ProductBean bean = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			String sql = "select * from product where prono=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
		        bean = new ProductBean();
		        bean.setProno(rs.getInt("Prono"));
		        bean.setProname(rs.getString("Proname"));
		        bean.setWriter(rs.getString("Writer"));
		        bean.setPrice(rs.getInt("price"));
		        bean.setDetail(rs.getString("detail"));
		        bean.setImage(rs.getString("image"));
		    }        
		} catch (Exception e) {
		    System.out.println("Exception" + e);
		} finally {
		    if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return bean;
	}
	
    public boolean sendEmail(String email) {
        String TO = email;
        final String user = "dnsdudwk1549@gmail.com";
        final String password = "dnsdudwk12";
        
        String SUBJECT = "동양미래 강의평가 사이트입니다.";
        
        String BODY = "장터에서 구매하기 버튼을 누르셨습니다. 확인 후 판매자 분의 이메일을 보내드리겠습니다.";
        
        System.setProperty("https.protocols", "TLSv1,TLSv1.1,TLSv1.2");
        System.setProperty("jsse.enableSNIExtension", "false");
        
        Properties props = new Properties();
        props.put("mail.transport.protocal", "smtp");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.port", "465"); 
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.debug", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");
        
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
            	return new PasswordAuthentication(user, password);
            }
        });
            try {
            	MimeMessage msg = new MimeMessage(session);
                msg.setFrom(new InternetAddress(user));
                msg.addRecipient(Message.RecipientType.TO, new InternetAddress(TO));
                msg.setSubject(SUBJECT);
                msg.setText(BODY, "UTF-8");
                Transport transport = session.getTransport("smtps");
                transport.connect("smtp.gmail.com", 465, user, password);
                transport.sendMessage(msg, msg.getAllRecipients());
                transport.close();
                System.out.println("13");
                return true;
            } catch (AddressException e) {
                e.printStackTrace();
            } catch (MessagingException e) {
                e.printStackTrace();
            }
            return false;
        }
    
    public void delete(String pro_no) {
		String sql = "delete from product where prono = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pro_no);
			
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
