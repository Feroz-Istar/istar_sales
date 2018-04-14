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

public class SalesTeamPerformancePojo {

@SerializedName("graph")
@Expose
private List<GraphPojo> graph = new ArrayList<>();
@SerializedName("groups")
@Expose
private List<String> groups = new ArrayList<>();

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

}