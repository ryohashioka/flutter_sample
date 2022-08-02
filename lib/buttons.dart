import 'package:flutter/material.dart';

class ButtonSample extends StatefulWidget {
  const ButtonSample({Key? key}) : super(key: key);

  @override
  _ButtonSampleState createState() => _ButtonSampleState();
}

class _ButtonSampleState extends State<ButtonSample> {
  int _count = 0;

  void _handlePressed() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ButtonSample'),
        ),
        body: Container(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: <Widget>[
                Text(
                  "$_count",
                  style: const TextStyle(
                    color:Colors.blueAccent,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500
                  ),
                ),
                // FlatButton(Depricated)
                // FlatButton(
                //   onPressed: _handlePressed,
                //   color: Colors.blue,
                //   child: Text(
                //     '更新',
                //     style: TextStyle(
                //         color:Colors.white,
                //         fontSize: 20.0
                //     ),
                //   ),
                // ),
                TextButton(
                  onPressed: _handlePressed,
                  child: const Text('更新')
                ),
                // RaisedButton(Depricated)
                // RaisedButton(
                //   onPressed: _handlePressed,
                //   color: Colors.blue,
                //   child: const Text(
                //     '更新',
                //     style: TextStyle(
                //         color:Colors.white,
                //         fontSize: 20.0
                //     ),),
                // ),
                ElevatedButton(
                  onPressed: _handlePressed,
                  child: const Text('更新')
                ),
                // OutlineButton(Depricated)
                // OutlineButton(
                //   onPressed: _handlePressed,
                //   borderSide: BorderSide(color: Colors.blue),
                //   child: const Text(
                //     '更新',
                //     style: TextStyle(
                //         color:Colors.blue,
                //         fontSize: 20.0
                //     ),
                //   ),
                // ),
                OutlinedButton(
                  onPressed: _handlePressed,
                  child: const Text('更新'),
                ),
                IconButton(
                  iconSize: 100,
                  onPressed: _handlePressed,
                  color: Colors.blue,
                  icon: Icon(Icons.add_circle_outline),
                ),
                FloatingActionButton(
                  onPressed: _handlePressed,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.add)
                ),
                FloatingActionButton.extended(
                  onPressed: _handlePressed,
                  backgroundColor: Colors.blue,
                  icon: Icon(Icons.add),
                  label: const Text('ボタン'),
                ),

              ],
            )
        )
    );
  }
}


class PopupMenuButtonSample extends StatefulWidget {
  const PopupMenuButtonSample({Key? key}) : super(key: key);

  @override
  _PopupMenuButtonSampleState createState() => _PopupMenuButtonSampleState();
}

class _PopupMenuButtonSampleState extends State<PopupMenuButtonSample> {
  String _selectedValue = "1";

