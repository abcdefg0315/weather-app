import 'package:flutter/material.dart';

class TextModel{
  Widget? getWeatherText(int condition){
    if(condition < 300){
      return Text(
        '천둥 칠 것 같은 날에는 이런 노래 어때요?',
        style: TextStyle(fontSize: 23.0, color: Colors.white,fontWeight: FontWeight.w500),
      );
    }else if(condition < 600){
      return Text(
          '비 오는 날에는 이런 노래 어때요?',
          style: TextStyle(fontSize: 23.0, color: Colors.white,fontWeight: FontWeight.w500),
      );
    }else if(condition < 700){
      return Text(
          '눈 오는 날에는 이런 노래 어때요?',
      style: TextStyle(fontSize: 23.0, color: Colors.white,fontWeight: FontWeight.w500),
      );
    }else if(condition < 800){
      return Text(
          '안개낀 날에는 이런 노래 어때요?',
      style: TextStyle(fontSize: 23.0, color: Colors.white,fontWeight: FontWeight.w500),
      );
    }else if(condition == 800){
      return Text(
          '화창한 날에는 이런 노래 어때요?',
      style: TextStyle(fontSize: 23.0, color: Colors.white,fontWeight: FontWeight.w500),
      );
    }else if(condition <= 804){
      return Text(
          '구름낀 날에는 이런 노래 어때요?',
      style: TextStyle(fontSize: 23.0, color: Colors.white,fontWeight: FontWeight.w500),

      );
    }
    return null;
  }
}