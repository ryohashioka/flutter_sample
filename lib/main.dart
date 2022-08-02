import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
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

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const RowSample(),
      // home: const ColumnSample(),
      // home: const RowColumnSample(),
      // home: const StackSample(),
      // home: const StackPositionedSample(),
      // home: const StackAlignmentSample(),
      // home: const CardSample(),
      // home: const ListSample(),
      // home: const ListSample2(),
      // home: const ListTileSample(),
      // home: const ListBuilderSample(),
      // home: const ListSeparatedSample(),
      // home: const ListScrollDirection(),
      // home: const GridSample(),
      // home: const GridExtentSample(),
      // home: const GridBuilderSample(),
      // home: const ButtonSample(),
      // home: const PopupMenuButtonSample(),
      // home: const DropdownButtonSample(),
      // home: const CheckBoxSample(),
      // home: const RadioButtonSample(),
      // home: const SwitchSample(),
      // home: const DatePickerSample(),
      // home: const TextFieldSample(),
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () => goPage( const RandomWords()),
              child: const Text('無限スクロール')
            ),
            TextButton(
                onPressed: () => goPage( const ContainerSample()),
                child: const Text('Container サンプル')
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => goPage( const SubPage() ),
        child: const Icon(Icons.add)
      ),
    );
  }
}


