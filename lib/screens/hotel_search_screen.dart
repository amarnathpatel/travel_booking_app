import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:travel_booking_app/models/hotel_details_model.dart';
import 'package:travel_booking_app/services/hotels_search_service.dart';

import 'hotel_results_list_screen.dart';

class HotelSearchScreen extends StatefulWidget {
  static const String routeName = '/hotel';

  const HotelSearchScreen({super.key});

  @override
  State<HotelSearchScreen> createState() => _HotelSearchScreenState();
}

class _HotelSearchScreenState extends State<HotelSearchScreen> {
  // Input handlers
  TextEditingController cityInputController = TextEditingController();
  TextEditingController checkinDateInputController = TextEditingController();
  TextEditingController checkoutDateInputController = TextEditingController();
  TextEditingController noofadultsInputInputController = TextEditingController();
  TextEditingController noofRoomsInputInputController = TextEditingController();

  bool _isBusy = false;
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

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
        controller.value = TextEditingValue(text: requiredDateFormat.format(picked));
      });
    }
  }

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
                  controller: cityInputController,
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'City can\'t be blank';
                    } else {
                      return null;
                    }
                  },
                  onTap: () {},
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_city, color: Colors.blueGrey),
                    labelText: "City to stay",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
                child: Row(
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
                          controller: checkinDateInputController,
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                            labelText: 'Check-in date',
                          ),
                          onTap: () {
                            _pickDate(context, checkinDateInputController);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Check-in date field can\'t be blank';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Icon(Icons.date_range, color: Colors.blueGrey),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 1.0),
                        child: TextFormField(
                          showCursor: true,
                          readOnly: true,
                          controller: checkoutDateInputController,
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                            labelText: 'Check-out date',
                          ),
                          onTap: () {
                            _pickDate(context, checkoutDateInputController);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Check-out date field can\'t be blank';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
                child: Row(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Icon(Icons.person, color: Colors.blueGrey),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextFormField(
                          controller: noofadultsInputInputController,
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                            labelText: 'No of adults',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Adults field can\'t be blank';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Icon(Icons.room, color: Colors.blueGrey),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 1.0),
                        child: TextFormField(
                          controller: noofRoomsInputInputController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'No of rooms',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                      _onSearchHotelsBtnTap();
                    },
                    child: const Text('Search Hotels'),
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

  _onReset() {
    cityInputController.clear();
    checkinDateInputController.clear();
    checkoutDateInputController.clear();
    noofadultsInputInputController.clear();
  }

  void _onSearchHotelsBtnTap() async {
    if (_formKey.currentState!.validate()) {
      String cityCode = cityInputController.text;
      String checkinDate = checkinDateInputController.text;
      String checkoutDate = checkoutDateInputController.text;
      int adults = int.parse(noofadultsInputInputController.text);
      int rooms = int.parse(noofadultsInputInputController.text);
      debugPrint(
          'City Code: $cityCode , checkinDate:$checkinDate, checkoutDate:$checkoutDate, adults: $adults, Rooms: $rooms');
      List<String> hotelIds = [];
      try {
        hotelIds = await HotelSearchService().getHotelIds(cityCode);
      } catch (e) {
        debugPrint('Exception occured(get HotelIDs for City) -  message : $e');
        setState(() {
          _isBusy = false;
        });
        showServerError(e);
        return;
      }
      debugPrint('Hotel Ids count - ${hotelIds.length}');
      debugPrint('Hotel Ids  - $hotelIds');
      List<HotelDetailsModel> hotels = [];
      try {
        hotels = await HotelSearchService()
            .searchHotels(hotelIds, checkinDate, checkoutDate, adults, rooms);
      } catch (e) {
        debugPrint(
            'Exception occured from server(Search Hotels)-  message : $e');
        setState(() {
          _isBusy = false;
        });
        showServerError(e);
        return;
      }
      debugPrint('Hotel search results - ${hotels.length}');
      setState(() {
        _isBusy = false;
      });
      if (int.parse('${hotels.length}') >= 1) {
        Navigator.pushNamed(context, HotelResultsListScreen.routeName,
            arguments: hotels);
      } else {
        showServerError(
            Exception('No data found, please search with some other inputs.'));
      }
    }
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
}
