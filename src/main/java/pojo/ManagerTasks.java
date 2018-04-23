package pojo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Random;

import com.github.javafaker.Faker;

public class ManagerTasks {
	private Integer id;
	private String taskType;
	private String contactPersonImage;
	private String companyName;
	private String contactPersonName;
	private String status;
	private String startTime;
	private String duration;
	private Float rating;
	public ManagerTasks() {
		super();
	}
	 
	public ManagerTasks(Integer id, String taskType, String contactPersonImage, String companyName,
			String contactPersonName, String status, String startTime, String duration, Float rating) {
		super();
		this.id = id;
		this.taskType = taskType;
		this.contactPersonImage = contactPersonImage;
		this.companyName = companyName;
		this.contactPersonName = contactPersonName;
		this.status = status;
		this.startTime = startTime;
		this.duration = duration;
		this.rating = rating;
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
	public String getContactPersonImage() {
		return contactPersonImage;
	}
	public void setContactPersonImage(String contactPersonImage) {
		this.contactPersonImage = contactPersonImage;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getContactPersonName() {
		return contactPersonName;
	}
	public void setContactPersonName(String contactPersonName) {
		this.contactPersonName = contactPersonName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public Float getRating() {
		return rating;
	}
	public void setRating(Float rating) {
		this.rating = rating;
	}
	
	
	
	
}
