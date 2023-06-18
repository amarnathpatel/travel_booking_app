// import dependencies
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:travel_booking_app/utils/api_constants.dart';

class AccessToken {
  String? token;
  Future<String?> generateAccessToken() async {
    debugPrint('generateAccessToken() routine called.');
    // fetch client id and client secret key from .env file
    String clientId = kClientID;
    String clientSecret = kClientSecret;
    //  authorization endpoint
    Uri authorizationUri =
        Uri.parse("https://test.api.amadeus.com/v1/security/oauth2/token");
    Response response;
    // send authorization request
    try {
      response = await post(authorizationUri,
          headers: {"Content-type": "application/x-www-form-urlencoded"},
          body:"grant_type=$kGrantType&client_id=$clientId&client_secret=$clientSecret");
    } catch (e) {
      debugPrint("error generating token --> $e");
      return "Unable to generate access token due to error $e";
    }
    Map data = jsonDecode(response.body);
    // get token from response
    token = data['access_token'];
    debugPrint('Access Token - $token');
    return token;
  }
}
