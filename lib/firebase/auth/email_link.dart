import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailLinkAuth extends StatefulWidget {
  const EmailLinkAuth({Key? key}) : super(key: key);

  @override
  State<EmailLinkAuth> createState() => _EmailLinkAuthState();
}

class _EmailLinkAuthState extends State<EmailLinkAuth> {

  final _formKey = GlobalKey<FormState>();
  String _email = "";

  void create(BuildContext context) async {
    try {
      // var acs = ActionCodeSettings(
      //   // URL you want to redirect back to. The domain (www.example.com) for this
      //   // URL must be whitelisted in the Firebase Console.
      //     url: 'https://www.example.com/finishSignUp?cartId=1234',
      //     // This must be true
      //     handleCodeInApp: true,
      //     iOSBundleId: 'com.example.ios',
      //     androidPackageName: 'com.example.android',
      //     // installIfNotAvailable
      //     androidInstallApp: true,
      //     // minimumVersion
      //     androidMinimumVersion: '12');
      // await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //   email: _email,
      //   password: _password,
      // );
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