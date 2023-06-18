import 'package:flutter/material.dart';
import 'package:travel_booking_app/utils/size_config.dart';
import '../../../utils/text_styles.dart';
import '../utils/colors.dart';

class TripItemWidget extends StatelessWidget {
  const TripItemWidget(
      {Key? key,
      required this.place,
      required this.title,
      required this.date,
      required this.imagePath})
      : super(key: key);

  final String place;
  final String title;
  final String date;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: getProportionateScreenHeight(210),
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: getProportionateScreenHeight(115),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10)),
                        image: DecorationImage(
                            image: AssetImage(imagePath), fit: BoxFit.cover)),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Text(date, //
                          style: TextStyles.normal
                              .copyWith(color: secondaryColor))),
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, // 'Dive with Whale sharks'
                              style: TextStyles.heading.copyWith(fontSize: 14)),
                          Icon(Icons.navigate_next_outlined,
                              color: Colors.black.withOpacity(0.4))
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 0, left: 10),
                      child: Text(place,
                          style: TextStyles.regular2.copyWith(color: black)))
                ],
              ),
            )));
  }
}
