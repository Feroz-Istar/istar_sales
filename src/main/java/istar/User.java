package istar;

public class User {
	private Integer id;
	private String email;
	private String password;
	private Integer age;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String email, String password, Integer age) {
		super();
		this.email = email;
		this.password = password;
		this.age = age;
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
	
	
	
	
	
}
