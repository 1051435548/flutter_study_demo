import 'package:Flutter/mobx/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';


class MobxAndProviderOne extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Counter counter = Provider.of<Counter>(context);
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('MobX Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '第二个页面显示第一个页面的数是:',
              ),
              Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
