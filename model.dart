import 'package:flutter/material.dart';

class Model{
  Widget? getWeatherIcon(int condition){
    if(condition < 300){
      return Image.asset('assets/thunder.png',
      color: Colors.white,
        height: 70,
      );
    }else if(condition < 600){
      return Image.asset('assets/rain.png',
          color: Colors.white,
        height: 70,

      );
    }else if(condition < 700){
      return Image.asset('assets/snow.png',
          color: Colors.white,
        height: 70,
      );
    }else if(condition < 800){
      return Image.asset('assets/dust.png',
          color: Colors.white,
        height: 70,
      );
    }else if(condition == 800){
      return Icon(Icons.sunny,
          color: Colors.white,
        size: 70,
      );
    }else if(condition <= 804){
      return Image.asset('assets/cloud.png',
          color: Colors.white,
        height: 70,
      );
    }
    return null;
  }
}