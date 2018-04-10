package pojo;

public class Project {
	private Integer id;
	private String projectname;
	private Integer teamid;

	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Project(Integer id, String projectname, Integer teamid) {
		super();
		this.id = id;
		this.projectname = projectname;
		this.teamid = teamid;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProjectname() {
		return projectname;
	}

	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}

	public Integer getTeamid() {
		return teamid;
	}

	public void setTeamid(Integer teamid) {
		this.teamid = teamid;
	}

}
