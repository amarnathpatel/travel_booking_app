import 'package:flutter/material.dart';

import 'navigation/travel_app_bottom_nav.dart';

void main() {
  runApp(const TravelBookingApp());
}

class TravelBookingApp extends StatelessWidget {
  const TravelBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TravelAppBottomNavLayout(),
    );
  }
}
