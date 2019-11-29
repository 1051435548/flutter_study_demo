import 'package:Flutter/community/opendoor.dart';
import 'package:flutter/material.dart';

class BindHouse extends StatefulWidget {
  @override
  _BindHouseState createState() => _BindHouseState();

  const BindHouse({Key key}) : super(key: key);
  static const String routeName = '/bindhouse';
  static const _houseList = ['1', '2', '3', '4'];
}

class _BindHouseState extends State<BindHouse> {
  bool _checkValue1 = false;
  bool _checkValue2 = false;

  @override
  Widget build(BuildContext context) {
    BorderSide _outBorderSide = BorderSide(color: Colors.grey[500], width: 0);
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new Text(
          '绑定房屋',
          style:
              new TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: new Padding(
          padding: EdgeInsets.only(top: 1.0), //暂时放着，方便控制下面的容器
          child: new Column(
            children: <Widget>[
              new Container(
                height: 300.0,
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  border: Border(
                    left: _outBorderSide,
                    right: _outBorderSide,
                    top: _outBorderSide,
                    bottom: _outBorderSide,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: _ableBindHouses(),
              ),
              new Container(
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.only(left: 24.0, right: 24.0),
                child: _bindHouseButton(context),
              )
            ],
          )),
    );
  }

  // ignore: slash_for_doc_comments
  /**
   * 绑定房屋列表
   */
  Widget _ableBindHouses() {
    return new ListView(
      children: <Widget>[
        new CheckboxListTile(
          secondary: const Icon(Icons.home),
          title: const Text('天龙小区2401'),
          value: _checkValue2,
          onChanged: (bool value) {
            setState(() {
              this._checkValue2 = !this._checkValue2;
            });
          },
        ),
        new CheckboxListTile(
          secondary: const Icon(Icons.home),
          title: const Text('天龙小区2402'),
          value: _checkValue2,
          onChanged: (bool value) {
            setState(() {
              this._checkValue2 = !this._checkValue2;
            });
          },
        ),
      ],
    );
  }

  // ignore: slash_for_doc_comments
  /**
   * 绑定房屋按钮
   */
  Widget _bindHouseButton(BuildContext context) {
    return new MaterialButton(
      minWidth: double.infinity,
      height: 50.0,
      color: Colors.teal,
      textColor: Colors.white,
      onPressed: () {
        Navigator.pushNamed(context, OpenDoor.routeName);
      },
      child: Text(
        "绑定",
        style: new TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
