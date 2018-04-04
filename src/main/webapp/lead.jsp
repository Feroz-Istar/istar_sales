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
<style>

.dataTables_filter, .dataTables_length { display: none; }
table.dataTable.stripe tbody tr.odd,table.dataTable.display tbody tr.odd{
    background-color:#ffffff !important;
}
table.dataTable.display tbody tr.odd>.sorting_1,table.dataTable.order-column.stripe tbody tr.odd>.sorting_1{
    background-color:#ffffff !important;
}
table.dataTable.display tbody tr.even>.sorting_1,table.dataTable.order-column.stripe tbody tr.even>.sorting_1{
    background-color:#ffffff !important;
}
</style>
</head>
<body>
	<jsp:include page="inc/nav.jsp"></jsp:include>
	<div class="container mt-4">
		<div class="d-flex">
			<div class="p-2">
				<label class="sr-only" for="inlineFormInputName2">Name</label> <input
					type="text" class="form-control mb-2 mr-sm-2"
					id="inlineFormInputName2" placeholder="Search ...">

			</div>
			<div class="p-2">
				<select class="custom-select datatable_filter" id="inlineFormCustomSelectPref">
					<option selected>Filter</option>
					<option value="0">Name</option>
					<option value="1">Company</option>
					<option value="2">Phoneno</option>
					<option value="3">Email</option>
					<option value="4">City</option>
					<option value="5">State</option>
				</select>

			</div>
			<div class="p-2">
				<select class="custom-select datatable_sort" id="inlineFormCustomSelectPref">
					<option selected>Sort</option>
					<option value="0">Name</option>
					<option value="1">Company</option>
					<option value="2">Phoneno</option>
					<option value="3">Email</option>
					<option value="4">City</option>
					<option value="5">State</option>

				</select>

			</div>
			<div class="ml-auto ">

				<a class="btn bg-theme btn-lg color-white font-16 font-weight-bold"
					href="#" role="button"> Add Leads</a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">

				<table id="example" class="display" style="width: 100%">
					<thead class="bg-white">
						<tr>
							<th>Name</th>
							<th>Company</th>
							<th>Phoneno</th>
							<th>Email</th>
							<th>City</th>
							<th>State</th>
						</tr>
					</thead>

				</table>
			</div>
		</div>

	</div>
	<jsp:include page="inc/foot.jsp"></jsp:include>
	<script>
$(document).ready(function() {
	var table = $('#example').DataTable( {
        "processing": true,
        "serverSide": true,
        ajax: {
            /* "url": "DummyDatatable", */
                        "url": "rest/getData/datatable",
            contentType: 'application/json; charset=utf-8',
            "data": function(data) {
            	
            	
            	return planify(data);
            } 
           
    },
    "columns": [
    { "name": "engine" },
    { "name": "browser" },
    { "name": "platform" },
    { "name": "version" },
    { "name": "grade" },
    { "name": "ss" }
    ]
	
	
	});
	
	
	
	$('#inlineFormInputName2').on( 'keyup', function () {
		var datatable_filter = $('.datatable_filter').val();
		var datatable_sort = $('.datatable_sort').val();
		var val = $(this).val().replace(/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi, '');
		console.log("datatable_filter "+datatable_filter +" datatable_sort "+datatable_sort);
		if(datatable_filter ==="Filter" && datatable_sort==="Sort"){
		console.log('running this');
	    table.search( val ).draw();
		}else{
			if(datatable_filter != "Filter" && datatable_sort==="Sort"){
				console.log('filtering column');
				table.columns( datatable_filter).search( val ).draw();
			}else if(datatable_filter != "Filter" && datatable_sort !=="Sort"){
				table.columns( datatable_filter).order( [ datatable_sort, 'asc' ]).search( val ).draw();
			}else if( datatable_sort !=="Sort"){
				table.order( [ datatable_sort, 'asc' ]).draw();
			}
		}
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
	
	
} );

</script>
</body>
</html>