import { Controller } from "@hotwired/stimulus";
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array || null
  }

  static targets = [
    "long",
    "lat"
  ]

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/satellite-streets-v12",
    })

    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))

    if (this.markersValue.length > 0){
    this.addMarkersToMap()
    this.fitMapToMarkers()
    }
  }

  addMarkersToMap() {
    this.markersValue.forEach((marker) => {

      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  clickmap() {

    // this.map = new mapboxgl.Marker()({
    // container: "map",
    // });
    // this.marker = new mapboxgl.Marker();
    // this.map.on('click', this.add_marker.bind(this));

    // function add_marker  (event) {
    //   var coordinates = event.lngLat;
    //   console.log('Lng:', coordinates.lng, 'Lat:', coordinates.lat);
    //   this.marker.setLngLat(coordinates).addTo(this.map);
    // }

    // this.map.on('click', (e) => {

    // // this.longTarget.value = parseFloat(e.lngLat.lng)
    // // this.latTarget.value = parseFloat(e.lngLat.lat)
    // this.longTarget.value = e.lngLat.lng
    // console.log(e.lngLat.lng)
    // this.latTarget.value = e.lngLat.lat

    //     new mapboxgl.Marker()
    //     .setLngLat([ e.lngLat.lng , e.lngLat.lat ])
    //     .addTo(this.map)
    // })
    var map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v11',
    center: [-79.4512, 43.6568],
    zoom: 13
    });
    this.map = new mapboxgl.Map({
      container: "map",
      style: "<mapbox://styles/mapbox/streets-v11",
    });
    this.marker = new mapboxgl.Marker();
    this.map.on('click', this.add_marker.bind(this));
    function add_marker  (event) {
      var coordinates = event.lngLat;
      console.log('Lng:', coordinates.lng, 'Lat:', coordinates.lat);
      this.marker.setLngLat(coordinates).addTo(this.map);
    }
    var geocoder = new MapboxGeocoder({
    accessToken: mapboxgl.accessToken,
    mapboxgl: mapboxgl
    });
    document.getElementById('geocoder').appendChild(geocoder.onAdd(map));

  }
}
