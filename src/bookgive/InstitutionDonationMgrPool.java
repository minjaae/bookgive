package bookgive;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

public class InstitutionDonationMgrPool {
	
	private DBConnectionMgr pool = null;
	
	public InstitutionDonationMgrPool() {
 	 try{
 	   pool = DBConnectionMgr.getInstance();
 	   }catch(Exception e){
 	      System.out.println("Error : Ŀ�ؼ� ������ ����");
 	   }
     }
 
    public Vector<InstitutionDonationBean> getRegisterList() {
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   Vector<InstitutionDonationBean> vlist = new Vector<InstitutionDonationBean>();	   
       try {
          conn = pool.getConnection();
          String strQuery = "select * from institution_donation";
          stmt = conn.createStatement();
          rs = stmt.executeQuery(strQuery);
		  while (rs.next()) {
			  InstitutionDonationBean bean = new InstitutionDonationBean();
             bean.setInstitutionDonationId (rs.getInt("institution_donation_id"));
			 bean.setUserID (rs.getString("userID"));
 			 bean.setTitle (rs.getString("title"));
 			 bean.setContent (rs.getString("content"));
 			 bean.setImg (rs.getString("img"));
 			 bean.setCreateAt (rs.getDate("create_at"));
 			 bean.setModifiedAt (rs.getDate("modified_at"));
 			 bean.setInstitution(rs.getString("institution"));
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