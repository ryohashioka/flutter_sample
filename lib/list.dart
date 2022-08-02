import 'package:flutter/material.dart';

class ListSample extends StatelessWidget {
  const ListSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const data = [
      Text("item0"),Text("item1"),Text("item2"),Text("item3"),Text("item4"),
    ];

    return  Scaffold(
      body: ListView(
        children: data
      ),
    );
  }
}

class ListSample2 extends StatelessWidget {
  const ListSample2({Key? key}) : super(key: key);

  Widget _menuItem(String title, Icon icon) {
    return GestureDetector(
      child:Container(
          padding: EdgeInsets.all(8.0),
          decoration: new BoxDecoration(
              border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey)),
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                child:icon,
              ),
              Text(
                title,
                style: TextStyle(
                    color:Colors.black,
                    fontSize: 18.0
                ),
              ),
            ],
          )
      ),
      onTap: () {
        print("onTap called.");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            _menuItem("メニュー1", Icon(Icons.settings)),
            _menuItem("メニュー2", Icon(Icons.map)),
            _menuItem("メニュー3", Icon(Icons.room)),
            _menuItem("メニュー4", Icon(Icons.local_shipping)),
            _menuItem("メニュー5", Icon(Icons.airplanemode_active)),
          ]
      ),
    );
  }
}

class ListTileSample extends StatelessWidget {
  const ListTileSample({Key? key}) : super(key: key);

  Widget _menuItem(String title, Icon icon) {
    return Container(
      decoration: new BoxDecoration(
          border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
      ),
      child:ListTile(
        leading: icon,
        title: Text(
          title,
          style: TextStyle(
              color:Colors.black,
              fontSize: 18.0
          ),
        ),
        onTap: () {
          print("onTap called.");
        }, // タップ
        onLongPress: () {
          print("onLongPress called.");
        }, // 長押し
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            _menuItem("メニュー1", Icon(Icons.settings)),
            _menuItem("メニュー2", Icon(Icons.map)),
            _menuItem("メニュー3", Icon(Icons.room)),
            _menuItem("メニュー4", Icon(Icons.local_shipping)),
            _menuItem("メニュー5", Icon(Icons.airplanemode_active)),
          ]
      ),
    );
  }
}

class ListBuilderSample extends StatelessWidget {
  const ListBuilderSample({Key? key}) : super(key: key);
  
  Widget _messageItem(String title) {
    return Container(
      decoration: new BoxDecoration(
          border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
      ),
      child:ListTile(
        title: Text(
          title,
          style: TextStyle(
              color:Colors.black,
              fontSize: 18.0
          ),
        ),
        onTap: () {
          print("onTap called.");
        }, // タップ
        onLongPress: () {
          print("onLongTap called.");
        }, // 長押し
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var list = ["メッセージ", "メッセージ", "メッセージ", "メッセージ", "メッセージ",];
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('ListView'),
            ),
            body: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                if (index >= list.length) {
                  list.addAll(["メッセージ","メッセージ","メッセージ","メッセージ",]);
                }
                return _messageItem(list[index]);
              },
            )
        )
    );
  }
}

class ListSeparatedSample extends StatelessWidget {
  const ListSeparatedSample({Key? key}) : super(key: key);

  Widget separatorItem() {
    return Container(
      height: 10,
      color: Colors.orange,
    );
  }

  Widget _messageItem(String title) {
    return Container(
      decoration: new BoxDecoration(
          border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
      ),
      child:ListTile(
        title: Text(
          title,
          style: TextStyle(
              color:Colors.black,
              fontSize: 18.0
          ),
        ),
        onTap: () {
          print("onTap called.");
        }, // タップ
        onLongPress: () {
          print("onLongTap called.");
        }, // 長押し
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var list = ["メッセージ", "メッセージ", "メッセージ", "メッセージ", "メッセージ","メッセージ","メッセージ","メッセージ",];
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('ListView'),
            ),
            body: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return _messageItem(list[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return separatorItem();
              },
              itemCount: list.length,
            )
        )
    );
  }
  
}

class ListScrollDirection extends StatelessWidget {
  const ListScrollDirection({Key? key}) : super(key: key);

  Widget _messageItem(String title) {
    return Container(
        width: 100,
        decoration: new BoxDecoration(
            border: new Border(right: BorderSide(width: 1.0, color: Colors.grey))
        ),
        child:Center(
          child:Text(
            title,
            style: TextStyle(
                color:Colors.black,
                fontSize: 20.0
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    var list = ["0","1","2","3","4","5","6","7","8","9"];
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('ListView'),
            ),
            body: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                if (index >= list.length) {
                  list.addAll(["0","1","2","3","4","5","6","7","8","9",]);
                }
                return _messageItem(list[index]);
              },
            )
        )
    );
  }
}
