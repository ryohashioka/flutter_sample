import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {

  final _formKey = GlobalKey<FormState>();
  String _phoneNumber = "";
  final _smsCodeController = TextEditingController();

  Future<String?> inputSmsCodeDialog() {
    return showDialog<String>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('SMS コード'),
          content: TextField(
            controller: _smsCodeController,
            keyboardType: TextInputType.number,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, null),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, _smsCodeController.text),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void create(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: '+81' + _phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Android ONLY
        // TODO: SMSコードが送信されると自動で確認される？（要検証）
        await auth.signInWithCredential(credential);
        Navigator.pop(context);
      },
      verificationFailed: (FirebaseAuthException e) {
        // TODO: 失敗処理
        print("Failed");
      },
      codeSent: (String verificationId, int? resendToken) async {
        // NOTE: SMS にコードを送信した後に呼ばれる

        var res = await inputSmsCodeDialog();
        if(res != null) {
          // Update the UI - wait for the user to enter the SMS code
          String smsCode = res;

          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

          // Sign the user in (or link) with the credential
          await auth.signInWithCredential(credential);
          Navigator.pop(context);
        }

      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // TODO: タイムアウト処理
        print("timeout");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("電話番号認証ユーザの作成＆認証"),
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
                  labelText: "電話番号", // ラベル
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '電話番号を入力してください。';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phoneNumber = value!;
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