package pojo;

public class IstarUser {
private Integer id;
private String email;
private String password;
private String userimage;
public IstarUser() {
	super();
	// TODO Auto-generated constructor stub
}


public IstarUser(String email, String password, String userimage) {
	super();
	this.email = email;
	this.password = password;
	this.userimage = userimage;
}


public IstarUser(Integer id, String email, String password, String userimage) {
	super();
	this.id = id;
	this.email = email;
	this.password = password;
	this.userimage = userimage;
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
public String getUserimage() {
	return userimage;
}
public void setUserimage(String userimage) {
	this.userimage = userimage;
}




}
