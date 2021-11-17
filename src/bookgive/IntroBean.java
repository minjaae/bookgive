package bookgive;

import java.util.Date;

public class IntroBean{

	private int studentId;
	private String name;
	private String department;
	private String school;
	
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public int getStudentId() {
		return studentId;
	}
	public String getName() {
		return name;
	}
	public String getDepartment() {
		return department;
	}
	public String getSchool() {
		return school;
	}
}