import 'package:flutter/material.dart';

class ContainerSample extends StatelessWidget {
  const ContainerSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.green,
          width: 300.0,
          height: 300.0,
          child: Text('word'),
          padding: const EdgeInsets.all(50.0),
          margin: const EdgeInsets.all(100.0),
          alignment: Alignment.topCenter,
          transform: Matrix4.rotationZ(0.1),
        ),
      ),
    );
  }
}