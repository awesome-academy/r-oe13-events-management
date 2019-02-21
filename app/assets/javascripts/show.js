function initMap(success, failure){
  navigator.geolocation.getCurrentPosition(success, failure);
  function success(position){
    var start = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    var end = new google.maps.LatLng(event_lat, event_lng);
    var directionsDisplay = new google.maps.DirectionsRenderer();
    var directionsService = new google.maps.DirectionsService();
    var mapOptions = {
      zoom: 18,
      center: start
    };

    var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    directionsDisplay.setMap(map);

    var request = {
      origin: start,
      destination: end,
      travelMode: "WALKING"
    };

    directionsService.route(request, function(result, status){
      if (status == 'OK'){
        directionsDisplay.setDirections(result);
      }
    });
  }
  function failure(){}
}
