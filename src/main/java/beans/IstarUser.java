package beans;

import java.sql.Timestamp;

public class IstarUser {
	private String name;
	private String email;
	private String password;
	private Integer age;
	private String mobile;
	private String gender;
	private String profile_image;
	private Timestamp lastlogin;
	public IstarUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	public IstarUser(String name, String email, String password, Integer age, String mobile, String gender,
			String profile_image, Timestamp lastlogin) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.age = age;
		this.mobile = mobile;
		this.gender = gender;
		this.profile_image = profile_image;
		this.lastlogin = lastlogin;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getProfile_image() {
		return profile_image;
	}
	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}
	public Timestamp getLastlogin() {
		return lastlogin;
	}
	public void setLastlogin(Timestamp lastlogin) {
		this.lastlogin = lastlogin;
	}
	
	
}
