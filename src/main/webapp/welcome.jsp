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

</head>

<body style="background: #e8e8e8;">
	<jsp:include page="inc/nav.jsp"></jsp:include>
	<main role="main" class="container">

	<h4 class="mt-3">Today's Task</h4>
	<div class="slider autoplay">
		<%
			for (int i = 0; i <= 10; i++) {
				String border_top = "border-top-ongoing";
				String icon_name = "desktop_windows";
				if (i % 2 == 0) {
					border_top = "border-top-completed";
					icon_name = "desktop_windows";
				}
				if (i % 3 == 0) {
					border_top = "border-top-scheduled";
					icon_name = "local_phone";
				}
		%>


		<div class="card task_card <%=border_top%> p-1 ml-2 mr-2"
			style="width: 18rem;">

			<div class="card-body">

				<div class="row">
					<div class="col-md-3">
						<img src="https://www.w3schools.com/html/img_girl.jpg" alt="..."
							class="img-thumbnail border-0">
					</div>
					<div class="col-5">
						<div class="font-weight-normal font-13">Sales Call</div>
						<div class="font-weight-bold font-14">Dell</div>
						<div class="font-weight-normal font-13">Ram Verma</div>
					</div>
					<div class="col-4 text-center">
						<div class="font-14">Not Started</div>
						<i class="material-icons font-32 mt-1"><%=icon_name%></i>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-4">
						<div class="text-muted font-14 text-center">Start Time</div>
					</div>
					<div class="col-4">
						<div class="text-muted font-14 text-center">Duration</div>
					</div>
					<div class="col-4">
						<div class="text-muted font-14 text-center">Score</div>
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<div class="font-12 font-weight-bold text-center">12:30 PM</div>
					</div>
					<div class="col-4">
						<div class="font-12 font-weight-bold text-center">45 Minutes</div>
					</div>
					<div class="col-4  align-self-center">
						<div>
							<div class="rateYo p-0 font-12 text-center" data-rating="3.2"
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
	<h4 class="mt-3">Team Performance</h4>

	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="helloworld d-flex justify-content-end p-2">
					<div class="btn-group ml-2 mr-2">
						<button type="button" class="btn bg-dropdown dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Right-aligned menu</button>
						<div class="dropdown-menu dropdown-menu-right">
							<button class="dropdown-item" type="button">Action</button>
							<button class="dropdown-item" type="button">Another
								action</button>
							<button class="dropdown-item" type="button">Something
								else here</button>
						</div>
					</div>
					<div class="btn-group  ml-2 mr-2">
						<button type="button" class="btn bg-dropdown dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Right-aligned menu</button>
						<div class="dropdown-menu dropdown-menu-right">
							<button class="dropdown-item" type="button">Action</button>
							<button class="dropdown-item" type="button">Another
								action</button>
							<button class="dropdown-item" type="button">Something
								else here</button>
						</div>
					</div>
				</div>
				<div class="highchart_container" data-tableid="datatable"
					data-title="this is my graph"></div>

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
								<div class="card d-flex" >
									<div id="map" style="height: 300px;width: 100%;"></div>
									<div class="map_error_div  text-center" style="position:absolute;height: 300px;width: 100%;margin:auto;">
									<div class="error_msg theme-color" style="position: relative;top: 50%;transform: translateY(-50%);">Please Allow Location in your browser to view the map</div></div>
									
								</div>
							</div>
							<div class="col-6">
								<h4>Presentation</h4>
								<div class="card" >
									<img  src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrBe15UtESAPeZA27aFmCjb1cPIgrlCR5UH4LyeC3DdhmvY4hu" alt="Card image cap" style="height: 300px;width: 100%;">
									
								</div>
							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	</main>



	

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<jsp:include page="inc/foot.jsp"></jsp:include>

</body>
</html>