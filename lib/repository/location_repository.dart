import 'package:geolocator/geolocator.dart';

class LocationRepository {
  final _geolocator = Geolocator();

  Future<Position> getCurrentLocation() async {
    Position position = await _geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    return position;
  }
}