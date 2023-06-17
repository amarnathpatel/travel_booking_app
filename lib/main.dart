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
import 'package:travel_booking_app/screen_routes/screen_routes.dart';
import 'package:travel_booking_app/screens/flight_results_list_screen.dart';
import 'package:travel_booking_app/screens/flight_search_screen.dart';
import 'package:travel_booking_app/screens/hotel_search_screen.dart';
import 'navigation/travel_app_bottom_nav.dart';
import 'screens/hotel_results_list_screen.dart';

void main() => runApp(const BootstrapAppWidget());

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
        Routes.routehHotelSearchList: ((context) => const HotelResultsListScreen()),
        Routes.routehHotelSearch: ((context) => const HotelSearchScreen()),
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


