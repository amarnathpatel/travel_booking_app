import 'package:flutter/material.dart';

import '../utils/size_config.dart';
import '../widgets/custom_text.dart';
import '../widgets/trip_item.dart';

class MyTripsScreen extends StatefulWidget {
  const MyTripsScreen({Key? key}) : super(key: key);
  static const String routeName = '/trips';

  @override
  State<MyTripsScreen> createState() => _MyTripsScreeenState();
}

class _MyTripsScreeenState extends State<MyTripsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomTextWidget(title: 'Upcoming trips'),
            TripItemWidget(
              imagePath: 'assets/images/switzerland.jpg',
              place: 'Ningaloo, Switzerland',
              title: 'Dive with Whale sharks',
              date: 'Aug 30, 2023',
            ),
            CustomTextWidget(title: 'Completed trips'),
            TripItemWidget(
              imagePath: 'assets/images/goa.jpg',
              place: 'Goa, India',
              title: 'Beutiful Beach Trip',
              date: 'Sept 30, 2023',
            ),
          ],
        ),
      ),
    );
  }
}
