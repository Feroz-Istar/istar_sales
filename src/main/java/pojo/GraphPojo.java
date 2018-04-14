package pojo;


import java.util.ArrayList;
import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
public class GraphPojo {
	@SerializedName("id")
	@Expose
	private Integer id;
@SerializedName("name")
@Expose
private String name;
@SerializedName("data")
@Expose
private List<Double> data = new ArrayList<>();

public String getName() {
return name;
}

public void setName(String name) {
this.name = name;
}

public List<Double> getData() {
return data;
}

public void setData(List<Double> data) {
this.data = data;
}
}
