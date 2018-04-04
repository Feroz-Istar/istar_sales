<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Create Team</title>
<jsp:include page="inc/head.jsp"></jsp:include>
<style>
body .scrollspy-example {
	position: relative;
	height: 430px;
	overflow: auto;
}
</style>
</head>
<body data-spy="scroll" data-target="#navbar-example">
	<jsp:include page="inc/nav.jsp"></jsp:include>

	<div class="container mt-4">
		<h4 class="font-weight-bold">Create Team</h4>
		<div class="d-flex flex-row">
			<div class="form-group" style="min-width: 49%;">
				<label for="exampleInputEmail1" class="text-muted  ">Team
					Name</label> <input class="form-control" type="text"
					placeholder="Enter Team Name">
			</div>

		</div>

		<div class="row">

			<div class="col-6">
				<div class="form-group">
					<label for="exampleInputEmail1 " class="text-muted   ">Add
						Members </label> <input class="form-control" type="text"
						placeholder="Enter member Name">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1" class="text-muted  ">Add
						Products</label> <input class="form-control" type="text"
						placeholder="Add products">
				</div>
				<div class="form-group">
					<label for="exampleFormControlTextarea1" class="text-muted  ">Example
						textarea</label>
					<textarea class="form-control"
						placeholder="Describe yourself here..."
						id="exampleFormControlTextarea1" rows="3"> </textarea>
				</div>
				<div class="form-group text-right">
					<button type="button" class="btn btn-danger">Create Member</button>
				</div>
			</div>
			<div class="col-6">
				<h4 class="text-muted">Select Members</h4>
				<div class="card "
					style="height: 54%; width: 100%; background-color: rgba(255, 255, 255, 0.5);">
					<div class="row  scrollspy-example pl-4	" data-spy="scroll"
						data-target="#spy">
						<%
							for (int i = 0; i < 70; i++) {
						%>
						<div id="scroll1" class="col-md-3  m-2 ">

							 
							<button type="button" class="btn btn-outline-danger btn-sm    ">
								<span>Small button</span><i class="material-icons md-18">clear</i>
							</button>


						</div>
						<%
							}
						%>


					</div>

				</div>
			</div>

		</div>
	</div>

	<jsp:include page="inc/foot.jsp"></jsp:include>
	<script type="text/javascript">
		$('body').scrollspy({
			target : '#navbar-example'
		})

		$('[data-spy="scroll"]').each(function() {
			var $spy = $(this).scrollspy('refresh')
		})
	</script>

</body>
</html>