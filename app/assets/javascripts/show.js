function initMapshow(success, failure){
  navigator.geolocation.getCurrentPosition(success, failure);
  function success(position){
    var start = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    var end = new google.maps.LatLng(event_lat, event_lng);
    var directionsDisplay = new google.maps.DirectionsRenderer();
    var directionsService = new google.maps.DirectionsService();
    var mapOptions = {
      zoom: 15,
      center: end
    };

    var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    directionsDisplay.setMap(map);

    var image = {
      url: 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png',
      size: new google.maps.Size(20, 32),
      origin: new google.maps.Point(0, 0),
      anchor: new google.maps.Point(0, 32)
    };

    var marker = new google.maps.Marker({
      position: {lat: event_lat, lng: event_lng},
      map: map,
      icon: image
    });

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
