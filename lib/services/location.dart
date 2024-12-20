import 'package:geolocator/geolocator.dart';

class Location {
   double ? latitude;
   double ? longitude;

 Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude=location.latitude;
      longitude=location.longitude;

    } catch (e) {
      print(e);
    }
  }



}
