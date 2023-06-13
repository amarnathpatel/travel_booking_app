import '../navigation/travel_app_bottom_nav.dart';
import '../screens/flight_results_list_screen.dart';
import '../screens/flight_search_screen.dart';
import '../screens/hotel_search_screen.dart';
import '../screens/my_profile_screen.dart';
import '../screens/my_trips_screen.dart';

class Routes {
  static const String routeHomeScreen = TravelAppBottomNavLayout.routeName;
  static const String routehHotelSearch = HotelSearchScreen.routeName;
  static const String routeFlightScreen = FlightSearchScreen.routeName;
  static const String routesFlightList = FlightResultsListScreen.routeName;
  static const String routeProfile = MyProfileScreen.routeName;
  static const String routeTrips = MyTripsScreen.routeName;
}
