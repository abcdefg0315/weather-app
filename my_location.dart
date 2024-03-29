import 'package:geolocator/geolocator.dart';

class MyLocation{
  late double latitude2;
  late double longitude2;

  Future<void> getMyCurrentLocation()async{
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
      print(latitude2);
      print(longitude2);
    }catch(e){
      print('internet connection error');
    }
  }
}

