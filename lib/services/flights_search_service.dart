import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:travel_booking_app/utils/api_constants.dart';

class FlightsSearchService {
  late DateTime departureDateTime;
  late DateTime arrivalDateTime;
  late String carrierCode;
  late String carrierName;
  late int totatPrice;

  Future<void> getFlightSerachResults(String originLocationCode,
      String destinationLocationCode, String departureDate, int adultsCount,
      {maxResults, nonStop, currencyCode}) async {
    /*var url = Uri.parse(
        '$kSearchFlightsUrl?originLocationCode=$originLocationCode&destinationLocationCode=$destinationLocationCode&departureDate=$departureDate&adults=$adultsCount&max=$maxResults&nonStop=$nonStop,currencyCode=$currencyCode');
    Map<String, String> headers = {
      'Authorization': 'Bearer G6RmTOOZslNwUjnwYgtiGbKwCA9O'
    };
    var response = await http.get(url, headers: headers);
    if(response.statusCode == 200){
        var data = response.body;
        var jsonObject = jsonDecode(data);  // Parses the JSON string and returns the resulting JSON object
        var count = jsonObject['meta']['count'];
        debugPrint('Count : $count');
      }
    debugPrint("${response.statusCode}");
    debugPrint(response.body);
    */

    final String data = await rootBundle.loadString('assets/flight2.json');
    var jsonObject = jsonDecode(data); // Parses the JSON string and returns the resulting JSON object
    var flightList = jsonObject['data'];
    List flightListArray = flightList as List;
    for (var flight in flightListArray) {
      var id = flight['id'];
      debugPrint('+++++++++++++++For Flight Id : $id');
      var itinerariesList = flight['itineraries'];
      List itinerariesListArray = itinerariesList as List;
      for (var itinery in itinerariesListArray) {
        var sigmentList = itinery['segments'];
        List sigmentListArray = sigmentList as List;
        for (var segment in sigmentListArray) {
          var departureTime = segment['departure']['at'];
          var arrivalTime = segment['arrival']['at'];
          var carrierCode = segment['carrierCode'];
          var flightNumber = segment['number'];
          var aircraftCode = segment['aircraft']['code'];
          var noOfStops = segment['numberOfStops'];
          debugPrint(
              'segment details- Carrier Code:$carrierCode  ,Flight Number: $flightNumber ,Aircraft Code : $aircraftCode ,Number Of stops : $noOfStops');
          debugPrint(
              'segment details- Carrier Code:$carrierCode  ,Flight Number: $flightNumber ,Aircraft Code : $aircraftCode ,Number Of stops : $noOfStops');
          debugPrint(
              'segment details- Departure Time:$departureTime  ,Arrival Time: $arrivalTime');
        }
      }
    }
  }
}
