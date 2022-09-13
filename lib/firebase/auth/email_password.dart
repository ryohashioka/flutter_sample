import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailPasswordAuth extends StatefulWidget {
  const EmailPasswordAuth({Key? key}) : super(key: key);

  @override
  State<EmailPasswordAuth> createState() => _EmailPasswordAuthState();
}

class _EmailPasswordAuthState extends State<EmailPasswordAuth> {

  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  void create(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Email/Password 認証ユーザの作成"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // メールアドレス
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Email", // ラベル
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  // 必須かつメールアドレスのフォーマット
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r'^[a-zA-Z0-9_+-]+(.[a-zA-Z0-9_+-]+)*@([a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9]*\.)+[a-zA-Z]{2,}$').hasMatch(value)) {
                    return 'メールアドレスを入力してください。';
                  }
                  return null; // 問題ない場合はnullを返す
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              // パスワード
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "パスワード",
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'パスワードを入力してください。';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              ElevatedButton(
                child: const Text("登録"),
                onPressed: () {
                  if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                    // 入力データが正常な場合の処理
                    _formKey.currentState!.save();
                    create(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}