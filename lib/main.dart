import 'package:flutter/material.dart';
import 'package:lights/home.dart';
import 'package:lights/lights/mqtt_light.dart';
import 'package:lights/mqtt/mqtt_connection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key) {
    var mqtt = MQTTConnection();
    () async {
      await mqtt.connect();
      var _ = MQTTLight(mqtt);
    }();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.teal,
          canvasColor: Colors.blueGrey.shade50),
      home: const Home(),
    );
  }
}
