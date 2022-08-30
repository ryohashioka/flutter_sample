import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_sample/firebase/firestore.dart';
// import 'package:flutter/rendering.dart';
import './random_words.dart';
import './container.dart';
import './column_and_row.dart';
import './stack.dart';
import './card.dart';
import './list.dart';
import './grid.dart';
import './buttons.dart';
import './text_field.dart';
import './sub_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// void main() {
Future<void> main() async {
  // debugPaintSizeEnabled = true;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void goPage(Widget page) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => page
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          TextButton(
              onPressed: () => goPage( const RandomWords() ),
              child: const Text('無限スクロール')
          ),
          TextButton(
              onPressed: () => goPage( const ContainerSample() ),
              child: const Text('Container サンプル')
          ),
          TextButton(
              onPressed: () => goPage( const RowColumnSample() ),
              child: const Text('Row x Column サンプル')
          ),
          TextButton(
              onPressed: () => goPage( const StackAlignmentSample() ),
              child: const Text('Stack サンプル')
          ),
          TextButton(
              onPressed: () => goPage( const CardSample() ),
              child: const Text('Card サンプル')
          ),
          TextButton(
              onPressed: () => goPage( const ListTileSample() ),
              child: const Text('ListTile サンプル')
          ),
          TextButton(
              onPressed: () => goPage( const ListBuilderSample() ),
              child: const Text('ListBuilder サンプル')
          ),
          TextButton(
              onPressed: () => goPage( const ListScrollDirection() ),
              child: const Text('ListScroll サンプル')
          ),
          TextButton(
              onPressed: () => goPage( const GridExtentSample() ),
              child: const Text('GridExtent サンプル')
          ),
          TextButton(
              onPressed: () => goPage( const GridBuilderSample() ),
              child: const Text('GridBuilder サンプル')
          ),
          TextButton(
              onPressed: () => goPage( const ButtonSample() ),
              child: const Text('Button サンプル')
          ),
          TextButton(
              onPressed: () => goPage( const PopupMenuButtonSample() ),
              child: const Text('PopupMenuButton サンプル')
          ),
          TextButton(
              onPressed: () => goPage( const DropdownButtonSample() ),
              child: const Text('DropdownButton サンプル')
          ),
          TextButton(
              onPressed: () => goPage( const CheckBoxSample() ),
              child: const Text('CheckBox サンプル')
          ),
          TextButton(
              onPressed: () => goPage( const RadioButtonSample() ),
              child: const Text('RadioButton サンプル')
          ),
          TextButton(
              onPressed: () => goPage( const SwitchSample() ),
              child: const Text('Switch サンプル')
          ),
          TextButton(
              onPressed: () => goPage( const DatePickerSample() ),
              child: const Text('DatePicker サンプル')
          ),
          TextButton(
              onPressed: () => goPage( const DatePickerSample() ),
              child: const Text('TextField サンプル')
          ),
          TextButton(
              onPressed: () => goPage( const FirestoreSample() ),
              child: const Text('Firestore サンプル')
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => goPage( const SubPage() ),
        child: const Icon(Icons.add)
      ),
    );
  }
}


