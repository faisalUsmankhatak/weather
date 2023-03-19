import 'dart:convert';
import 'dart:math';

import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:weather/Activity/lodaing.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

   String? name;
TextEditingController controller=TextEditingController();
   @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    Object? map =ModalRoute.of(context)?.settings.arguments;
    Map convert=map as Map;
    String temp=convert['temp_value'].toString().substring(0,5);
String icon=convert['icon_value'];

    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:NewGradientAppBar(
        elevation: 0,
        gradient: const LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,],
        begin: Alignment.bottomRight,end: Alignment.topLeft),
      ),
      body:Container(padding: EdgeInsets.all(20),

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin:Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: [
              Colors.lightBlue,
              Colors.lightBlueAccent
            ],
          ),
        ),

        child: Column(
          children:  [
            Container(

              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius:BorderRadius.circular(20)
              ),
              child: Row(
                children:  [
                   Container(

                       margin: EdgeInsets.only(left: 10),

                       child: GestureDetector(
                           onTap: (){
                         String value=controller.text.trim();
                         if(value!=""){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>Lodaing(city: value)));
                         }
                           },
                           child: const Icon(Icons.search,color: Colors.white54)),
                   ),const SizedBox(width: 5,),Expanded(child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "By Default select ${convert['city_value']}",
                      border: InputBorder.none

                    ),
                  ))
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black12,
                      borderRadius: BorderRadius.circular(20)
                    ),

                    padding: EdgeInsets.all(15),

                    child: Row(
                      children: [
                        if(icon!="No data")
                        Image.network("http://openweathermap.org/img/wn/$icon@2x.png",scale: 1.5,),
                        SizedBox(width: 10,),
                        Column(
                          children:  [
                            Text("${convert['discription_value']}",style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("${convert['city_value']}",style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  child: Container(padding: EdgeInsets.all(20),
                    height: 170,
                    decoration:    BoxDecoration(
                      color: Colors.black12,
borderRadius: BorderRadius.circular(20),
                    ),
                    child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Icon(WeatherIcons.thermometer),
                        SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children:  [Text("$temp",style: const TextStyle(fontSize: 40),),
                          const Text("C",style: TextStyle(fontSize: 20),)],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                   padding: EdgeInsets.all(15),
                   height: 150,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black12
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [Icon(WeatherIcons.day_windy)],
                        ),
                        SizedBox(height: 15,),
                        Column(
                          children:  [
                            Text("${convert['air_speed_value'].toString().substring(0,5)}",style: TextStyle(fontSize: 30)),
                            Text("kk/hr"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container(
                  margin: EdgeInsets.only(left: 15),
                  padding: EdgeInsets.all(15),
                  height: 150,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black12
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [Icon(WeatherIcons.humidity)],
                      ),
                      SizedBox(height: 15,),
                      Column(
                        children:  [
                          Text("${convert['humidity_value']}",style: TextStyle(fontSize: 30)),
                          Text("Percent"),
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
            SizedBox(height: 10,),
            const Text("Made By Faisal Usman"),
            const Text("Data Provided By OpenWeather")
          ],
        ),
      ),
    );
  }
}
