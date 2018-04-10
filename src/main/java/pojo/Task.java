package pojo;

import java.sql.Timestamp;

public class Task {
	private Integer id;
	private String name;
	private String description;
	private IstarUser target_user;
	private String status;
	private Timestamp start_time;
	private Integer duration;
	private Integer score;
	private Integer user_id;
	private String task_type;
	public Task() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Task(Integer id, String name, String description,  String status, Timestamp start_time,
			Integer duration, Integer score, Integer user_id, String task_type) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.status = status;
		this.start_time = start_time;
		this.duration = duration;
		this.score = score;
		this.user_id = user_id;
		this.task_type = task_type;
	}
	public Task(String name, String description, IstarUser target_user, String status, Timestamp start_time,
			Integer duration, Integer score, Integer user_id, String task_type) {
		super();
		this.name = name;
		this.description = description;
		this.target_user = target_user;
		this.status = status;
		this.start_time = start_time;
		this.duration = duration;
		this.score = score;
		this.user_id = user_id;
		this.task_type = task_type;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public IstarUser getTarget_user() {
		return target_user;
	}
	public void setTarget_user(IstarUser target_user) {
		this.target_user = target_user;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Timestamp getStart_time() {
		return start_time;
	}
	public void setStart_time(Timestamp start_time) {
		this.start_time = start_time;
	}
	public Integer getDuration() {
		return duration;
	}
	public void setDuration(Integer duration) {
		this.duration = duration;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getTask_type() {
		return task_type;
	}
	public void setTask_type(String task_type) {
		this.task_type = task_type;
	}
	
	
	
	
	
}
