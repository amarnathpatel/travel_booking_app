// import dependencies
import 'dart:convert';
import 'package:http/http.dart';
import 'package:travel_booking_app/utils/api_constants.dart';

class AccessToken {
  String? token;
  Future<String?> generateAccessToken() async {
    // fetch client id and client secret key from .env file
    String clientId = kClientID;
    String clientSecret = kClientSecret;
    //  authorization endpoint
    Uri authorizationUri =
        Uri.parse("https://test.api.amadeus.com/v1/security/oauth2/token");
    Response response;
    print(clientSecret);
    print(clientId);
    // send authorization request
    try {
      response = await post(authorizationUri,
          headers: {"Content-type": "application/x-www-form-urlencoded"},
          body:
              "grant_type=$kGrantType&client_id=$clientId&client_secret=$clientSecret");
    } catch (e) {
      print("error generating token --> $e");
      return "Unable to generate access token due to error $e";
    }
    Map data = jsonDecode(response.body);
    print(data);
    // get token from response
    token = data['access_token'];
    return token;
  }
}
