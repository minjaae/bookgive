package bookgive;


//@WebServlet("/RegisterBeanBookGive")

public class UserBean{
	
	private String userID;
	private String name;
	private String pwd;
	private String phone;
	private String address;
	private String email;
	private String role;
	private String description;
	
	
	public void setUserID (String userID) {
		this.userID = userID;
	}
       
	public void setName (String name) {
		this.name = name;
	}
       
	public void setPwd (String pwd) {
		this.pwd = pwd;
	}
       
	public void setPhone (String phone) {
		this.phone = phone;
	}
       
	public void setAddress (String address) {
		this.address = address;
	}
       
	public void setEmail (String email) {
		this.email = email;
	}
       
	public void setRole (String role) {
		this.role = role;
	}
	
	public void setDescription (String description) {
		this.description = description;
	}
       
	
	public String getUserId() {
		return userID;
	}

	public String getName() {
		return name;
	}

	public String getPwd() {
		return pwd;
	}

	public String getPhone() {
		return phone;
	}

	public String getAddress() {
		return address;
	}

	public String getEmail() {
		return email;
	}
	
	public String getRole() {
		return role;
	}
	
	public String getDescription() {
		return description;
	}
	
}
