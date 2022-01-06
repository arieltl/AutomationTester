import 'package:flutter/material.dart';
import 'light_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Luzes"),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 500,
            
          ),
          itemCount: 10,
          itemBuilder: (ctx, idx) {
            
            return LightCard(
              title: 'luz $idx',
            );
          }),
      
    );
  }
}
