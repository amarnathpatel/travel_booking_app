import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_booking_app/models/flight_details_model.dart';
import 'package:travel_booking_app/services/flights_search_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'flight_results_list_screen.dart';

class FlightSearchScreen extends StatefulWidget {
  static const String routeName = '/flight';
  const FlightSearchScreen({super.key});

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {
  //Input controllers handle
  TextEditingController sourceAirportInputController = TextEditingController();
  TextEditingController destinationAirportInputController = TextEditingController();
  TextEditingController passengersInputController = TextEditingController();
  TextEditingController departureDateInputController = TextEditingController();

  bool _isBusy = false;
  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TextFormField(
                controller: sourceAirportInputController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  debugPrint('Departure airport  input Validator : $value');
                  if (value!.isEmpty) {
                    return 'Departure airport can\'t be blank';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.flight_takeoff, color: Colors.blueGrey),
                  labelText: "Departure City",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TextFormField(
                controller: destinationAirportInputController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  debugPrint('Destination airport input Validator : $value');
                  if (value!.isEmpty) {
                    return 'Destination airport can\'t be blank';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.flight_land, color: Colors.blueGrey),
                  labelText: "Destination City",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TextFormField(
                controller: passengersInputController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  debugPrint('Passengers input Validator : $value');
                  if (value!.isEmpty) {
                    return 'Passengers field can\'t be blank';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.person, color: Colors.blueGrey),
                  labelText: "Number of Passengers",
                ),
              ),
            ),
            Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.date_range, color: Colors.blueGrey),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: TextFormField(
                      showCursor: true,
                      readOnly: true,
                      controller: departureDateInputController,
                      decoration: const InputDecoration(
                      
                        labelText: 'Departure Date',
                        hintText: 'Please select date of departure.',
                      ),
                      onTap: (){
                         _pickDate(context, departureDateInputController);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Departure date field can\'t be blank';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _isBusy = true;
                    });
                    _onSearchFlightBtnTap();
                  },
                  child: const Text('Search Flights'),
                ),
                const SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    _onReset();
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Visibility(
              visible: _isBusy,
              child: SpinKitFadingCircle(
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.grey : Colors.blueGrey,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }

  void _onSearchFlightBtnTap() async {
    if (_formKey.currentState!.validate()) {
      String sourceAirportCode = sourceAirportInputController.text;
      String destinationAirportCode = destinationAirportInputController.text;
      int noOfPassengers = int.parse(passengersInputController.text);
      String departureDate = departureDateInputController.text;
      debugPrint('Input data: source : $sourceAirportCode');
      debugPrint('Input data: destination : $destinationAirportCode');
      debugPrint('Input data: No of passengers : $noOfPassengers');
      debugPrint('Input data: Departure Date : $departureDate');
      List<FlightDetailModel> flightlist = [];
      try {
        flightlist = await FlightsSearchService().getFlightSerachResults(
            sourceAirportCode,
            destinationAirportCode,
            departureDate,
            noOfPassengers);
      } catch (e) {
        debugPrint(
            'Exception occured in getti ng flight results -  message : $e');
        setState(() {
          _isBusy = false;
        });
        showServerError(e);
        return;
      }
      setState(() {
        _isBusy = false;
      });
      if(int.parse('${flightlist.length}') >= 1){
      Navigator.pushNamed(context, FlightResultsListScreen.routeName,
          arguments: flightlist);
      } else{
        showServerError(Exception('No data found, please search with some other inputs.'));
      }
    }
  }

  _onReset() {
    sourceAirportInputController.clear();
    destinationAirportInputController.clear();
    passengersInputController.clear();
    departureDateInputController.clear();
  }

  // Show message if there is some issue in fetching data from server
  void showServerError(Object errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
            errorMessage.toString().substring(10),
          ),
          backgroundColor: Colors.brown),
    );
  }

  Future<void> _pickDate(
      BuildContext context, TextEditingController controller) async {
    var requiredDateFormat = DateFormat('yyyy-MM-dd');

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        controller.value =
            TextEditingValue(text: requiredDateFormat.format(picked));
      });
    }
  }
}
