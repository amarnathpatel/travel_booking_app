import 'package:flutter/material.dart';
import 'package:travel_booking_app/utils/colors.dart';
import 'package:travel_booking_app/utils/strings.dart';

class MyProfileScreen extends StatelessWidget {
    static const String routeName = '/profile';

  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.green.shade200,
      child: const Center(
        child: Text(
          kMyProfileScreenTitleTxt,
          style: kScreenTitleTextStyle,
        ),
      ),
    );
  }
}
