// import 'package:flutter/material.dart';
// import 'navigation/travel_app_bottom_nav.dart';

// void main() {
//   runApp(const TravelBookingApp());
// }

// class TravelBookingApp extends StatelessWidget {
//   const TravelBookingApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       title: 'Travel Booking Application',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: const TravelAppBottomNavLayout(),
//     );
//   }
// }

//  Navigation using named routes
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_booking_app/screen_routes/screen_routes.dart';
import 'package:travel_booking_app/screens/flight_results_list_screen.dart';
import 'package:travel_booking_app/screens/flight_search_screen.dart';
import 'package:travel_booking_app/screens/hotel_search_screen.dart';
import 'navigation/travel_app_bottom_nav.dart';
import 'screens/hotel_results_list_screen.dart';
import 'screens/my_trips_screen.dart';
import 'services/generate_access_token_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   try{
   getAndSaveAccessToken();
   }catch(e){
     rethrow;
   }
   runApp(const BootstrapAppWidget());
}

Future<void> getAndSaveAccessToken() async {
   final Future<SharedPreferences> sharedPref = SharedPreferences.getInstance();
   final SharedPreferences prefs = await sharedPref;
   //String? savedAccessToken = prefs.getString('access_token');
   //debugPrint("getAndSaveAccessToken(): - Previous AccessToken : $savedAccessToken");
    try {
      //String? accessToken = savedAccessToken ?? await AccessToken().generateAccessToken();
      String? accessToken = await AccessToken().generateAccessToken();
      //debugPrint("getAndSaveAccessToken() - Access token : $accessToken");
      prefs.setString('access_token',accessToken!).then((value) => debugPrint("getAndSaveAccessToken() - Access token generated abd saved : $value"));
    } on Exception catch (e) {
      debugPrint("getAndSaveAccessToken() - Error $e occurred in getting access token");
    }
}

class BootstrapAppWidget extends StatelessWidget {
  const BootstrapAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Booking Application',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.routeHomeScreen: ((context) => const TravelAppBottomNavLayout()),
        Routes.routeFlightScreen: ((context) => const FlightSearchScreen()),
        Routes.routesFlightList: ((context) => const FlightResultsListScreen()),
        Routes.routehHotelSearchList: ((context) =>
            const HotelResultsListScreen()),
        Routes.routehHotelSearch: ((context) => const HotelSearchScreen()),
        Routes.routeTrips: ((context) => const MyTripsScreen()),
      },
      initialRoute: Routes.routeHomeScreen,
    );
  }
}



// Get access token test


// import 'package:flutter/material.dart';

// import 'services/flights_search_service.dart';
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   var service = FlightsSearchService();
//   await service.getFlightSerachResults('PNQ','LKO', '2023-06-13',3, maxResults: 5, nonStop: 'true',currencyCode: 'INR');
// }


