import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="meteo"
export default class extends Controller {
  // static values = {
  //   apiKey: String,
  //   markers: Array
  // }


  connect() {
    // const openwheaterdata = fetch('https://api.openweathermap.org/data/2.5/weather?lat=48.862725&lon=2.287592&appid=8811c40a96849bc823488eb804289094&units=metric')
    // console.log(openwheaterdata);
    console.log('hello');
  }
}
