import 'package:flutter/material.dart';
import 'package:travel_booking_app/models/flight.dart';

class FlightResultsListScreen extends StatefulWidget {
  static const String routeName = '/flightlist';
  const FlightResultsListScreen({super.key});

  @override
  State<FlightResultsListScreen> createState() =>
      _FlightResultsListScreenState();
}

class _FlightResultsListScreenState extends State<FlightResultsListScreen> {
  final List<Flight> flightList = [
    Flight(DateTime(2023, 06, 17, 06, 30), DateTime(2023, 06, 17, 08, 30), 'AI',
        'AIr India'),
    Flight(DateTime(2023, 06, 17, 08, 30), DateTime(2023, 06, 17, 09, 30), 'AI',
        'AIr India'),
    Flight(DateTime(2023, 06, 17, 02, 30), DateTime(2023, 06, 17, 03, 30), 'AI',
        'Indigo'),
    Flight(DateTime(2023, 06, 17, 06, 30), DateTime(2023, 06, 17, 08, 30), 'AI',
        'AIr India'),
    Flight(DateTime(2023, 06, 17, 06, 30), DateTime(2023, 06, 17, 08, 30), 'AI',
        'AIr India'),
    Flight(DateTime(2023, 06, 17, 06, 30), DateTime(2023, 06, 17, 08, 30), 'AI',
        'AIr India'),
    Flight(DateTime(2023, 06, 17, 08, 30), DateTime(2023, 06, 17, 09, 30), 'AI',
        'AIr India'),
    Flight(DateTime(2023, 06, 17, 02, 30), DateTime(2023, 06, 17, 03, 30), 'AI',
        'Indigo'),
    Flight(DateTime(2023, 06, 17, 06, 30), DateTime(2023, 06, 17, 08, 30), 'AI',
        'AIr India'),
    Flight(DateTime(2023, 06, 17, 06, 30), DateTime(2023, 06, 17, 08, 30), 'AI',
        'AIr India'),
    Flight(DateTime(2023, 06, 17, 06, 30), DateTime(2023, 06, 17, 08, 30), 'AI',
        'AIr India'),
    Flight(DateTime(2023, 06, 17, 08, 30), DateTime(2023, 06, 17, 09, 30), 'AI',
        'AIr India'),
    Flight(DateTime(2023, 06, 17, 02, 30), DateTime(2023, 06, 17, 03, 30), 'AI',
        'Indigo'),
    Flight(DateTime(2023, 06, 17, 06, 30), DateTime(2023, 06, 17, 08, 30), 'AI',
        'AIr India'),
    Flight(DateTime(2023, 06, 17, 06, 30), DateTime(2023, 06, 17, 08, 30), 'AI',
        'AIr India'),
  ];

  @override
  Widget build(BuildContext context) {
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
        //padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        //height: 220,
        //width: double.maxFinite,
        //child: Scrollbar(
          child: ListView.builder(
            itemCount: flightList.length,
            itemBuilder: (BuildContext context, int index) =>
                buildFlightCard(context, index),
          ),
        ),
      );
    //);
  }

  Widget buildFlightCard(BuildContext context, int index) {
    debugPrint('index of item :$index');
    final Flight flight = flightList[index];
    return Container(
      height: 130,
      child: Card(
        elevation: 5.0,
        child: Column(
          children: <Widget>[
            Text(flight.departureDateTime.toString()),
            Text(flight.departureDateTime.toString()),
          ],
        ),
      ),
    );
  }
}
