
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Worker{
  late String location;
Worker({required this.location}){

}

  late String temp;
  late String humidity;
  late String air_speed;
  late String discription;
  late String main;
  late String icon;


 Future<void> getdata()async{
   try {

     Response response = await get(Uri.parse(
         'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=dcb976e6cee9ee03f4cd8c7bb7ba366f'));

     Map<String,dynamic> data = jsonDecode(response.body);
if(data.isNotEmpty) {
  Map<String, dynamic> temp_data = data['main'];
  String gettemp = temp_data['temp'].toString();
  String gethumidity = temp_data['humidity'].toString();
  List weather_data = data['weather'];

  Map<String, dynamic> weather_main_data = weather_data[0];

  String getmain_des = weather_main_data['main'];

  String getdes = weather_main_data['description'];

  Map<String, dynamic> wind = data['wind'];

  String getair_speed = (wind['speed'] / 0.27777777777778).toString();

  temp = gettemp;
  humidity = gethumidity;

  air_speed = getair_speed;
  discription = getdes;
  main = getmain_des;
  icon = weather_main_data['icon'];

  location = data['name'];
}else{
  temp = "No data";
  humidity = "No data";
  air_speed = "No data";
  discription = "No data";
  main = "No data";
  icon="No data";
}
//print(data['timezone']);
   }catch(e){
     print(e.toString());
     temp = "No data";
     humidity = "No data";
     air_speed = "No data";
     discription = "No data";
     main = "No data";
     icon="No data";
    // print(e.toString());
   }
  }


}