$(document).ready(function(){
	$('.rateYo').each(function(){
		var rating = $(this).attr('data-rating');
		var star_width = $(this).attr('data-width');
		  $(this).rateYo({
			    starWidth: star_width+"px",
			    rating: rating,
			    readOnly: true
			  });
		
	});

	$('.task_card').unbind().click(function(){
		
		$('.modal').modal('show')

	});
	
	$('.autoplay').slick({
		  dots: false,
		  infinite: false,
		  speed: 600,
		  slidesToShow: 3,
		  slidesToScroll:3,
		  responsive: [
		    {
		      breakpoint: 1024,
		      settings: {
		        slidesToShow: 3,
		        slidesToScroll: 3,
		        infinite: false,
		        dots: true
		      }
		    },
		    {
		      breakpoint: 600,
		      settings: {
		        slidesToShow: 2,
		        slidesToScroll: 2
		      }
		    },
		    {
		      breakpoint: 480,
		      settings: {
		        slidesToShow: 1,
		        slidesToScroll: 1
		      }
		    }
		    // You can unslick at a given breakpoint now by adding:
		    // settings: "unslick"
		    // instead of a settings object
		  ]
		});
	
	Highcharts.setOptions({
		 colors: ['#30beef','#bae88a','#fd6d81','#7295fd']
		});
	
	
	$('.highchart_container').each(function(){
		var table_id=$(this).attr("data-tableid");
		var title=$(this).attr("data-title");
		if(title === undefined){
			title="";
		}
		
		 $(this).highcharts({
		        data: {
		            table: document.getElementById('datatable')
		        },
		        chart: {
		            type: 'column'
		        },
		        title: {
		            text: title
		        },
		        yAxis: {
		            allowDecimals: false,
		            title: {
		                text: 'Units'
		            }
		        },
		        tooltip: {
		            formatter: function() {
		                return '<b>'+ this.series.name +'</b><br/>'+
		                    this.point.y +' '+ this.point.name.toLowerCase();
		            }
		        },
		        legend: {
		            symbolRadius: 0
		        }
		    });
		
		
		
	});
	
	
	if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    }
	
					
});

function showPosition(position){
	
	addScript(position);
	
}
var maxZoomService;
var infoWindow;

function addScript(position){
	$.getScript('https://maps.googleapis.com/maps/api/js?key=AIzaSyC85ThseuEMZCrNyKqkJkjatXWyZKQD6aA')
	  .done(function(){
	    var uluru = {lat: position.coords.latitude, lng: position.coords.longitude};
        var geocoder = new google.maps.Geocoder();
        var address ="ISTAR Skill Development Pvt. Ltd. bangalore";
        
        var map = new google.maps.Map(document.getElementById('map'), {
  	      zoom: 16,
  	      center: uluru
  	    });
        geocoder.geocode({'address': address}, function(results, status) {
            if (status === 'OK') {
            	map.setCenter(results[0].geometry.location);
              var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
              });
            } else {
              alert('Geocode was not successful for the following reason: ' + status);
            }
          });
	   /* 
	    var marker = new google.maps.Marker({
	      position: uluru,
	      map: map
	    });
	    infoWindow = new google.maps.InfoWindow();

	    maxZoomService = new google.maps.MaxZoomService();
	    map.addListener('click', showMaxZoom);*/
	    $('.map_error_div').hide();
	    
	  })
	  .fail(function(){
	    console.log('script could not load');
	  })
	;

	
	
/*    $('body').append('<script      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC85ThseuEMZCrNyKqkJkjatXWyZKQD6aA&callback=getLocation">    </script>');
*/    
}

function showMaxZoom(e) {
	  maxZoomService.getMaxZoomAtLatLng(e.latLng, function(response) {
	    if (response.status !== 'OK') {
	      infoWindow.setContent('Error in MaxZoomService');
	    } else {
	      infoWindow.setContent(
	          'The maximum zoom at this location is: ' + response.zoom);
	    }
	    infoWindow.setPosition(e.latLng);
	    infoWindow.open(map);
	  });
	}
