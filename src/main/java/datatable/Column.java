package datatable;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Column {

@SerializedName("data")
@Expose
private Integer data;
@SerializedName("name")
@Expose
private String name;
@SerializedName("searchable")
@Expose
private Boolean searchable;
@SerializedName("orderable")
@Expose
private Boolean orderable;
@SerializedName("searchRegex")
@Expose
private Boolean searchRegex;
@SerializedName("searchValue")
@Expose
private String searchValue;

public Integer getData() {
return data;
}

public void setData(Integer data) {
this.data = data;
}

public String getName() {
return name;
}

public void setName(String name) {
this.name = name;
}

public Boolean getSearchable() {
return searchable;
}

public void setSearchable(Boolean searchable) {
this.searchable = searchable;
}

public Boolean getOrderable() {
return orderable;
}

public void setOrderable(Boolean orderable) {
this.orderable = orderable;
}

public Boolean getSearchRegex() {
return searchRegex;
}

public void setSearchRegex(Boolean searchRegex) {
this.searchRegex = searchRegex;
}

public String getSearchValue() {
return searchValue;
}

public void setSearchValue(String searchValue) {
this.searchValue = searchValue;
}

}
