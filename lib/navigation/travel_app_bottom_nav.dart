import 'package:flutter/material.dart';
import 'package:travel_booking_app/utils/strings.dart';
import '../screens/flight_search_screen.dart';
import '../screens/hotel_search_screen.dart';
import '../screens/my_profile_screen.dart';
import '../screens/my_trips_screen.dart';
import '../utils/colors.dart';

class TravelAppBottomNavLayout extends StatefulWidget {
  static const String routeName = 'home';
  const TravelAppBottomNavLayout({super.key});

  @override
  State<TravelAppBottomNavLayout> createState() =>
      _TravelAppBottomNavLayoutState();
}

class _TravelAppBottomNavLayoutState extends State<TravelAppBottomNavLayout> {
  final _tabWidgets = <Widget>[
    const HotelSearchScreen(),
    const FlightSearchScreen(),
    const MyTripsScreen(),
    const MyProfileScreen()
  ];

  int _currentIndex = kHotelTabIndex;
  // State to handle title update on screen changes
  late String _screenTitle = kAppBarLableTxt;

  @override
  Widget build(BuildContext context) {
    debugPrint('+++TravelAppBottomNavLayout() , build is called.');

    return Scaffold(
      appBar: AppBar(
        title: Text(_screenTitle),
        centerTitle: true,
      ),
      body: _tabWidgets[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.hotel), label: kHotelTabLabelTxt),
          BottomNavigationBarItem(
              icon: Icon(Icons.flight), label: kFlightTabLabelTxt),
          BottomNavigationBarItem(
              icon: Icon(Icons.trip_origin), label: kMyTripsTabLabelTxt),
          BottomNavigationBarItem(
              icon: Icon(Icons.verified_user_sharp),
              label: kMyProfileTabLabelTxt),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: kBackgroundColor,
        selectedItemColor: kSelectedBottomNavItemColor,
        unselectedItemColor: kUnselectedBottomNavItemColor,
        currentIndex: _currentIndex,
        enableFeedback: true,
        selectedFontSize: kSelectedFontSize,
        unselectedFontSize: kUnselectedFontSize,
        onTap: (selectedIndex) {
          setState(() {
            debugPrint('+++TravelAppBottomNavLayout() , setState(): selected index: $selectedIndex');
            _currentIndex = selectedIndex;
            switch (_currentIndex) {
              case kHotelTabIndex:
                _screenTitle = kHotelSearchScreenTitleTxt;
                break;
              case kFlightTabIndex:
                _screenTitle = kFlightSearchScreenTitleTxt;
                break;
              case kMyTripsTabIndex:
                _screenTitle = kMyTripeScreenTitleTxt;
                break;
              case kMyProfileTabIndex:
                _screenTitle = kMyProfileScreenTitleTxt;
                break;
              default:
                kAppBarLableTxt;
            }
          });
        }, // OnTap
      ),
    );
  }
}
