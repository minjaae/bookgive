package bookgive;
import java.util.Date;

public class InstitutionDonationBean{

	private int institutionDonationId;
	private String userID;
	private String title;
	private String content;
	private int pos;
	private int depth;
	private int ref;
	private Date createdAt;
	private String pass;
	private int count;
	private String filename;
	private int filesize;
	private String img;
	private Date modifiedAt;
	private String institution;
	private boolean donationState;
	private String bookStatus;
		
	
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getPos() {
		return pos;
	}
	public void setPos(int pos) {
		this.pos = pos;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
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
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
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
	public Date getCreatedAt() {
		return createdAt;
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