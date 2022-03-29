import  'package:flutter/material.dart';
import 'dart_file.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var appTitle=Text('flutter button');
    var appBody=AppBody();
    var appBar=AppBar(

      title: appTitle,


    );
    var app=MaterialApp(

      home: Scaffold(

        appBar: appBar,
        body: appBody,


      ),


    );

    return app;
  }
}