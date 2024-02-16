import 'package:app3/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:app3/data/my_location.dart';
import 'package:app3/data/network.dart';
const apikey = '717425e252e87eb9399681806b5e5a07';

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key});

  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {

  late double latitude3;
  late double longitude3;

  @override
  void initState() {
    super.initState();
    getLocation();
  }
  void getLocation() async{
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network('https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric');

    var weatherData = await network.getJsonData();
    print(weatherData);
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return HomePage(parseWeatherData: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/1.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 20),
              const Text(
                '오늘의 플레이리스트',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 100)
            ],
          ),
      ),
    );
  }
}
