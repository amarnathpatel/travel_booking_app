import 'package:flutter/material.dart';
import 'package:travel_booking_app/utils/colors.dart';
import 'package:travel_booking_app/utils/strings.dart';

class MyTripsWidget extends StatelessWidget {
  const MyTripsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.purple.shade200,
      child: const Center(
        child: Text(
          kMyTripeScreenTitleTxt,
          style: kScreenTitleTextStyle,
        ),
      ),
    );
  }
}
