import 'package:flutter/material.dart';

class ContainerSample extends StatelessWidget {
  const ContainerSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        // color: Color(0xFF42A5F5),
        // color: Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5),
        // color: Color.fromARGB(255, 66, 165, 245),
        // color: Color.fromRGBO(66, 165, 245, 1.0),
        // View more (https://api.flutter.dev/flutter/material/Colors-class.html)
        width: 300.0,
        height: 300.0,
        alignment: Alignment.center,
        child: const Text('word'),
        padding: const EdgeInsets.all(50.0),
        margin: const EdgeInsets.all(25.0),
        transform: Matrix4.rotationZ(0.1),
      ),
    );
  }
  
}