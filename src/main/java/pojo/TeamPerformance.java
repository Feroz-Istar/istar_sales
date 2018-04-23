package pojo;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class TeamPerformance {

	private List<GraphPojo> graph = new ArrayList<>();
	private List<String> groups = new ArrayList<>();
	private List<String> dropdown1 = new ArrayList<>();
	private List<String> dropdown2 = new ArrayList<>();

	public TeamPerformance() {
		super();
	}

	 

	public TeamPerformance(List<GraphPojo> graph, List<String> groups, List<String> dropdown1, List<String> dropdown2) {
		super();
		this.graph = graph;
		this.groups = groups;
		this.dropdown1 = dropdown1;
		this.dropdown2 = dropdown2;
	}

	public List<GraphPojo> getGraph() {
		return graph;
	}

	public void setGraph(List<GraphPojo> graph) {
		this.graph = graph;
	}

	public List<String> getGroups() {
		return groups;
	}

	public void setGroups(List<String> groups) {
		this.groups = groups;
	}

	public List<String> getDropdown1() {
		return dropdown1;
	}

	public void setDropdown1(List<String> dropdown1) {
		this.dropdown1 = dropdown1;
	}

	public List<String> getDropdown2() {
		return dropdown2;
	}

	public void setDropdown2(List<String> dropdown2) {
		this.dropdown2 = dropdown2;
	}

 


}