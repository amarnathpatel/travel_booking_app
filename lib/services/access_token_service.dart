import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:travel_booking_app/utils/api_constants.dart';

class AccessTokenService {
  Future<http.Response> getAccessToken() async {
    var url =
        Uri.parse(kAccessTokenUrl);
    Map requestBody = {
      'client_id': kClientID,
      'client_secret': kClientSecret,
      'grant_type': kGrantType
    };

    var response = await http.post(url,
        headers: {
          "Content-Type": kContentType
        },
        body: requestBody);

    //debugPrint("${response.statusCode}");
    //debugPrint(response.body);
    return response;
  }
}
