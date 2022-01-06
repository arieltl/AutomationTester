// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_browser_client.dart';
import 'mqtt_delegate.dart';

class MQTTConnection {
  final ip = '192.168.15.211';
  final port = 1884;
  late final client = MqttBrowserClient("ws://" + ip, "autoTeste");
  final connMess = MqttConnectMessage();
  var connected = false;
  var conError = false;

  Map<String, Set<MQTTDelegate>> subscriptions = {};
  MQTTConnection() {
    client.setProtocolV311();
    client.keepAlivePeriod = 20;
    client.port = port;
    client.autoReconnect = true;
    client.websocketProtocols = MqttClientConstants.protocolsSingleDefault;
    client.connectionMessage = connMess;
    print("trying to connect");
  }
  connect() async {
    try {
      await client.connect("mq", "teste");
      print("connected");
      connected = true;
    } on Exception catch (e) {
      print('EXAMPLE::client exception - $e');
      client.disconnect();
    }
    const topic = 'test/lol'; // Not a wildcard topic
    client.subscribe(topic, MqttQos.atLeastOnce);
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      c!.forEach((ms) {
        final recMess = ms.payload as MqttPublishMessage;

        final pt =
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
        if (subscriptions.containsKey(ms.topic)) {
          subscriptions[ms.topic]!.forEach((delegate) {
            delegate.processEvent(ms.topic, pt);
            print('run');
          });
        }
        print(
            'EXAMPLE::Change notification:: topic is <${ms.topic}>, payload is <-- $pt -->');
        print('');
      });
    });
  }

  Future<bool> addSubscription(String topic, MQTTDelegate delegate) async {
    await Future.doWhile(() => !(connected || conError));
    if (!subscriptions.containsKey(topic)) {
      client.subscribe(topic, MqttQos.exactlyOnce);
      subscriptions[topic] = {delegate};
    } else if (!subscriptions[topic]!.contains(delegate)) {
      subscriptions[topic]!.add(delegate);
    }
    return !conError;
  }
}
