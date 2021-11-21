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
 }