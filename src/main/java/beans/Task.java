package beans;

import java.sql.Timestamp;
import java.util.Date;


public class Task {
	private String task_type;
	private String task_title;
	private String task_description;
	private Date start_date;
	private Long duration;
	private Integer score;
	private Long user_id;
	private Long target_user_id;
	private String status;
	private Long id;

	// [START keys]
	public static final String TASK_TYPE = "task_type";
	public static final String TASK_TITLE = "task_title";
	public static final String TASK_DESCRIPTION = "task_description";
	public static final String START_DATE = "start_date";
	public static final String DURATION = "duration";
	public static final String SCORE = "score";
	public static final String USER_ID = "user_id";
	public static final String TARGET_USER_ID = "target_user_id";
	public static final String STATUS = "status";
	public static final String ID = "id";
	// [END keys]

	
	private Task(Builder builder) {
		this.task_type = builder.task_type;
		this.task_title = builder.task_title;
		this.task_description = builder.task_description;
		this.start_date = builder.start_date;
		this.duration = builder.duration;
		this.score = builder.score;
		this.user_id = builder.user_id;
		this.target_user_id = builder.target_user_id;
		this.status = builder.status;
		this.id = builder.id;
	}
	

	public String getTask_type() {
		return task_type;
	}

	public void setTask_type(String task_type) {
		this.task_type = task_type;
	}

	public String getTask_title() {
		return task_title;
	}

	public void setTask_title(String task_title) {
		this.task_title = task_title;
	}

	public String getTask_description() {
		return task_description;
	}

	public void setTask_description(String task_description) {
		this.task_description = task_description;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Long getDuration() {
		return duration;
	}

	public void setDuration(Long duration) {
		this.duration = duration;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Long getUser_id() {
		return user_id;
	}

	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}

	public Long getTarget_user_id() {
		return target_user_id;
	}

	public void setTarget_user_id(Long target_user_id) {
		this.target_user_id = target_user_id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	// [END builder]

	public  static  class Builder {
		private String task_type;
		private String task_title;
		private String task_description;
		private Date start_date;
		private Long duration;
		private Integer score;
		private Long user_id;
		private Long target_user_id;
		private String status;
		private Long id;

		public Builder task_type(String task_type) {
			this.task_type = task_type;
			return this;
		}

		public Builder task_title(String task_title) {
			this.task_title = task_title;
			return this;
		}

		public Builder task_description(String task_description) {
			this.task_description = task_description;
			return this;
		}

		public Builder start_date(Date start_date) {
			this.start_date = start_date;
			return this;
		}

		public Builder duration(Long duration) {
			this.duration = duration;
			return this;
		}

		public Builder score(Integer score) {
			this.score = score;
			return this;
		}

		public Builder user_id(Long user_id) {
			this.user_id = user_id;
			return this;
		}

		public Builder target_user_id(Long target_user_id) {
			this.target_user_id = target_user_id;
			return this;
		}

		public Builder status(String status) {
			this.status = status;
			return this;
		}

		public Builder id(Long id) {
			this.id = id;
			return this;
		}

		public Task build() {
			return new Task(this);
		}
	}

	
}