  void _handleChange(String value) {
    setState(() {
      _selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SelectButtonSample"),
      ),
      body: Column(
        children: [
          Text(
            _selectedValue,
            style: const TextStyle(
                color:Colors.blueAccent,
                fontSize: 30.0,
                fontWeight: FontWeight.w500
            ),
          ),
          PopupMenuButton<String>(
            onSelected: _handleChange,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: "1",
                child: Text('選択1'),
              ),
              const PopupMenuItem<String>(
                value: "2",
                child: Text('選択2'),
              ),
              const PopupMenuItem<String>(
                value: "3",
                child: Text('選択3'),
              ),
              const PopupMenuItem<String>(
                value: "4",
                child: Text('選択4'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class DropdownButtonSample extends StatefulWidget {
  const DropdownButtonSample({Key? key}) : super(key: key);

  @override
  _DropdownButtonSampleState createState() => _DropdownButtonSampleState();
}

class _DropdownButtonSampleState extends State<DropdownButtonSample> {

  String _defaultValue = 'りんご';
  final List<String> _list = <String>['りんご', 'オレンジ', 'みかん', 'ぶどう'];
  String _text = 'りんご';

  void _handleChange(String? newValue) {
    if(newValue != null) {
      setState(() {
        _text = newValue;
        _text = _defaultValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DropdownButtonSample"),
      ),
      body: Container(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: <Widget>[
              Text(
                _text,
                style: const TextStyle(
                    color:Colors.blueAccent,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500
                ),
              ),
              DropdownButton<String>(
                value: _defaultValue,
                onChanged: _handleChange,
                items: _list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          )
      )
    );
  }

}


class CheckBoxSample extends StatefulWidget {
  const CheckBoxSample({Key? key}) : super(key: key);

  @override
  _CheckBoxSampleState createState() => _CheckBoxSampleState();
}

class _CheckBoxSampleState extends State<CheckBoxSample> {

  bool _flag = false;

  void _handleCheckbox(bool? e) {
    if(e != null) {
      setState(() {
        _flag = e;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DropdownButtonSample"),
      ),
      body: Container(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: <Widget>[
              Center(
                child: new Icon(
                  Icons.thumb_up,
                  color: _flag ? Colors.orange[700] : Colors.grey[500],
                  size: 100.0,
                ),
              ),
              Checkbox(
                activeColor: Colors.blue,
                value: _flag,
                onChanged: _handleCheckbox,
              ),
              CheckboxListTile(
                activeColor: Colors.blue,
                title: Text('チェックボックス'),
                subtitle: Text('チェックボックスのサブタイトル'),
                secondary: new Icon(
                  Icons.thumb_up,
                  color: _flag ? Colors.orange[700] : Colors.grey[500],
                ),
                controlAffinity: ListTileControlAffinity.leading,
                value: _flag,
                onChanged: _handleCheckbox,
              ),
            ],
          )
      )
    );
  }
}


class RadioButtonSample extends StatefulWidget {
  const RadioButtonSample({Key? key}) : super(key: key);

  @override
  _RadioButtonSampleState createState() => _RadioButtonSampleState();
}

class _RadioButtonSampleState extends State<RadioButtonSample> {

  String? _type1;
  String? _type2;

  void _handleRadio1(String? e) => setState(() {_type1 = e;});
  void _handleRadio2(String? e) => setState(() {_type2 = e;});

  IconData _changeIcon(String? e) {
    IconData? icon;
    switch (e) {
      case 'thumb_up':
        icon = Icons.thumb_up;
        break;
      case 'favorite':
        icon = Icons.favorite;
        break;
      default:
        icon = Icons.thumb_up;
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DropdownButtonSample"),
      ),
      body: Container(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: <Widget>[
              Center(
                child: new Icon(
                  _changeIcon(_type1),
                  color: Colors.orange[700],
                  size: 100.0,
                ),
              ),
              new Radio(
                activeColor: Colors.blue,
                value: 'thumb_up',
                groupValue: _type1,
                onChanged: _handleRadio1,
              ),
              new Radio(
                activeColor: Colors.orange,
                value: 'favorite',
                groupValue: _type1,
                onChanged: _handleRadio1,
              ),

              Center(
                child: new Icon(
                  _changeIcon(_type2),
                  color: Colors.orange[700],
                  size: 100.0,
                ),
              ),
              new RadioListTile(
                secondary: Icon(Icons.thumb_up),
                activeColor: Colors.blue,
                controlAffinity: ListTileControlAffinity.trailing,
                title: Text('Good'),
                subtitle: Text('Goodアイコンの表示'),
                value: 'thumb_up',
                groupValue: _type2,
                onChanged: _handleRadio2,
              ),
              new RadioListTile(
                secondary: Icon(Icons.favorite),
                activeColor: Colors.orange,
                controlAffinity: ListTileControlAffinity.trailing,
                title: Text('Favorite'),
                subtitle: Text('Favoriteアイコンの表示'),
                value: 'favorite',
                groupValue: _type2,
                onChanged: _handleRadio2,
              ),
            ],
          )
      ),
    );
  }
}


class SwitchSample extends StatefulWidget {
  const SwitchSample({Key? key}) : super(key: key);

  @override
  _SwitchSampleState createState() => _SwitchSampleState();
}

class _SwitchSampleState extends State<SwitchSample> {

  bool _active = false;

  void _changeSwitch(bool e) => setState(() => _active = e);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DropdownButtonSample"),
      ),
      body: Container(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: <Widget>[
              Center(
                child: new Icon(
                  Icons.thumb_up,
                  color: _active ? Colors.orange[700] : Colors.grey[500],
                  size: 100.0,
                ),
              ),
              new Switch(
                value: _active,
                activeColor: Colors.orange,
                activeTrackColor: Colors.red,
                inactiveThumbColor: Colors.blue,
                inactiveTrackColor: Colors.green,
                onChanged: _changeSwitch,
              ),

              new SwitchListTile(
                value: _active,
                activeColor: Colors.orange,
                activeTrackColor: Colors.red,
                inactiveThumbColor: Colors.blue,
                inactiveTrackColor: Colors.grey,
                secondary: new Icon(
                  Icons.thumb_up,
                  color: _active ? Colors.orange[700] : Colors.grey[500],
                  size: 50.0,
                ),
                title: Text('タイトル'),
                subtitle: Text('サブタイトル'),
                onChanged: _changeSwitch,
              )
            ],
          )
      ),
    );
  }
}


class DatePickerSample extends StatefulWidget {
  const DatePickerSample({Key? key}) : super(key: key);

  @override
  _DatePickerSampleState createState() => _DatePickerSampleState();
}

class _DatePickerSampleState extends State<DatePickerSample> {

  DateTime _date = new DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2016),
        lastDate: new DateTime.now().add(new Duration(days: 360))
    );
    if(picked != null) setState(() => _date = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DropdownButtonSample"),
      ),
      body: Container(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            Center(child:Text("${_date}")),
            new ElevatedButton(onPressed: () => _selectDate(context), child: new Text('日付選択'),)
          ],
        )
      ),
    );
  }
}
