package pojo;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
public class SalesAnalyticsTeamUserPojo  {
	@SerializedName("phone_no")
	@Expose
	private Long phoneNo;
	@SerializedName("city")
	@Expose
	private String city;
	@SerializedName("name")
	@Expose
	private String name;
	@SerializedName("id")
	@Expose
	private Integer id;
	@SerializedName("email")
	@Expose
	private String email;
	@SerializedName("profile_image")
	@Expose
	private String profileImage;


	public Long getPhoneNo() {
	return phoneNo;
	}

	public void setPhoneNo(Long phoneNo) {
	this.phoneNo = phoneNo;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public String getCity() {
	return city;
	}

	public void setCity(String city) {
	this.city = city;
	}

	public String getName() {
	return name;
	}

	public void setName(String name) {
	this.name = name;
	}

	public Integer getId() {
	return id;
	}

	public void setId(Integer id) {
	this.id = id;
	}

	public String getEmail() {
	return email;
	}

	public void setEmail(String email) {
	this.email = email;
	}

	}

	