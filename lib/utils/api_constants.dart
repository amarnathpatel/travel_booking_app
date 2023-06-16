

// Web Service URLs
const kAccessTokenUrl = 'https://test.api.amadeus.com/v1/security/oauth2/token';
const kSearchFlightsUrl = 'https://test.api.amadeus.com/v2/shopping/flight-offers';
const kSearchHotelsByCityUrl = 'https://test.api.amadeus.com/v1/reference-data/locations/hotels/by-city';
const kSearchHotelsUrl = 'https://test.api.amadeus.com/v3/shopping/hotel-offers';

//https://test.api.amadeus.com/v3/shopping/hotel-offers?hotelIds=MCLONGHM&adults=1&checkInDate=2023-11-22&paymentPolicy=NONE&roomQuantity=1
//https://test.api.amadeus.com/v1/reference-data/locations/hotels/by-city?cityCode=PNQ&radius=5&radiusUnit=KM&hotelSource=ALL


// API authentication secrets for getting access token
const kClientID = 'rkgFO2jEilT8sx1BhmZbnYWJ8CqQC2xn';
const kClientSecret = 'i0kVUlHdx1gWHiWx';
const kGrantType= 'client_credentials';
const kContentType= 'application/x-www-form-urlencoded; charset=UTF-8';