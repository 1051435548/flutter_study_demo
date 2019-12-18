import 'package:Flutter/community/bottomNavigationBar/three.dart';
import 'package:flutter/material.dart';

class RouteGenerate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('generate'),
      ),
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('generate'),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      )),
    );
  }
}
