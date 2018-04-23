<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="pojo.ManagerTasks"%>
<%@page import="com.google.appengine.repackaged.org.json.JSONArray"%>
<%@page import="com.google.appengine.repackaged.org.json.JSONObject"%>
<%@page import="pojo.TeamPerformance"%>
<%@page import="pojo.GraphPojo"%>

<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.SalesTodaysTaskPojo"%>

<%@page import="java.lang.reflect.Type"%>
<%@page import="com.google.gson.reflect.TypeToken"%>

<%@page import="utils.HttpUtilsRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../../../favicon.ico">

<title>Istar-Sales</title>

<!-- Bootstrap core CSS -->
<jsp:include page="inc/head.jsp"></jsp:include>
//service return ArrayListOf Cards


<%
	TeamPerformance teamPerformance = new TeamPerformance();
	ArrayList<ManagerTasks> managerTasks = new ArrayList<>();

	String res = HttpUtilsRequest.sendGet("http://192.168.1.18:8080/istar/rest/sales_manager/3/tasks");
	JsonParser jsonParser = new JsonParser();
	JsonObject jsonObject = (JsonObject) jsonParser.parse(res);
	JsonArray jsonArray = jsonObject.get("data").getAsJsonArray();

	managerTasks = new Gson().fromJson(jsonArray.toString(), new TypeToken<ArrayList<ManagerTasks>>() {
	}.getType());

	String performance_response = HttpUtilsRequest.sendGet(
			"http://192.168.1.18:8080/istar/rest/sales_manager/3/team_performance/weekly/quantitative");

	JsonParser jsonParser2 = new JsonParser();

	JsonObject jsonObject2 = (JsonObject) jsonParser2.parse(performance_response);

	JsonObject data = (JsonObject) jsonObject2.get("data");

	JsonArray graph = (JsonArray) data.get("graph");

	//System.out.println(graph);

	teamPerformance = new Gson().fromJson(data.toString(), TeamPerformance.class);
%>

</head>

