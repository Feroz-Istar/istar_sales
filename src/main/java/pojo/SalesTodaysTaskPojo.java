package pojo;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class SalesTodaysTaskPojo {

	@SerializedName("duration")
	@Expose
	private Integer duration;
	@SerializedName("start_time")
	@Expose
	private String startTime;
	@SerializedName("profile_image")
	@Expose
	private String profileImage;
	@SerializedName("company_name")
	@Expose
	private String companyName;
	@SerializedName("actor_name")
	@Expose
	private String actorName;
	@SerializedName("rating")
	@Expose
	private Float rating;
	@SerializedName("id")
	@Expose
	private Integer id;
	@SerializedName("task_type")
	@Expose
	private String taskType;
	@SerializedName("status")
	@Expose
	private String status;

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getActorName() {
		return actorName;
	}

	public void setActorName(String actorName) {
		this.actorName = actorName;
	}

	public Float getRating() {
		return rating;
	}

	public void setRating(Float float1) {
		this.rating = float1;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTaskType() {
		return taskType;
	}

	public void setTaskType(String taskType) {
		this.taskType = taskType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
