class HotelDetailsModel {
  String hotelName;
  String latitude;
  String longitude;
  String? hotelPhotoUrl;
  String fare;
  String offer;

  HotelDetailsModel({
    required this.hotelName,
    required this.latitude,
    required this.longitude,
    this.hotelPhotoUrl,
    required this.offer,
    required this.fare,
  });
   
      String get hotel=> hotelName;
}
