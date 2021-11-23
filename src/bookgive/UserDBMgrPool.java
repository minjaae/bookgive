package bookgive;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import bookgive.DBConnectionMgr;

public class UserDBMgrPool {
	
	private DBConnectionMgr pool = null;
	
	public UserDBMgrPool() {
 	 try{
 	   pool = DBConnectionMgr.getInstance();
 	   }catch(Exception e){
 	      System.out.println("Error : 커넥션 얻어오기 실패");
 	   }
     }
 
    public Vector<UserBean> getRegisterList() {
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   Vector<UserBean> vlist = new Vector<UserBean>();	   
       try {
          conn = pool.getConnection();
          String strQuery = "select * from userdb";
          stmt = conn.createStatement();
          rs = stmt.executeQuery(strQuery);
		  while (rs.next()) {
			 UserBean bean = new UserBean();
			 bean.setUserID (rs.getString("userID"));
 			 bean.setName (rs.getString("name"));
 			 bean.setPwd (rs.getString("pwd"));
 			 bean.setPhone (rs.getString("phone"));
 			 bean.setAddress (rs.getString("address"));
 			 bean.setEmail (rs.getString("email"));
 			 bean.setRole (rs.getString("role"));
 			 bean.setDescription(rs.getString("description"));
 			vlist.addElement(bean);
          }
       } catch (Exception ex) {
          System.out.println("Exception" + ex);
       } finally {
	      pool.freeConnection(conn);
       }
       return vlist;
    }
    
    //로그인
    public boolean login(String id, String pwd) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
            con = pool.getConnection();
			String query = "select count(*) from userdb where userID = ? and pwd = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, id);
            pstmt.setString(2, pwd);
            rs = pstmt.executeQuery();
            if(rs.next()&&rs.getInt(1)>0) 
            	loginCon =true;
        }catch(Exception ex) {
            System.out.println("Exception" + ex);
        }finally{
             pool.freeConnection(con,pstmt,rs);
        }
        return loginCon;
    }
    
 // ID 중복확인
 	public boolean checkId(String id) {
 		Connection con = null;
 		PreparedStatement pstmt = null;
 		ResultSet rs = null;
 		String sql = null;
 		boolean flag = false;
 		try {
 			con = pool.getConnection();
 			sql = "select userID from userdb where userID = ?";
 			pstmt = con.prepareStatement(sql);
 			pstmt.setString(1, id);
 			flag = pstmt.executeQuery().next();
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			pool.freeConnection(con, pstmt, rs);
 		}
 		return flag;
 	}

 	// 우편번호 검색
 	public Vector<ZipcodeBean> zipcodeRead(String area3) {
 		Connection con = null;
 		PreparedStatement pstmt = null;
 		ResultSet rs = null;
 		String sql = null;
 		Vector<ZipcodeBean> vlist = new Vector<ZipcodeBean>();
 		try {
 			con = pool.getConnection();
 			sql = "select * from tblZipcode where area3 like ?";
 			pstmt = con.prepareStatement(sql);
 			pstmt.setString(1, "%" + area3 + "%");
 			rs = pstmt.executeQuery();
 			while (rs.next()) {
 				ZipcodeBean bean = new ZipcodeBean();
 				bean.setZipcode(rs.getString(1));
 				bean.setArea1(rs.getString(2));
 				bean.setArea2(rs.getString(3));
 				bean.setArea3(rs.getString(4));
 				vlist.addElement(bean);
 			}
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			pool.freeConnection(con, pstmt, rs);
 		}
 		return vlist;
 	}

 	// 회원가입
 	public boolean insertMember(UserBean bean) {
 		Connection con = null;
 		PreparedStatement pstmt = null;
 		String sql = null;
 		boolean flag = false;
 		try {
 			con = pool.getConnection();
 			sql = "insert userdb(userID,role,name,pwd,email,phone,zipcode,address"
			+ ")values(?,?,?,?,?,?,?,?)";
 			pstmt = con.prepareStatement(sql);
 			pstmt.setString(1, bean.getUserID());
 			pstmt.setString(2, bean.getRole());
 			pstmt.setString(3, bean.getName());
 			pstmt.setString(4, bean.getPwd());
 			pstmt.setString(5, bean.getEmail());
 			pstmt.setString(6, bean.getPhone());
 			pstmt.setString(7, bean.getZipcode());
 			pstmt.setString(8, bean.getAddress());
 			if (pstmt.executeUpdate() == 1)
 				flag = true;
 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			pool.freeConnection(con, pstmt);
 		}
 		return flag;
 	}
 }