package bookgive;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InstitutionBoardMgr {

	private DBConnectionMgr pool;
	private static final String  SAVEFOLDER = "C:/Jsp/bookgive/WebContent/agencyfileupload";
	private static final String ENCTYPE = "UTF-8";
	private static int MAXSIZE = 5*1024*1024;

	public InstitutionBoardMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 게시판 리스트
	public Vector<InstitutionDonationBean> getBoardList(String keyField, String keyWord,
			int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<InstitutionDonationBean> vlist = new Vector<InstitutionDonationBean>();
		try {
			con = pool.getConnection();
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select * from institution_donation order by ref desc, pos limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * from institution_donation where " + keyField + " like ? ";
	            sql += "order by ref desc, pos limit ?, ?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, "%" + keyWord + "%");
	            pstmt.setInt(2, start);
	            pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				InstitutionDonationBean bean = new InstitutionDonationBean();
				bean.setInstitutionDonationId(rs.getInt("institution_donation_id"));
				bean.setUserID(rs.getString("userID"));
				bean.setTitle(rs.getString("title"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setCount(rs.getInt("count"));
				bean.setCreatedAt (rs.getDate("created_at"));
	            bean.setDonationState (rs.getBoolean("donation_state"));
	            bean.setBookStatus (rs.getString("book_status"));
	            bean.setPos(rs.getInt("pos"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//총 게시물수
	public int getTotalCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select count(institution_donation_id) from institution_donation";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select count(institution_donation_id) from  institution_donation where " + keyField + " like ? ";
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
	
	// 게시물 입력
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
			sql = "select max(institution_donation_id) from institution_donation";
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
				content = UtilMgr.replace(content, "<", "&lt;");
			sql = "insert institution_donation(userID,content,title,ref,pos,depth,created_at,pass,count,filename,filesize,book_status,donation_state)";
			sql += "values(?, ?, ?, ?, 0, 0, now(), ?, 0,?, ?, ?,false)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("userID"));
			pstmt.setString(2, content);
			pstmt.setString(3, multi.getParameter("title"));
			pstmt.setInt(4, ref);
			pstmt.setString(5, multi.getParameter("pass"));
			pstmt.setString(6, filename);
			pstmt.setInt(7, filesize);
			pstmt.setString(8, multi.getParameter("book_status"));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	// 게시물 리턴
	public InstitutionDonationBean getBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		InstitutionDonationBean bean = new InstitutionDonationBean();
		try {
			con = pool.getConnection();
			sql = "select * from institution_donation where institution_donation_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setInstitutionDonationId(rs.getInt("institution_donation_id"));
				bean.setUserID(rs.getString("userID"));
				bean.setTitle(rs.getString("title"));
				bean.setContent(rs.getString("content"));
				bean.setPass(rs.getString("pass"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setBookStatus(rs.getString("book_status"));
				bean.setCreatedAt(rs.getDate("created_at"));
				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				bean.setFilesize(rs.getInt("filesize"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	// 조회수 증가
	public void upCount(int institutionDonationId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update institution_donation set count=count+1 where institution_donation_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, institutionDonationId);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// 게시물 삭제
	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "select filename from institution_donation where institution_donation_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next() && rs.getString(1) != null) {
				if (!rs.getString(1).equals("")) {
					File file = new File(SAVEFOLDER + "/" + rs.getString(1));
					if (file.exists())
						UtilMgr.delete(SAVEFOLDER + "/" + rs.getString(1));
				}
			}
			sql = "delete from institution_donation where institution_donation_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	// 게시물 수정
	public void updateBoard(InstitutionDonationBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update institution_donation set userID=?,title=?,content=?,donation_state=? where institution_donation_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getUserID());
			pstmt.setString(2, bean.getTitle());
			pstmt.setString(3, bean.getContent());
			pstmt.setBoolean(4, bean.getDonationState());
			pstmt.setInt(5, bean.getInstitutionDonationId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// 게시물 답변
	public void replyBoard(InstitutionDonationBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert institution_donation (userID,content,title,ref,pos,depth,created_at,pass,count)";
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
			pstmt.setString(7, bean.getPass());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// 답변에 위치값 증가
	public void replyUpBoard(int ref, int pos) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update institution_donation set pos = pos + 1 where ref=? and pos > ?";
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

	//파일 다운로드
		public void downLoad(HttpServletRequest req, HttpServletResponse res,
				JspWriter out, PageContext pageContext) {
			try {
				String filename = req.getParameter("filename");
				File file = new File(UtilMgr.con(SAVEFOLDER + File.separator+ filename));
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
//		
//	//페이징 및 블럭 테스트를 위한 게시물 저장 메소드 
//	public void post1000(){
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		String sql = null;
//		try {
//			con = pool.getConnection();
//			sql = "insert tblBoard(name,content,subject,ref,pos,depth,regdate,pass,count,ip,filename,filesize)";
//			sql+="values('aaa', 'bbb', 'ccc', 0, 0, 0, now(), '1111',0, '127.0.0.1', null, 0);";
//			pstmt = con.prepareStatement(sql);
//			for (int i = 0; i < 1000; i++) {
//				pstmt.executeUpdate();
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			pool.freeConnection(con, pstmt);
//		}
//	}
//	
//	//main
//	public static void main(String[] args) {
//		new BoardMgr().post1000();
//		System.out.println("SUCCESS");
//	}
}