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
</head>
<body class="bg-dark">
	<jsp:include page="inc/nav.jsp"></jsp:include>
	<div class="container">
		<div class="col-md-6 p-4 m-4 bg-light">
			<div class="card border-0">
				<div class="card-body">
					<div class="m-4 border rounded">
						<div class="p-4">
							<form>
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email">
									<small id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>
								<div class="form-check">
									<input type="checkbox" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">Check me out</label>
								</div>
								<button type="submit" class="btn btn-primary">Submit</button>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div>
				<div class="d-flex mt-4">
					<div class="p-2">
						<button type="button" class="btn btn-lg btn-danger"  ><span class="ml-3 mr-3">Previous</span></button>
					</div>
					<div class="ml-auto p-2">
						<button type="button" class="btn btn-lg btn-danger " ><span class="ml-5 mr-5">Next</span></button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="inc/foot.jsp"></jsp:include>

</body>
</html>