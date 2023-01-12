import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FbStorage extends StatefulWidget {
  const FbStorage({super.key});

  @override
  State<FbStorage> createState() => _FbStorageState();
}

class _FbStorageState extends State<FbStorage> {

  List<Reference> imageRefs = [];

  void loadImages() async {
    final storageRef = FirebaseStorage.instance.ref().child("images/");
    final listResult = await storageRef.listAll();
    setState(() {
      imageRefs = listResult.items;
    });
  }
  
  List<Widget> images() {
    return imageRefs.map((ref) {
      return FutureBuilder(
        future: ref.getDownloadURL(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if(snapshot.hasData) {
            return Image.network(snapshot.data!);
          } else {
            return const Text("loading...");
          }
        },
      );
    }).toList();
  }

  @override
  void initState() {
    loadImages();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Storage Sample"),
        actions: [
          IconButton(
            onPressed: () async {
              final ImagePicker _picker = ImagePicker();
              // Pick an image
              final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
              // 空の場合終了
              if (image == null) {
                return;
              }

              FirebaseStorage storage = FirebaseStorage.instance;
              try {
                String imageUrl = '';
                final task = await storage.ref('images/${image.name}').putFile(File(image.path));
                // firestoreに保存する処理
              } on FirebaseException  catch (e) {
                // エラー処理
              }

              loadImages();
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: images(),
      )
    );
  }
}