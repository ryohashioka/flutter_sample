import 'package:flutter/material.dart';

class RowSample extends StatelessWidget {
  const RowSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 300,
        height: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container( color: Colors.blue, width: 100, height:100 ),
            Container( color: Colors.red, width: 100, height:100 ),
          ],
        ),
      ),
    );
  }
}


class ColumnSample extends StatelessWidget {
  const ColumnSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 300,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container( color: Colors.blue, width: 100, height:100 ),
            Container( color: Colors.red, width: 100, height:100 ),
          ],
        ),
      ),
    );
  }
}


class RowColumnSample extends StatelessWidget {
  const RowColumnSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container( color: Colors.blue, width: 100, height:100 ),
              Container( color: Colors.red, width: 100, height:100 ),
            ],
          ),
          Column(
            children: <Widget>[
              Container( color: Colors.green, width: 100, height:100 ),
              Container( color: Colors.orange, width: 100, height:100 ),
            ],
          ),
        ],
      ),
    );
  }
}