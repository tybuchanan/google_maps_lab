// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  var markers = [];

  function initialize() {
    //just a variable storing a location
    var mapOptions = {
      center: new google.maps.LatLng(32.7758, 96.7967),
      zoom: 2
    };
    // alert(gon.current_user)
    var loadPins = function() {    
      var url = "/pins.json";    
      $.ajax(url, {
        type: 'get'
      }).success(function(data) {      
        for (var i in data) {        
          addPin(data[i].lat, data[i].long);      
        }    
      });  
    }
    loadPins();

    var map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);


    function addPin(lat, long) {
      var loc = new google.maps.LatLng(lat, long);
      console.log(loc);
      var newMarker = new google.maps.Marker({
        position: loc,
        map: map

      });
    };

    google.maps.event.addListener(map, "click", function(event) {
      addPin(event.latLng.A, event.latLng.k);

      var lat = event.latLng.A;
      var long = event.latLng.k;
      var email = gon.email_id;
      var url = "/pins.json";
      $.ajax(url, {
        // url: '/pins.json', // action: "/contacts",
        type: 'post',

        data: {
          pin:

          {
            lat: lat,
            long: long,
            email_id: gon.email_id

          }
        },
        dataType: "json",
        success: function(data) {
          console.log(data);      
        }
      })

    });
  };
  //code loads the map
  google.maps.event.addDomListener(window, 'load', initialize);

});