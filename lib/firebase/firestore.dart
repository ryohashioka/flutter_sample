import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';

class FirestoreSample extends StatefulWidget {
  const FirestoreSample({Key? key}) : super(key: key);

  @override
  State<FirestoreSample> createState() => _FirestoreSampleState();
}

class _FirestoreSampleState extends State<FirestoreSample> {

  bool isFilter = false;

  void addRandomUser() {
    var db = FirebaseFirestore.instance;
    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "name": WordPair.random().asLowerCase,
      "born": 1950 + Random().nextInt(70),
      "gender": Random().nextInt(2) == 0 ? 'male' : 'female'
    };

    // Add a new document with a generated ID
    db.collection("users").add(user).then((DocumentReference doc) {
      print('DocumentSnapshot added with ID: ${doc.id}');
      // 再描画
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    IconData filterIcon = Icons.filter_alt;
    dynamic query = FirebaseFirestore.instance.collection('users');
    if(isFilter) {
      filterIcon = Icons.filter_alt_off;
      query = query
          .where("born", isGreaterThan: 1992)
          .where("gender", isEqualTo: "female");
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Firestore サンプル"),
        actions: <Widget>[
          IconButton(
            icon: Icon(filterIcon),
            onPressed: () {
              setState(() {
                isFilter = !isFilter;
              });
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: query.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }
          if (!snapshot.hasData) {
            return const Text("Document does not exist");
          }
          if (snapshot.hasData) {
            final List<DocumentSnapshot> documents = snapshot.data!.docs;
            return ListView.separated(
              // physics: const AlwaysScrollableScrollPhysics(),
              itemCount: documents.length,
              separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.black,),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(documents[index]['name']),
                  subtitle: Text(documents[index]['born'].toString()),
                );
              },
            );
          }
          return Text("Loading...");
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: addRandomUser,
          child: const Icon(Icons.add)
      ),
    );
  }
}
