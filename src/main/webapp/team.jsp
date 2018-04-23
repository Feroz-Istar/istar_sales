<%@page import="pojo.TeamMember"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="pojo.SalesTeamUserPojo"%>
<%@page
	import="com.google.appengine.repackaged.com.google.gson.reflect.TypeToken"%>
<%@page import="com.google.appengine.repackaged.com.google.gson.Gson"%>
<%@page import="pojo.SalesTeamPojo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="utils.HttpUtilsRequest"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<jsp:include page="inc/head.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="inc/nav.jsp"></jsp:include>
	<div class="container mt-4">
		<div class="d-flex">
			<div class="mr-auto p-2">
				<div class="font-28 ">Teams</div>
			</div>
			<div class="p-2 mt-3">
				<a class="btn bg-theme btn-lg color-white font-18 font-weight-bold"
					href="#" role="button"> Create Team</a>
			</div>
		</div>


		<%
			ArrayList<SalesTeamPojo> salesTeamPojos = new ArrayList<>();
			TeamMember teamMember = new TeamMember();
			Object object;

			String res = HttpUtilsRequest.sendGet("http://192.168.1.18:8080/istar/rest/sales_manager/3/teams");

			JsonParser jsonParser = new JsonParser();
			JsonObject jsonObject = (JsonObject) jsonParser.parse(res);
			JsonArray jsonArray = (JsonArray) jsonObject.get("response");
			System.out.println("--------------------<json array>" + jsonArray);

			salesTeamPojos = new Gson().fromJson(jsonArray.toString(), new TypeToken<ArrayList<SalesTeamPojo>>() {

			}.getType());
		%>
		<div class="row">
			<%
				for (SalesTeamPojo salesTeamPojo : salesTeamPojos) {
			%>

			<div class="col-md-3">

				<div
					class="card  w-100 p-0 mb-3  border border-dark  parent-height bg-white"">
					

						<div class="card-header  bg-white border-0 p-1 m-1 ">
							<h5 class="card-title text-danger mb-2"><%=salesTeamPojo.getName()%></h5>
							<p class="card-text text-muted font-weight-bold  font-14"><%=salesTeamPojo.getDescription()%></p>

						</div>

						<div class="card-footer  bg-white border-0">
							<div class="d-flex      ">

								<div class="mr-auto p-0 ">
									<%
										int total_users = 0;
											int i = 0;
											for (TeamMember teammembers : salesTeamPojo.getTeamMembers()) {

												i++;
												if (i <= 3) {
									%>
									<img src="<%=teammembers.getProfileImage()%>"
										class="rounded-circle" alt="" width="20" height="20">
									<%
										}

											}

											System.out.println("-------------->" + total_users);
									%>
								</div>

								<div class="p-0 ml-5 mt-1">
								<% int members = salesTeamPojo.getTotalTeamMember() - 3; 
								if(members < 0){
									members = 0 ;
								}else{
									members = salesTeamPojo.getTotalTeamMember() - 3;
								}
								
								%>
									<a href="view_team_member_list.jsp?teamid=<%=salesTeamPojo.getId()%>" class="card-link mt-2 font-14 text-muted">+<%=members%>
										members
									</a>
								</div>
							</div>


						</div>
					 
				</div>
			</div>

			<%
				}
			%>
		</div>
	</div>
	<jsp:include page="inc/foot.jsp"></jsp:include>

</body>
</html>

<script>
	$(document).ready(function() {

		var max_height = 0;
		$(".parent-height").each(function() {
			var parentheight = $(this).height();
			console.log("parentheight" + parentheight);

			if (max_height < parentheight) {

				max_height = parentheight;
			}

		});

		$(".parent-height").each(function() {

			$(this).height(max_height);

		});
		console.log(max_height);
		
		
		$(".card").click(function(){
			
			var salected_value2=$(this).text();

	console.log(salected_value2);
		});

		
		
		
		
	});
	
	
	
</script>