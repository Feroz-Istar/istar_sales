<!-- Bootstrap core CSS -->
<%
   String url = request.getRequestURL().toString();
   String baseURL = url.substring(0, url.length() - request.getRequestURI().length()) + request.getContextPath() + "/";
   
   %>
<link href="<%=baseURL %>assets/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<%=baseURL %>assets/css/sticky-footer-navbar.css"
   rel="stylesheet">
<link href="<%=baseURL %>assets/css/slick.css" rel="stylesheet">
<link href="<%=baseURL %>assets/css/slick-theme.css" rel="stylesheet">
<link href="<%=baseURL %>assets/css/google-material-icon.css"
   rel="stylesheet">
<link href="<%=baseURL %>assets/css/jquery.rateyo.min.css"
   rel="stylesheet">
 <link href="<%=baseURL %>assets/css/jquery.dataTables.min.css" rel="stylesheet">
   
   <link href="<%=baseURL %>assets/css/tree.css" rel="stylesheet">
<link href="<%=baseURL %>assets/css/custom.css" rel="stylesheet">