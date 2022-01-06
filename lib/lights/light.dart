import 'dart:math';

import 'package:flutter/cupertino.dart';

class Light {
  late Map<String, dynamic> _state;
  
  Light() {
    _state = {'brightness': 0,"state":"ON"};
  }

  int get brightness {
    return _state['brightness'];
  }

  set brightness(int bri) {
    _state['brightness'] = min(bri, 100);
  }
  get state {
    return _state['state']
  }
  set state

  void turnOn() {}
  void turnOff() {}
}
