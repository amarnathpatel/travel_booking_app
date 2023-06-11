import 'package:flutter/material.dart';
import 'package:travel_booking_app/utils/colors.dart';
import 'package:travel_booking_app/utils/strings.dart';

class HotelWidget extends StatelessWidget {
  const HotelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.amber.shade200,
      child: const Center(
        child: Text(
          kHotelSearchScreenTitleTxt,
          style: kScreenTitleTextStyle,
        ),
      ),
    );
  }
}
