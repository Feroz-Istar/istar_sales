package pojo;

public class TeamMember {
	
	private Integer id ;
	private String name ;
	private String profileImage ;
	public TeamMember() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TeamMember(Integer id, String name, String profileImage) {
		super();
		this.id = id;
		this.name = name;
		this.profileImage = profileImage;
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
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

}
