import 'package:flutter/material.dart';

class LightCard extends StatefulWidget {
  const LightCard({
    Key? key, required this.title
  }) : super(key: key);
  final String title;
  @override
  State<LightCard> createState() => _LightCardState();
}

class _LightCardState extends State<LightCard> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      
      
      child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Title(
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              color: Colors.black,
            ),
             const Expanded(
              child: FractionallySizedBox(
                heightFactor: 0.6,
                child: FittedBox(
                  
                  
                  child: Icon(Icons.lightbulb,color: Colors.amber),
                ),
              ),
              flex: 2,
            ),
            Slider(
              value: value,
              onChanged: (v) {
                setState(() {
                  value = v;
                });
              },
            )
          ],
        ),
    );
  }
}
