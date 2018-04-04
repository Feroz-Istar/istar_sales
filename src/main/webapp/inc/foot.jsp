
<%

String url = request.getRequestURL().toString();
String baseURL = url.substring(0, url.length() - request.getRequestURI().length()) + request.getContextPath() + "/";

%>
<script src="<%=baseURL %>assets/js/jquery-3.3.1.min.js"></script>
<script src="<%=baseURL %>assets/js/popper.min.js"></script>
<script src="<%=baseURL %>assets/js/bootstrap.min.js"></script>
<script src="<%=baseURL %>assets/js/slick.min.js"></script>
<script src="<%=baseURL %>assets/js/jquery.rateyo.min.js"></script>
<script src="<%=baseURL %>assets/js/highcharts.js"></script>
<script src="<%=baseURL %>assets/js/data.js"></script>
<script src="<%=baseURL %>assets/js/jquery.dataTables.min.js"></script>

<script src="<%=baseURL %>assets/js/tree.js"></script>

<script src="<%=baseURL %>assets/js/app.js"></script>