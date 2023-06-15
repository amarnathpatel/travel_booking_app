class FlightDetailModel {
  final String? _path; // Destination - Arrival
  final String? _time; // Departure time - Arrival Time
  final String? _date; // Date of travel
  final String? _airline; // Name of airline
  final String? _price; // Price
  final String? _flightNumber;

  FlightDetailModel(
      this._path, this._time, this._date, this._airline, this._price, this._flightNumber);

  String? get price => _price;
  String? get airline => _airline;
  String? get date => _date;
  String? get time => _time;
  String? get path => _path;
  String? get flightNumber => _flightNumber;
}
