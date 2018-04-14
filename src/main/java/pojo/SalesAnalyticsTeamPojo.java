package pojo;

import java.util.ArrayList;
import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
public class SalesAnalyticsTeamPojo {

@SerializedName("total_calls")
@Expose
private Integer totalCalls;
@SerializedName("total_emails")
@Expose
private Integer totalEmails;
@SerializedName("group_name")
@Expose
private String groupName;
@SerializedName("total_meetings")
@Expose
private Integer totalMeetings;
@SerializedName("total_webinars")
@Expose
private Integer totalWebinars;
@SerializedName("id")
@Expose
private Integer id;
@SerializedName("users")
@Expose
private List<SalesAnalyticsTeamUserPojo> users = new ArrayList<>();
@SerializedName("total_presantations")
@Expose
private Integer totalPresantations;

public Integer getTotalCalls() {
return totalCalls;
}

public void setTotalCalls(Integer totalCalls) {
this.totalCalls = totalCalls;
}

public Integer getTotalEmails() {
return totalEmails;
}

public void setTotalEmails(Integer totalEmails) {
this.totalEmails = totalEmails;
}

public String getGroupName() {
return groupName;
}

public void setGroupName(String groupName) {
this.groupName = groupName;
}

public Integer getTotalMeetings() {
return totalMeetings;
}

public void setTotalMeetings(Integer totalMeetings) {
this.totalMeetings = totalMeetings;
}

public Integer getTotalWebinars() {
return totalWebinars;
}

public void setTotalWebinars(Integer totalWebinars) {
this.totalWebinars = totalWebinars;
}

public Integer getId() {
return id;
}

public void setId(Integer id) {
this.id = id;
}

public List<SalesAnalyticsTeamUserPojo> getUsers() {
return users;
}

public void setUsers(List<SalesAnalyticsTeamUserPojo> users) {
this.users = users;
}

public Integer getTotalPresantations() {
return totalPresantations;
}

public void setTotalPresantations(Integer totalPresantations) {
this.totalPresantations = totalPresantations;
}
}
