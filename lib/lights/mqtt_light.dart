import 'dart:convert';

import 'package:lights/lights/light.dart';
import 'package:lights/mqtt/mqtt_connection.dart';

import '../mqtt/mqtt_delegate.dart';
import 'light.dart';

class MQTTLight extends Light with MQTTDelegate {
  @override
  MQTTConnection con;
  
  MQTTLight(this.con){
    subscribe("ha/light1/cmd");
  }

  @override
  void processEvent(String topic, String message) {
    print(jsonDecode(message));
  }
}
