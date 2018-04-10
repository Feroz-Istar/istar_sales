package pojo;

public class Team {

	private Integer id ;
	private String teamName ;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public Team(Integer id, String teamName) {
		super();
		this.id = id;
		this.teamName = teamName;
	}
	public Team() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
