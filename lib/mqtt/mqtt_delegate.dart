

import 'mqtt_connection.dart';
abstract class MQTTDelegate {
  abstract MQTTConnection con;
  
  void subscribe(String topic)  async{
    con.addSubscription(topic, this).then((value) => print("test"));
  }

  void processEvent(String topic, String message);
}
