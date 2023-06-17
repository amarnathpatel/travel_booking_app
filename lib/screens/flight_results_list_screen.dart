import 'package:flutter/material.dart';
import 'package:travel_booking_app/widgets/flight_card.dart';

import '../models/flight_details_model.dart';

class FlightResultsListScreen extends StatefulWidget {
  static const String routeName = '/flightlist';
  const FlightResultsListScreen({super.key});

  @override
  State<FlightResultsListScreen> createState() =>
      _FlightResultsListScreenState();
}

class _FlightResultsListScreenState extends State<FlightResultsListScreen> {
  @override
  Widget build(BuildContext context) {
    List<FlightDetailModel> flightList =
        ModalRoute.of(context)!.settings.arguments as List<FlightDetailModel>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flight Search Result'),
        centerTitle: true,
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: Scrollbar(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: flightList.length,
          itemBuilder: (BuildContext context, int index) =>
              FlightCard(flightList[index]),
        ),
      ),
    );
    //);
  }
}
