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
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
                child: Image.asset(
                  'assets/images/hotel3.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      
                      Text(
                        hotel.hotelName,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Location: ',
                            style: kCardSmallTextStyle,
                          ),
                          Text(
                            hotel.latitude,
                            style: kCardSmallTextStyle,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            hotel.longitude,
                            style: kCardSmallTextStyle,
                          ),
                        ],
                      ),
                       const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Total Fare: ',
                            style: kCardSmallTextStyle,
                          ),
                          Text(
                            hotel.fare,
                            style: kCardSmallTextStyle,
                          ),
                         
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ));
  }
}
