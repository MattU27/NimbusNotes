import 'package:geolocator/geolocator.dart';

Future<Position> getLocation() async {
  LocationPermission permission;

  // Check if location services are enabled
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  // Check the current permission status
  permission = await Geolocator.checkPermission();
  
  // If permission is denied, request it
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  // Handle the case where permission is denied forever
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.',
    );
  }

  // If permissions are granted, get the current position
  return await Geolocator.getCurrentPosition();
}