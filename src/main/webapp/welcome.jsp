<%@page import="pojo.SalesTeamPerformancePojo"%>
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

	String res = HttpUtilsRequest
			.sendGet("http://192.168.1.18:8080/istar/rest/sales/dashboard/3/todays_tasks");
	//new JsonParser().parse(res).getAsJsonArray()
ArrayList<SalesTodaysTaskPojo> salesTodaysTaskPojos=new ArrayList<>();
	   salesTodaysTaskPojos =  new Gson().fromJson(res,
			new TypeToken<ArrayList<SalesTodaysTaskPojo>>() {
			}.getType());

%>

<%

	String performance_response = HttpUtilsRequest
			.sendGet("http://192.168.1.18:8080/istar/rest/sales/dashboard/3/get_team_performance");
	//new JsonParser().parse(res).getAsJsonArray()
SalesTeamPerformancePojo salesTeamPerformancePojo =  new Gson().fromJson(performance_response,SalesTeamPerformancePojo.class);

%>

</head>

<body style="">
	<jsp:include page="inc/nav.jsp"></jsp:include>
	<main role="main" class="container ">

	<h3 class="mt-4 pt-1 ml-2 mb-0	 font-28">Today's Tasks</h3>
	<div class="slider autoplay pt-3 mt-4">
		<%
			for (SalesTodaysTaskPojo salesTodaysTaskPojo: salesTodaysTaskPojos ) {
				
				int i = 8;
				String border_top = "border-top-ongoing";
				String task_icon_color="";
				String icon_name = "desktop_windows";
				String task_type="";
				if(salesTodaysTaskPojo.getTaskType().equalsIgnoreCase("SALES_CALL_TASK")){
					
					task_type = "Sales Call";
					
				}else if(salesTodaysTaskPojo.getTaskType().equalsIgnoreCase("SALES_WEBINAR_PROJECT")){
					task_type = "Sales Webinar";
					
				}else if(salesTodaysTaskPojo.getTaskType().equalsIgnoreCase("SALES_PRESANTATION_TASK")){
					
					task_type=	"Sales Presentation";
				}
				
				if (salesTodaysTaskPojo.getStatus().equalsIgnoreCase("SCHEDULED")) {
					border_top = "border-top-scheduled ";
					task_icon_color="scheduled-color";
 				}else if(salesTodaysTaskPojo.getStatus().equalsIgnoreCase("ONGOING")){
					border_top = "border-top-ongoing";

				}else if(salesTodaysTaskPojo.getStatus().equalsIgnoreCase("COMPLETED")){
					border_top = "border-top-completed";

				}
				if (salesTodaysTaskPojo.getTaskType().equalsIgnoreCase("SALES_CALL_TASK")) {
					border_top = "border-top-scheduled";
					icon_name = "local_phone";
				}else if(salesTodaysTaskPojo.getTaskType().equalsIgnoreCase("SALES_WEBINAR_PROJECT")){
					border_top = "border-top-scheduled";
					icon_name = "local_phone";
				}else if(salesTodaysTaskPojo.getTaskType().equalsIgnoreCase("SALES_WEBINAR_PROJECT")){
					border_top = "border-top-scheduled";
					icon_name = "local_phone";	
					
				}
				
				String duration="";
				int hour=0;
				int min=0;
				int sec=0;
				if(salesTodaysTaskPojo.getDuration()/3600 > 0){
					hour=salesTodaysTaskPojo.getDuration()/3600;
					duration+=hour+" Hr";
				}
				if(salesTodaysTaskPojo.getDuration()/60 > 0){
					min=salesTodaysTaskPojo.getDuration()/60;
					duration+=min+" Min ";
				}
				if(salesTodaysTaskPojo.getDuration()%60 > 0){
					sec=salesTodaysTaskPojo.getDuration()%60;
					duration+=sec+" Sec";
				}
				
				
		%>


		<div class="card task_card <%=border_top%> p-1 ml-2 mr-2"
			style="width: 18rem;">

			<div class="card-body">

				<div class="row">
					<div class="col-md-3">
						<img src="<%=salesTodaysTaskPojo.getProfileImage() %>" alt="..."
							class="img-thumbnail rounded border-0  ">
					</div>
					<div class="col-5">
						<div class="font-weight-normal   font-13"
							style="color: rgb(85, 85, 85);"><%=task_type%></div>
						<div class="font-weight-bold   font-16"><%=salesTodaysTaskPojo.getCompanyName() %></div>
						<div class="font-weight-normal text-muted font-13"><%=salesTodaysTaskPojo.getActorName() %></div>
					</div>
					<div class="col-4 text-center">
						<div class="font-14 text-muted "><%=salesTodaysTaskPojo.getStatus() %></div>
						<i class="material-icons <%= task_icon_color%>  font-32 mt-1"><%=icon_name%></i>
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
						<div class="font-15  text-center"><%=salesTodaysTaskPojo.getStartTime() %></div>
					</div>
					<div class="col-4">
						<div class="font-15   text-center"><%=duration %></div>
					</div>
					<div class="col-4  align-self-center">
						<div>
							<div class="rateYo p-0 font-12 text-center" data-rating="<%=salesTodaysTaskPojo.getRating() %>"
								data-width="12"></div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<%
			}
		%>

	</div>
	<div class=" font-28 mt-4 ml-2" style="color: rgb(74, 74, 74);">Performance</div>
	<nav aria-label="breadcrumb  ">
		<ol class="breadcrumb  bg-transparent pl-2 ">
			<li class="breadcrumb-item font-23    "><a class="" href="#"
			 onclick="createCustomGraph('http://192.168.1.18:8080/istar/rest/sales/dashboard/3/get_team_performance')"	style="color: rgb(74, 74, 74);">Team Wise</a></li>
			<li class="breadcrumb-item font-23  " aria-current="page"><a
			id="productwise"	class="" href="#" style="color: rgb(74, 74, 74);" onclick="createCustomGraph('http://192.168.1.18:8080/istar/rest/sales/dashboard/3/get_product_performance')" >Product Wise</a></li>
			<li class="breadcrumb-item  font-23   " aria-current="page"><a
				class="" href="#" style="color: rgb(74, 74, 74);">Geographical
					Area Wise</a></li>

		</ol>
	</nav>

	<div class="row">

		<div class="col-md-12">
			<div class="card">
				<div class="helloworld d-flex justify-content-end p-2">
					<div class="btn-group ml-2 mr-2">
						<button type="button"
							class="btn bg-dropdown dropdown-toggle text-muted border-top border-left font-12"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Weekly</button>
						<div class="dropdown-menu dropdown-menu-right">
							<button class="dropdown-item font-12" type="button">Weekly</button>
							<button class="dropdown-item font-12" type="button">Monthly
								action</button>
							<button class="dropdown-item font-12" type="button">Annually
								else here</button>
						</div>
					</div>
					<div class="btn-group  ml-2 mr-2">
						<button type="button"
							class="btn bg-dropdown dropdown-toggle text-muted  border-top border-left font-12"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Quantitative
							Performance</button>
						<div class="dropdown-menu dropdown-menu-right">
							<button class="dropdown-item  font-12" type="button">quantitative
								performance</button>
							<button class="dropdown-item font-12" type="button">quantitative
								performance</button>

						</div>
					</div>
				</div><div id="highchart_container1" class="highchart_container1" data-tableid="datatable"
					data-title=""></div>
				<div class="highchart_container" data-tableid="datatable"
					data-title=""></div>

				<table id="datatable" style="display: none;" >
				
					<thead>
						<tr>
						<th></th>
						<%for(GraphPojo graphPojo: salesTeamPerformancePojo.getGraph()){ %>
							<th><%=graphPojo.getName() %></th>
							  <%} %>
						</tr>
					</thead>
					<tbody>
					<%for(String groupName: salesTeamPerformancePojo.getGroups()){ 
						int sizeData=salesTeamPerformancePojo.getGroups().size();%>
						<tr>
							<th><%=groupName %></th>
							<%for(GraphPojo graphPojo: salesTeamPerformancePojo.getGraph()){ %>
							<td><%=graphPojo.getData().get(sizeData-1) %></td>
							  <%} %>
							 
						</tr>
						<% }%> 
					</tbody>
				</table>

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

function productwise(){
	
}

</script>




	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<jsp:include page="inc/foot.jsp"></jsp:include>

</body>
</html>