import 'package:flutter/material.dart';
import 'package:travel_booking_app/models/hotel_details_model.dart';

import '../utils/colors.dart';

class HotelCardWidget extends StatelessWidget {
  final HotelDetailsModel hotel;

  const HotelCardWidget({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          color: kCardBgColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Image.asset(
                'assets/images/hotel3.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              flex: 2,
              child: Text(hotel.hotelName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  )),
            )
          ],
        ));
  }
}
