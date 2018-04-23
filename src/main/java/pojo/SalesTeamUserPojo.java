package pojo;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class SalesTeamUserPojo {
	@SerializedName("profile_image")
	@Expose
	private String profile_image;
	@SerializedName("name")
	@Expose
	private String name;
	@SerializedName("id")
	@Expose
	private Integer id;

	public String getProfileImage() {
	return profile_image;
	}

	public void setProfileImage(String profileImage) {
	this.profile_image = profileImage;
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

	}