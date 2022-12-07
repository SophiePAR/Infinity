// import { Controller } from "@hotwired/stimulus";
// import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// // Connects to data-controller="map"
// export default class extends Controller {
//   static values = {
//     apiKey: String,
//     markers: Array || null
//   }

//   static targets = [
//     "long",
//     "lat"
//   ]

//   connect() {
//     mapboxgl.accessToken = this.apiKeyValue

//     this.map = new mapboxgl.Map({
//       container: this.element,
//       style: "mapbox://styles/mapbox/satellite-streets-v12",
//     })

//     this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
//       mapboxgl: mapboxgl }))

//     if (this.markersValue.length > 0){
//     this.addMarkersToMap()
//     this.fitMapToMarkers()
//     } else {
//       this.map.on("mousemove", (e) => {
//         console.log(e.point);
//       })
//       this.map.on('click', (e) => {

//         this.longTarget.value = e.lngLat.lng
//         this.latTarget.value = e.lngLat.lat

//           const dubaï = new mapboxgl.Marker()
//             .setLngLat([ e.lngLat.lng , e.lngLat.lat ])
//             .addTo(this.map)

//     })
//     }
//   }

//   addMarkersToMap() {
//     this.markersValue.forEach((marker) => {

//       new mapboxgl.Marker()
//         .setLngLat([ marker.lng, marker.lat ])
//         .addTo(this.map)
//     })
//   }

//   fitMapToMarkers() {
//     const bounds = new mapboxgl.LngLatBounds()
//     this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
//     this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
//   }
// }
