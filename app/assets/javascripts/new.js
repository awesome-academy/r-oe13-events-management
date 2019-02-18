function initMap(){
  var options = {
    zoom: 18,
    center: {lat: 21.0170075, lng: 105.7824571}
  }

  var map = new google.maps.Map(document.getElementById('map-canvas'), options);

  var marker = new google.maps.Marker({
    position: {lat: 21.017069199999998, lng: 105.7823701},
    map: map,
    draggable: true
  });

  var searchBox = new google.maps.places.SearchBox(document.getElementById('mapsearch'));
  google.maps.event.addListener(searchBox, 'places_changed', function(){
    console.log(searchBox.getPlaces());
    var places = searchBox.getPlaces();
    var bounds = new google.maps.LatLngBounds();
    var i, place;
    for(i=0; place=places[i];i++){
      document.getElementById('latitude').value = place.geometry.location.lat();
      document.getElementById('longitude').value = place.geometry.location.lng();
      bounds.extend(place.geometry.location);
      marker.setPosition(place.geometry.location);
    }
    map.fitBounds(bounds);
    map.setZoom(18);
  });
}
