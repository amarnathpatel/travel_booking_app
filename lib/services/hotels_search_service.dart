import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:travel_booking_app/models/hotel_details_model.dart';
import 'package:travel_booking_app/utils/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HotelSearchService {
  late List<HotelDetailsModel> hotelSearchResult = [];
  final Future<SharedPreferences> _sharedPref = SharedPreferences.getInstance();
  
  // To fetch Hotel Ids by City code API call
  Future<List<String>> getHotelIds(String cityCode) async {
    final SharedPreferences prefs = await _sharedPref;
    String? savedAccessToken = prefs.getString('access_token');
    Response response;
    var hotelIdList = <String>[];
    var serchByCityUrl = Uri.parse(
        '$kSearchHotelsByCityUrl?cityCode=$cityCode&radius=5&radiusUnit=KM&hotelSource=ALL');
    Map<String, String> headers = {'Authorization': 'Bearer $savedAccessToken'};
    try {
      response = await http.get(serchByCityUrl, headers: headers);
    } on Exception catch (e) {
      debugPrint("Error $e occurred");
      rethrow;
    }
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      var data = response.body;
      var jsonObject = jsonDecode(data);
      var hotelIdsList = jsonObject['data'];
      List hotelIdsArray = hotelIdsList as List;
      for (var hotel in hotelIdsArray) {
        var hotelId = hotel['hotelId'];
        hotelIdList.add(hotelId);
        debugPrint('+++++++++++++++For hotel Id : $hotelId');
      }
    } else {
      List errors = jsonDecode(response.body)['errors'] as List;
      debugPrint(errors[0]['title']);
      throw Exception(errors[0]['title']);
    }
    return hotelIdList;
  }

  // Search hotels API call
  Future<List<HotelDetailsModel>> searchHotels(
    List<String> hotelIds,
    String checkinDate,
    String checkoutDate,
    int adultsCount,
    int roomQuantity,
  ) async {
    final SharedPreferences prefs = await _sharedPref;
    String? savedAccessToken = prefs.getString('access_token');
    var searchHotels = Uri.parse(
        '$kSearchHotelsUrl?hotelIds=$hotelIds&adults=$adultsCount&checkInDate=$checkinDate&checkOutDate=$checkoutDate&roomQuantity=$roomQuantity');
    Map<String, String> headers = {'Authorization': 'Bearer $savedAccessToken'};
    Response response;
    try {
      response = await http.get(searchHotels, headers: headers);
    } on Exception catch (e) {
      debugPrint("Error $e occurred");
      rethrow;
    }
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      var data = response.body;
      List hotelArray = jsonDecode(data)['data'] as List;
      for (int index = 0; index < hotelArray.length; index++) {
        var hotel = hotelArray[index];
        var hotelName = hotel['hotel']['name'];
        var lat = hotel['hotel']['latitude'].toString();
        var long = hotel['hotel']['latitude'].toString();
        List offers = hotel['offers'] as List;
        var currency = 'INR', fare, roomDesc = '';
        for (var offer in offers) {
          roomDesc = offer['room']['description']['text'];
          currency = offer['price']['currency'];
          fare = offer['price']['total'];

          break;
        }
        var totalFare = '$currency $fare';
        debugPrint(
            'Hotel NAme : $hotelName, lattitude: $lat, longitude: $long , fare: $fare');
        hotelSearchResult.add(HotelDetailsModel(
            fare: totalFare,
            hotelName: hotelName,
            latitude: lat,
            longitude: long,
            offer: roomDesc,
            hotelPhotoUrl: 'assets/images/hotel/hotel${index+1}.jpg'));
      } //
    } else {
      List errors = jsonDecode(response.body)['errors'] as List;
      debugPrint('Search Hotels API error response.....');
      debugPrint(errors[0]['title']);
      throw Exception(errors[0]['title']);
    }
    return hotelSearchResult;
  }
}
