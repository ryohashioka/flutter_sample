/// View https://flutter.ctrnost.com/basic/layout/stack/

import 'package:flutter/material.dart';

class StackSample extends StatelessWidget {
  const StackSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Stack Sample'),
        ),
        body: Stack(
          children: <Widget>[
            Container(
                width: 100,
                height: 100,
                color:Colors.green
            ),
            Container(
              width: 50,
              height: 80,
              color: Colors.orange,
            )
          ],
        )
    );
  }
}


class StackPositionedSample extends StatelessWidget {
  const StackPositionedSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Stack Sample'),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              left: 20.0,
              top: 20.0,
              width: 300.0,
              height: 300.0,
              child: Container(color: Colors.blue,),
            ),
            Positioned(
              left: 10.0,
              top: 10.0,
              width: 100.0,
              height: 100.0,
              child: Container(color: Colors.green,),
            ),
            Positioned(
              left: 120.0,
              top: 120.0,
              width: 100.0,
              height: 100.0,
              child: Container(color: Colors.orange,),
            ),
          ],
        )
    );
  }
}


class StackAlignmentSample extends StatelessWidget {
  const StackAlignmentSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Stack Sample'),
        ),
        body: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            SizedBox(
              width: 400.0,
              height: 400.0,
              child: Container(color: Colors.orange,),
            ),
            Positioned(
              left: 20.0,
              top: 20.0,
              width: 300.0,
              height: 300.0,
              child: Container(color: Colors.blue,),
            ),
            Positioned(
              left: 10.0,
              top: 10.0,
              width: 100.0,
              height: 100.0,
              child: Container(color: Colors.green,),
            ),
            Positioned(
              left: 120.0,
              top: 120.0,
              width: 100.0,
              height: 100.0,
              child: Container(color: Colors.orange,),
            ),
            const Text('Test')
          ],
        )
    );
  }
}
