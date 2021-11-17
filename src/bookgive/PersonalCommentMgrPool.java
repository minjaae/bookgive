package bookgive;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

public class PersonalCommentMgrPool {
	
	private DBConnectionMgr pool = null;
	
	public PersonalCommentMgrPool() {
 	 try{
 	   pool = DBConnectionMgr.getInstance();
 	   }catch(Exception e){
 	      System.out.println("Error : 커넥션 얻어오기 실패");
 	   }
     }
 
    public Vector<PersonalCommentBean> getRegisterList() {
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   Vector<PersonalCommentBean> vlist = new Vector<PersonalCommentBean>();	   
       try {
          conn = pool.getConnection();
          String strQuery = "select * from personal_comment";
          stmt = conn.createStatement();
          rs = stmt.executeQuery(strQuery);
		  while (rs.next()) {
			  PersonalCommentBean bean = new PersonalCommentBean();
             bean.setCommentID (rs.getInt("comment_ID"));
			 bean.setPersonalDonationID (rs.getInt("personal_donation_ID"));
 			 bean.setUserID (rs.getString("userID"));
 			 bean.setCreatedAt (rs.getDate("created_at"));
 			 bean.setModifiedAt (rs.getDate("modified_at"));
 			vlist.addElement(bean);
          }
       } catch (Exception ex) {
          System.out.println("Exception" + ex);
       } finally {
	      pool.freeConnection(conn);
       }
       return vlist;
    }
 }