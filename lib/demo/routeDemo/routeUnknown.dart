import 'package:flutter/material.dart';

class RouteUnknown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unknown'),
      ),
      body: Container(
        child: Text('Unknown'),
      ),
    );
  }
}
