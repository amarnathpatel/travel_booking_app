import 'package:flutter/material.dart';
import 'package:travel_booking_app/models/hotel_details_model.dart';
import 'package:travel_booking_app/widgets/hotel_card.dart';


class HotelResultsListScreen extends StatefulWidget {
  static const String routeName = '/hotellist';
  const HotelResultsListScreen({super.key});

  @override
  State<HotelResultsListScreen> createState() => _HotelResultsListScreen();
}

class _HotelResultsListScreen extends State<HotelResultsListScreen> {
  @override
  Widget build(BuildContext context) {
    List<HotelDetailsModel> hotelList =
        ModalRoute.of(context)!.settings.arguments as List<HotelDetailsModel>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel Search Result'),
        centerTitle: true,
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: Scrollbar(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: hotelList.length,
          itemBuilder: (BuildContext context, int index) =>
              HotelCardWidget(
            hotel: hotelList[index],
          ),
        ),
      ),
    );
    //);
  }
}
