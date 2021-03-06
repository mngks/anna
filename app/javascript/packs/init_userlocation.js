const haversine = require('haversine')

const initUserLocation = () => {
  navigator.geolocation.getCurrentPosition((position)=>{
    const userLatitude = position.coords.latitude
    const userLongitude = position.coords.longitude
    const cards = document.querySelectorAll('.big-card-location')
    console.log(cards)
    cards.forEach((card)=>{
      const cardCoordinatesArray = JSON.parse(card.dataset.coordinates)
      const foodLatitude = cardCoordinatesArray[0]
      const foodLongitude = cardCoordinatesArray[1]
      const userPosition = {latitude: userLatitude, longitude: userLongitude }
      const foodPosition = {latitude: foodLatitude, longitude: foodLongitude }
      const distance = haversine(userPosition, foodPosition).toFixed(1)
      card.innerHTML = "<p><strong>" + distance + "km</strong></p>" + "<p>from you</p>"
    })
  })
}


export { initUserLocation }
