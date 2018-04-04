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
				<a class="btn bg-theme btn-lg color-white font-18 font-weight-bold" href="#" role="button">
					Create	Team</a>
			</div>
		</div>
		<div class="row">
			<%
				for (int i = 1; i < 12; i++) {
			%>
			<div class="col-3 ">
				<div class="card p-2 mb-3  border border-dark ">
					<a class="bg-transparent text-muted nohover "
						href="view_team_member_list.jsp">

						<div class="card-body p-1 m-1 ">
							<h5 class="card-title text-danger">Card title</h5>
							<p class="card-text text-muted font-weight-bold text-justify font-14"> 	Some quick example text to build on the  card title .</p>
							<a href="#" class="card-link "><span class="pt-3">Card link</span></a>
							 <a href="#" class="card-link mt-2">Another link</a>
						</div> </a>
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