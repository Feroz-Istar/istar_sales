<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
			<li class="breadcrumb-item"><a class="text-muted"
				href="/analytics.jsp">Teams</a></li>
			<li class="breadcrumb-item " aria-current="page"><a
				href="/individuals.jsp">Individuals</a></li>
		</ol>
		</nav>
		<div class="row">
			<div class="col-md-12 p-0 m-0">
			<%for(int i=0; i<10;i++){ %>
				<div class="card p-4 m-4 ">
				<a  class="bg-transparent text-muted nohover" href="individuals_report.jsp">
					<div class="row">
						<div class="col-2">
							<img
								src="http://www.ihindiwishes.com/wp-content/uploads/2018/01/Happy-Whatsapp-DP-Images.jpg"
								alt="..." class="img-thumbnail border-0	 ">
						</div>
						<div class="col-10">
							<div class="font-weight-bold font-25 mb-1">Yogesh Jain</div>
							<div class="rateYo p-0 font-12 align-self-center"
								data-rating="3.2" data-width="15"></div>
							<div class="row ml-0 mr-0 mt-3 mb-1">
								<div class="col-2 text-left pl-0 pr-0">
									<i class="material-icons md-36 color-sky">phone_forwarded</i>

								</div>
								<div class="col-2 text-center pl-0 pr-0">
									<i class="material-icons  md-36 color-sky">library_books</i>
								</div>
								<div class="col-2 text-center pl-0 pr-0">
									<i class="material-icons md-36 color-sky">group</i>

								</div>
								<div class="col-2 text-center pl-0 pr-0">
									<i class="material-icons md-36 color-sky">mail_outline</i>

								</div>
								<div class="col-2 text-center pl-0 pr-0">
									<i class="material-icons md-36 color-sky">tv</i>

								</div>
								<div class="col-2 text-center pl-0 pr-0">
								<i class="material-icons  md-36 color-sky">multiline_chart</i>
								</div>
							</div>
							<div class="row ml-0 mr-0">
								<div class="col-2 text-left  text-muted  font-14 pl-0 pr-0">112 Calls</div>
								<div class="col-2 text-center text-muted  font-14 pl-0 pr-0">85
									Presentations</div>
								<div class="col-2 text-center text-muted  font-14 pl-0 pr-0">85
									Meeting</div>
								<div class="col-2 text-center  text-muted  font-14 pl-0 pr-0">85
									Mails</div>
								<div class="col-2 text-center text-muted  font-14  pl-0 pr-0">10
									Webinars</div>
								<div class="col-2 text-center text-muted  font-14 pl-0 pr-0">500
									Target Achieved</div>
							</div>
						</div>
					</div>
					</a>
				</div>
				<%} %>

			</div>
		</div>
	</div>




	<jsp:include page="inc/foot.jsp"></jsp:include>

</body>
</html>