import 'package:flutter/material.dart';

import 'flight_results_list_screen.dart';

class FlightSearchScreen extends StatelessWidget {
  static const String routeName = '/flight';

  const FlightSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.flight_takeoff, color: Colors.red),
                  labelText: "From",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.flight_land, color: Colors.red),
                  labelText: "To",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person, color: Colors.red),
                  labelText: "Passengers",
                ),
              ),
            ),
            Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.date_range, color: Colors.red),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Departure',
                        hintText: 'Please input date of departure.',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: "Arrival"),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          // TO DO Passing argumants
                          Navigator.pushNamed(
                              context, FlightResultsListScreen.routeName);
                        },
                        child: const Text('Search Flights')))),
          ],
        ),
      ),
    );
  }
}
