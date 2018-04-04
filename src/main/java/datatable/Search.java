package datatable;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Search {
	@SerializedName("value")
	@Expose
	private String value;
	@SerializedName("regex")
	@Expose
	private Boolean regex;

	public String getValue() {
	return value;
	}

	public void setValue(String value) {
	this.value = value;
	}

	public Boolean getRegex() {
	return regex;
	}

	public void setRegex(Boolean regex) {
	this.regex = regex;
	}
}
