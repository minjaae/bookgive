package bookgive;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

public class IntroMgrPool {
	
	private DBConnectionMgr pool = null;
	
	public IntroMgrPool() {
 	 try{
 	   pool = DBConnectionMgr.getInstance();
 	   }catch(Exception e){
 	      System.out.println("Error : Ŀ�ؼ� ������ ����");
 	   }
     }
 
    public Vector<IntroBean> getRegisterList() {
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   Vector<IntroBean> vlist = new Vector<IntroBean>();	   
       try {
          conn = pool.getConnection();
          String strQuery = "select * from intro";
          stmt = conn.createStatement();
          rs = stmt.executeQuery(strQuery);
		  while (rs.next()) {
			  IntroBean bean = new IntroBean();
             bean.setStudentId (rs.getInt("studentID"));
			 bean.setName (rs.getString("name"));
 			 bean.setDepartment (rs.getString("department"));
 			 bean.setSchool (rs.getString("school"));
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