import 'package:Flutter/demo/mobxAndProviderDemo/mobxAndProviderOne.dart';
import 'package:Flutter/mobx/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';


class MobxAndProviderMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage();

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
                '数值是:',
              ),
              // Wrapping in the Observer will automatically re-render on changes to counter.value
              Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.display1,
              ),
              RaisedButton(
                  child: Text('去第二页'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return MobxAndProviderOne();
                      }),
                    );
                  })
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: counter.increment,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
