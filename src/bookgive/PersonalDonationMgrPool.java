package bookgive;

import java.io.BufferedInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PersonalDonationMgrPool extends HttpServlet {
   
   private DBConnectionMgr pool = null;
   private static final String ENCTYPE = "UTF-8";
   private static final String  SAVEFOLDER = "C:/Jsp";
   private static int MAXSIZE = 5*1024*1024;
   
   public PersonalDonationMgrPool() {
     
      try{
         pool = DBConnectionMgr.getInstance();
          }catch(Exception e){
             System.out.println("Error : 커넥션 얻어오기 실패");
             }
     }
 
   //게시판 리스트
   public Vector<PersonalDonationBean> getBoardList(String keyField, String keyWord, int start, int end) {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = null;
      Vector<PersonalDonationBean> vlist = new Vector<PersonalDonationBean>();
      try {
         con = pool.getConnection();
         
         if (keyWord.equals("null") || keyWord.equals("")) {
            sql = "select * from personal_donation order by ref desc, pos limit ?, ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, start);
            pstmt.setInt(2, end);
         } else {
            sql = "select * from personal_donation where " + keyField + " like ? ";
            sql += "order by ref desc, pos limit ?, ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%" + keyWord + "%");
            pstmt.setInt(2, start);
            pstmt.setInt(3, end);
         }
         
         rs = pstmt.executeQuery();
         while (rs.next()) {
        	 PersonalDonationBean bean = new PersonalDonationBean();
             bean.setPersonalDonationId (rs.getInt("personal_donation_id"));
             bean.setUserID (rs.getString("userID"));
             bean.setPWD (rs.getString("pwd"));
             bean.setTitle (rs.getString("title"));
             bean.setPos(rs.getInt("pos"));
             bean.setRef(rs.getInt("ref"));
             bean.setDepth(rs.getInt("depth"));
             bean.setContent (rs.getString("content"));
             bean.setCreatedAt (rs.getDate("created_at"));
             bean.setDonationState (rs.getBoolean("donation_state"));
             bean.setBookStatus (rs.getString("book_status"));
             bean.setFileName (rs.getString("filename"));
             bean.setFileSize (rs.getInt("filesize"));
             bean.setCount (rs.getInt("count"));
              
             vlist.addElement(bean);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         pool.freeConnection(con, pstmt, rs);
      }
      return vlist;
   }
   
   
   public Vector<PersonalDonationBean> getRegisterList() {
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   Vector<PersonalDonationBean> vlist = new Vector<PersonalDonationBean>();	   
       try {
          conn = pool.getConnection();
          String strQuery = "select * from personal_donation";
          stmt = conn.createStatement();
          rs = stmt.executeQuery(strQuery);
		  while (rs.next()) {
             PersonalDonationBean bean = new PersonalDonationBean();
             bean.setPersonalDonationId (rs.getInt("personal_donation_id"));
			 bean.setUserID (rs.getString("userID"));
 			 bean.setTitle (rs.getString("title"));
 			 bean.setPos(rs.getInt("pos"));
 			 bean.setRef(rs.getInt("ref"));
 			 bean.setDepth(rs.getInt("depth"));
 			 bean.setContent (rs.getString("content"));
 			 bean.setCreatedAt (rs.getDate("created_at"));
 			 bean.setDonationState (rs.getBoolean("donation_state"));
 			 bean.setBookStatus (rs.getString("book_status"));
 			vlist.addElement(bean);
          }
       } catch (Exception ex) {
          System.out.println("Exception" + ex);
       } finally {
	      pool.freeConnection(conn);
       }
       return vlist;
    }
   
   //총 게시물 수
   public int getTotalCount(String keyField, String keyWord) {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = null;
      int totalCount = 0;
      try {
         con = pool.getConnection();
         if (keyWord.equals("null") || keyWord.equals("")) {
            sql = "select count(personal_donation_id) from personal_donation";
            pstmt = con.prepareStatement(sql);
         } else {
            sql = "select count(personal_donation_id) from personal_donation where " + keyField + " like ? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%" + keyWord + "%");
         }
         rs = pstmt.executeQuery();
         if (rs.next()) {
            totalCount = rs.getInt(1);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         pool.freeConnection(con, pstmt, rs);
      }
      return totalCount;
   }
   
   
   
   //게시물 입력
   public void insertBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MultipartRequest multi = null;
		int filesize = 0;
		String filename = null;
		try {
			con = pool.getConnection();
			sql = "select max(personal_donation_id) from personal_donation";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int ref = 1;
			if (rs.next())
				ref = rs.getInt(1) + 1;
			File file = new File(SAVEFOLDER);
			if (!file.exists())
				file.mkdirs();
			multi = new MultipartRequest(req, SAVEFOLDER,MAXSIZE, ENCTYPE,
					new DefaultFileRenamePolicy());

			if (multi.getFilesystemName("filename") != null) {
				filename = multi.getFilesystemName("filename");
				filesize = (int) multi.getFile("filename").length();
			}
			String content = multi.getParameter("content");
				content = PersonalUtilMgr.replace(content, "<", "&lt;");
			sql = "insert personal_donation(userID,content,title,ref,pos,depth,created_at,donation_state, book_status,pwd,count,filename,filesize)";
			sql += "values(?, ?, ?, ?, 0, 0, now(), false, ?, ?, 0, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("userID"));
			pstmt.setString(2, content);
			pstmt.setString(3, multi.getParameter("title"));
			pstmt.setInt(4, ref);
			pstmt.setString(5, multi.getParameter("book_status"));
			pstmt.setString(6, multi.getParameter("pwd"));
			pstmt.setString(7, filename);
			pstmt.setInt(8, filesize);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

   
//게시물 리턴   

   public PersonalDonationBean getBoard(int personal_donation_id) {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = null;
      PersonalDonationBean bean = new PersonalDonationBean();
      try {
         con = pool.getConnection();
         sql = "select * from personal_donation where personal_donation_id=?";
         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, personal_donation_id);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            bean.setPersonalDonationId(rs.getInt("personal_donation_id"));
            bean.setUserID(rs.getString("userID"));
            bean.setPWD(rs.getString("pwd"));
            bean.setTitle(rs.getString("title"));
            bean.setContent(rs.getString("content"));
            bean.setPos(rs.getInt("pos"));
            bean.setRef(rs.getInt("ref"));
            bean.setDepth(rs.getInt("depth"));
            bean.setCreatedAt(rs.getDate("created_at"));
            bean.setDonationState(rs.getBoolean("donation_state"));
            bean.setBookStatus(rs.getString("book_status"));
            bean.setCount(rs.getInt("count"));
            bean.setFileName(rs.getString("filename"));
            bean.setFileSize(rs.getInt("filesize"));
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         pool.freeConnection(con, pstmt, rs);
      }
      return bean;
   }
   
   //조회수 증가
   public void upCount(int personal_donation_id) {
      Connection con = null;
      PreparedStatement pstmt = null;
      String sql = null;
      try {
         con = pool.getConnection();
         sql = "update personal_donation set count=count+1 where personal_donation_id=?";
         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, personal_donation_id);
         pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         pool.freeConnection(con, pstmt);
      }
   }
   
   //게시물 삭제
   public void deleteBoard(int personal_donation_id) {
      Connection con = null;
      PreparedStatement pstmt = null;
      String sql = null;
      ResultSet rs = null;
      try {
         con = pool.getConnection();
         sql = "select filename from personal_donation where personal_donation_id = ?";
         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, personal_donation_id);
         rs = pstmt.executeQuery();
         if (rs.next() && rs.getString(1) != null) {
            if (!rs.getString(1).equals("")) {
               File file = new File(SAVEFOLDER + "/" + rs.getString(1));
               if (file.exists())
                  PersonalUtilMgr.delete(SAVEFOLDER + "/" + rs.getString(1));
            }
         }
         sql = "delete from personal_donation where personal_donation_id=?";
         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, personal_donation_id);
         pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         pool.freeConnection(con, pstmt, rs);
      }
   }
  
   
   //게시물 수정
   public void updateBoard(PersonalDonationBean bean) {
      Connection con = null;
      PreparedStatement pstmt = null;
      String sql = null;
      try {
         con = pool.getConnection();
         sql = "update personal_donation set userID=?,title=?,content=? where personal_donation_id=?";
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, bean.getUserID());
         pstmt.setString(2, bean.getTitle());
         pstmt.setString(3, bean.getContent());
         pstmt.setInt(4, bean.getPersonalDonationId());
         pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         pool.freeConnection(con, pstmt);
      }
   }
   
   public void replyBoard(PersonalDonationBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert personal_donation (userID,content,title,ref,pos,depth,created_at,pwd,count)";
			sql += "values(?,?,?,?,?,?,now(),?,0)";
			int depth = bean.getDepth() + 1;
			int pos = bean.getPos() + 1;
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getUserID());
			pstmt.setString(2, bean.getContent());
			pstmt.setString(3, bean.getTitle());
			pstmt.setInt(4, bean.getRef());
			pstmt.setInt(5, pos);
			pstmt.setInt(6, depth);
			pstmt.setString(7, bean.getPWD());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
   
   
   public void replyUpBoard(int ref, int pos) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update personal_donation set pos = pos + 1 where ref=? and pos > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, pos);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
   }
   
   
   //첨부파일 다운로드
   public void downLoad(HttpServletRequest req, HttpServletResponse res,
         JspWriter out, PageContext pageContext) {
      try {
         String filename = req.getParameter("filename");
         File file = new File(PersonalUtilMgr.con(SAVEFOLDER + File.separator+ filename));
         byte b[] = new byte[(int) file.length()];
         res.setHeader("Accept-Ranges", "bytes");
         String strClient = req.getHeader("User-Agent");
         if (strClient.indexOf("MSIE6.0") != -1) {
            res.setContentType("application/smnet;charset=euc-kr");
            res.setHeader("Content-Disposition", "filename=" + filename + ";");
         } else {
            res.setContentType("application/smnet;charset=euc-kr");
            res.setHeader("Content-Disposition", "attachment;filename="+ filename + ";");
         }
         out.clear();
         out = pageContext.pushBody();
         if (file.isFile()) {
            BufferedInputStream fin = new BufferedInputStream(
                  new FileInputStream(file));
            BufferedOutputStream outs = new BufferedOutputStream(
                  res.getOutputStream());
            int read = 0;
            while ((read = fin.read(b)) != -1) {
               outs.write(b, 0, read);
            }
            outs.close();
            fin.close();
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   
   public static void main(String[] args) {
      new PersonalDonationMgrPool();
      System.out.println("SUCCESS");
   }
}