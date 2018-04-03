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
	content="width=device-width, initial-scale=1, shrink-to-fit=no"><title>Insert title here</title>
<jsp:include page="inc/head.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="inc/nav.jsp"></jsp:include>

	 

				
			 
	<div class="container mt-4">
	<nav aria-label="breadcrumb">
				<ol class="breadcrumb bg-white">
					<li class="breadcrumb-item"><a href="/analytics.jsp">Teams</a></li>
					<li class="breadcrumb-item " aria-current="page"><a class="text-muted" href="/individuals.jsp">Individuals</a></li>
				</ol>
				</nav>
		<div class="row">
			<div class="col-md-12 p-0 m-0">
			<%for(int i=0;i<10; i++){ %>
				<div class="card p-4 m-4 ">
					<div class="row">
						<div class="col-md-12">
							<div class="d-flex">
								<div class="mr-auto font-weight-bold p-2"
									style="font-size: 24px;">North</div>
								<div class="p-2 pt-3">23 members</div>
								<div class="rateYo p-0 font-12 align-self-center"
									data-rating="3.2" data-width="12"></div>
							</div>
						</div>
					</div>
					<button class="btn bg-transparent" data-toggle="collapse"
						data-target="#<%=i %>" aria-expanded="true"
						aria-controls="collapseOne">
						<div class="row  pl-4  ">
							<div class="col-md-2 pl-0 pr-0 align-self-center">
								<div
									class="d-flex flex-column border border-info text-center   ">
									<div class=" pt-4">
										<i class="material-icons md-36 color-sky">phone_forwarded</i>
									</div>
									<div class=" font-weight-bold ">
										<h3>230</h3>
									</div>
									<div class="pb-4">
										<h4 class="font-14 text-muted">Calls</h4>
									</div>
								</div>
							</div>
							<div class="col-md-2 pl-0 pr-0 align-self-center">
								<div class="d-flex flex-column border border-info text-center">
									<div class=" pt-4">
										<i class="material-icons md-36 color-sky">mail_outline</i>
									</div>
									<div class="  font-weight-bold ">
										<h3>230</h3>
									</div>
									<div class=" pb-4">
										<h4 class="font-14 text-muted">Emails</h4>
									</div>
								</div>
							</div>
							<div class="col-md-2 pl-0 pr-0 align-self-center">
								<div class="d-flex flex-column border border-info text-center">
									<div class=" pt-4">
										<i class="material-icons md-36 color-sky">tv</i>
									</div>
									<div class="  font-weight-bold">
										<h3>230</h3>
									</div>
									<div class=" pb-4">
										<h4 class="font-14 text-muted">Presentation</h4>
									</div>
								</div>
							</div>
							<div class="col-md-2 pl-0 pr-0 align-self-center">
								<div class="d-flex flex-column border border-info text-center">
									<div class=" pt-4">
										<i class="material-icons md-36 color-sky">mail_outline</i>
									</div>
									<div class="  font-weight-bold   pt-0 pb-0">
										<h3>230</h3>
									</div>
									<div class="pb-4 font-15">
										<h4 class="font-14 text-muted">Emails</h4>
									</div>
								</div>
							</div>
							<div class="col-md-2 pl-0 pr-0 align-self-center">
								<div class="d-flex flex-column border border-info text-center">
									<div class=" pt-4">
										<i class="material-icons md-36 color-sky">tv</i>
									</div>
									<div class="  font-weight-bold  ">
										<h3>230</h3>
									</div>
									<div class=" pb-4">
										<h4 class="font-14 text-muted">Emails</h4>
									</div>
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
					<div id="<%=i %>" class="collapse" aria-labelledby="headingOne"
						data-parent="#accordion">

						<div class="row">
							<div class="col-md-12">
								<div class="table-container">

									<table class="table border "
										style="margin-left: auto; margin-right: auto; width: 80%;">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">First</th>
												<th scope="col">Last</th>
												<th scope="col">Handle</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">1</th>
												<td>Mark</td>
												<td>Otto</td>
												<td>@mdo</td>
											</tr>
											<tr>
												<th scope="row">2</th>
												<td>Jacob</td>
												<td>Thornton</td>
												<td>@fat</td>
											</tr>
											<tr>
												<th scope="row">3</th>
												<td>Larry</td>
												<td>the Bird</td>
												<td>@twitter</td>
											</tr>
											<tr>
												<th scope="row">1</th>
												<td>Mark</td>
												<td>Otto</td>
												<td>@mdo</td>
											</tr>
											<tr>
												<th scope="row">2</th>
												<td>Jacob</td>
												<td>Thornton</td>
												<td>@fat</td>
											</tr>
											<tr>
												<th scope="row">3</th>
												<td>Larry</td>
												<td>the Bird</td>
												<td>@twitter</td>
											</tr>
											<tr>
												<th scope="row">1</th>
												<td>Mark</td>
												<td>Otto</td>
												<td>@mdo</td>
											</tr>
											<tr>
												<th scope="row">2</th>
												<td>Jacob</td>
												<td>Thornton</td>
												<td>@fat</td>
											</tr>
											<tr>
												<th scope="row">3</th>
												<td>Larry</td>
												<td>the Bird</td>
												<td>@twitter</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

				</div>
				<%} %>
			</div>
		</div>
	</div>
	<jsp:include page="inc/foot.jsp"></jsp:include>
	<script type="text/javascript">
		Highcharts.setOptions({
			colors : [ '#30beef', '#bae88a', '#fd6d81' ]
		});
		$('.highcart_div').each(function(){
			$(this).highcharts(
					{
						data : {
							table : document.getElementById('datatable'),

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
								return '<b>' + this.series.name + '</b><br/>'
										+ this.point.y + ' '
										+ this.point.name.toLowerCase();
							}
						}
					});
			
			
		});
		
	</script>
</body>
</html>