import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FlightResultsListScreen extends StatelessWidget {
  static const String routeName = '/flightlist';

  const FlightResultsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Flight Search Result'),
        centerTitle: true,
        leading:  InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
      ),
      
    );
  }
}