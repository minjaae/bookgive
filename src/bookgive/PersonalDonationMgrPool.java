package bookgive;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

public class PersonalDonationMgrPool {
	
	private DBConnectionMgr pool = null;
	
	public PersonalDonationMgrPool() {
 	 try{
 	   pool = DBConnectionMgr.getInstance();
 	   }catch(Exception e){
 	      System.out.println("Error : 커넥션 얻어오기 실패");
 	   }
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
 			 bean.setContent (rs.getString("content"));
 			 bean.setCreatedAt (rs.getDate("created_at"));
 			 bean.setModifiedAt (rs.getDate("modified_at"));
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
 }