import 'package:flutter/material.dart';

class Animation1 extends StatefulWidget {
  const Animation1({Key key}) : super(key: key);

  @override
  _YoungAppState createState() => _YoungAppState();
}

class _YoungAppState extends State<Animation1>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )
      ..reset();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.green,
      ),
      builder: (BuildContext context, Widget child) {
        return Transform.rotate(
          angle: _controller.value * 2.0,
          child: child,
        );
      },
    );
  }
}
