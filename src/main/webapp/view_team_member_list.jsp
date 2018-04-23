<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<jsp:include page="inc/head.jsp"></jsp:include>
<title>Insert title here</title>
<style type="text/css">
.table td, .table th {
	vertical-align: middle !important;
}

.team-btn {
	line-height: 0.5rem !important;
	background-color: white !important;
}
.dataTables_filter{
display: none;
}
.dataTables_length{
display: none;}
</style>
</head>
<body>
	<jsp:include page="inc/nav.jsp"></jsp:include>


	<div class="container  mt-3">
		<div class="d-flex  ">
			<div class="mr-auto p-2 ml-5">
				<div class="font-28 ml-4">
					<i class="material-icons text-danger  font-32">arrow_back</i>Teams
				</div>
			</div>

			<div class="p-2 mr-5">
				<form class="form-inline" style="position: relative;">
				<i class="material-icons" style="position: absolute; right: 0" ml-2 >search</i>	
					<input class="form-control mr-sm-2"  onkeyup="datatable()" id="search" type="search" 	placeholder="Search " aria-label="Search">
 				</form>
			</div>

		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="table-container">

					<table class="table border bg-white rounded" id="example"
						style="margin-left: auto; margin-right: auto; width: 80%;">
						<thead>
							<tr class="rounded ">
 								<th class="font-weight-bold font-16 text-muted p-3  "
									scope="col">CLIENT NAME</th>
								<th class="font-weight-bold font-16 p-3 " scope="col">PHONE
									NO</th>
								<th class="font-weight-bold font-16  p-3 " scope="col">EMAIL
									ID</th>
								<th class="font-weight-bold font-16   p-3 " scope="col">City</th>
								<th class="font-weight-bold font-16 p-3 " scope="col">State</th>
								<th class="font-weight-bold font-16  p-3 " scope="col">Products
								</th>
								
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="inc/foot.jsp"></jsp:include>
<script>
var table;
function datatable(){
     var x = document.getElementById("search");
     table.search(x.value).draw();
	}
$(document).ready(function() {
	
	
	
	


	table = $('#example').DataTable( {
		 "dom":   '<"top"i>rt<"bottom"flp><"clear">',
        "processing": true,
        "serverSide": true,
        ajax: {      type: "POST",

            /* "url": "DummyDatatable", */
                        "url": "http://192.168.1.18:8080/istar/rest/sales_manager/3/teams/5343",
            contentType: 'application/x-www-form-urlencoded',
            "data": function(data) {
            	
            	
            	return planify(data);
            } , dataFilter: function(data){
            	var reponse_json = JSON.parse(data);
            	console.log(reponse_json);
            	console.log(reponse_json.response.recordsTotal);
            	console.log(reponse_json.response.recordsFiltered);
            	console.log(reponse_json.response.data);
            	console.log(reponse_json.response.draw);

                var json = {};
                json.recordsTotal =reponse_json.response.recordsTotal;
                json.recordsFiltered =  reponse_json.response.recordsFiltered;
                json.data = reponse_json.response.data;
                json.draw=reponse_json.response.draw;
     console.log(json)
                return JSON.stringify( json ); // return JSON string
            }
           
    } 
	
	
	});
	 
} );

function planify(data) {
	
	
    for (var i = 0; i < data.columns.length; i++) {
        column = data.columns[i];
        column.searchRegex = column.search.regex;
        column.searchValue = column.search.value;
        delete(column.search);
    }
    var obj={};
    obj.data=JSON.stringify(data);
    return obj;
}
</script>
</body>
</html>


