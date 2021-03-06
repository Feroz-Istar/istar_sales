<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="pojo.SalesAnalyticsTeamPojo"%>
<%@page import="pojo.SalesAnalyticsTeamUserPojo"%>
 
 
<%@page import="java.util.ArrayList"%>
<%@page import="utils.HttpUtilsRequest"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.table-container {
	height: 20em;
}

table {
	display: flex;
	flex-flow: column;
	height: 100%;
	width: 100%;
}

table thead {
	/* head takes the height it requires, 
    and it's not scaled when table is resized */
	flex: 0 0 auto;
	width: calc(100% - 0.9em);
}

table tbody {
	/* body takes all the remaining available space */
	flex: 1 1 auto;
	display: block;
	overflow-y: auto;
}

table tbody tr {
	width: 100%;
}

table thead, table tbody tr {
	display: table;
	table-layout: fixed;
}
</style>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Analytics</title>
<jsp:include page="inc/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="inc/nav.jsp"></jsp:include>

	<%
		String res = HttpUtilsRequest.sendGet("http://192.168.1.18:8080/istar/rest/sales/analytics/team/3");
		//new JsonParser().parse(res).getAsJsonArray()
		ArrayList<SalesAnalyticsTeamPojo> salesAnalyticsTeamPojos = new ArrayList<>();
		salesAnalyticsTeamPojos = new Gson().fromJson(res, new TypeToken<ArrayList<SalesAnalyticsTeamPojo>>() {
		}.getType());

		System.out.println("dnfjksbfksdf" + salesAnalyticsTeamPojos);
	%>


	<%
		String respons = HttpUtilsRequest.sendGet("http://192.168.1.18:8080/istar/rest/sales/analytics/team/3");
		//new JsonParser().parse(res).getAsJsonArray()
		ArrayList<SalesAnalyticsTeamUserPojo> sAnalyticsTeamUserPojos = new ArrayList<>();
		sAnalyticsTeamUserPojos = new Gson().fromJson(res, new TypeToken<ArrayList<SalesAnalyticsTeamUserPojo>>() {
		}.getType());

		System.out.println("dnfjksbfksdf" + sAnalyticsTeamUserPojos);
	%>



	<div class="container mt-4">
		<nav aria-label="breadcrumb">
		<ol class="breadcrumb bg-transparent m-0 p-0 ml-2">
			<li class="breadcrumb-item"><a href="/analytics.jsp"
				class="font-24 text-dark">Teams</a></li>
			<li class="breadcrumb-item " aria-current="page"><a
				class="text-dark font-24" href="/individuals.jsp">Individuals</a></li>
		</ol>
		</nav>
		<div class="row">
			<div class="col-md-12 p-0 m-0">
				<%
					for (SalesAnalyticsTeamPojo salesAnalyticsTeamPojo : salesAnalyticsTeamPojos) {
				%>
				<div class="card p-3 m-4  pb-6">
					<div class="row">
						<div class="col-md-12">
							<div class="d-flex">
								<div class="mr-auto font-weight-bold  font-24 p-0 ml-5 "><%=salesAnalyticsTeamPojo.getGroupName()%></div>
								<div class="p-0 pt-3 font-weight-bold  font-16   mr-4	"
									style="color: rgb(155, 155, 155);">23 Members</div>
								<div class="rateYo mt-3  font-12 align-self-center ml-3"
									data-rating="3.2" data-width="12"></div>
							</div>
						</div>
					</div>
					<button class="btn bg-transparent p-0" data-toggle="collapse"
						data-target="#<%=salesAnalyticsTeamPojo.getId()%>" aria-expanded="true"
						aria-controls="collapseOne">
						<div class="row  pl-4 mb-4 ml-3 ">
							<div class="col-md-2 pl-0 pr-0 align-self-center">
								<div class="d-flex flex-column border   text-center   ">
									<div class=" pt-4">
										<i class="material-icons md-36 text-primary  pt-3">phone_forwarded</i>
									</div>
									<div class="text-dark font-24 "><%=salesAnalyticsTeamPojo.getTotalCalls()%></div>
									<div class="pb-5 font-13	 m-0 p-0 font-weight-bold "
										style="color: rgb(155, 155, 155);">Calls</div>
								</div>
							</div>
							<div class="col-md-2 pl-0 pr-0 align-self-center">
								<div class="d-flex flex-column border  text-center">
									<div class=" pt-4">
										<i class="material-icons md-36 text-primary  pt-3">mail_outline</i>
									</div>
									<div class="  text-dark  font-24"><%=salesAnalyticsTeamPojo.getTotalMeetings()%></div>
									<div class="pb-5 font-13 font-weight-bold"
										style="color: rgb(155, 155, 155);">Meetings</div>
								</div>
							</div>
							<div class="col-md-2 pl-0 pr-0 align-self-center">
								<div class="d-flex flex-column border   text-center">
									<div class=" pt-4">
										<i class="material-icons md-36 text-primary  pt-3">tv</i>
									</div>
									<div class="  text-dark font-24"><%=salesAnalyticsTeamPojo.getTotalPresantations()%></div>
									<div class="pb-5 font-13 font-weight-bold "
										style="color: rgb(155, 155, 155);">Presentations</div>
								</div>
							</div>
							<div class="col-md-2 pl-0 pr-0 align-self-center">
								<div class="d-flex flex-column border   text-center">
									<div class=" pt-4">
										<i class="material-icons md-36 text-primary  pt-3">mail_outline</i>
									</div>
									<div class="  text-dark font-24"><%=salesAnalyticsTeamPojo.getTotalEmails()%></div>
									<div class="pb-5 font-13 font-weight-bold "
										style="color: rgb(155, 155, 155);">Emails</div>
								</div>
							</div>
							<div class="col-md-2 pl-0 pr-0 align-self-center">
								<div class="d-flex flex-column border   text-center">
									<div class=" pt-4">
										<i class="material-icons md-36 text-primary pt-3">tv</i>
									</div>
									<div class=" text-dark font-24  "><%=salesAnalyticsTeamPojo.getTotalWebinars()%></div>
									<div class=" pb-5 font-13 font-weight-bold"
										style="color: rgb(155, 155, 155);">Webinar</div>
								</div>
							</div>
							<div class="col-md-2 p-0 m-0">
								<div class="highcart_div" style="height: 200px; width: 100%;";></div>
								<table id="datatable" style="display: none;">
									<thead>
										<tr>
											<th></th>
											<th>Jane</th>
											<th>John</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>Apples</th>
											<td>3</td>
											<td>4</td>
										</tr>
										<tr>
											<th>Pears</th>
											<td>2</td>
											<td>0</td>
										</tr>
										<tr>
											<th>Plums</th>
											<td>5</td>
											<td>11</td>
										</tr>
										<tr>
											<th>Bananas</th>
											<td>1</td>
											<td>1</td>
										</tr>
										<tr>
											<th>Oranges</th>
											<td>2</td>
											<td>4</td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
					</button>
					<div id="<%=salesAnalyticsTeamPojo.getId()%>" class="collapse" aria-labelledby="headingOne"
						data-parent="#accordion">

						<div class="row">
							<div class="col-md-12">
								<div class="table-container">

									<table class="table border "
										style="margin-left: auto; margin-right: auto; width: 80%;">
										<thead>
											<tr>
												<th class="font-weight-bold font-16 text-muted pl-5 pr-0 pb-4" scope="col">CLIENT
													NAME</th>
												<th class="font-weight-bold font-16 pl-5 pb-4" scope="col">PHONE
													NO</th>
												<th class="font-weight-bold font-16 pl-5 pb-4" scope="col">EMAIL ID</th>
												<th class="font-weight-bold font-16  pb-4 pl-5" scope="col">CITY</th>
												<th class="font-weight-bold font-16 "  scope="col">TALENTIFY SCORE</th>
											</tr>
										</thead>
										<tbody>
											<%
												for (SalesAnalyticsTeamUserPojo sAnalyticsTeamUserPojo : salesAnalyticsTeamPojo.getUsers()) {
											
											
											%>
											<tr>

												<td class="text-muted "><img
													src="<%=sAnalyticsTeamUserPojo.getProfileImage()%>"
													height="45" width="45" /><span class=" font-13 ml-1"><%=sAnalyticsTeamUserPojo.getName() %></span></td>
												<td class="text-muted font-13 pt-4  pl-5"><%=sAnalyticsTeamUserPojo.getPhoneNo() %></td>
												<td class="text-muted font-13 pt-4 "><%=sAnalyticsTeamUserPojo.getEmail()%>
												</td>
												<td class="text-muted font-13 pt-4 pl-5 "><%=sAnalyticsTeamUserPojo.getCity()%></td>
												<td class="text-muted font-13 pt-4">200</td>
											</tr>
											<%
												}
											%>

										</tbody>
									</table>
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
	</div>
	<jsp:include page="inc/foot.jsp"></jsp:include>
	<script type="text/javascript">
		Highcharts.setOptions({
			colors : [ '#30beef', '#bae88a', '#fd6d81' ]
		});
		$('.highcart_div')
				.each(
						function() {
							$(this)
									.highcharts(
											{
												data : {
													table : document
															.getElementById('datatable'),

												},
												chart : {
													type : 'pie'
												},
												title : {
													text : ''
												},
												yAxis : {
													allowDecimals : false,
													title : {
														text : 'Units'
													}
												},
												plotOptions : {
													pie : {
														allowPointSelect : true,
														cursor : 'pointer',
														dataLabels : {
															enabled : false,
														},
														innerSize : '60%'
													}
												},
												tooltip : {
													formatter : function() {
														return '<b>'
																+ this.series.name
																+ '</b><br/>'
																+ this.point.y
																+ ' '
																+ this.point.name
																		.toLowerCase();
													}
												}
											});

						});
	</script>
</body>
</html>