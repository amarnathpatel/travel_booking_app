
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_booking_app/widgets/space.dart';

import '../utils/colors.dart';
import '../models/flight_details_model.dart';

class FlightCard extends StatelessWidget {

 FlightDetailModel flightDetails;

 FlightCard(this.flightDetails, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        onTap: (){
          // To DO
        },
        child: Container(

            height: 144,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              color: kCardBgColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        flightDetails.path!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: kCardtextColor.withOpacity(0.3)),
                      ),
                      Spacer(),
                      Text(
                        flightDetails.flightNumber!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: kFlightNumberTxtColor),
                      ),
                    ],
                  ),
                  Space.Y(15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            flightDetails.time!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: kCardtextColor),
                          ),
                          Space.Y(10),
                          Text(
                            flightDetails.date! +' • Direct',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: kCardtextColor),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        flightDetails.price!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: kCardtextColor),
                      ),
                    ],
                  ),
                  Space.Y(15),
                  Row(

                    children: [
                      Image.asset('assets/images/logo.png', height: 24,),
                    Space.X(20),
                      Text(
                        flightDetails.airline!,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: kCardtextColor),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
