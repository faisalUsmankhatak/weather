import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/worker/worker.dart';

class Lodaing extends StatefulWidget {
   Lodaing({Key? key,required this.city}) : super(key: key);
late String city;
  @override
  State<Lodaing> createState() => _LodaingState();
}

class _LodaingState extends State<Lodaing> {


//late String city=widget.city;
  void load_data()async{
    List city_list=["karak","kohat","Peshawar","Islamabad","Banu","Mardan","Lahour"];
    var random=Random();
    String  rendom_city =city_list[random.nextInt(city_list.length)];
    var final_city;
   if(widget.city!=""){final_city=widget.city;}else{final_city=rendom_city;}
    Worker instance=Worker(location:final_city);
   await instance.getdata();
    //print(instance.discription);
  Navigator.pushNamed(context, '/home',arguments: {
    "temp_value":instance.temp,"humidity_value":instance.humidity,"air_speed_value":instance.air_speed,
    "discription_value": instance.discription,"main_value":instance.main,"icon_value":instance.icon,"city_value":instance.location,
    "rendom_city":rendom_city
  });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    load_data();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Image.asset("asset/weather.png"),
            const Text("Mausam App",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            const Text("Made By Faisal"),
            const SpinKitFadingCircle(
              color: Colors.black12,
              size: 50.0,

            ),
          ],
        ),
      ),
    );
  }
}
