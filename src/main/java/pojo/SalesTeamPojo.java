package pojo;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class SalesTeamPojo {

	private Integer id;
	private String name;
	private String description;
	private Integer totalTeamMember;
	private List<TeamMember> teamMembers = new ArrayList<>();
	public SalesTeamPojo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SalesTeamPojo(Integer id, String name, String description, Integer totalTeamMember,
			List<TeamMember> teamMembers) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.totalTeamMember = totalTeamMember;
		this.teamMembers = teamMembers;
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
	public Integer getTotalTeamMember() {
		return totalTeamMember;
	}
	public void setTotalTeamMember(Integer totalTeamMember) {
		this.totalTeamMember = totalTeamMember;
	}
	public List<TeamMember> getTeamMembers() {
		return teamMembers;
	}
	public void setTeamMembers(List<TeamMember> teamMembers) {
		this.teamMembers = teamMembers;
	}

	}
