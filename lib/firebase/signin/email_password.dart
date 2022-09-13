import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailPasswordSignin extends StatefulWidget {
  const EmailPasswordSignin({Key? key}) : super(key: key);

  @override
  State<EmailPasswordSignin> createState() => _EmailPasswordSigninState();
}

class _EmailPasswordSigninState extends State<EmailPasswordSignin> {

  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  void signIn(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email,
          password: _password
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
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
                    signIn(context);
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