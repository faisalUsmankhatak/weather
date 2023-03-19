
import 'package:flutter/material.dart';

import 'Activity/home.dart';
import 'Activity/lodaing.dart';

void main() {
  runApp( MaterialApp(

    routes: {
      "/":(context)=>Lodaing(city: "",),
      "/home":(context)=>Home(),

    },
  ));

}


