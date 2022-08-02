import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldSample extends StatefulWidget {
  const TextFieldSample({Key? key}) : super(key: key);

  @override
  _TextFieldSampleState createState() => _TextFieldSampleState();
}

class _TextFieldSampleState extends State<TextFieldSample> {

  String _text = '';

  void _handleText(String e) {
    setState(() {
      _text = e;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextFieldSample")
      ),
      body: Container(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: <Widget>[
              Text(
                "$_text",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500
                ),
              ),
              new TextField(
                enabled: true,
                // 入力数
                maxLength: 10,
                style: TextStyle(color: Colors.red),
                obscureText: false,
                maxLines:1 ,
                onChanged: _handleText,
              ),
              new TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.face),
                  hintText: 'お名前を教えてください',
                  labelText: '名前 *',
                ),
              ),
              new TextField(
                decoration: const InputDecoration(
                  labelText: 'パスワード',
                ),
                obscureText: true,
                onChanged: _handleText,
              ),
              new TextField(
                decoration: const InputDecoration(
                  labelText: '数字',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter> [
                  // WhitelistingTextInputFormatter.digitsOnly, // 古い
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ],
          )
      ),
    );
  }
}