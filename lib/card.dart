/// View https://flutter.ctrnost.com/basic/layout/card/
/// 公式ドキュメント https://api.flutter.dev/flutter/material/Card-class.html

import 'package:flutter/material.dart';

class CardSample extends StatelessWidget {
  const CardSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Sample'),
      ),
      body: Card(
        margin: const EdgeInsets.all(50.0),
        child: Container(
          margin: const EdgeInsets.all(10.0),
          width: 300,
          height: 100,
          child: const Text(
            'Card',
            style: TextStyle(fontSize: 30),
          )
        ),
      ),
    );
  }
  
}