package bookgive;
import java.util.Date;

public class InstitutionDonationBean{

	private int institutionDonationId;
	private String userID;
	private String title;
	private String content;
	private String img;
	private Date createAt;
	private Date modifiedAt;
	private String institution;
	private boolean donationState;
	private String bookStatus;
	
	public void setInstitutionDonationId(int institutionDonationId) {
		this.institutionDonationId = institutionDonationId;
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
	public void setImg(String img) {
		this.img = img;
	}
	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	public void setModifiedAt(Date modifiedAt) {
		this.modifiedAt = modifiedAt;
	}
	public void setInstitution(String institution) {
		this.institution = institution;
	}
	public void setDonationState(boolean donationState) {
		this.donationState = donationState;
	}
	public void setBookStatus(String bookStatus) {
		this.bookStatus =bookStatus;
	}
	public int getInstitutionDonationId() {
		return institutionDonationId;
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
	public String getImg() {
		return img;
	}
	public Date getCreateAt() {
		return createAt;
	}
	public Date getModifiedAt() {
		return modifiedAt;
	}
	public String getInstitution() {
		return institution;
	}
	public boolean getDonationState() {
		return donationState;
	}
	public String getBookStatus() {
		return bookStatus;
	}
}