<body style="">
	<jsp:include page="inc/nav.jsp"></jsp:include>
	<main role="main" class="container ">

	<h3 class="mt-2 pt-1 ml-0 mb-0	 font-28">Today's Tasks</h3>
	<div class="slider autoplay pt-3 mt-4">
		<%
			for (ManagerTasks managerTask : managerTasks) {

				int i = 8;
				String border_top = "border-top-ongoing";
				String task_icon_color = "";
				String icon_name = "desktop_windows";
				String task_type = "";
				String status = "";
				String company_name = "";
				String contact_person = "";

				if (managerTask.getStatus().equalsIgnoreCase("SCHEDULED")) {
					border_top = "border-top-scheduled ";
					task_icon_color = "scheduled-color";
					status = "Not Started";
				} else if (managerTask.getStatus().equalsIgnoreCase("ONGOING")) {
					border_top = "border-top-ongoing";
					status = "In Process";
					task_icon_color = "ongoing-color";
				} else if (managerTask.getStatus().equalsIgnoreCase("COMPLETED")) {
					border_top = "border-top-completed";
					status = "Completed ";
					task_icon_color = "completed-color";
				}

				if (managerTask.getTaskType().equalsIgnoreCase("Sales Call")) {
					//border_top = "border-top-scheduled";
					icon_name = "local_phone";
				} else if (managerTask.getTaskType().equalsIgnoreCase("Sales Presentation")) {
					//border_top = "border-top-scheduled";
					icon_name = "tv";
				} else if (managerTask.getTaskType().equalsIgnoreCase("SALES_WEBINAR_PROJECT")) {
					//border_top = "border-top-scheduled";
					icon_name = "tv";

				}

				if (managerTask.getCompanyName().length() >= 11) {
					company_name = managerTask.getCompanyName().substring(0, 10) + "...";

				} else {
					company_name = managerTask.getCompanyName();
				}

				if (managerTask.getContactPersonName().length() > 15) {
					contact_person = managerTask.getContactPersonName().substring(0, 12) + "...";
				} else {
					contact_person = managerTask.getContactPersonName();
				}
		%>


		<div class="card task_card <%=border_top%> p-1 ml-2 mr-2"
			style="width: 18rem;">

			<div class="card-body">

				<div class="row">
					<div class="col-md-3">
						<img src="<%=managerTask.getContactPersonImage()%>" alt="..."
							class="img-thumbnail rounded border-0  ">
					</div>
					<div class="col-5">
						<div class="font-weight-normal   font-13"
							style="color: rgb(85, 85, 85);"><%=managerTask.getTaskType()%></div>
						<div class="font-weight-bold   font-16"><%=company_name%></div>
						<div class="font-weight-normal text-muted font-13"><%=contact_person%></div>
					</div>
					<div class="col-4 text-center">
						<div class="font-14 text-muted "><%=status%></div>
						<i class="material-icons <%=task_icon_color%>  font-32 mt-1"><%=icon_name%></i>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-4">
						<div class="  font-15 text-center" style="color: #d4cfcf;">Start
							Time</div>
					</div>
					<div class="col-4">
						<div class="  font-15 text-center" style="color: #d4cfcf;">Duration</div>
					</div>
					<div class="col-4">
						<div class="  font-15 text-center" style="color: #d4cfcf;">Score</div>
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<div class="font-13  text-center"><%=managerTask.getStartTime()%></div>
					</div>
					<div class="col-4 p-0">
						<div class="font-13   text-center"><%=managerTask.getDuration()%></div>
					</div>
					<div class="col-4  align-self-center">
						<div>
							<div class="rateYo p-0 font-12 text-center"
								data-rating="<%=managerTask.getRating()%>" data-width="12"></div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<%
			}
		%>

	</div>
	<div class=" font-28 mt-4 ml-0" style="color: rgb(74, 74, 74);">Performance</div>
	<nav aria-label="breadcrumb  ">
		<ol class="breadcrumb  bg-transparent pl-0 ">
			<li class="breadcrumb-item font-23  team-wise  "><a class=""
				href="#" style="color: rgb(74, 74, 74);">Team Wise</a></li>
			<li class="breadcrumb-item font-23 products-wise "
				aria-current="page"><a id="productwise" class="" href="#"
				style="color: rgb(74, 74, 74);">Product Wise</a></li>
			<li class="breadcrumb-item  font-23  geographical-wise "
				aria-current="page"><a class="" href="#"
				style="color: rgb(74, 74, 74);">Geographical Area Wise</a></li>

		</ol>
	</nav>

	<div class="row">

		<div class="col-md-12">
			<div class="card">
				<div class="helloworld d-flex justify-content-end p-2">
					<div class="btn-group ml-2 mr-2">

						<button type="button"
							class="btn bg-dropdown dropdown-toggle text-muted border-top border-left font-12 dropdown1-value"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Weekly
						</button>
						<div class="dropdown-menu dropdown-menu-right dropdown1">
							<%
								for (String dropdown1 : teamPerformance.getDropdown1()) {
							%>
							<button class="dropdown-item font-12" value="<%=dropdown1%>"
								type="button"><%=dropdown1%>
							</button>
							<%
								}
							%>
						</div>
					</div>
					<div class="btn-group  ml-2 mr-2">
						<button type="button"
							class="btn bg-dropdown dropdown-toggle text-muted  border-top border-left font-12 dropdown2-value"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Quantitative
							Performance</button>
						<div class="dropdown-menu dropdown-menu-right dropdown2">
							<%
								for (String dropdown2 : teamPerformance.getDropdown2()) {
							%>
							<button class="dropdown-item value="
								<%=dropdown2%>"  font-12" type="button"><%=dropdown2%></button>
							<%
								}
							%>

						</div>
					</div>
				</div>
				<div id="highchart_container1" class="highchart_container1"
					data-tableid="datatable" data-title=""></div>
				<div class="highchart_container" data-tableid="datatable"
					data-title=""></div>

				<table id="datatable" style="display: none;">

					<thead>
						<tr>
							<th></th>
							<%
								for (GraphPojo graphPojo : teamPerformance.getGraph()) {
							%>
							<th><%=graphPojo.getName()%></th>
							<%
								}
							%>


						</tr>
					</thead>
					<tbody>
						<%
							for (String groupname : teamPerformance.getGroups()) {
								int Sizedata = teamPerformance.getGroups().size();

								System.out.println("groupname------------->+" + groupname);
						%>
						<tr>
							<th><%=groupname%></th>
							<%
								for (GraphPojo graphPojo : teamPerformance.getGraph()) {
							%>
							<td><%=graphPojo.getData().get(Sizedata - 1)%></td>
							<%
								}
							%>

						</tr>
						<%
							}
						%>
					</tbody>
				</table>

			</div>

			<div class="card" style="width: 100%; height: 100%;">
				<div class="card-body">
					<h5 class="card-title">No Data Found</h5>

				</div>
			</div>


		</div>

	</div>


	<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<div class="modal-header  ">
					<h4 class="modal-title ml-auto" id="myLargeModalLabel">Istar
						Bank</h4>

					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div>
					<div class="highchart_container flex-column"
						data-tableid="datatable1" style="height: 200px;"></div>

					<table id="datatable" style="display: none;">
						<thead>
							<tr>
								<th></th>
								<th>Jane</th>
								<th>John</th>
								<th>teen</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<th>Apples</th>
								<td>3</td>
								<td>4</td>
								<td>4</td>
							</tr>
							<tr>
								<th>Pears</th>
								<td>2</td>
								<td>4</td>
								<td>0</td>
							</tr>
							<tr>
								<th>Plums</th>
								<td>5</td>
								<td>9</td>
								<td>11</td>
							</tr>
							<tr>
								<th>Bananas</th>
								<td>1</td>
								<td>1</td>
								<td>4</td>

							</tr>
							<tr>
								<th>Oranges</th>
								<td>2</td>
								<td>4</td>
								<td>14</td>
							</tr>
						</tbody>
					</table>
					<div class="w-100 p-2">
						<div class="text-center">
							<button type="button"
								class="btn btn-outline-light btn-sm sky-blue-border color-sky btn-nohover custom-sm-icon-button">
								<i class="material-icons ">volume_up</i>
							</button>
							<button type="button"
								class="btn btn-outline-light sky-blue-border color-sky btn-lg custom-lg-icon-button"
								style="">
								<i class="material-icons md-48">play_arrow</i>
							</button>

							<button type="button"
								class="btn btn-outline-light btn-sm sky-blue-border color-sky btn-nohover custom-sm-icon-button">
								<i class="material-icons ">volume_up</i>
							</button>

						</div>
					</div>
				</div>
				<div class="modal-body" style="background: #a6a6a6;">
					<div class="card">
						<div class="row">
							<div class="col-md-2">
								<img src="https://www.w3schools.com/html/img_girl.jpg" alt="..."
									class="img-thumbnail border-0">
							</div>
							<div class="col-10">
								<div class="font-weight-normal font-18 pt-1 pb-1">Miriam
									Thomas</div>
								<div class="font-weight-bold font-14 text-muted ">Team
									Name</div>
								<div class="font-weight-normal font-13 d-flex d-flex pt-1 pb-1">
									<div class="mr-2">Average Feedback</div>
									<div class="rateYo p-0 font-12 text-center align-self-center"
										data-rating="3.2" data-width="12"></div>
								</div>
								<div class="font-weight-normal font-13 d-flex pt-1">
									<div class="mr-4">Talentify Score</div>
									245
								</div>

							</div>

						</div>
						<div class="row p-3">
							<div class="col-6">
								<h4>Location</h4>
								<div class="card d-flex">
									<div id="map" style="height: 300px; width: 100%;"></div>
									<div class="map_error_div  text-center"
										style="position: absolute; height: 300px; width: 100%; margin: auto;">
										<div class="error_msg theme-color"
											style="position: relative; top: 50%; transform: translateY(-50%);">Please
											Allow Location in your browser to view the map</div>
									</div>

								</div>
							</div>
							<div class="col-6">
								<h4>Presentation</h4>
								<div class="card">
									<img
										src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrBe15UtESAPeZA27aFmCjb1cPIgrlCR5UH4LyeC3DdhmvY4hu"
										alt="Card image cap" style="height: 300px; width: 100%;">

								</div>
							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	</main>
	<script type="text/javascript">
		function productwise() {

		}
	</script>




	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<jsp:include page="inc/foot.jsp"></jsp:include>

</body>
</html>

<script>
	
</script>