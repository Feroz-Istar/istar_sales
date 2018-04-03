<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">
    <title>Login</title>

 
 
<!-- Bootstrap core CSS -->
<jsp:include page="inc/head.jsp"></jsp:include>
<style type="text/css">/* latin-ext */
@font-face {
  font-family: 'Lato';
  font-style: normal;
  font-weight: 400;
  src: local('Lato Regular'), local('Lato-Regular'), url(https://fonts.gstatic.com/s/lato/v14/S6uyw4BMUTPHjxAwXjeu.woff2) format('woff2');
  unicode-range: U+0100-024F, U+0259, U+1E00-1EFF, U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
}
/* latin */
@font-face {
  font-family: 'Lato';
  font-style: normal;
  font-weight: 400;
  src: local('Lato Regular'), local('Lato-Regular'), url(https://fonts.gstatic.com/s/lato/v14/S6uyw4BMUTPHjx4wXg.woff2) format('woff2');
  unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
}
.login-screen-box {
    background-color: white;
    width: 400px;
    align-self: center;
    display: block;
    margin-left: auto;
    margin-right: auto;
    margin-top: 5%;
    padding: 6.6%;
}.custom-theme-btn-primary {
    background-color: #eb384f !important;
    border-color: #eb384f !important;
}.btn:not(:disabled):not(.disabled) {
    cursor: pointer;
}
.row {
    margin-right: -15px;
    margin-left: -15px;
}.custom-theme-btn-primary {
    background-color: #eb384f !important;
    border-color: #eb384f !important;
}.full-width {
    width: 100% !important;
}body {
    font-family: 'Lato', sans-serif !important;
    background-color: #2f4050;
    font-size: 13px;
    color: #676a6c;
    overflow-x: hidden;
}.btn-danger {
    background-color: #ed5565;
    border-color: #ed5565;
    color: #FFFFFF;
}.btn-group-sm>.btn, .btn-sm {
    padding: 5px 10px;
    font-size: 12px;
    line-height: 1.5;
    border-radius: 3px;
}.form-control, .single-line {
height:34px;
    background-color: #FFFFFF;
    background-image: none;
    /* border: 1px solid #eb384f; */
    border-radius: 1px;
    color: inherit;
    display: block;
    padding: 6px 12px;
    transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s
 ease-in-out 0s;
    width: 100%;
    font-size: 14px;
}
.m-t {
    margin-top: 15px;
}
.welcometxt{
margin-top: 20px;
    margin-bottom: 10px;}
    .small, small {
    font-size: 85%;
}
    .btn {
    display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
}.btn-group-sm>.btn, .btn-sm {
    padding: 5px 10px;
    font-size: 12px;
    line-height: 1.5;
    border-radius: 3px;
}
    
</style>
  </head>

 <body class="gray-bg" style="background-size: cover; background-repeat: no-repeat; background-image: url('http://elt.talentify.in/assets/images/demo1.png')" data-gr-c-s-loaded="true">
	
	
	
	

	
	<div class="text-center loginscreen animated fadeInDown">

		<div class="login-screen-box">
			<div>
				<img alt="Talentify" src="http://elt.talentify.in:9999/assets/img/user_images/new_talentify_logo.png" width="60%" height="60%">
			</div>

			<br>

			<h2 class="welcometxt" style="font-weight: 700;  font-size: 24px;">Welcome</h2>
			

			<form class="m-t" role="form" action="Authentication" method="post">
				<div class="form-group">
					<input type="email" name="email" class="form-control" placeholder="Username" required="">
				</div>
				<div class="form-group">
					<input type="password" name="password" class="form-control" placeholder="Password" required="">
				</div>
				
				<% if(response.getHeader("error") !=null){ %>
<div class="alert alert-danger" role="alert">
  <%=response.getHeader("error") %>
</div>
<% } %>
				<button type="submit" style="font-weight: 600; font-size: 16px;     margin-bottom: 7px;" class="btn btn-danger custom-theme-btn-primary block full-width m-b login-button">Login</button>	
                 <div class="row" style="margin-top: 10px;">       
				<div class="col-md-6"><a class="btn btn-sm btn-danger btn-block" href="trainer_signup.jsp">Sign up as Trainer</a></div>
				<div class="col-md-6"><a class="btn btn-sm btn-danger btn-block" href="./student_signup.jsp">Sign up as Student</a></div>
				</div>
				
			</form>
          
			<p class="m-t">
				<small>ISTAR Skill Development Pvt. Ltd. © 2017</small>
			</p>
		</div>
	</div>

	<jsp:include page="inc\foot.jsp"></jsp:include>
	
	



</body>





</html>

