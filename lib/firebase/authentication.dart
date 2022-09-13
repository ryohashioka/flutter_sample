import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_sample/firebase/signin/email_password.dart';

import 'auth/email_link.dart';
import 'auth/email_password.dart';
import 'auth/phone.dart';

class FbAuth extends StatefulWidget {
  const FbAuth({Key? key}) : super(key: key);

  @override
  State<FbAuth> createState() => _FbAuthState();
}

class _FbAuthState extends State<FbAuth> {

  User? user;

  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
        setState(() {
          this.user = user;
        });
      });
  }

  Widget unAuthenticatedWidget() {
    if(user == null) {
      return Column(
        children: [
          Text("認証"),
          TextButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => EmailPasswordSignin()
              )),
              child: const Text('メールアドレス／パスワード認証')
          ),
          Divider(),
          Text("ユーザ作成"),
          TextButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => EmailPasswordAuth()
              )),
              child: const Text('メールアドレス／パスワード認証')
          ),
          TextButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => PhoneAuth()
              )),
              child: const Text('SMS認証')
          ),
        ],
      );
    }

    return Column(
      children: [
        Text("ログアウト"),
        IconButton(
          color: Colors.redAccent,
          icon: const Icon(Icons.logout),
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
        ),
        Divider(),
        Text("ユーザ情報"),
        userInfo(),
      ],
    );
  }

  Widget userInfo() {
    if(user==null) {
      return Text("Nothing...");
    }

    List<Widget> info = [];

    info.add(Text(user!.uid));
    if(user!.email != null) info.add(Text(user!.email!));
    if(user!.phoneNumber != null) info.add(Text(user!.phoneNumber!));
    if(user!.displayName != null) info.add(Text(user!.displayName!));

    return Column(
      children: info,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase 認証サンプル"),
      ),
      body: Center(
        child: unAuthenticatedWidget(),
      ),
    );
  }
}