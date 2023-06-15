import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_booking_app/models/flight_details_model.dart';
import 'package:travel_booking_app/utils/api_constants.dart';

import '../models/flight.dart';

class FlightsSearchService {
  late DateTime departureDateTime;
  late DateTime arrivalDateTime;
  late String carrierCode;
  late String carrierName;
  late int totatPrice;

  Future<List<FlightDetailModel>> getFlightSerachResults(
      String originLocationCode,
      String destinationLocationCode,
      String departureDate,
      int adultsCount,
      {maxResults,
      nonStop,
      currencyCode}) async {
    debugPrint(
        'getFlightSerachResults, originLocationCode: $originLocationCode, destinationLocationCode: $destinationLocationCode , departureDate: $departureDate,  adultsCount:$adultsCount');
    var flightSerachResult = <FlightDetailModel>[];
    //var url = Uri.parse('$kSearchFlightsUrl?originLocationCode=$originLocationCode&destinationLocationCode=$destinationLocationCode&departureDate=$departureDate&adults=$adultsCount&max=$maxResults&nonStop=$nonStop,currencyCode=$currencyCode');
    var url = Uri.parse(
        '$kSearchFlightsUrl?originLocationCode=$originLocationCode&destinationLocationCode=$destinationLocationCode&departureDate=$departureDate&adults=$adultsCount');
    Map<String, String> headers = {
      'Authorization': 'Bearer OBsyu7t2sX0Ao3xOsTIPlwsXJTOc'
    };
    var response = await http.get(url, headers: headers);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      var data = response.body;
      var jsonObject = jsonDecode(
          data); // Parses the JSON string and returns the resulting JSON object
      // var count = jsonObject['meta']['count'];
      //debugPrint('Count : $count');

      //debugPrint("${response.statusCode}");
      //debugPrint(response.body);

      //final String data = await rootBundle.loadString('assets/flight2.json');
      //var jsonObject = jsonDecode(data); // Parses the JSON string and returns the resulting JSON object
      var flightList = jsonObject['data'];
      List flightListArray = flightList as List;
      for (var flight in flightListArray) {
        var id = flight['id'];
        debugPrint('+++++++++++++++For Flight Id : $id');
        var cost = flight['price']['grandTotal'];
        var currencyUnit = flight['price']['currency'];
        var totalCost = '$currencyUnit $cost';
        debugPrint('+++++++++++++++Total cost : $totalCost ');
        var itinerariesList = flight['itineraries'];
        List itinerariesListArray = itinerariesList as List;
        for (var itinery in itinerariesListArray) {
          var sigmentList = itinery['segments'];
          List sigmentListArray = sigmentList as List;
          for (var segment in sigmentListArray) {
            var departureTime = segment['departure']['at'];
            var carrCode = segment['carrierCode'];
            var number = segment['number'];
            var flightNo = '$carrCode-$number';
            var departureAirpotrtCode = segment['departure']['iataCode'];
            var arrivalAirpotrtCode = segment['arrival']['iataCode'];

            var formateddDepartureTime =
                DateFormat('HH:MM').format(DateTime.parse(departureTime));
            debugPrint('Formatted departure time: $formateddDepartureTime');
            var formattedDeparturDate =
                DateFormat('EEEE, d MMM').format(DateTime.parse(departureTime));
            debugPrint('Formatted departure Date: $formattedDeparturDate');

            var arrivalTime = segment['arrival']['at'];
            var formatedArrivalTime =
                DateFormat('HH:MM').format(DateTime.parse(arrivalTime));

            debugPrint('Formatted arrival time: $formatedArrivalTime');
            var path = '$departureAirpotrtCode - $arrivalAirpotrtCode';
            var time = '$formateddDepartureTime - $formatedArrivalTime';
            var carrierCode = segment['carrierCode'];
            var carrierName =
                jsonObject['dictionaries']['carriers']['$carrierCode'];
            debugPrint('Carrier Name :::::: $carrierName');
            var flightNumber = segment['number'];
            var aircraftCode = segment['aircraft']['code'];
            var noOfStops = segment['numberOfStops'];
            debugPrint(
                'segment details- Carrier Code:$carrierCode  ,Flight Number: $flightNumber ,Aircraft Code : $aircraftCode ,Number Of stops : $noOfStops');
            debugPrint(
                'segment details- Carrier Code:$carrierCode  ,Flight Number: $flightNumber ,Aircraft Code : $aircraftCode ,Number Of stops : $noOfStops');
            debugPrint(
                'segment details- Departure Time:$departureTime  ,Arrival Time: $arrivalTime');
            flightSerachResult.add(FlightDetailModel(
                path, time, formattedDeparturDate, carrierName, totalCost, flightNo));
          }
        }
      }
    } else {
      debugPrint('Issue in getting data from Server');
    }
    return flightSerachResult;
  }

  // Only for testing if service is not working
  Future<List<FlightDetailModel>> getFlightSerachResultsFromLocalJSON(
      String originLocationCode,
      String destinationLocationCode,
      String departureDate,
      int adultsCount,
      {maxResults,
      nonStop,
      currencyCode}) async {
    debugPrint(
        'getFlightSerachResults, originLocationCode: $originLocationCode, destinationLocationCode: $destinationLocationCode , departureDate: $departureDate,  adultsCount:$adultsCount');
    var flightSerachResult = <FlightDetailModel>[];
    final String data = await rootBundle.loadString('assets/flight1.json');
    var jsonObject = jsonDecode(
        data); // Parses the JSON string and returns the resulting JSON object
    var flightList = jsonObject['data'];
    List flightListArray = flightList as List;
    for (var flight in flightListArray) {
      var id = flight['id'];
      debugPrint('+++++++++++++++For Flight Id : $id');
      var cost = flight['price']['grandTotal'];
      var currencyUnit = flight['price']['currency'];
      var totalCost = '$currencyUnit $cost';
      debugPrint('+++++++++++++++Total cost : $totalCost ');

      var itinerariesList = flight['itineraries'];
      List itinerariesListArray = itinerariesList as List;
      for (var itinery in itinerariesListArray) {
        var sigmentList = itinery['segments'];
        List sigmentListArray = sigmentList as List;
        for (var segment in sigmentListArray) {
          var departureTime = segment['departure']['at'];
          var carrCode = segment['carrierCode'];
          var number = segment['number'];
          var flightNo = '$carrCode-$number';
          var departureAirpotrtCode = segment['departure']['iataCode'];
          var arrivalAirpotrtCode = segment['arrival']['iataCode'];

          var formateddDepartureTime =
              DateFormat('HH:MM').format(DateTime.parse(departureTime));
          debugPrint('Formatted departure time: $formateddDepartureTime');
          var formattedDeparturDate =
              DateFormat('EEEE, d MMM').format(DateTime.parse(departureTime));
          debugPrint('Formatted departure Date: $formattedDeparturDate');

          var arrivalTime = segment['arrival']['at'];
          var formatedArrivalTime =
              DateFormat('HH:MM').format(DateTime.parse(arrivalTime));

          debugPrint('Formatted arrival time: $formatedArrivalTime');
          var path = '$departureAirpotrtCode - $arrivalAirpotrtCode';
          var time = '$formateddDepartureTime - $formatedArrivalTime';
          var carrierCode = segment['carrierCode'];
          var carrierName =
              jsonObject['dictionaries']['carriers']['$carrierCode'];
          debugPrint('Carrier Name :::::: $carrierName');
          var flightNumber = segment['number'];
          var aircraftCode = segment['aircraft']['code'];
          var noOfStops = segment['numberOfStops'];
          debugPrint(
              'segment details- Carrier Code:$carrierCode  ,Flight Number: $flightNumber ,Aircraft Code : $aircraftCode ,Number Of stops : $noOfStops');
          debugPrint(
              'segment details- Carrier Code:$carrierCode  ,Flight Number: $flightNumber ,Aircraft Code : $aircraftCode ,Number Of stops : $noOfStops');
          debugPrint(
              'segment details- Departure Time:$departureTime  ,Arrival Time: $arrivalTime');
          flightSerachResult.add(FlightDetailModel(
              path, time, formattedDeparturDate, carrierName, totalCost,flightNo));
        } //
      }
    }
    return flightSerachResult;
  }
}
