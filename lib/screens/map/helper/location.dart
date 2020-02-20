import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<Position> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      return position;
    } catch (e) {
      print(e);
      return e;
    }
  }
}