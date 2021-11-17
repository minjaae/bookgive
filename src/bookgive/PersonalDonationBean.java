package bookgive;
import java.util.Date;

public class PersonalDonationBean{

	private int personalDonationId;
	private String userID;
	private String title;
	private String content;
	private Date createAt;
	private Date modifiedAt;
	private boolean donationState;
	private String bookStatus;
	
	public void setPersonalDonationId(int personalDonationId) {
		this.personalDonationId = personalDonationId;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	public void setModifiedAt(Date modifiedAt) {
		this.modifiedAt = modifiedAt;
	}
	public void setDonationState(boolean donationState) {
		this.donationState = donationState;
	}
	public void setBookStatus(String bookStatus) {
		this.bookStatus =bookStatus;
	}
	public int getPersonalDonationId() {
		return personalDonationId;
	}
	public String getUserID() {
		return userID;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public Date getCreateAt() {
		return createAt;
	}
	public Date getModifiedAt() {
		return modifiedAt;
	}
	public boolean getDonationState() {
		return donationState;
	}
	public String getBookStatus() {
		return bookStatus;
	}
}