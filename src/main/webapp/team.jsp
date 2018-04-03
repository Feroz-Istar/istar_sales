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
				<div class="font-32">Teams</div>
			</div>
			<div class="p-2">
				<button type="button"
					class="btn bg-theme btn-lg color-white font-18 font-weight-bold">Create
					Team</button>
			</div>
		</div>
		<div class="row">
			<%
				for (int i = 1; i < 12; i++) {
			%>
			<div class="col-3">
				<div class="card p-2 mb-3">
					<a class="bg-transparent text-muted nohover"
						href="view_team_member_list.jsp">

						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="card-link">Card link</a> <a href="#"
								class="card-link">Another link</a>
						</div> <a class="bg-transparent text-muted nohover"
						href="individuals_report.jsp">
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