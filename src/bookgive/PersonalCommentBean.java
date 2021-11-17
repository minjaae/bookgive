package bookgive;
import java.util.Date;

public class PersonalCommentBean{

	private int comment_ID;
	private int personal_donation_ID;
	private String userID;
	private Date created_at;
	private Date modified_at;
	
	public void setCommentID(int comment_ID) {
		this.comment_ID = comment_ID;
	}
	
	public void setPersonalDonationID(int personal_donation_ID) {
		
		this.personal_donation_ID = personal_donation_ID;
	}
	
	public void setUserID(String userID) {
		
		this.userID = userID;
	}
	
	public void setCreatedAt(Date created_at) {
	
		this.created_at = created_at;
	}
	
	public void setModifiedAt(Date modified_at) {
		
		this.modified_at = modified_at;
	}
	
	public int getCommentID() {
		return comment_ID;
	}
	
	public int getPersonalDonationID() {
		return personal_donation_ID;
	}
	
	public String getUserID() {
		return userID;
	}
	
	public Date getCreatedAt() {
		return created_at;
	}
	
	public Date getModifiedAt() {
		return modified_at;
	}
	
	
	
}