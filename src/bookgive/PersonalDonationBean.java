package bookgive;
import java.util.Date;

public class PersonalDonationBean{

   private int personal_donation_id;
   private String userID;
   private String pwd;
   private String title;
   private String content;
   private Date created_at;
   private boolean donation_state;
   private String book_status;
   private String filename;
   private int filesize;
   private int count;
   
   public void setPersonalDonationId(int personal_donation_id) {
      this.personal_donation_id = personal_donation_id;
   }
   public void setUserID(String userID) {
      this.userID = userID;
   }
   public void setPWD(String pwd) {
      this.pwd = pwd;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public void setCreatedAt(Date created_at) {
      this.created_at = created_at;
   }
   public void setDonationState(boolean donation_state) {
      this.donation_state = donation_state;
   }
   public void setBookStatus(String book_status) {
      this.book_status =book_status;
   }
   public void setFileName(String filename) {
      this.filename =filename;
   }
   public void setFileSize(int filesize) {
      this.filesize =filesize;
   }
   public void setCount(int count) {
      this.count = count;
   }
   
   public int getPersonalDonationId() {
      return personal_donation_id;
   }
   public String getUserID() {
      return userID;
   }
   public String getPWD() {
      return pwd;
   }
   public String getTitle() {
      return title;
   }
   public String getContent() {
      return content;
   }
   public Date getCreatedAt() {
      return created_at;
   }
 
   public boolean getDonationState() {
      return donation_state;
   }
   public String getBookStatus() {
      return book_status;
   }
   public String getFileName() {
      return filename;
   }
   public int getFileSize() {
      return filesize;
   }
   public int getCount() {
      return count;
   }
      
}